function result = solve_vdp_roundtrip(Case)
%Function for making S1-S12 Tables
%% Initial setting
global casenum
casenum = Case;
global ene_init
global blood_init
global forager_init
global midworker_init
global nestworker_init
h = waitbar(0,['Case',num2str(casenum)]);%Waitbar
year=15;
t_tot=      6.5*60*60*30*7*year;%simulation time(year)
y0=[0; 0; forager_init; 0; 0; midworker_init; 0; 0; nestworker_init; blood_init; 0; 0; ene_init];%%Initial workers
options = odeset('Events',@events);
set_parameter();%%Parameter determination

global l;
%% Configuration: Modified variables and the range
global parametername;
parametername='s_Rstop';                              %Variable name1
global  s_Rstop;                                      %Variable name2
step=1;%%%FiX
%range: +-50%
rangevalue =s_Rstop;                                  %Variable name3
range=0.5*rangevalue:rangevalue/step:1.5*rangevalue;   %Range (In document, 50%-150%)
%range=rangevalue;                                     %Original           
result=zeros(length(range),15);


%% Solve ODE repeatedly in the set range
for i=1:length(range)
    result(i,1)=range(i);
    set_parameter();
    %Value change
    s_Rstop=range(i);                          %Variable name4                        
    %% If another constant value is changed with upper variable's change, please write here.
  %  l=phi * 1/1e5;
    [t,y,~,~] = ode23tb(@vdp,[0 t_tot],y0,options);
    result(i,2:14)=y(end,:);%Memorize all worker's number.
    
    CCS =y(:,1)+y(:,2)+y(:,3)+y(:,4)+y(:,5)+y(:,6)+y(:,7)+y(:,8)+y(:,9)+y(:,10);%%Current colony size
    result(i,15)=CCS(end);%Memorize the colony size
    waitbar(i/length(range));    %% Update waitbar
end
close(h);

%% Event function which catches small colony size
    function [value,isterminal,direction] = events(~,y)
        CCS_now=y(1)+y(2)+y(3)+y(4)+y(5)+y(6)+y(7)+y(8)+y(9)+y(10);
        % Locate the time when height passes through zero in a
        % decreasing direction and stop integration.
        value(1) = CCS_now - 1;     % Detect CCS_now = 1
        isterminal(1) = 1;   % Stop the integration
        direction(1) = -1;   % negative direction
    end
end

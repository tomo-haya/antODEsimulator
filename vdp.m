function dydt = vdp(~,y)
%% y(1):W_R(F) y(2):W_R(M) y(3):W_R(N)
%% y(4):W_E(F) y(5):W_E(M) y(6):W_E(N)
%% y(7):W_I(F) y(8):W_I(M) y(9):W_I(N) y(10):W_E(B)+W_I(B)
%% y(11):C y(12):D y(13):A

%% Constant Variables determined in set_parameter.m
global beta;
global s_Rstop;
global s_Estop;
global alpha;
global rho_cdet;
global s_Esame;
global s_Ediff;
global u_inside;
global u_outside;
global a_max;
global phi;
global psi;
global lambda;
global mu;
global rho_ddet;
global rho_fdet;
global theta;
global k_max;
global l;
global q_foraging;
global q_midden;
global q_nest;
global q_blood;
global g;
global gamma;

global casenum %Scenario, which is determined in solve_vdp


CCS=y(1)+y(2)+y(3)+y(4)+y(5)+y(6)+y(7)+y(8)+y(9)+y(10);%%Current colony size
n_negative=(a_max/beta)/(1-exp(-(a_max/beta)));
n_positive=(a_max/beta)/(exp(a_max/beta) - 1);

switch casenum %Scenario, which is determined in solve_vdp
    case 1     %Colony size FB (-1)    %Nutritional energy FB (-1)
        X_FB=alpha/(CCS - y(4) - y(5));
        Y_FB=n_negative * (exp(-y(13)/(CCS*beta)));
        if Y_FB > 10^9
            Y_FB=10^9;
        end
    case 2         %Colony size FB (0H)       %Nutritional energy FB (-1)
        X_FB=alpha/10;
        Y_FB=n_negative * (exp(-y(13)/(CCS*beta)));
        if Y_FB > 10^9
            Y_FB=10^9;
        end
    case 3       %Colony size FB (0L)        %Nutritional energy FB (-1)
       X_FB=alpha/100;
        Y_FB=n_negative * (exp(-y(13)/(CCS*beta)));
        if Y_FB > 10^9
            Y_FB=10^9;
        end
    case 4        %Colony size FB (+1)        %Nutritional energy FB (-1)
        X_FB=alpha * (CCS - y(4) - y(5)) /10000;
        Y_FB=n_negative * (exp(-y(13)/(CCS*beta)));
        if Y_FB > 10^9
            Y_FB=10^9;
        end
    case 5         %Colony size FB (-1)       %Nutritional energy FB (0)
        X_FB=alpha/(CCS - y(4) - y(5));
        Y_FB=1;
    case 6          %Colony size FB (0H)       %Nutritional energy FB (0)
        X_FB=alpha/10;
        Y_FB=1;
    case 7        %Colony size FB (0L)        %Nutritional energy FB (0)
        X_FB=alpha/100;
        Y_FB=1;   
    case 8        %Colony size FB (+1)        %Nutritional energy FB (0)
        X_FB=alpha * (CCS - y(4) - y(5)) /10000;
        Y_FB=1;
    case 9        %Colony size FB (-1)        %Nutritional energy FB (+1)
       X_FB=alpha/(CCS - y(4) - y(5));
        Y_FB=n_positive * exp(y(13)/(CCS*beta));
        if Y_FB > 10^9
            Y_FB=10^9;
        end
    case 10        %Colony size FB (0H)        %Nutritional energy FB (+1)
        X_FB=alpha/10;
        Y_FB=n_positive * exp(y(13)/(CCS*beta));
        if Y_FB > 10^9
            Y_FB=10^9;
        end
    case 11        %Colony size FB (0L)        %Nutritional energy FB (+1)
        X_FB=alpha/100;
        Y_FB=n_positive * exp(y(13)/(CCS*beta));
        if Y_FB > 10^9
            Y_FB=10^9;
        end        
    case 12        %Colony size FB (+1)        %Nutritional energy FB (+1)
        X_FB=alpha * (CCS - y(4) - y(5)) /10000;
        Y_FB=n_positive * exp(y(13)/(CCS*beta));
        if Y_FB > 10^9
            Y_FB=10^9;
        end    
end



%% Calclate nutritional energy shortage
if(y(13)<0)
    n_lack=-y(13)/CCS;
else n_lack=0;
end

%% Number of birth
Nb=min(k_max*exp(-(n_lack/mu)),(l*y(10)));

%% Nutiritional Energy consumption
consume = u_inside*(y(1) + y(2) + y(3) + y(6) + y(7) + y(8) + y(9) + y(10))*24/6.5 + u_outside*(y(4) + y(5))*24/6.5; 
F_E_lack=1-exp(-(n_lack/mu));

%% Number of death
D_R_f= min(1,q_foraging+F_E_lack) * y(1);
D_R_m= min(1,q_midden+F_E_lack) * y(2);
D_R_n= min(1,q_nest+F_E_lack) * y(3);
D_E_f= min(1,q_foraging+F_E_lack + g) * y(4);
D_E_m= min(1,q_midden+F_E_lack + g*exp(-y(11)/gamma)) * y(5);
D_E_n= min(1,q_nest+F_E_lack) * y(6);
D_I_f= min(1,q_foraging+F_E_lack) * y(7);
D_I_m= min(1,q_midden+F_E_lack) * y(8);
D_I_n= min(1,q_nest+F_E_lack) * y(9);
D_blood= min(1,q_blood+F_E_lack) * y(10);

%% ODE
dydt = zeros(13,1);
%Recruit
dydt(1) = rho_fdet * y(4) - s_Rstop * y(1) - D_R_f;
dydt(2) = exp(-y(11)/rho_cdet) * y(5) - s_Rstop * y(2) -D_R_m;
dydt(3) = (1-(1/exp((y(12)/rho_ddet)))) * y(6) - s_Rstop * y(3) -D_R_n;
%Work
dydt(4) = s_Rstop*y(1)-rho_fdet*y(4)-s_Estop*y(4)+X_FB*y(1)*(y(7)+y(8)+y(9))*Y_FB + s_Esame*y(7)*Y_FB + s_Ediff*y(8)*Y_FB + s_Ediff*y(9)*Y_FB -D_E_f;
dydt(5) = s_Rstop*y(2)-exp(-y(11)/rho_cdet)*y(5)-s_Estop*y(5)+(s_Ediff+X_FB*y(2))*y(10)*(1-phi)+X_FB*y(2)*y(8)+s_Esame*y(8)-D_E_m;
dydt(6) = s_Rstop*y(3)-(1-(1/exp((y(12)/rho_ddet))))*y(6)-s_Estop*y(6)+(s_Ediff+X_FB*y(3))*y(10)*(1-phi)+X_FB*y(3)*y(9)+s_Esame*y(9)-D_E_n;
%Rest
dydt(7) = s_Estop*y(4) - X_FB*y(1)*y(7)*Y_FB - s_Esame*y(7)*Y_FB -D_I_f;
dydt(8) = s_Estop*y(5) - X_FB*y(1)*y(8)*Y_FB - X_FB*y(2)*y(8)-s_Esame*y(8)-s_Ediff*y(8)*Y_FB -D_I_m;
dydt(9) = s_Estop*y(6) - X_FB*y(1)*y(9)*Y_FB - X_FB*y(3)*y(9)-s_Esame*y(9) - s_Ediff*y(9)*Y_FB -D_I_n;

dydt(10) = Nb - (s_Ediff+X_FB*y(3))*y(10)*(1-phi) - (s_Ediff+X_FB*y(2))*y(10)*(1-phi) -D_blood;%Blood care worker

dydt(11) = -theta*y(11) + exp(-y(11)/rho_cdet)*y(5);%Midden construction

dydt(12) = - (1-(1/exp((y(12)/rho_ddet))))*y(6) + psi;%Debris inside the nest dynamics

dCCSdt = Nb-D_R_f-D_R_m-D_R_n-D_E_f-D_E_m-D_E_n-D_I_f-D_I_m-D_I_n-D_blood;%Colony size's dynamics
if(y(13)>a_max*CCS && rho_fdet*y(4)*lambda-consume>a_max*dCCSdt)%%Workers have maximum nutritional energy
    dydt(13)=a_max*dCCSdt;
else
    dydt(13) = rho_fdet*y(4)*lambda - consume;%Nutritional energy's dynamics
end




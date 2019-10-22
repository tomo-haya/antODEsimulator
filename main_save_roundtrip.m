%Memorize parameters' sensitivity analysis data as .mat
global parametername
result=[];
for i=1:12
    result(:,:,i)=solve_vdp_roundtrip(i);
end

%% Result(1):Range of the parameter
%% Result(2-14):Corresponds to y(1)-y(13). 
%% Result(15):Colony size
save(parametername,'result')

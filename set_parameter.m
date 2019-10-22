function set_parameter()
%All variables are defined as global variables

%% Rate at which recruiting workers spontaneously stop recruiting [/s]
global s_Rstop;
s_Rstop =0.1;
%% Rate at which engaged workers spontaneously stop engaged [/s]
global s_Estop;
s_Estop=1*10^(-4);
%% Rate at which inactive workers are spontaneously engaged the task [/s]
global s_Esame;
s_Esame=1 * 10^(-4);
%% Rate at which inactive workers are spontaneously engaged the different task [/s]
global s_Ediff;
s_Ediff=2 * 10^(-7);
%% Rate at which foraging workers detect food [/s]	
global rho_fdet;
rho_fdet=1.3*10^(-3);
%% Coefficient for possibility of midden detection [midden]
global rho_cdet;
rho_cdet=1.0;
%% Coefficient for possibility of debris detection [debris]
global rho_ddet;
rho_ddet = 1.0;
%% Rate of engaged workers in intra-nest tasks 
global phi;
phi = 0.2;
%% Maximum of Birth speed [num/s]
global k_max;
k_max=0.002035;
%% Number of larvae taken care of by an intra-nest worker
global l;
l=phi * 10^(-5);%%%In this program, E_intra & I_intra are combined;
%% Coefficient for X(t) [/s]
global alpha;
alpha=6*10^(-2);
%% Metabolic energy consumed by a worker inside the nest[Kcal/sec]
global u_inside;
u_inside=3.2*10^(-6);
%% Metabolic energy consumed by a worker outside the nest[Kcal/sec]
global u_outside;
u_outside=9.4*10^(-6);
%% Coefficient for Y(t) [kcal]
global beta;
beta= u_inside*60*60*6.5*1.4;
%% Rate at which workers are killed by external enemies [/s]	
global g;
g=5*10^(-7);
%% Death rate of workers in foraging task killed by natural causes [/s]
global q_foraging;
q_foraging=1.*10^(-6);
%% Death rate of workers in midden construction task killed by natural causes [/s]
global q_midden;
q_midden=1.*10^(-7);
%% Death rate of workers in nest maintenance task killed by natural causes [/s]
global q_nest;
q_nest=1.*10^(-7);
%% Death rate of workers in intara-nest tasks killed by natural causes [/s]
global q_blood;
q_blood=1.*10^(-8);
%% Coefficient for death rate from external enemy attack [midden]
global gamma;
gamma=1;
%% Spontaneous midden collapse rate [/s] 
global theta;
theta=1*10^(-6);
%% Spontaneous debris inflow rate [debris/s]
global psi;
psi=1*10^(-5);
%% Amount of energy per unit of food [kcal] 
global lambda;
lambda=0.3;
%% Coefficient for energy shortage [kcal]
global mu;
mu = u_inside*60*60*6.5*7000;
%% Maximum surplus nutritional energy of a worker [kcal]	
global a_max;
a_max=u_inside*60*60*6.5*5;


%% Initial worker[num]
global blood_init;
blood_init = 10;%7;
global forager_init;
forager_init = 5;%3;
global midworker_init;
midworker_init = 5;%3;
global nestworker_init;
nestworker_init = 5;%3;
%% Initial energy[kcal]
global ene_init;
ene_init=(blood_init + forager_init + midworker_init + nestworker_init) * a_max;

end
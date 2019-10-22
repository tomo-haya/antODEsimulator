%%Paper Title: Behavioral responses to colony-level property affect disturbance resistance of red harvester ant colonies
%%Author of this document: Tomohiro Hayakawa
%%Date: 2019/10/9
%%Matlab version: MatlabR2015a

This document explains how to use the program which makes Fig3-7 in main document and S1-S12 Table in Supplementary materials.

------------------------------Program explanation-------------------------
main_normal.m--------------
Program to make Fig3
How to use: Just perform main_normal.m.
Required other programs:
    set_parameter.m(Set parameters' value)
    solve_vdp.m(Set initial condition for ODE calculation)
    vdp.m(main ODE)
Note: 
    Figure(1) correponds to Fig. 3(a) 
    Figure(2) correponds to Fig. 3(b) 
    Figure(3-8) correponds to inset of figures in Fig. 3(a) 
    Figure(9-14) correponds to inset of figures in Fig. 3(b) 

main_make_bar.m--------------
Program to make Fig4
How to use: Just perform the program.
Required other programs:
    applyhatch_pluscolor.m
    makehatch_plus.m
    Note: Limit disturbance values written in the program were investigated previously.

main_disturbance.m--------------
Program to make Fig5-7
How to use: Define "Disturbance" in the program and perform it. 1:Starvation(Fig. 5) 2:Midden collapse(Fig. 6) 3:Debris inflow(Fig. 7)
Required other programs:
    set_parameter.m(Set parameters' value)
    solve_vdp_pertur.m(Set initial condition and disturbance condition)
    vdp.m(main ODE)
Note:
    Environmental disturbance values are same to the value written in the main document.

main_save_roundtrip.m--------------
Program to gather data for S1-S12 Tables
How to use: Please change four variable names in solve_vdp_roundtrip.m (Variable name1,Variable name2,Variable name3,Variable name4). 
Then, please perform solve_vdp_roundtrip.m. Then, corresponding mat file is created.
Required other programs:
    set_parameter.m(Set parameters' value)
    solve_vdp_roundtrip.m(Set initial conditios, that is, -50% and +50%)
    vdp.m(main ODE)
Note:
    After calculating all 20 variables' data (see latextable_for_journal.m) and one original one, then please perform latextable_for_journal('anyname');
    Then, the 'anyname' text is newly created which includes tables for latex.



%{
plot_spatAtt_All.m

Script to plot new and original spatial attribute results data together

Lewis Thresh 22/02/2018
%}

clear;
clc;
clf;
% Run scripts to gather data

run('Results_Decode.m');
run('Spatial_Attributes.m');
run('Hash_Results_Decode.m');

%%
run('sa_sharedMics.m');
%%
run('sa_allMics.m');
%%
run('sa_avgQ.m');
%%
run('sa_AvsB.m');
%%
run('sa_AvsB_allMics.m');
%%
run('sa_box_all.m');


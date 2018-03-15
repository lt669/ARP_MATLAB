%{
Results_Decode.m

Reads and decodes the results spreadsheet 'Results.xlsx' into array
'sortedArray' to be used to displaying sections of results

Lewis Thresh 22/02/2018
%}
clear;
clc;
[~,~,xlRaw] = xlsread('Results.xlsx','Raw Data','A1:BW41');
[xlSamp,~,~] = xlsread('Results.xlsx','Sample Numbers');

%{
    3D array for results
    Arrays: 
        1 = Spots
        2 = OCT
        3 = PCMA
        4 = Ambeo
        5 = IRT Cross
        6 = Hamasaki Cube
        7 = ST450
    [array,participant,result]
%}


%==========----------| Decode Excel Results Sheet

noOfPar = 38;  % Number of participants
ansIndex = 7; % Where the first sample specific answer starts
for i = 2:8   % 1-7 samples
    for k = 4:noOfPar+3 % Cycle through RAW data
        sub = k-3;
        micArray = xlSamp(sub,i);
        sortedArray(micArray,sub,1:9) = xlRaw(k,ansIndex:(ansIndex+8));        
    end
    ansIndex = ansIndex + 10;
end

questions = xlRaw(1,7:15);
% spotArray(:,:) = sortedArray(1,:,:);
% OCT(:,:) = sortedArray(2,:,:);


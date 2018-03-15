%{
Hash_Results_Decode.m

Reads and decodes Hash' original results that have been made into the spreadsheet 'Hash_Results.xlsx' into array
'hash_sortedArray' to be used to displaying sections of results

Lewis Thresh 26/02/2018
%}

[~,~,hash_xlRaw(1,:,:)] = xlsread('Hash_Results.xlsx','Spots');
[~,~,hash_xlRaw(2,:,:)] = xlsread('Hash_Results.xlsx','Eigen');
[~,~,hash_xlRaw(3,:,:)] = xlsread('Hash_Results.xlsx','ESMA');
[~,~,hash_xlRaw(4,:,:)] = xlsread('Hash_Results.xlsx','ORTF');
[~,~,hash_xlRaw(5,:,:)] = xlsread('Hash_Results.xlsx','A_ST450');
[~,~,hash_xlRaw(6,:,:)] = xlsread('Hash_Results.xlsx','C_IRT');
[~,~,hash_xlRaw(7,:,:)] = xlsread('Hash_Results.xlsx','C_Hamasaki');
[~,~,hash_xlRaw(8,:,:)] = xlsread('Hash_Results.xlsx','C_ST450');

%==========----------| Avereage Spatial Attributes

for mic = 1:8
    for q = 1:4
        hash_spatAttAvg(mic,q) = sum(cell2mat(hash_xlRaw(mic,q+2,2:20)))/20;
    end
end

%==========----------| Avereage Spatial Attributes Plot
%clf;
%bar(hash_spatAttAvg');


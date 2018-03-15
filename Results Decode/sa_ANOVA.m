% Spatial Attributes ANOVA
% Create sortedArray

run('Results_Decode.m');
run('Hash_Results_Decode.m');

% Position B data
for mic=1:7     % 7 mics
    for par=1:noOfPar   % 4 questions
        sa_ANOVA(mic,par) = sum(cell2mat(sortedArray(mic,par,2:5)))/4;
    end
end

% Position A data
for mic = 1:8
    for p = 2:20
        sa_ANOVA_H(mic,p-1) = sum(cell2mat(hash_xlRaw(mic,3:6,p)))/4;
    end
end
%%
sa_ANOVA_T = zeros(15,29);
sa_ANOVA_T(1:7,1:29) = sa_ANOVA;
sa_ANOVA_T(8:15,1:19) = sa_ANOVA_H;
sa_ANOVA_T(8:15,20:29) = nan;
%%
groups = {'Spots (B)','OCT (B)', 'PCMA (B)', 'AMBEO (B)', 'IRT Cross (C->B)', 'Hamasaki Cube (C->B)', 'ST450 (C->B)','Spots (A)','Eigen (A)','ESMA (A)','ORTF (A)','ST450 (A)','IRT (C)','Hamasaki (C)','ST450(C)'};
anova1(sa_ANOVA_T',groups);


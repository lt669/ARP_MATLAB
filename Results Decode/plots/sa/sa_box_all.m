% Locatedness t(mic,par)

q = 4;

switch q
    case 1
        array = 1;
        titleStr = 'Locatedness';
    case 2 
        array = 2;
        titleStr = 'Sense of space';
    case 3 
        array = 3;
        titleStr = 'Envelopment';
    case 4 
        array = 4;
        titleStr = 'Externalisation';
end

sa_raw_loc = cell2mat(sortedArray(:,:,array + 1));
sa_raw_loc_h(:,:) = cell2mat(hash_xlRaw(:,array + 2,2:20));

t = zeros(15,38);

t(1:7,1:38) = sa_raw_loc;
t(8:15,1:19) = sa_raw_loc_h;
t(8:15,20:38) = NaN;
% Boxplot
figure('name',titleStr);
boxplot(t');
textLeg = {'Spots (B)','OCT (B)', 'PCMA (B)', 'AMBEO (B)', 'IRT Cross (C->B)', 'Hamasaki Cube (C->B)', 'ST450 (C->B)','Spots (A)','Eigen (A)','ESMA (A)','ORTF (A)','ST450 (A)','IRT (C)','Hamasaki (C)','ST450(C)'};
set(gca,'xticklabels',textLeg,'XTickLabelRotation',55);
ylabel('Spatial Attribute Score');
xlabel('Microhpone Configuration');
hold on
% Scatter
%clf;
% Add Y offset for clarity
y=(1/7.5);
f = 1.2;
sz = 40;
index = 1;
shape = {'o','v','d','^','s','>','<','o','v','o','v','d','^','s','>'};
for mic = 1:15
    for par = 1:38
        % Vector for spreading results along X axis
        scatterX(mic,par) = mic - ((19-(par-1))/(38*f));
        %scatterX(index) = mic - ((19-(par-1))/(38*f));
        t_all(index) = t(mic,par);
        %d{index} = shape(mic);
        index = index + 1;
    end
end
for i = 1:15
    scatter(scatterX(i,:),t(i,:),sz,shape{i});
    hold on
end

% Labels
title(titleStr);
textLeg = {'Spots (B)','OCT (B)', 'PCMA (B)', 'AMBEO (B)', 'IRT Cross (C->B)', 'Hamasaki Cube (C->B)', 'ST450 (C->B)','Spots (A)','Eigen (A)','ESMA (A)','ORTF (A)','ST450 (A)','IRT (C)','Hamasaki (C)','ST450(C)'};
set(gca,'XTick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15],'xticklabels',textLeg,'XTickLabelRotation',55);
set(gca,'YTick',[1 2 3 4 5 6 7 8 9 10]);
%set(gca,'title',title);
ylim([0 10]);
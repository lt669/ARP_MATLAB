%% Shared A and B micropones timbral comparison
%{
    A(1) B(1) Spots
    A(6) B(5) IRT Cross
    A(7) B(6) Hamasaki Cube
    A(8) B(7) ST450
%}

ta_AB(1,:) = timbreResults_H(1,:);
ta_AB(2,:) = timbreResults(1,:);

index = 5;
for mic = 3:2:8
    ta_AB(mic,:) = timbreResults_H(index+1,:);
    ta_AB(mic+1,:) = timbreResults(index,:);
    index = index + 1;
end

% Calculate differences between shared mics (+ A higher, - B higher)
index = 1;
for i = 1:2:8
    diff(index,:) = ta_AB(i,:) - ta_AB(i+1,:);
    for x = 1:6
        diff_ratio(index,x) = ta_AB(i,x)/ta_AB(i+1,x);
        diff_ratio_inv(index,x) = ta_AB(i+1,x)/ta_AB(i,x);
    end
    index = index + 1;
end

% Average difference
diff_av = sum(abs(diff),1)/4;
diff_av_sway = sum(diff,1)/4;


x = gcf;
b = bar(ta_AB');
%applyhatch_plusC(x,'/-x.\+','rkbkmk',[],500);
a = 1;
set(b,'FaceColor',[a a a]);
title(sprintf('Timbral Attributes Assigned to Each Microphone Configuration as A Percentage of Participants'));
name = {'Full','Bright','Flat','Rich', 'Realistic', 'Loud'};
set(gca,'xticklabel',name)

xlabel('Timbral Attributes');
ylabel('Participants (%)');
textLeg = {'Spots (A)','Spots (B)','IRT Cross (A)','IRT Cross (C->B)', 'Hamasaki Cube (A)', 'Hamasaki Cube (C->B)', 'ST450 (A)', 'ST450 (C->B)'};
textC = {'r','r','k','k','b','b','m','m',};

pos = zeros(8,1);
pos(1) = [0.64];
for q = 1:6
    for mic = 1:8
        pos(mic+1) = pos(mic)+0.1;
        h = text(pos(mic) + (1*(q-1)),ta_AB(mic,q) + 1,textLeg{mic},'HorizontalAlignment','left','FontSize',10.5,'color',textC{mic});
        %h = text(pos(mic) + (1*(q-1)),1,textLeg{mic},'HorizontalAlignment','left','FontSize',10.5,'color',textC{mic});
        set(h,'Rotation',90);
    end
end
grid on;
name = {'Full','Bright','Flat','Rich', 'Realistic', 'Loud'};
set(gca,'xticklabel',name);
ylim([0 100]);
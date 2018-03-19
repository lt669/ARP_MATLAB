% plot_sa_vs_ta

%{

    - Load SA scores
    - Order from highest to lowest
    - Plot correspongin TA scor

eg Graph: SA: loc TA Full

%}

% Both scripts run the necessary results decode scripts
clear;
clc;
run('Timbral_Attributes.m');
run('Hash_Timbral_Attributes.m');
run('Spatial_Attributes.m');


sa = 2; % [loc sos ext env]
ta = 5; % [Full Bright Flat Rich Realistic Loud]

[sTitle,tTitle] = getAttributes(sa,ta);
 
sorted_Att = zeros(15,3,4); %[index SA TA]
for i = 1:4
    sorted_Att(:,1,i) = 1:15;
    % Load Att results into array for sorting
    sorted_Att(1:7,2,i) = spatialAttAvg(:,i);
    sorted_Att(8:15,2,i) = hash_spatAttAvg(:,i);
    sorted_Att(1:7,3,i,1:4) = timbreResults(:,ta);
    sorted_Att(8:15,3,i,1:4) = timbreResults_H(:,ta);
    % Sort
    sorted_Att_2(:,:,i) = sortrows(sorted_Att(:,:,i),2,'descend');
end

% Subplotting
subplot(4,1,1),[ax,h1,hh1] = plotyy([0.75:1:14.75],sorted_Att_2(:,2,1),[1.25:1:15.25],sorted_Att_2(:,3,1),'bar','bar');
title(strcat('Localisation - ',tTitle));
subplot(4,1,2),[ax,h2,hh2] = plotyy([0.75:1:14.75],sorted_Att_2(:,2,2),[1.25:1:15.25],sorted_Att_2(:,3,2),'bar','bar');
title(strcat('Sense Of Space - ',tTitle));
subplot(4,1,3),[ax,h3,hh3] = plotyy([0.75:1:14.75],sorted_Att_2(:,2,3),[1.25:1:15.25],sorted_Att_2(:,3,3),'bar','bar');
title(strcat('Externalisation - ',tTitle));
subplot(4,1,4),[ax,h4,hh4] = plotyy([0.75:1:14.75],sorted_Att_2(:,2,4),[1.25:1:15.25],sorted_Att_2(:,3,4),'bar','bar');
title(strcat('Envelopment - ',tTitle));
for i = 1:4
    set(eval(sprintf('h%i',i)),'FaceColor','r');
    set(eval(sprintf('hh%i',i)),'FaceColor','b');
end


% Plot correlation
% limit data between 0 - 1
a = squeeze(sorted_Att_2(:,2,:));
b = squeeze(sorted_Att_2(:,3,:));
limData(:,1,:) = sorted_Att_2(:,1,:);
limData(:,2,:) = a./max(a);
limData(:,3,:) = b./max(b);
figure


for i = 1:4
    % Use Function
    [rFun(:,:,i),p(:,:,i)] = corrcoef(limData(:,2,i),limData(:,3,i));
    
    % Calculate manualy
    x = squeeze(limData(:,2,i));
    y = squeeze(limData(:,3,i));
    % Calculate correlation coefficient for each SA
    n = 15;
    r(i) = (n*(sum(x.*y)) - (sum(x)*sum(y)))/(sqrt((n*(sum(x.^2)) - (sum(x))^2)*(n*(sum(y.^2))-(sum(y))^2)));
    r(i) = round(r(i),2);
    
    coeffs = polyfit(x,y,1);
    % Create vector with linearly distributed points
    fittedX(i,:) = linspace(min(x),max(x),200);
    % Get Y values of polynomial at value X (spatialAtt)
    fittedY(i,:) = polyval(coeffs,fittedX(i,:));
    
    t = i;
    subplot(4,1,1), plot(fittedX(t,:),fittedY(t,:));
    hold on
    subplot(4,1,1), plot(fittedX(t,:),fittedY(t,:));
end
grid on
legend('Loc','SoS','Ext','Env');
%%
clf;
t = 4;
plot(fittedX(t,:),fittedY(t,:),'r-');


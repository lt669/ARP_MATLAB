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
 
saUnsorted = zeros(15,2,4);
taUnsorted = zeros(15,2,7);


saUnsorted(1:7,2,:) = spatialAttAvg(:,:);
saUnsorted(8:15,2,:) = hash_spatAttAvg(:,:);
for i = 1:4
    saUnsorted(:,1,i) = 1:15;
    saSort(:,:,i) = sortrows(saUnsorted(:,:,i),2,'descend');
end

taUnsorted(1:7,2,1:6) = timbreResults(:,:);
taUnsorted(8:15,2,1:6) = timbreResults_H(:,:);
% Add enjoyment rating
enjoy1 = cell2mat(sortedArray(:,:,9));
% Remove NaN's and average
for i = 1:7
    enjoy2 = squeeze(enjoy1(i,:));
    enjoy2(isnan(enjoy1(i,:))) = [];
    enjoy3(i,1:length(enjoy2)) = enjoy2;
end
taUnsorted(1:7,2,7) = squeeze(sum(enjoy3,2)/38);
taUnsorted(8:15,2,7) = squeeze(sum(cell2mat(hash_xlRaw(1:8,11,2:20)),3)/19);


for i = 1:7
    taUnsorted(:,1,i) = 1:15;
end
a = squeeze(saUnsorted(:,2,:));
b(:,1:7) = squeeze(taUnsorted(:,2,1:7));
legIndex = 1; % Used for variable sized legend (added legend for plotting extra data
cIndex = 1;
titles = {'Locatedness','Sense of Space','Externalisation','Envelopment'};
colors = {'r','b','k','c','m'};
markers = {'o','x', '*'};
clc;
clf;

%% PLOT ALL ON SUBPLOTS
% Plot correlation
% limit data between 0 - 1
for i = 1:4
    for t = 1:6
        % Empty array to assign zeros to legend before all R and P is
        % calculated
        R = zeros(1,7);
        P = zeros(1,7);
        
        % Get attribute names (For legend)
        [sTitle,tTitle] = getAttributes(sa,t);
        
        % Use Function
        [rFun(:,:,i,t),p(:,:,i,t)] = corrcoef(a(:,i),b(:,t));
        R(t) = round(rFun(1,2,i,t),3);
        P(t) = round(p(1,2,i,t),3);

        % Calculate manualy
        x = squeeze(a(:,i));
        y = squeeze(b(:,t));
        
        % Calculate correlation coefficient for each SA
        n = 15;
        r_temp = (n*(sum(x.*y)) - (sum(x)*sum(y)))/(sqrt((n*(sum(x.^2)) - (sum(x))^2)*(n*(sum(y.^2))-(sum(y))^2)));
        r(i,t) = round(r_temp,2);

        coeffs = polyfit(x,y,1);
        % Create vector with linearly distributed points
        fittedX(i,t,:) = linspace(min(x),max(x),200);
        % Get Y values of polynomial at value X (spatialAtt)
        fittedY(i,t,:) = polyval(coeffs,fittedX(i,t,:));

        % Scale between centre values are aligned
        plotA = squeeze(fittedX(i,t,:));
        plotB = squeeze(fittedY(i,t,:));
        
        % Plot line of best fit
        subplot(2,2,i), h(t) = plot(plotA,plotB);
        % Add Legend for line
        legtextTEMP = {...
        sprintf('Full: r=%.2f, p=%.3f',R(1),P(1)),...
        sprintf('Bright: r=%.2f, p=%.3f',R(2),P(2)),...
        sprintf('Flat: r=%.2f, p=%.3f',R(3),P(3)),...
        sprintf('Rich: r=%.2f, p=%.3f',R(4),P(4)),...
        sprintf('Realistic: r=%.2f, p=%.3f',R(5),P(5)),...
        sprintf('Loud: r=%.2f, p=%.3f',R(6),P(6)),...
        sprintf('Enjoyment: r=%.2f, p=%.3f',R(7),P(7))};
    
        textLegend{legIndex} = legtextTEMP{t};
        legIndex = legIndex +1;
        hold on
        
        % Indicate lines with low P-Value
        if P(t) < 0.05
            set(h(t),'LineStyle','--','Color',colors{cIndex});
            subplot(2,2,i),plot(x,y,markers{cIndex},'Color',colors{cIndex});
            % Add extra legend for new data
            textLegend{legIndex} = strcat('',tTitle,' Data');
            disp(sprintf('[Debug]: R(%i): %.3f P(%i): %.3f testLegend{%i}: %s',i,R(t),t,P(t),legIndex,textLegend{legIndex}));
            cIndex = cIndex + 1;
            legIndex = legIndex + 1;
        end
        grid on
    end
    
    legIndex = 1;
    title(titles{i});
    
    leg = legend(textLegend);
    set(leg,'location','best');
    cIndex = 1;
end

%% Plot just Envelopment
clf;
i = 4;
for t = 1:6
    % Empty array to assign zeros to legend before all R and P is
    % calculated
    R = zeros(1,6);
    P = zeros(1,6);

    % Get attribute names (For legend)
    [sTitle,tTitle] = getAttributes(sa,t);

    % Use Function
    [rFun(:,:,i,t),p(:,:,i,t)] = corrcoef(a(:,i),b(:,t));
    R(t) = round(rFun(1,2,i,t),3);
    P(t) = round(p(1,2,i,t),3);

    % Calculate manualy
    x = squeeze(a(:,i));
    y = squeeze(b(:,t));

    % Calculate correlation coefficient for each SA
    n = 15;
    r_temp = (n*(sum(x.*y)) - (sum(x)*sum(y)))/(sqrt((n*(sum(x.^2)) - (sum(x))^2)*(n*(sum(y.^2))-(sum(y))^2)));
    r(i,t) = round(r_temp,2);

    coeffs = polyfit(x,y,1);
    % Create vector with linearly distributed points
    fittedX(i,t,:) = linspace(min(x),max(x),200);
    % Get Y values of polynomial at value X (spatialAtt)
    fittedY(i,t,:) = polyval(coeffs,fittedX(i,t,:));

    % Scale between centre values are aligned
    plotA = squeeze(fittedX(i,t,:));
    plotB = squeeze(fittedY(i,t,:));

    % Plot line of best fit
    h(t) = plot(plotA,plotB);
    % Add Legend for line
    legtextTEMP = {...
    sprintf('Full: r=%.2f, p=%.3f',R(1),P(1)),...
    sprintf('Bright: r=%.2f, p=%.3f',R(2),P(2)),...
    sprintf('Flat: r=%.2f, p=%.3f',R(3),P(3)),...
    sprintf('Rich: r=%.2f, p=%.3f',R(4),P(4)),...
    sprintf('Realistic: r=%.2f, p=%.3f',R(5),P(5)),...
    sprintf('Loud: r=%.2f, p=%.3f',R(6),P(6))};

    textLegend{legIndex} = legtextTEMP{t};
    legIndex = legIndex +1;
    hold on

    % Indicate lines with low P-Value
    if P(t) < 0.05
        set(h(t),'LineStyle','--','Color',colors{cIndex});
        plot(x,y,markers{cIndex},'Color',colors{cIndex});
        % Add extra legend for new data
        textLegend{legIndex} = strcat('',tTitle,' Data');
        disp(sprintf('[Debug]: R(%i): %.3f P(%i): %.3f testLegend{%i}: %s',i,R(t),t,P(t),legIndex,textLegend{legIndex}));
        cIndex = cIndex + 1;
        legIndex = legIndex + 1;
    end
    grid on
end
    
legIndex = 1;
title(strcat('Correlation between Timbral Attributes and','{ }',titles{i},''));

leg = legend(textLegend);
set(leg,'location','best');
cIndex = 1;

clear;
clc;
run('Results_Decode.m');
run('Spatial_Attributes.m');
run('Hash_Results_Decode.m');
% sortedArray(mic,Par,9)
%| Calculate average enjoyment rating across participants
% POSITION B
for mic = 1:7
    a = cell2mat(sortedArray(mic,:,9));
    a(isnan(a)) = [];
    e(mic) = sum(a)/length(a);
end

% POSITION A
for mic = 1:8
    a = cell2mat(hash_xlRaw(mic,11,2:20));
    a(isnan(a)) = [];
    eH(mic) = sum(a)/length(a);
end


xB = spatialAttAvgMic;
yB = e;

xA = hash_spatAttAvgMic;
yA = eH;

% Get x and y data for plotting
[fittedX_A,fittedY_A] = getCoeff(xA,yA);
[fittedX_B,fittedY_B] = getCoeff(xB,yB);

% Using function for r and p calues
[rFun_B,pFun_B] = corrcoef(xB,yB);
[rFun_A,pFun_A] = corrcoef(xA,yA);

% PLOT B

% Plot points
%%clf;
markers = {'o','*','s','d','^','v','>','<','p','h'};
for p = 1:length(xB)
    subplot(2,1,2);plot(xB(p),yB(p),markers{p},'color',rand(1,3),'MarkerSize',10,'LineWIdth',1.5);
    hold on;
end

hold on;
subplot(2,1,2);plot(fittedX_B,fittedY_B,'r-');
ylim = [6.8 8];
xlim = [6.6 7.8];
grid on;

leg = legend('Spots','OCT', 'PCMA', 'AMBEO', 'IRT Cross', 'Hamasaki Cube', 'ST450','Best Fit');
set(leg,'location','best');
HeightScaleFactor = 1.5;
NewHeight = leg.Position(4) * HeightScaleFactor;
leg.Position(2) = leg.Position(2) - (NewHeight - leg.Position(4));
leg.Position(4) = NewHeight;

xlabel(sprintf('Average Enjoyment Score, r = %0.2f, p = %0.2f',rFun_B(1,2),pFun_B(1,2)));
ylabel('Average Spatial Attribut Score');
title('Graph Showing Correlation Between Average Spatial Attribute Score and Enjoyment Rating: Position B');

% PLOT A

% Plot points

markers = {'o','*','s','d','^','v','>','<','p','h'};
for p = 1:length(xA)
    subplot(2,1,1);plot(xA(p),yA(p),markers{p},'color',rand(1,3),'MarkerSize',10,'LineWIdth',1.5);
    hold on;
end

hold on;
subplot(2,1,1);plot(fittedX_A,fittedY_A,'r-');
ylim = [6.8 8];
xlim = [6.6 7.8];
grid on;

leg = legend('Spots','Eigen','ESMA','ORTF','ST450','IRT','Hamasaki Cube','ST450','Best Fit');
set(leg,'location','best');
set(leg,'location','best');
HeightScaleFactor = 1.5;
NewHeight = leg.Position(4) * HeightScaleFactor;
leg.Position(2) = leg.Position(2) - (NewHeight - leg.Position(4));
leg.Position(4) = NewHeight;

xlabel(sprintf('Average Enjoyment Score, r = %0.2f, p = %0.2f',rFun_A(1,2),pFun_A(1,2)));
ylabel('Average Spatial Attribut Score');
title('Graph Showing Correlation Between Average Spatial Attribute Score and Enjoyment Rating: Position A');

%%

function [fitX,fitY] = getCoeff(x,y)
    % Correlation Coefficient
    n = length(x);
    r = (n*(sum(x.*y)) - (sum(x)*sum(y)))/(sqrt((n*(sum(x.^2)) - (sum(x))^2)*(n*(sum(y.^2))-(sum(y))^2)));
    r = round(r,2);
    % Generate coefficients of polynomial for the two vectors
    coeffs = polyfit(x,y,1);
    % Create vector with linearly distributed points
    fitX = linspace(min(x),max(x),200);
    % Get Y values of polynomial at value X (spatialAtt)
    fitY = polyval(coeffs,fitX);
end

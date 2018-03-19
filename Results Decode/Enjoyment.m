% sortedArray(mic,Par,9)
%| Calculate average enjoyment rating across participants
for mic = 1:7
    a = cell2mat(sortedArray(mic,:,9));
    a(isnan(a)) = [];
    e(mic) = sum(a)/length(a);
end

x = spatialAttAvgMic;
y = e;

% Correlation Coefficient
n = 7;
r = (n*(sum(x.*y)) - (sum(x)*sum(y)))/(sqrt((n*(sum(x.^2)) - (sum(x))^2)*(n*(sum(y.^2))-(sum(y))^2)));
r = round(r,2);
% Generate coefficients of polynomial for the two vectors
coeffs = polyfit(x,y,1);
% Create vector with linearly distributed points
fittedX = linspace(min(x),max(x),200);
% Get Y values of polynomial at value X (spatialAtt)
fittedY = polyval(coeffs,fittedX);

% Plot points
clf;
markers = {'o','*','s','d','^','v','>','<','p','h'};
for p = 1:length(x);
    plot(x(p),y(p),markers{p},'color',rand(1,3),'MarkerSize',10,'LineWIdth',1.5);
    hold on;
end
%scatter(x,y,'r','filled');
leg = legend('Spots','OCT + Spots', 'PCMA + Spots', 'AMBEO + Spots', 'IRT Cross + Spots', 'Hamasaki Cube + Spots', 'ST450 + Spots');
set(leg,'location','best');

hold on;
plot(fittedX,fittedY,'r-');
ylim = [6.8 8];
xlim = [6.6 7.8];
grid on;

xlabel(sprintf('Average Enjoyment Score, P = %0.2f',r));
ylabel('Average Spatial Attribut Score');
title('Graph Showing Correlation Between Average Spatial Attribute Score and Enjoyment');

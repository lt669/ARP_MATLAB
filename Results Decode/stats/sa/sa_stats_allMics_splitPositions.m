% Determine statistical significance between all microphones but looking at
% Position A and B seperately

% Change for git

%{
    GROUP = MICROPHONE
    THEREFORE, REARANGE SA MATRIX TO HAVE MICROPHONES IN COLUMS
%}

% Rearrange the order of hash_xlRaw matrix
hash_xlRaw_Re = permute(hash_xlRaw,[3 1 2]);
hash_xlRaw_Re = hash_xlRaw_Re(2:20,:,3:11);
% Rearrange sorted array
sortedArray_Re = permute(sortedArray,[2 1 3]);


x1 = zeros(38,7,4);
x2 = zeros(19,8,4);

x1 = cell2mat(sortedArray_Re(:,:,2:5));
%x2 = cell2mat(permute(hash_xlRaw_Re(:,:,1:4),[2,1,3]));
x2 = cell2mat(hash_xlRaw_Re(:,:,1:4));

% Check Variance between groups (checks variance of columns)
v1 = squeeze(var(x1(:,:,:)));
v2 = squeeze(var(x2(:,:,:)));

for q = 1:4
    for mic = 1:7
        vt1(mic,q) = vartest(x1(:,mic,q),v1(mic,q));
        adX1(mic,q) = adtest(x1(:,mic,q));
    end
    
    for mic = 1:8
        vt2(mic,q) = vartest(x2(:,mic,q),v2(mic,q));
        adX2(mic,q) = adtest(x2(:,mic,q));
    end
end

% Perform ANOVA for each question
%a1 = anova1(x(:,:,1));
for i = 1:4
    [k1(1,i),tbl(:,:,i),stats1(i)] = kruskalwallis(x1(:,:,i),[],'off');
    [k1(2,i),tb2(:,:,i),stats2] = kruskalwallis(x2(:,:,i),[],'off');
end
%c = multcompare(stats1(2));

[~,~,statsTest] = kruskalwallis(x1(:,:,2),[],'off');
c = multcompare(statsTest);

% Plot the distributions of Groups 1, 2 and 3
%%
close all
h1 = histfit(x1(:,1,2),[],'normal');delete(h1(1));
hold on
h2 = histfit(x1(:,1,2),[],'kernel');%delete(h2(1));


%%
fit = 'kernel';
close all
h1 = histfit(x1(:,1,2),[],fit);
hold on
h2 = histfit(x1(:,2,2),[],fit);
h3 = histfit(x1(:,3,2),[],fit);
h4 = histfit(x1(:,4,2),[],fit);
h5 = histfit(x1(:,5,2),[],fit);
h6 = histfit(x1(:,6,2),[],fit);
h7 = histfit(x1(:,7,2),[],fit);

xlabel('Spatial Attribute Score');
ylabel('No. of Participants Answered');
title('Distribution of SA scores per microphone');

set(h1(2),'color','r','linestyle',':'); delete(h1(1));
set(h2(2),'color','g','linestyle','--'); delete(h2(1));
set(h3(2),'color','b'); delete(h3(1));
set(h4(2),'color','k'); delete(h4(1));
set(h5(2),'color','m'); delete(h5(1));
set(h6(2),'color','k','linestyle','-.'); delete(h6(1));
set(h7(2),'color','c'); delete(h7(1));

textLeg = {'Spots (B)','OCT (B)', 'PCMA (B)', 'AMBEO (B)', 'IRT Cross (C->B)', 'Hamasaki Cube (C->B)', 'ST450 (C->B)'};
legend(textLeg);
grid on
%%
data = x(:,1,1);
rank = tiedrank(data);
p = rank / ( length(rank) + 1 ); %# +1 to avoid Inf for the max point
% Find the normal inverse cumulative distribution function
newdata = norminv( p, 0, 1 );

bcData = boxcox(data);

v1 = var(data)
v2 = var(newdata)
v3 = var(bcData)

close all
histfit(data);
figure
histfit(newdata);
figure
histfit(bcData);

ad1 = adtest(data);
ad2 = adtest(newdata);
ad3 = adtest(bcData);


%%
plot(data);
hold on
plot(newdata+10);
hold on
plot(p+10);
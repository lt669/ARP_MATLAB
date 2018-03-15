% Perform ANOVA to determine difference in mean across SA score for each
% mic array for each SA question

% Concatinate SA results from Hash's and new test

% Rearrange the order of hash_xlRaw matrix
hash_xlRaw_Re = permute(hash_xlRaw,[1 3 2]);
hash_xlRaw_Re = hash_xlRaw_Re(:,2:20,3:11);

x = zeros(15,38,4);
x(1:7,:,:) = cell2mat(sortedArray(:,:,2:5));
x(8:15,1:19,:) = cell2mat(hash_xlRaw_Re(:,:,1:4));
x(8:15,20:38,:) = NaN;

% Reshape 'x' so microhpones = colums
x = permute(x,[2,1,3]);

% Check Variance between groups
v(1:7,:) = squeeze(var(x(:,1:7,:)));
v(8:15,:) = squeeze(var(x(1:19,8:15,:)));
for q = 1:4
    for mic = 1:15
        vt(mic,q) = vartest(x(:,mic,q),v(mic,q));
        adX(mic,q) = adtest(x(:,mic,q));
    end
end

% Perform ANOVA for each question
%a1 = anova1(x(:,:,1));
k1 = kruskalwallis(x(:,:,4));

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
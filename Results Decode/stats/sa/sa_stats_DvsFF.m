%{
    sa_stats_DvsFF: Using a K-W test to analyse the difference WITHING
    Diffuse and Free-Field microphone array groups
%}

% Rearrange the order of hash_xlRaw matrix
hash_xlRaw_Re = permute(hash_xlRaw,[3 1 2]); %[par,mic,q]
hash_xlRaw_Re = hash_xlRaw_Re(2:20,:,3:11);

% Rearrange sorted array
sortedArray_Re = permute(sortedArray,[2 1 3]); %[par,mic,q]

% Create arrays for Diffuse and FF microphones
FF = zeros(38,8,4);
D = zeros(38,7,4);

FF(:,1:4,:) = cell2mat(sortedArray_Re(:,1:4,2:5));
FF(1:19,5:8,:) = cell2mat(hash_xlRaw_Re(:,1:4,1:4));
FF(20:38,5:8,:) = nan;

%P  = cell2mat(hash_xlRaw_Re(:,1:4,1:4));
D(:,1:3,:) = cell2mat(sortedArray_Re(:,5:7,2:5));
D(1:19,4:7,:) = cell2mat(hash_xlRaw_Re(:,5:8,1:4));
D(20:38,4:7,:) = nan;

% Check the variance between groups
v_D = squeeze(var(D(:,:,1)));

% Confirm that not all data is normally distributed
for i = 1:4
    v_Dall(i) = vartestn(D(:,:,i),'Display','off');
    v_FFall(i) = vartestn(FF(:,:,i),'Display','off');
    for mic = 1:7
        ad_D(mic,i) = adtest(D(:,mic,i));
    end
    for mic = 1:8
        ad_FF(mic,i) = adtest(FF(:,mic,i));
    end
end

for i = 1:4
    [kw(1,i),~,stats_D(i)] = kruskalwallis(D(:,:,i),[],'off');
    [kw(2,i),~,stats_F(i)] = kruskalwallis(FF(:,:,i),[],'off');
end

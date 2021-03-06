
%{
 sa_stats_DvsFF_V2: Using a K-W test to analyse the difference between all Diffuse and Free-Field
 microphone arrays AVERAGED
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

% Average all FF and D results for direct comparison
D_av(1:19,:) = squeeze(sum(D(1:19,:,:),2)/7);
D_av(20:38,:) = squeeze(sum(D(20:38,1:3,:),2)/3);

FF_av(1:19,:) = squeeze(sum(FF(1:19,:,:),2)/8);
FF_av(20:38,:) = squeeze(sum(FF(20:38,1:4,:),2)/4);


% Check the variance between groups
v_D = squeeze(var(D(:,:,1)));

% Confirm that not all data is normally distributed
for i = 1:4
    v_Dall(i) = vartestn(D_av(:,i),'Display','off');
    v_FFall(i) = vartestn(FF_av(:,i),'Display','off');

    ad_D(i) = adtest(D(:,i));
    ad_FF(i) = adtest(FF(:,i));

end

% Create seperate vectors for comparison
for i = 1:4
    comp(:,1,i) = FF_av(:,i);
    comp(:,2,i) = D_av(:,i);
end


for i = 1:4
    [kw_D(1,i),~,stats_D(i)] = kruskalwallis(D_av(:,i),[],'off');
    [kw_FF(1,i),~,stats_F(i)] = kruskalwallis(FF_av(:,i),[],'off');
    
    [kw(i),~,stats_DvF(i)] = kruskalwallis(comp(:,:,i),[],'off');
    
    multcompare()
end

% run KW on mic in D and in FF and then comapre them all against each other
%

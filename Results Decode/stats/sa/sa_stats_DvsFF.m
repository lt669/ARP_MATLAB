% sa_stats_DvsFF

% Using a K-W test to analyse the difference between Diffuse and Free-Field
% microphone arrays

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
FF(19:38,5:8,:) = nan;

%P  = cell2mat(hash_xlRaw_Re(:,1:4,1:4));
D(:,1:3,:) = cell2mat(sortedArray_Re(:,5:7,2:5));
D(1:19,4:7,:) = cell2mat(hash_xlRaw_Re(:,5:8,1:4));
D(19:38,4:7,:) = nan;

% Check the variance between groups
v_D = squeeze(var(D(:,:,1)));

v_Dall = vartestn(D(:,:,1));
% Hash_Timbral_Attributes

run('Hash_Results_Decode.m');

% Produce list of attributes for each mic
%hash_xlRaw(mic,7,2:20)

for mic = 1:8
    startIndex = 1;
   for par = 2:20
      val = cell2mat(hash_xlRaw(mic,7,par));
      if strcmp(mat2str(val),'NaN') == 0
          % Load all answers into array
          tempArray = strsplit(val,',');
          [x,y,z] = size(tempArray);
          
          % Add current partisipants answers to list of total answers per
          % mic
          timbreAttArray_H(mic,startIndex:(startIndex+y-1)) = strtrim(tempArray);
          startIndex = startIndex + y;
      end
   end
end

% Count number of attributes
for mic = 1:8
    for att = 1:6
        attString_H = findAttributeName_Hash(att);
        attAns = timbreAttArray_H(mic,:);
        timbreResults_H(mic,att) = (sum(strcmp(attString_H,attAns))/19)*100;
    end
end

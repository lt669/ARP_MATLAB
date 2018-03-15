% Timbral Attributs Extraction
% sortedArray(mic,par,6)
% timbreAttSplit(mic,par,ans)
% timbreAttArray(mic,ans)

%==========----------| Extracting Timbral Attribute Results
run('Results_Decode.m');

% Produce an list of attributes given for each mic array (timbreAttArray)
for mic = 1:7
    startIndex = 1;
    for par = 1:noOfPar
        val = cell2mat(sortedArray(mic,par,6));
        comp = 'NaN';
        if strcmp(mat2str(val),comp) == 0
            % Load answers into of variable size
            tempArray = strsplit(val,','); 
            [x,y,z] = size(tempArray);
            % Add new answers on the end of the array full of answers
            timbreAttArray(mic,startIndex:(startIndex+y-1)) = strtrim(tempArray);
            startIndex = startIndex + y;
        end
    end
end

% Extract number of each attribute for each mic
% timbreResults(mic,att)

% Scan through list of attributes and count how many there are of each one
% for each array (timbreResults)
for mic = 1:7
    for att = 1:6
        attString = findAttributeName(att);
        attAns = timbreAttArray(mic,:);
        timbreResults(mic,att) = (sum(strcmp(attString,attAns))/noOfPar)*100;        
    end
    
end
   

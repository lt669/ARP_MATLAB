% Extract Comments For each Mic Array and Display

for mic = 1:7
cIndex = 1;
    for par = 1:29
        comment = sortedArray(mic,par,8);
        if strcmp(mat2str(cell2mat(comment)),'NaN') == 0
             cArray{mic,cIndex} = comment;
             cIndex = cIndex + 1;
        end
    end
end

t = table(cArray(1,:));
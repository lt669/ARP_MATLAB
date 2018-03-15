function y = findAttributeName(x)
    switch x
        case 1
            y = 'Full / Warm (abundance of low frequencies present)';
        case 2
            y = 'Bright (abundance of high frequencies present)';
        case 3
            y = 'Flat (lack of low and high frequencies)';
        case 4
            y = 'Rich (abundance of both lower and higher frequencies)';
        case 5
            y = 'Realistic (the sounds are perceived to be realistic and sound like real instruments)';
        case 6
            y = 'Loud (perceived amplitude is high)';
        otherwise
            ('No Attribute');
    end            
end

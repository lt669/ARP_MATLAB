function [sa,ta] = getAttributes(x, y)

    switch x
        case 1
            sa = 'Locatedness';
        case 2
            sa = 'Sense of Space';
        case 3
            sa = 'Externalisation';
        case 4
            sa = 'Envelopment';
    end
    
    switch y
        case 1
            ta = 'Full';
        case 2
            ta = 'Bright';
        case 3
            ta = 'Flat';
        case 4
            ta = 'Rich';
        case 5
            ta = 'Realistic';
        case 6
            ta = 'Loud';
        case 7
            ta = 'Enjoyment';
    end
end
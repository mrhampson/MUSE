% Fills in holes in data with the non-zero average of the column
% This assumes we are operating on a single column

function ret = fillMissing(X)
    sum = 0;
    numNotZero = 0;
    average = 0;
    ret = [];
    for i = 1:size(X,1)
        if(X(i,1) ~= 0)
            sum = sum + X(i,1);
            numNotZero = numNotZero + 1;
        end
    end
    
    average = sum / numNotZero;
    X(X == 0) = average;
    ret = X;
end
    
    
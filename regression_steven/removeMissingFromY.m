% Will remove samples if Y is 0

function [X, Y] = removeMissingFromY(Xin, Yin)
    X = [];
    Y = [];
    
    for i = 1:size(Xin,1)
        if(Yin(i,1) ~= 0)
            X = [X; Xin(i,:)];
            Y = [Y; Yin(i,1)];
        end
    end
end

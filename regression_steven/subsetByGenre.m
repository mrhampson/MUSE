% Select a subset of songs based on the genre value in 'categories'
% Will only select one genre

function [X, Y] = subsetByGenre( genre, categories, Xin, Yin )
    X = [];
    Y = [];
    numSample = size(Xin,1);
    
    for i = 1:numSample
        if(categories(i,genre))
            X = [X; Xin(i,:)];
            Y = [Y; Yin(i,1)];
        end
    end
end
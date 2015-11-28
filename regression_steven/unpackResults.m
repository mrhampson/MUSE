% Unpacks the struct vector that perGenreRegression returns

function [MSEs, weights]  = unpackResults(R)
    MSEs = [];
    weights = [];
    for i = 1:size(R,1)
        currentResult = R(i,1);
        assert(currentResult.genreID == i); %Dont want to fuck up order
        
        MSEs = [MSEs; currentResult.mse];
        weights = [weights currentResult.weights];
        
    end
end
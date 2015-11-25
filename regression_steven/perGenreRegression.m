% Takes as arguments the category matrix (Genre tags of each song), the 
%   songs themselves, the hotness.
%  Will automatically parse out matrices of songs that belong to each
%   genre and will return a struct containing the CrossValidation and 
%   weights for each

% results struct of form struct(genreID, mse, weights)



function results = perGenreRegression(categories, X, Y)
    addpath(genpath('glmnet_matlab'));
    results = [];
    numGenres = size(categories, 2);
    
    for i = 1:numGenres
        [subX, subY] = subsetByGenre(i, categories, X, Y);
        
        % These methods can be tweaked so that we use the best predictor
        % They just need to return the CrossValidated MSE, and model
        %   weights
        %subMse = CrossValidator(subX, subY);
        %subWeights = generateWeights(subX, subY);
        
        % Using glmnet which may or may not be better? Uses 10 fold cross val as default
        opts = struct('alpha',1); % 1 for lasso, 0 for ridge, in between for elastic net
        cvfit = cvglmnet(subX, subY)
        [subMse bestind] = min(cvfit.cvm);
        subWeights = cvfit.glmnet_fit.beta(:,bestind);
        
        result = struct('genreID',i, 'mse',subMse, 'weights',subWeights);
        results = [results; result];
    end
    
end
        
    
    

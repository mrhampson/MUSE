% Handles the actual calculation of weights
% A higher NumLambda should lead to better weights
%   Though takes for fucking ever

function W = generateWeights(X,Y)
    [B, FitInfo] = lasso(X, Y, 'NumLambda', 50);
    W = B(:,1);
end
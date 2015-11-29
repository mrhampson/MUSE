% Handles the actual calculation of weights
% A higher NumLambda should lead to better weights
%   Though takes for fucking ever

function W = generateWeights(X,Y)
    linearModel = fitlm(X,Y);
    W = linearModel.Coefficients;
    W = W(:,1);
    W = W.Estimate;
end
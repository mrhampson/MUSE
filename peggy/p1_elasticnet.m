% Predictor of bacterial growth agttribute using only expression of genes as the attributes. Not all genes are informative, so use a regularized regression technique. 
% Ridge regression is bad for this b/c it keeps all predictors in the model
% Lasso tends to select one variable from a group of predictors with high pairwise correlations, and also isn't good when there's more features than samples.
% I'll try elastic net regression which is a linear combination of the two
% B = argminB(||y-XB||^2 + lamda2||B||^2 + lambda1||B||^1)

% Find the optimal lambdas, and
% report the number of features with non zero coefficients, and 
% 10 fold cross validation generalization error
function [cvfit] = p1_elasticnet(X,Y)
addpath(genpath('glmnet_matlab'));

N = size(X,1);
nfolds = 10;
alpha = 1;%0.8;

population = cat(2, repmat(1:nfolds, 1, floor(N/nfolds)), 1:mod(N,nfolds));
foldid = population(randperm(length(population), N));
opts = struct('alpha',alpha);
cvfit = cvglmnet(X, Y, 'gaussian', opts);
%cvfit = cvglmnet(X, Y, 'gaussian');

disp('The optimal lambda is');
disp(cvfit.lambda_min);
[e i] = min(cvfit.cvm);
disp('The number of nonzero features is');
disp(cvfit.nzero(i));
disp('The cross-validation generalization error is');
disp(e);

end

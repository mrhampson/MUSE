% Calculates the rms for the given training and testing sets
% This is starting to become the larger chunk of the project IE more logic
%   will go into this and any functions that begin to use it.

function yHatTest = trainAndTest(XTRAIN,ytrain,XTEST)    
    W = generateWeights(XTRAIN, ytrain);
    display(W);
    yHatTest = generatePredicted(W, XTEST);
end
function [ networks ] = part1(x, y)
% part1(): performs calculations for part1 by
% constructing and training ANN

xtrain = double(zeros(2));
ytrain = double(zeros(2));
xval = double(zeros(2));
yval = double(zeros(2));

% observe effects of different learning rates
learningRates = [0.2 0.7 1 1.2 1.5];
networks = [];
for rate = learningRates
    network = constructAndTrain3LayerNetwork(xtrain, ytrain, xval, yval, rate);
    networks = [networks network];
end
end


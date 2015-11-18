function [ nn ] = constructAndTrain3LayerNetwork()
%constructAndTrain3LayerNetwork(): constructs a 3-layer ANN

% parameters for constructing network
inputs = 10;
numHiddenLayers = 1;
numHiddenNodesPerLayer = 3;
outputs = 1;
architecture = [inputs repmat(numHiddenNodesPerLayer, numHiddenLayers, 1) outputs];


nn = nnsetup()

end


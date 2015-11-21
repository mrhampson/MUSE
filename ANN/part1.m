function [ networks ] = part1(xtrain, ytrain)
% part1(): Performs calculations for part 1 by constructing 
%		   and training various Neural Networks with various
%		   learning rates. Training and testing data are 
%		   extracted from the dataset that is provided: (x, y)

	disp(sprintf('\n'));
	disp('****************************************')
	disp('*** PART 1 *****************************')
    
    percentageOfSize = 0.2;
    [rows, ~] = size(xtrain);
    trainSize = round(percentageOfSize * rows);
    xtrain = xtrain(1:trainSize, :);
    ytrain = ytrain(1:trainSize, :);


	% Initialize parameters for constructing a Neural Network with: 
	% an input layer with as many inputs as there are features in the
	% dataset, a hidden layer with 3 hidden nodes, and an output layer
	% with a single output node to perform classification
	numHiddenLayers = 1;
	numHiddenNodesPerLayer = 3;
	[~, inputs] = size(xtrain);
	[~, outputs] = size(ytrain);
	architecture = [inputs repmat(numHiddenNodesPerLayer, 1, numHiddenLayers) outputs];
	learningRates = [0.2 0.7 1 1.2 1.5];
	networks = [];

	disp('The architecture of this Neural Network is:');
	disp(architecture);


	% Loop through the various learningrates 
	for rate = learningRates
		disp('*  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *');
		disp(['Creating and Training with Learning Rate = ' num2str(rate) ' ...']);

		% Construct and Train a network with a particular learning rate
	    [network, ~] = constructAndTrainNetwork(architecture, rate, xtrain, ytrain);
	    networks = [networks network];
	end

	disp('****************************************');
	disp('****************************************');
end


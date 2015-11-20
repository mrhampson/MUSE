function [ networks ] = part1(x, y)
% part1(): Performs calculations for part 1 by constructing 
%		   and training various Neural Networks with various
%		   learning rates. Training and testing data are 
%		   extracted from the dataset that is provided: (x, y)

	disp(sprintf('\n'));
	disp('****************************************')
	disp('*** PART 1 *****************************')


	% Extract the training data from the entire dataset (x, y) by selecting
	% the genre of the song as the response variable and the other features 
	% as the input features

	% TODO: Need to write function/code to extract training data from dataset
	%		For now, we will just set the training and validation datasets to zeros
	disp('****************************************')
	disp('Getting training data...')
	[rows, cols] = size(x);
	trainingSize = round(0.65 * rows);
	xtrain = x(1:trainingSize, :);
	ytrain = y(1:trainingSize, :);
	xval = x((trainingSize + 1):end, :);
	yval = y(trainingSize + 1):end, :);


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
	    [network, ~] = constructAndTrainNetwork(architecture, rate, xtrain, ytrain, xval, yval);
	    networks = [networks network];
	end

	disp('****************************************');
	disp('****************************************');
end


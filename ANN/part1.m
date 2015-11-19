function [ networks ] = part1(x, y)
% part1(): Performs calculations for part 1 by constructing 
%		   and training various Neural Networks with various
%		   learning rates. Training and testing data are 
%		   extracted from the dataset that is provided: (x, y)

	disp('****************************************')
	disp('*** PART 1 *****************************')

	% Extract the training data from the entire dataset (x, y) by selecting
	% the genre of the song as the response variable and the other features 
	% as the input features

	% TODO: Need to write function/code to extract training data from dataset
	%		For now, we will just set the training and validation datasets to zeros
	disp('****************************************')
	disp('Getting training data...')
	xtrain = double(zeros(2));
	ytrain = double(zeros(2));
	xval = double(zeros(2));
	yval = double(zeros(2));

	% Initialize parameters for constructing network
	numHiddenNodesPerLayer = 3;
	[~, inputs] = size(xtrain);
	numHiddenLayers = 1;
	outputs = 1;

	% Construct the architecture of the network
	architecture = [inputs repmat(numHiddenNodesPerLayer, 1, numHiddenLayers) outputs];

	% observe effects of different learning rates
	learningRates = [0.2 0.7 1 1.2 1.5];
	networks = [];
	for rate = learningRates
		disp('****************************************')
		disp(['Creating and Training with Learning Rate = ' num2str(rate) ' ...']);
	    [network, ~] = constructAndTrainNetwork(architecture, rate, xtrain, ytrain, xval, yval);
	    networks = [networks network];
	end
end


function [nn, L] = part2( x, y )
% part2(): performs calculations for part2 by
% 		   constructing and training a single ANN
% 		   with the entire dataset to observe the 
%		   training error 

	disp(sprintf('\n'));
	disp('****************************************')
	disp('*** PART 2 *****************************')


	% IDEA: could we try to determine the optimal learning rate
	%		from part1 and pass it to this function???

	% Initialize parameters for constructing a 3-layer Neural Network with
	% as many inputs as there are features in the dataset and a single output
	learningRate = 0.75;
	numHiddenLayers = 1;
	numHiddenNodesPerLayer = 3;
	[~, inputs] = size(xtrain);
	[~, outputs] = size(ytrain);
	architecture = [inputs repmat(numHiddenNodesPerLayer, 1, numHiddenLayers) outputs];


	% Train the network with the entire dataset
	disp('****************************************')
	disp(['Training with Learning Rate = ' num2str(learningRate) ' ...']);
	[nn, L] = constructAndTrainNetwork(architecture, learningRate, x, y);


	% Display training error
	% Note: error handling is performed in case
	%		there was a problem with initializing
	%		the L vector
	try 
		err = L(end,:);
	catch E
		err = -1;
		disp(E.message)
	end
	disp('Training Error:');
	disp(err);

	disp('****************************************');
	disp('****************************************');
end


function [nn, L] = part2( x, y )
% part2(): performs calculations for part2 by
% 		   constructing and training a single ANN
% 		   with the entire dataset
	disp('****************************************')
	disp('*** PART 2 *****************************')

	% construct and train the network with entire dataset
	% IDEA: could we try to determine the optimal learning rate
	%		from part1 and pass it to this function???


	% initialize parameters for constructing network
	learningRate = 0.75;
	[~, inputs] = size(x);
	numHiddenLayers = 1;
	numHiddenNodesPerLayer = 3;
	outputs = 1;
	architecture = [inputs repmat(numHiddenNodesPerLayer, 1, numHiddenLayers) outputs];


	% train the network
	disp('****************************************')
	disp(['Training with Learning Rate = ' num2str(learningRate) ' ...']);
	[nn, L] = constructAndTrainNetwork(architecture, learningRate, x, y);


	% display training error
	try 
		err = L(end,:);
	catch E
		err = -1;
		disp(E.message)
	end
	disp('Training Error:');
	disp(err);
end


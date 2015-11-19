function networks = part4( x, y )
% part4(): performs calculations for part4 by creating 12 
%          different Neural Networks with various numbers of 
%          hidden layers and various numbers of hidden nodes
%          per hidden layer
	disp('****************************************')
	disp('*** PART 4 *****************************')

    % IDEA: same as before, can we determine optimal learning rate?
    
    
	% initialize network parameters
    hiddenNodeValues = [3 6 9 12];
	hiddenLayerValues = 1:3;
    rate = 0.75;
	outputs = 1;
	networks = [];


	% train networks with different 
	for layerValue = hiddenLayerValues
		for nodeValue = hiddenNodeValues
			[~, inputs] = size(x);
			architecture = [inputs repmat(nodeValue, 1, layerValue) outputs];
			[network, L] = constructAndTrainNetwork(architecture, rate, xtrain, ytrain, xval, yval);
		end
	end
end


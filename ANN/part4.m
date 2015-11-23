function networks = part4( x, y )
% part4(): performs calculations for part4 by creating 12 
%          different Neural Networks with various numbers of 
%          hidden layers and various numbers of hidden nodes
%          per hidden layer

	disp(sprintf('\n'));
	disp('****************************************')
	disp('*** PART 4 *****************************')
    
    
    % IDEA: Same as before, can we determine optimal learning rate and use it here???
    
	% Initialize parameters for Neural Networks with various architectures 
	% (i.e. various hidden layers and hidden nodes)
	hiddenLayerValues = [1 2 3];
    hiddenNodeValues = [30 60 90 120];
    [~, inputs] = size(x);
	[~, outputs] = size(y);
	networks = [];
	rate = 0.75;


	% Iterate throughout the various hidden layer values and hidden node values
	for layerValue = hiddenLayerValues
		for nodeValue = hiddenNodeValues
            disp('*  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *');
            disp(['Creating and Training with ' num2str(layerValue) ' layers and ' num2str(nodeValue) ' nodes...']);

			% Initialize the architecture of the network
			architecture = [inputs repmat(nodeValue, 1, layerValue) outputs];

			% Construct and train the network with the above architecture
			[network, L] = constructAndTrainNetwork(architecture, rate, x, y);
		end
	end

	disp('****************************************');
	disp('****************************************');
end


function networks = part4( x, y )
% part4(): performs calculations for part4 by creating 12 
%          different Neural Networks with various numbers of 
%          hidden layers and various numbers of hidden nodes
%          per hidden layer
	disp('****************************************')
	disp('*** PART 4 *****************************')

    
    % TODO: construct training and validation datasets from original
	disp('****************************************')
	disp('Getting training data...')
	xtrain = double(zeros(2));
	ytrain = double(zeros(2));
	xval = double(zeros(2));
	yval = double(zeros(2));
    
    
    
    % IDEA: same as before, can we determine optimal learning rate?
    
	% initialize network parameters
    hiddenNodeValues = [3 6 9 12];
	hiddenLayerValues = 1:3;
    rate = 0.75;
	outputs = 1;
	networks = [];


	% train networks with different hidden layer/node values
	for layerValue = hiddenLayerValues
		for nodeValue = hiddenNodeValues
            disp('****************************************')
            disp(['Creating and Training with ' num2str(layerValue) ' layers and ' num2str(nodeValue) ' nodes...']);
                
			[~, inputs] = size(x);
			architecture = [inputs repmat(nodeValue, 1, layerValue) outputs];
			[network, L] = constructAndTrainNetwork(architecture, rate, xtrain, ytrain, xval, yval);
		end
	end
end


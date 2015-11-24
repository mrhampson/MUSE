function optimalNetwork = part4( x, y )
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
    hiddenLayerValues = [3 4];
	hiddenNodeValues = [9 12];
    [~, inputs] = size(x);
	[~, outputs] = size(y);
	networks = [];
	rates = [0.05 0.1 0.15];



	% Iterate throughout the various hidden layer values and hidden node values
    myStruct.labels = [];
    count1 = 1;
	for layerValue = hiddenLayerValues
		for nodeValue = hiddenNodeValues
            for rate = rates
                disp('*  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *');
                disp(['Learning Rate: ' num2str(rate) ', ' num2str(layerValue) ' hidden layers (each with ' num2str(nodeValue) ' nodes)']);

                % Initialize the architecture of the network
                architecture = [inputs repmat(nodeValue, 1, layerValue) outputs];

                % Construct and train the network with the above architecture
                [network, L, loss] = constructAndTrainNetwork(architecture, rate, x, y);
                results.labels{count1} = ['hidden layer: ' num2str(layerValue) ', nodes: ' num2str(nodeValue) ', rate: ' num2str(rate)];
                results.minL{count1} = min(L);
                results.losses{count1} = min(loss.train.e_frac);
                count1 = count1 + 1;
                
                if layerValue == 4 && nodeValue == 12 && rate == 0.1
                    optimalNetwork = network;
                end
            end
		end
    end
    
    for i = 1:(count1-1)
       disp(results.labels{i});
       disp(['min L: ' num2str(results.minL{i})]);
       disp(['losses: ' num2str(results.losses{i})]);
    end

	disp('****************************************');
	disp('****************************************');
end


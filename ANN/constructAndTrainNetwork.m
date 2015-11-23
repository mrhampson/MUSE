function [nn, L] = constructAndTrainNetwork(architecture, learningRate, xtrain, ytrain, xval, yval)
% constructAndTrain3LayerNetwork(): 
%	Constructs an Artificial Neural Network with the 
%	given architecture, and trains the network with the 
%	given training data (xtrain, ytrain). The training function also 
%	can use the validation data (xval, yval) while training


	% Normalize the data for training
	disp('normalizing data...')
	xtrain = double(cell2mat(xtrain));
	ytrain = double(cell2mat(ytrain));
	[xtrain, mu, sigma] = zscore(xtrain);


	% Initialize/Setup a new Artificial Neural Network with the
	% given architecture and learning rate. Also, initialize the activation
	% function and output of the ANN nodes
	disp(['Creating ' num2str(length(architecture)) '-layer Neural Network.']);
	nn = nnsetup(architecture);
	nn.learningRate = learningRate;
	nn.activation_function = 'sigm';
	nn.output = 'softmax';


	% Display results of initialization/setup
	disp('Created Neural Network!')
	% disp(nn); % this is optional (mostly used for testing)


	% Initialize the options for training the network
	opts.output = 'softmax';
% 	[opts.numepochs, ~] = size(xtrain); % <<< stille trying to determine necessary epoch number
    opts.numepochs = 100;
	opts.batchsize = size(xtrain, 1); % <<< still trying to determine optimal batch size
	opts.plot = 1; % Set this to 1 for plotting 


	% Train the new Neural Network with the above configurations/options
	% and with the training data provided. If the validation data is provided
	% (xval, yval), then it is passed to the training function
	disp('Training Neural Network...')
	[nn, L] = nntrain(nn, xtrain, ytrain, opts);
	disp('Neural Network has been trained!')
	disp(['Training Error: ' num2str(nn.L(end))])
end


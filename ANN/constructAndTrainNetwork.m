function [nn, L] = constructAndTrainNetwork(architecture, learningRate, xtrain, ytrain, xval, yval)
% constructAndTrain3LayerNetwork(): 
%	Constructs an Artificial Neural Network with the 
%	given architecture, and trains the network with the 
%	given training data (xtrain, ytrain). The training function also 
%	can use the validation data (xval, yval) while training

	% Normalize the data for training
	try
		[xtrain, mu, sigma] = zscore(xtrain);
		xval = normalize(xval, mu, sigma);

		% Make the training and testing vectors full if they are sparse
		vec = ind2vec(ytrain');
		full_vec = full(vec);
		ytrain = full_vec';

		if size(xval) > [0 0],
			vec2 = ind2vec(yval');
			full_vec2 = full(vec2);
			yval = full_vec2';
		end
	catch E
	    disp(['<<>> ERROR WHILE NORMALIZING DATA: ' E.message]);
		% error(['<<>> ERROR WHILE NORMALIZING DATA: ' E.message])
	end


	% Initialize/Setup a new Artificial Neural Network with the
	% given architecture and learning rate. Also, initialize the activation
	% function and output of the ANN nodes
	disp(['Creating ' num2str(length(architecture)) '-layer Neural Network...']);
	nn = nnsetup(architecture);
	nn.learningRate = learningRate;
	nn.activation_function = 'sigm';
	nn.output = 'softmax';



	% Display results of initialization/setup
	disp('Created Neural Network!')
	% disp(nn); % this is optional (mostly used for testing)


	% Initialize the options for training the network
	% NOTE: The training algorithm should perform 
	%		as many epochs as there are training samples
	%		and should have a batch size of 1 in order to
	% 		perform Stochastic Gradient Descent
	opts.output = 'softmax';
	[opts.numepochs, ~] = size(xtrain);
	opts.batchsize = 1;
	opts.plot = 0; % Set this to 1 for plotting 


	% Train the new Neural Network with the above configurations/options
	% and with the training data provided. If the validation data is provided
	% (xval, yval), then it is passed to the training function
	% Note: Error handling is performed to ensure that any problems during the 
	%		training process are caught.
	disp('Training Neural Network...')
    L = [];
	try 
		if size(xval) > zeros(1,2)
			[nn, L] = nntrain(nn, xtrain, ytrain, opts, xval, yval);
		else
			[nn, L] = nntrain(nn, xtrain, ytrain, opts);
		end
		disp('Trained Neural Network!')
	catch E
		disp(['<<>> ERROR WHILE TRAINING: ' E.message]);
		% error(['<<>> ERROR WHILE TRAINING: ' E.message])
	end
end


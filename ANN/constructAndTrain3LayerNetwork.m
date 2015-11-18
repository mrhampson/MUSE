function nn = constructAndTrain3LayerNetwork(xtrain, ytrain, xval, yval, learningRate)
%constructAndTrain3LayerNetwork(): constructs a 3-layer ANN

try
	% normalize the data
	[xtrain, mu, sigma] = zscore(xtrain);
	xval = normalize(xval, mu, sigma);

	% make the training and testing vectors full
	vec = ind2vec(ytrain');
	full_vec = full(vec);
	ytrain = full_vec';

	vec2 = ind2vec(yval');
	full_vec2 = full(vec2);
	yval = full_vec2';
catch E
    disp('ERROR WHILE NORMALIZING DATA:');
	disp(E.message);
	% error(ME.message)
end

% initialize parameters for constructing network
[~, inputs] = size(xtrain);
numHiddenLayers = 1;
numHiddenNodesPerLayer = 3;
outputs = 1;
architecture = [inputs repmat(numHiddenNodesPerLayer, numHiddenLayers, 1) outputs];

% initialize/setup neural network with above architecture
disp(strcat('Creating ', num2str(length(architecture)), '-layer Neural Network...'));
nn = nnsetup(architecture);
nn.learningRate = learningRate;
nn.activation_function = 'sigm';
nn.output = 'softmax'

% display results of NN setup
disp('Created Neural Network:')
disp(nn);

% declare options for training the network
% NOTE: perform as many epochs as there are training samples with batch size
%		of 1 to perform Logistic Gradient Descent 
opts.output = 'softmax';
[opts.numepochs, ~] = size(xtrain);
opts.batchsize = 1;
opts.plot = 1;

% train neural network with options and training set 
disp('Training Neural Network...')
try 
	[trainedNN, L] = nntrain(nn, xtrain, ytrain, opts, xval, yval);
catch E
	disp('ERROR WHILE TRAINING:');
    disp(E.message);
	% error(E.message)
end
end


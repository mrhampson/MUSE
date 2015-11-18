function [ network, SSE ] = train(xTrain, yTrain, xTest, yTest, numberHiddenLayers, numberHiddenNodes, plotting)
    
    [trainRows, ~] = size(xTrain);

    % normalize data
    [xTrain, mu, sigma] = zscore(xTrain);
    xTest = normalize(xTest, mu, sigma);

    % make the training and testing vectors full
    vec = ind2vec(yTrain');
    full_vec = full(vec);
    yTrain = full_vec';

    vec2 = ind2vec(yTest');
    full_vec2 = full(vec2);
    yTest = full_vec2';

    % setup NN
    inputs = 8;
    outputs = 10;
    architecture = [inputs numberHiddenNodes outputs];
    if numberHiddenLayers == 2,
        architecture = [inputs numberHiddenNodes numberHiddenNodes outputs];
    elseif numberHiddenLayers == 3,
        architecture = [inputs numberHiddenNodes numberHiddenNodes numberHiddenNodes outputs];
    end
    network = nnsetup(architecture);
    disp(network);
    
    network.learningRate = 0.95;               % set learning rate
    network.activation_function = 'sigm';   % use sigmoid function
    network.output = 'softmax';
    options.numepochs =  100;                % set number of iterations
    options.batchsize = trainRows;          % set batch size
    options.plot = plotting;                % turn plotting on/off

    [network, SSE] = nntrain(network, xTrain, yTrain, options, xTest, yTest);
end


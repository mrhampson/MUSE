% Performs the specified number of iterations of bootstrapping
% As far as I can tell bootstrapping constructs a normal distribution
%   from the predicted values of the random sub samplings
%   This may be wrong. Going with it though


function [Mean, variance] = bootstrap(X, Y, iterations)
    predictions = [];
    numSamples = size(X,1);
    
    for i = 1:iterations
        display('iteration:');
        display(i);
        
        resampleX = [];
        resampleY = [];
        
        %Build resampling
        for j = 1:numSamples
            randomNumber = randi([1 numSamples],1,1);
            resampleX = [resampleX; X(randomNumber, :)];
            resampleY = [resampleY; Y(randomNumber, 1)];
        end
        weights = generateWeights(resampleX, resampleY);
        % Get random sample to get predicted value
        randomNumber = randi([1 numSamples],1,1);
        randomX = X(randomNumber, :);
        yHat = generatePredicted(weights, randomX);

        predictions = [predictions; yHat];
        
    end
    
    % Calculate end values of the bootstrapping
    % Will use this to construct normal distribution and confidence
    %   interval
    
    StdDev = std(predictions);
    Mean =  mean(predictions);
    
    variance = StdDev ^ 2;
    
end
    
    
        
        
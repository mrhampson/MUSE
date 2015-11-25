% Generate a dummy array based on the unique identifiers in X
% Assumes X is a column vector
% Key will be shifted up by one, such that something with key=0 will have
%   a 1 in column(1)

function dummies = generateDummieArray( X )
    numUnique = size(unique(X), 1);
    numSamples = size(X,1);
    
    dummies = zeros(numSamples, numUnique);
    
    for i = 1:numSamples
        identifier = X(i) + 1; %shifted so can use array indexing
        dummies(i, identifier) = 1;
    end
end

    
    

% Purpose built for question 3

function yHat = predictedGrowthOfAverage(X, Y)
    W = generateWeights(X, Y);

    averagedGenes = [];
    numGenes = size(X,2);
    
    for i = 1:numGenes
        avg = mean(X(:, i));
        averagedGenes = [averagedGenes avg];
    end
    
    assert(size(averagedGenes, 2) == numGenes);
    assert(size(averagedGenes, 1) == 1);
    yHat = generatePredicted(W, averagedGenes);
    
end
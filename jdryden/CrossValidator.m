% Manually perform 10 fold cross validation for regression
% Assumes we have 194 samples, may need to change if we get new data
function mse = CrossValidator(X, Y)
    assert(size(X,1) == size(Y,1));
    
    mse = crossval('mse', X, Y, 'Predfun', @trainAndTest);
    

end
    
    
    
    
    
    
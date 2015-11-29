% Calculate all of the Y_hat for given X and weights
function predicted = generatePredicted( W, X )
    predicted = X * W(2:size(W,1),1);
    predicted = predicted + W(1,1);
end

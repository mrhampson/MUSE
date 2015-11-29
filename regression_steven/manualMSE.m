function mse = manualMSE(X, W, Y)
    mse = 0;
    for i = 1:size(X,1)
        curX = X(i,:);
        mse = mse + (Y(i,1) - generatePredicted(W, curX))^2;
    end
    mse = mse / size(X,1);
end
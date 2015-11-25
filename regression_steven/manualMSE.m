function mse = manualMSE(X, W, Y)
    mse = 0;
    for i = 1:size(X,1)
        mse = mse + (Y(i,1) - X(i,:)*W)^2;
    end
    mse = mse / size(X,1);
end
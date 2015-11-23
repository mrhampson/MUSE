% linRegression.m

hot = cell2mat(x(:,8));
Xmat = [x(:,1:7), x(:,9:end)];
Xmat = cell2mat(Xmat);

mdl = fitlm(Xmat,hot);
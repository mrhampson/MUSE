%
%
% linRegression.m
%


hot = cell2mat(songInfo(:,8));
xmat = [songInfo(:,1:7), songInfo(:,9:end)];
xmat = cell2mat(xmat);

indices = crossvalind('kfold',hot,10);
train = (indices == 1);
test = ~train;

lnmdl = fitlm(xmat(train,:),hot(train,:));

[newhot,newhotci] = predict(lnmdl,xmat(test,:));

pce = (hot(test,:)-newhot)/newhot(test,:)
numdataLRE = immse(hot(test,:),newhot)









[coeff,score,latent] = pca(xmat);
pc1 = coeff(:,1);
pc2 = coeff(:,2);
pc3 = coeff(:,3);

pcaMat = [xmat * pc1,xmat * pc2,xmat * pc3];


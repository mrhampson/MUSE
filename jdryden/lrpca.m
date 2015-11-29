%
%
% linRegression.m
% linear regression with pca
%


%set up matrices
plotnum = 1;
tplots = 3;
hot = cell2mat(songInfo(:,8));
xmat = [songInfo(:,1:7), songInfo(:,9:end)];
xmat = cell2mat(xmat);

indices = crossvalind('kfold',hot,10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ct = 1:10
	test = (indices == ct);
	train = ~test;
	%fit for linear regression
	lnmdl = fitlm(xmat(train,:),hot(train,:));
	[newhot,newhotci] = predict(lnmdl,xmat(test,:));
	numdataLRE = immse(hot(test,:),newhot);


	y = [hot(test),newhot];
	x = 1:sum(test);

	mse(ct) = manualMSE(newhot,1,hot(test));
end

%[newhot,hot(test)]
subplot(1,tplots,plotnum)
scatter(x,y(:,1),15,'r','filled','d')
title('Without Song Tags')
hold on
scatter(x,y(:,2),15,'b','filled','o')
plotnum = plotnum + 1;
mean(mse);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ct = 1:10
	test = (indices == ct);
	train = ~test;
	%grab first three principal components and refit
	[coeff,score,latent] = pca(xmat);
	pc1 = coeff(:,1);
	pc2 = coeff(:,2);
	pc3 = coeff(:,3);

	pcaMat = [xmat * pc1,xmat * pc2,xmat * pc3];
	lnmdl = fitlm(pcaMat(train,:),hot(train,:));
	[newhot,newhotci] = predict(lnmdl,pcaMat(test,:));
	numdataLRE = immse(hot(test,:),newhot);


	y = [hot(test),newhot];
	x = 1:sum(test);

	mse(ct) = manualMSE(newhot,1,hot(test));
end

%[newhot,hot(test)]
subplot(1,tplots,plotnum)
scatter(x,y(:,1),15,'r','filled','d')
title('Without Song Tags, Using PCA')
hold on
scatter(x,y(:,2),15,'b','filled','o')
plotnum = plotnum + 1;
mean(mse);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%remove entries for which hotness is zero
songInfo2 = cell2mat(songInfo);
sifid = find(songInfo2(:,8) ~= 0);
songInfo2 = songInfo2(sifid,:);
xmat = [songInfo2(:,1:7),songInfo2(:,9:end)];
hot = songInfo2(:,8);

indices = crossvalind('kfold',hot,10);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ct = 1:10
	test = (indices == ct);
	train = ~test;
	%refit using normal linear regression
	lnmdl = fitlm(xmat(train,:),hot(train,:));
	[newhot,newhotci] = predict(lnmdl,xmat(test,:));
	numdataLRE = immse(hot(test,:),newhot);


	y = [hot(test),newhot];
	x = 1:sum(test);

	mse(ct) = manualMSE(newhot,1,hot(test));
end
lnmdl
%[newhot,hot(test)]
subplot(1,tplots,plotnum)
scatter(x,y(:,1),15,'r','filled','d')
title('With Song Tags')
hold on
scatter(x,y(:,2),15,'b','filled','o')
xlim([0 450])
plotnum = plotnum + 1;
mean(mse);






























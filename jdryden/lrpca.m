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
test = (indices == 1);
train = ~test;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%fit for linear regression
lnmdl = fitlm(xmat(train,:),hot(train,:));
[newhot,newhotci] = predict(lnmdl,xmat(test,:));
numdataLRE = immse(hot(test,:),newhot);


y = [hot(test),newhot];
x = 1:sum(test);

subplot(1,tplots,plotnum)
scatter(x,y(:,1),15,'r','filled','d')
hold on
scatter(x,y(:,2),15,'b','filled','o')
plotnum = plotnum + 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

subplot(1,tplots,plotnum)
scatter(x,y(:,1),15,'r','filled','d')
hold on
scatter(x,y(:,2),15,'b','filled','o')
plotnum = plotnum + 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%remove entries for which hotness is zero
songInfo2 = cell2mat(songInfo);
sifid = find(songInfo2(:,8) ~= 0);
songInfo2 = songInfo2(sifid,:);
xmat = [songInfo2(:,1:7),songInfo2(:,9:end)];
hot = songInfo2(:,8);

indices = crossvalind('kfold',hot,10);
test = (indices == 1);
train = ~test;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%refit using normal linear regression
lnmdl = fitlm(xmat(train,:),hot(train,:));
[newhot,newhotci] = predict(lnmdl,xmat(test,:));
numdataLRE = immse(hot(test,:),newhot);


y = [hot(test),newhot];
x = 1:sum(test);

subplot(1,tplots,plotnum)
scatter(x,y(:,1),15,'r','filled','d')
hold on
scatter(x,y(:,2),15,'b','filled','o')
plotnum = plotnum + 1;

































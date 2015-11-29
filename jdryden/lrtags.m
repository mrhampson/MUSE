%
%
% lrtags
% linear regression using song tag info
%

%add song tags to data matrix
plotnum = 1;
tplots = 3;
hot = cell2mat(songInfo(:,8));
xmat = [songInfo(:,1:7), songInfo(:,9:end)];
xmat = cell2mat(xmat);
xmat = [xmat,songTags];

indices = crossvalind('kfold',hot,10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mse = 0;
for ct = 1:10
	test = (indices == ct);
	train = ~test;
	%fit linear regression with new data
	lnmdl = fitlm(xmat(train,:),hot(train,:));
	[newhot,newhotci] = predict(lnmdl,xmat(test,:));
	numdataLRE = immse(hot(test,:),newhot);

	mse(ct) = manualMSE(newhot,1,hot(test));

end

%[newhot,hot(test)]
y = [hot(test),newhot];
x = 1:sum(test);
subplot(1,tplots,plotnum)
scatter(x,y(:,1),15,'r','filled','d')
hold on
scatter(x,y(:,2),15,'b','filled','o')
plotnum = plotnum + 1;
mean(mse);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mse = 0;
%now use song tags with zero hotness entries removed
songInfo2 = cell2mat(songInfo);
sifid = find(songInfo2(:,8) ~= 0);
songInfo2 = songInfo2(sifid,:);
xmat = [songInfo2(:,1:7),songInfo2(:,9:end),songTags(sifid,:)];
hot = songInfo2(:,8);

indices = crossvalind('kfold',hot,10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for ct = 1:10
	test = (indices == ct);
	train = ~test;
	%fit to new data
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
hold on
scatter(x,y(:,2),15,'b','filled','o')
plotnum = plotnum + 1;
mean(mse);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%this time using only the top five most popular song tags
songInfo2 = cell2mat(songInfo);
sifid = find(songInfo2(:,8) ~= 0);
songInfo2 = songInfo2(sifid,:);
xmat = [songInfo2(:,1:7),songInfo2(:,9:end),songTags(sifid,1:5)];
hot = songInfo2(:,8);

indices = crossvalind('kfold',hot,10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ct = 1:10
	test = (indices == ct);
	train = ~test;
	%fit with new data
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
hold on
scatter(x,y(:,2),15,'b','filled','o')
plotnum = plotnum + 1;
mean(mse)


























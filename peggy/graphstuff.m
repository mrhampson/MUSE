names = {'danceability','duration','endoffadein','energy','key','loudness','mode','startoffadeout','tempo','timesignature'};
for i=1:length(names)
    figure;
    title(names(i));
    subplot(3,1,1);
    ind = find(hot);
    scatter(Xmat(ind,i),hot(ind));

    minval = min(Xmat(ind,i));
    maxval = max(Xmat(ind,i));
    cutoffs = linspace(minval,maxval,100);
    hotave = [];
    for j=2:length(cutoffs)
        hotave(j)=mean(hot( Xmat(ind,i)<=cutoffs(j) & Xmat(ind,i)>=cutoffs(j-1) ));
    end
    subplot(3,1,2);
    plot(cutoffs,hotave);

    subplot(3,1,3);
    hist(Xmat(ind,i));
    title(names(i));
end
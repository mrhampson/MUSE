%import the data
addpath('../Data');        %add path if needed
disp('importing data...');
data = dlmread('data-numeric-only.csv', ',', 2, 0);
labels = {'duration', 'end of fade in', 'key', 'loudness', 'song hotness', 'start of fade out', 'tempo', 'time signature'};

%Toss out dacability, energy - all 0s
D = data(:, [2:3, 5:12]);


%Toss out year, mode - too binary
D = D(:, [1:4, 6:9]);

%Toss Out hotness = 0
D = D( D(:,5)~=0 ,:)

D2 = D

%normalize Data
for j = 1:size(D,2)
    D(:,j) = ( (D(:,j)-min(D(:,j)) )./(max(D(:,j))-min(D(:,j))));
end


disp('calculating tree...');
P = pdist(D, 'euclid');
L = linkage(P, 'single');
C = cluster(L, 'maxclust', 2:20);

disp('plotting tree...');

figure;
dendrogram(L, 50);  %collapses all points into 50 leaf nodes
title('Dendrogram of Music Data');

%{
randData = rand(1000, 4);
P2= pdist(randData, 'euclid');
L2 = linkage(P2, 'single');
C2 = cluster(L2, 'maxclust', 13);

figure;
dendrogram(L2, 50);  %collapses all points into 50 leaf nodes
title('dendrogram of Random Data')
%}

%{
Plot The Clusters
addpath('varycolor');
for i = 1:size(C,2)
    figure;
    colors = varycolor(i+1);
    plot(D2(C(:,i)==1,3),D2(C(:,i)==1,5),'.','MarkerSize',12, 'Color', colors(1,:))
    hold on
    for j = 2:i
        plot(D2(C(:,i)==j,3),D2(C(:,i)==j,5),'.','MarkerSize',12, 'Color', colors(j,:))
    end
    legend('Cluster 1','Cluster 2','cluster 3','cluster 4','Centroids',...
           'Location','NW')
    xlabel(labels(3));
    ylabel(labels(5));
    title( ['Number of Clusters = ', int2str(i+1)]);
    hold off
end
%}

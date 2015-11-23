%import the data
addpath('../Data');        %add path if needed
disp('importing data...');
data = dlmread('data-numeric-only.csv', ',', 2, 0);
labels = {'duration', 'end of fade in', 'key', 'loudness', 'mode', 'song hotness', 'start of fade out', 'tempo', 'time signature', 'year'};

D = data(:, [2:3, 5:12]);
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

%{
randData = rand(1000, 4);
P2= pdist(randData, 'euclid');
L2 = linkage(P2, 'single');
C2 = cluster(L2, 'maxclust', 13);

figure;
dendrogram(L, 50);  %collapses all points into 50 leaf nodes
%}


%Plot The Clusters
addpath('varycolor');
colors = varycolor(20);
for i = 2:(size(C,2)+1)
    figure;
    colors = varycolor(i);
    plot(D2(C(:,i-1)==1,1),D2(C(:,i-1)==1,7),'.','MarkerSize',12, 'Color', colors(1,:))
    hold on
    for j = 2:i
        plot(D2(C(:,i-1)==j,1),D2(C(:,i-1)==j,7),'.','MarkerSize',12, 'Color', colors(j,:))
    end
    legend('Cluster 1','Cluster 2','cluster 3','cluster 4','Centroids',...
           'Location','NW')
    xlabel(labels(i));
    ylabel(labels(6));
    title 'Cluster Assignments and Centroids'
    hold off
end

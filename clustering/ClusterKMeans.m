%Import the data
addpath('../Data');
disp(sprintf('\nimporting dataset...'));
data = dlmread('data-numeric-only.csv', ',', 2, 0);
labels = {'duration', 'end of fade in', 'key', 'loudness', 'mode', 'song hotness', 'start of fade out', 'tempo', 'time signature', 'year'};

%Take only the data we want and format as a matrix
D = data(:, [2:3, 5:12]);
D2 = D;

%normalize Data
for j = 1:size(D,2)
    D(:,j) = ( (D(:,j)-min(D(:,j)) )./(max(D(:,j))-min(D(:,j))));
end

%run k means
disp(sprintf('Running 4 Cluster K-Means...'));
[idx,C] = kmeans(D,4);

disp(sprintf('Plotting Data...'));

%Plot The Clusters
for i = 1:(size(D,2)-1)
    figure;
    plot(D2(idx==1,i),D2(idx==1,6),'r.','MarkerSize',12)
    hold on
    plot(D2(idx==2,i),D2(idx==2,6),'b.','MarkerSize',12)
    plot(D2(idx==3,i),D2(idx==3,6),'g.','MarkerSize',12)
    plot(D2(idx==4,i),D2(idx==4,6),'y.','MarkerSize',12)
    plot(C(:,i),C(:,6),'kx',...
         'MarkerSize',15,'LineWidth',3)
    legend('Cluster 1','Cluster 2','cluster 3','cluster 4','Centroids',...
           'Location','NW')
    xlabel(labels(i));
    ylabel(labels(6));
    title 'Cluster Assignments and Centroids'
    hold off
end

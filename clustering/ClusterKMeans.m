%Import the data
addpath('../Data');
disp(sprintf('\nimporting dataset...'));
data = dlmread('data-numeric-only.csv', ',', 2, 0);
labels = {'duration', 'end of fade in', 'key', 'loudness', 'song hotness', 'start of fade out', 'tempo', 'time signature'};

%Take only the data we want and format as a matrix
D = data(:, [2:3, 5:12]);
D2 = D(:, [1:4, 6:9]);

%normalize Data
for j = 1:size(D2,2)
    D2(:,j) = ( (D2(:,j)-min(D2(:,j)) )./(max(D2(:,j))-min(D2(:,j))));
end

%run k means
disp(sprintf('Running 4 Cluster K-Means...'));
[idx,C] = kmeans(D2,4);

disp(sprintf('Plotting Data...'));

%Plot The Clusters
for i = 1:(size(D2,2))
    figure;
    plot(D2(idx==1,i),D2(idx==1,5),'r.','MarkerSize',12)
    hold on
    plot(D2(idx==2,i),D2(idx==2,5),'b.','MarkerSize',12)
    plot(D2(idx==3,i),D2(idx==3,5),'g.','MarkerSize',12)
    plot(D2(idx==4,i),D2(idx==4,5),'y.','MarkerSize',12)
    plot(C(:,i),C(:,5),'kx',...
         'MarkerSize',15,'LineWidth',3)
    legend('Cluster 1','Cluster 2','cluster 3','cluster 4','Centroids',...
           'Location','NW')
    xlabel(labels(i));
    ylabel(labels(5));
    title 'Cluster Assignments and Centroids'
    hold off
end



%K means on temp

%Import the data
addpath('../Data');
disp(sprintf('\nimporting dataset...'));
data = dlmread('data-numeric-only.csv', ',', 10);

%Take only the data we want and format as a matrix
D = double(data(2:end,[2:12 14]));

%run k means
disp(sprintf('Running 4 Cluster K-Means...'));
[idx,C] = kmeans(D,4);

disp(sprintf('Plotting Data...'));

%Plot The Clusters
figure;
plot(D(idx==1,1),D(idx==1,2),'r.','MarkerSize',12)
hold on
plot(D(idx==2,1),D(idx==2,2),'b.','MarkerSize',12)
plot(D(idx==3,1),D(idx==3,2),'g.','MarkerSize',12)
plot(D(idx==4,1),D(idx==4,2),'y.','MarkerSize',12)
plot(C(:,1),C(:,2),'kx',...
     'MarkerSize',15,'LineWidth',3)
legend('Cluster 1','Cluster 2','cluster 3','cluster 4','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off

figure;
plot(D(idx==1,1),D(idx==1,3),'r.','MarkerSize',12)
hold on
plot(D(idx==2,1),D(idx==2,3),'b.','MarkerSize',12)
plot(D(idx==3,1),D(idx==3,3),'g.','MarkerSize',12)
plot(D(idx==4,1),D(idx==4,3),'y.','MarkerSize',12)
plot(C(:,1),C(:,3),'kx',...
     'MarkerSize',15,'LineWidth',3)
legend('Cluster 1','Cluster 2','cluster 3','cluster 4','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off

figure;
plot(D(idx==1,2),D(idx==1,3),'r.','MarkerSize',12)
hold on
plot(D(idx==2,2),D(idx==2,3),'b.','MarkerSize',12)
plot(D(idx==3,2),D(idx==3,3),'g.','MarkerSize',12)
plot(D(idx==4,2),D(idx==4,3),'y.','MarkerSize',12)
plot(C(:,2),C(:,3),'kx',...
     'MarkerSize',15,'LineWidth',3)
legend('Cluster 1','Cluster 2','cluster 3','cluster 4','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off


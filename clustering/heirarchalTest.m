%import the data
addpath('../Data');        %add path if needed
disp('importing data...');
data = dlmread('data-numeric-only.csv', ',', 2, 0);
labels = {'duration', 'end of fade in', 'key', 'loudness', 'mode', 'song hotness', 'start of fade out', 'tempo', 'time signature', 'year'};

D = data(:, [2:3, 5:12]);
D2 = D;

[H,AX] = plotmatrix(D)
for i = 1:length(AX)
        ylabel(AX(i,1),labels{i})
        xlabel(AX(end,i),labels{i})
end

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
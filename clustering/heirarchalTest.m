%import the data
addpath('../Data');        %add path if needed
disp('importing data...');
data = dataset('File', 'song_data.csv', 'Delimiter', ',', 'HeaderLines', 0, 'ReadVarNames', false);

D = double(data(:, 8:11));
%normc(D);                  %normalize data

disp('calculating tree...');
P = pdist(D, 'euclid');
L = linkage(P, 'single');
C = cluster(L, 'maxclust', 13);

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
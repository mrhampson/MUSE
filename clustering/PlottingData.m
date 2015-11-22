%import the data
addpath('../Data');        %add path if needed
disp('importing data...');
data = dlmread('data-numeric-only.csv', ',', 2, 0);
labels = {'duration', 'fade in', 'key', 'loudness', 'mode', 'hotness', 'fade out', 'tempo', 'time sig', 'year'};

D = data(:, [2:3, 5:12]);
D2 = D;

[H,AX] = plotmatrix(D)
for i = 1:length(AX)
        ylabel(AX(i,1),labels{i})
        xlabel(AX(end,i),labels{i})
end
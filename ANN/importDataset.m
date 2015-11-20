function [ d, x, y ] = importDataset( path )
%importDataset(path): imports the dataset at the specified path and returns
%the parsed dataset as d, where x and y are the independent and dependent features

	disp(sprintf('\nimporting dataset...'));


	% Import the dataset as a text file with a comma as the separating delimiter
	data = dataset('File', [path 'song_data.csv'], 'Delimiter', ',', 'HeaderLines', 0, 'ReadVarNames', false);

    % Convert the dataset to a cell
    genreColumn = dataset2cell(data(:,end));
    
    % Get number of unique tags
    rankedGenres = importdata([path 'popular_genre_rankings.txt']);
    [numUniqueTags, ~] = size(rankedGenres);

	x = [];
	y = [];
	d = [x y];
	disp('dataset imported!')
end


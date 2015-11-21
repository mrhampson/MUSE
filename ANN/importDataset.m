function [ x, y ] = importDataset( path )
% importDataset(path): imports the dataset at the specified path and 
% returns the parsed dataset as d, where x and y are the independent 
% and dependent features (x, y). 

	disp(sprintf('\nimporting dataset...'));


	% Import the dataset as a text file with a comma as the separating delimiter
	data = dataset('File', [path 'song_data.csv'], 'Delimiter', ',', 'HeaderLines', 0, 'ReadVarNames', false);

    % Convert the dataset to a cell
    genreColumn = data(:,end);
    
    % Get number of unique tags
    rankedGenres = importdata([path 'popular_genre_rankings.txt']);
    [numUniqueTags, ~] = size(rankedGenres);
    
    % Construct matrix for tag columns (i.e. each tag will have its own column
	% to contain a 0 or 1 to indicate the presence of that tag)
    [numSamples, ~] = size(data);
    indicesOfInputFeatures = [8 9 10 11];
    x = cell(numSamples, length(indicesOfInputFeatures));
    y = cell(numSamples, numUniqueTags);

    % iterate over each sample
    for sample = 1:numSamples
        genresForSampleAsCell = strsplit(genreColumn{sample,:}, ';');
    	for tagIndex = 1:numUniqueTags
            for indexInSample = 1:length(genresForSampleAsCell)
            	if strcmp(genresForSampleAsCell{indexInSample},rankedGenres{tagIndex})
					y{sample, tagIndex} = 1; 
                else
                    y{sample, tagIndex} = 0;
                end
            end
        end
        
        index = 1;
        for featureIndex = indicesOfInputFeatures
           x{sample, index} = data{sample, featureIndex}; 
           index = index + 1;
        end
    end

%     disp(['size(x) = ' num2str(size(x))])
%     disp(['size(y) = ' num2str(size(y))])
    
	disp('dataset imported!')
end


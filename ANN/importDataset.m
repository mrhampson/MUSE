function [ x, y ] = importDataset( path )
% importDataset(path): imports the dataset at the specified path and 
% returns the parsed dataset as d, where x and y are the independent 
% and dependent features (x, y). 

    % Import the dataset as a text file with a comma as the separating delimiter.
	disp(sprintf('\nimporting dataset...'));
	data = dataset('File', [path 'data.csv'], 'Delimiter', ',', 'HeaderLines', 1, 'ReadVarNames', true);


    % Filter the dataset by the final column, which is the column that 
    % contains the tags for each song
    tagColumn = data(:,end);

    
    % Get number of unique tags from text file, which contains the rankings
    % of the top 301 most popular tags
    rankedtags = importdata('MostPopularMinimized.txt');
    [numUniqueTags, ~] = size(rankedtags);
    

    % Construct matrix for tag columns (i.e. each tag will have its own column
	% to contain either 0 or 1 to indicate the presence of that tag)
    [numSamples, features] = size(data);
    indicesOfRelevantFeatures = 1:(features - 1);
    x = cell(numSamples, length(indicesOfRelevantFeatures));
    y = cell(numSamples, numUniqueTags);


    % Iterate over each sample. 
    % At each sample, we check whether its list of tags contains those that 
    % are included in the list of ranked most popular tags. If the sample 
    % contains any of the most popular tags, we set its index in the 
    % y matrix for that tag to 1 to indicate its presence
    for sample = 1:numSamples

        % Since the tags were originally formatted as a semi-colon-separated
        % list of tags, this step requires that the string be split with the 
        % semi-colon delimiter and store each tag (as a string) in an array
        tagsForSampleAsCell = strsplit(tagColumn{sample,:}, ';');

        % Iterate over each unique tag from the list of ranked/unique tags
    	for tagIndex = 1:numUniqueTags

            % Iterate over each tag for the current sample that was obtained 
            % from splitting the string of tags in the earlier step
            for indexInSample = 1:length(tagsForSampleAsCell)

                % Check if the tag in the current sample equates to the tag in the list
                % of ranked most popular tags. If it does, then set the presence of the
                % tag (one). Otherwise, set it to as being absent (zero).
            	if strcmp(tagsForSampleAsCell{indexInSample},rankedtags{tagIndex})
					y{sample, tagIndex} = 1; 
                else
                    y{sample, tagIndex} = 0;
                end
            end
        end
        
        % Long story short, I had to figure out a way to copy the relevant features
        % from the dataset to the x matrix. This loop is performing that step since I
        % couldn't figure out a way to do it as a vector operation
        index = 1;
        for featureIndex = indicesOfRelevantFeatures
           x{sample, index} = data{sample, featureIndex}; 
           index = index + 1;
        end

        if mod(sample, 500) == 0
            disp([num2str(sample) '/' num2str(numSamples) ' samples processed']);
        end
    end
    
	disp('dataset imported!')
end


% runner: executes the functions for each part. The parts mirror the 
%		  HW2 assignment problems

% Set the seed of random number generator for reproducibility 
s = rng(1, 'v5normal');
rng(s);
rand('seed',0);

disp(sprintf('\n'));
disp('*************************************************');
disp('*** Artificial Neural Networks ******************');
disp('*************************************************');


% Allow the user to decide which part they want to execute by reading 
% input from the console. This will make testing/debugging easier than
% having to execute all the parts at once. 
% If the user inputs an invalid input type (e.g. puncuation marks and 
% other symbols) it will continuously ask the user for a number (1 through 6)
response = 'hi';
while ~isnumeric(response)
	disp('Which part would you like to run? Part 1, 2, 3, 4, 5, or 6');
    response = input('Enter 0 to run all the parts, or enter -1 to just import the data -> ', 's');
	try
		response = str2double(response);
		if (isnan(response) || (~isnumeric(response)))
			throw(MException('runner:invalidType','invalid input type'))
    	end
	catch E
		response = 'hi';
		disp(E.message);
    end
end


% Import the dataset to be used within each part. 
% The individual parts will determine if they want to divide
% the dataset into smaller training and testing sets
path = [pwd '/../Data/'];
[x, y] = importDataset(path);

% Extract a training set of data from the original dataset.
percentageOfSize = 0.65;
[rows, ~] = size(x);
trainSize = round(percentageOfSize * rows);
xtrain = x(1:trainSize, :);
ytrain = y(1:trainSize, :);


if ~(response < 0) 
	% Perform part 1 if user selected it as an option
	if (response == 1 || response == 0)
	    part1(xtrain, ytrain);
	end

	 
	% Perform part 2 if user selected it as an option
	if (response == 2 || response == 0)
		part2(x, y);
	end

	 
	% Perform part 3 if user selected it as an option
	if (response == 3 || response == 0)
		disp('Part 3 actually has no implementation');
	end

	 
	% Perform part 4 if user selected it as an option
	if (response == 4 || response == 0)
		part4(xtrain, ytrain);
	end
	 
	% Perform part 5 if user selected it as an option
	if (response == 5 || response == 0)
		part5(x, y);
	end
	 
	% Perform part 6 if user selected it as an option (should we be doing this?)
end

disp(sprintf('\n'));
% runner: executes the functions for each part


% determine which problem the user wants to execute (simplifies testing)
response = 'hi';
while ~isnumeric(response)
	disp('Which part would you like to run? Part 1, 2, 3, 4, 5, or 6');
    response = input('Enter 0 to run all the parts -> ', 's');
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


% import the dataset
% TODO: parse dataset
x = zeros(100);
y = zeros(100, 1);


% perform first problem
if (response == 1)
    part1(x, y);
end

 
% perform second problem
if (response == 2)
	part2(x, y);
end

 
% perform third problem
% if (response == 3)
% 	part3(x, y);
% end

 
% perform fourth problem
% if (response == 4)
% 	part4(x, y);
% end
 
% perform fifth problem
% if (response == 5)
% 	part5(x, y);
% end
 
% perform sixth problem (should we be doing this?)

function [ output_args ] = part2( x, y )
% part2(): performs calculations for part2 by
% 		   constructing and training a single ANN
% 		   with the entire dataset
	disp('****************************************')
	disp('* PERFORMING PART 2 ********************')

	% IDEA: could we try to determine the optimal learning rate
	%		from part1 and pass it to this function???
	learningRate = 0.75;

	disp('****************************************')
	disp(['Training with Learning Rate = ' num2str(learningRate) ' ...']);
	nn = constructAndTrain3LayerNetwork(learningRate, x, y);
end


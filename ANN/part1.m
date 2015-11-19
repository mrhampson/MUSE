function [ networks ] = part1(x, y)
% part1(): performs calculations for part1 by
% 		   constructing and training multiple
%		   Neural Networks with training data
	disp('****************************************')
	disp('* PERFORMING PART 1 ********************')

	% TODO: construct training and validation datasets from original
	disp('****************************************')
	disp('Getting training data...')
	xtrain = double(zeros(2));
	ytrain = double(zeros(2));
	xval = double(zeros(2));
	yval = double(zeros(2));

	% observe effects of different learning rates
	learningRates = [0.2 0.7 1 1.2 1.5];
	networks = [];
	for rate = learningRates
		disp('****************************************')
		disp(['Training with Learning Rate = ' num2str(rate) ' ...']);
	    network = constructAndTrain3LayerNetwork(rate, xtrain, ytrain, xval, yval);
	    networks = [networks network];
	end
end


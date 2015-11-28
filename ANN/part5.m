function [err, bad] = part5( x, y, network )
% part5(): performs calculations for part5 by using
%          a Neural Network to predict the output

	disp(sprintf('\n'));
	disp('****************************************')
	disp('*** PART 5 *****************************')
    
    x = cell2mat(x);
    y = cell2mat(y);
    
%     err = []
%     bad = [];
%     for i = 1:size(x,1)
%         [error, badd] = nntest(network, x(i,:), y(i,:));
%         err = [err error];
%         bad = [bad badd];
%     end
    [err, bad] = nntest(network, x, y);

    disp(['Testing error: ' num2str(err)]);
%     disp(bad)

	disp('****************************************');
	disp('****************************************');
end


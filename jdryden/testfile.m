%test.m


m = 10:30;
m = m'
om = [20:40;50:70;0:20]'

indices = crossvalind('kfold',m,10);
test = (indices == 1);
%train = ~test;




indices
test
m(test)
om(test,:)
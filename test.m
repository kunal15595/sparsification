y = [2 2]'

D = [1 0;0 1;1 1]'

x = zeros(size(D,2),size(y,2));

x = (D.')*y
D*x
norm(y - (D*x))
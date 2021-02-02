n = 10;
H = rand(n); H = H*H'; % make spsd
f = -rand(n,1);
Q = rand(n); Q = Q*Q'; % make spsd
g = -rand(n,1);

Q = [1 0.5;0.5 1];
H = -1*eye(2);

cvx_begin
    variable x(2)
    0.5*x'*Q*x+0.5*x'*H*x <=0
    x >= 0
    minimize(0.5*x'*H*x)
cvx_end
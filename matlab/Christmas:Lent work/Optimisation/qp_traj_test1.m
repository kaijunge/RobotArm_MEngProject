function ud  = qp_traj_test1(xref, Ts, T, currPos, currVel, k_effort, k_track, horizon)

% number of data points
N = double(int32(horizon/Ts));

% reference x = step funciton 
xr = squeeze(xref.Data);
currT = int32(T/Ts)+1;
xr = xr(currT:currT+N);

% initial condition
x0 = [currPos currVel];

A = [1 Ts; 0 1];
B = [0; Ts];

mat = zeros(2, N);

for i = 1:N
    mat(:,i) = (A^(i-1))*B;
end




H = 2*eye(2*N-1); % x2 to counteract the 1/2 coefficient in the solver

for i = 1:2*N-1 
    if i <= N
        H(i,i) = k_track*H(i,i);    
    else
        H(i,i) = k_effort*H(i,i);
    end
end

f = zeros(2*N-1,1);

for i = 1:N
    f(i) = -2*xr(i);
end

Aineq = [];
bineq = [];
Aeq = zeros(2*N-1);
beq = zeros(2*N-1, 1);
lb = zeros(2*N-1,1);
ub = zeros(2*N-1,1);

% set values in Aeq
Aeq(1,1) = 1;

for i = 2:N
    Aeq(i,i) = -1;
end

for i = 2:N
    Aeq(i, 1) = [1,0]*A^(i-1)*[1;0]; 
    
    p = zeros(1, N-1);
    p(1:i-1) = mat(1, 1:i-1);
    Aeq(i,N+1:end) = p;
end

beq(1) = x0(1);
for i = 2:N
    beq(i) = [0,1]*A^(i-1)*[0;1]*x0(2);
end

u_lim = Ts*1000;
for i = 1:2*N-1
    if i <= N
        lb(i) = -inf;
        ub(i) = inf;
    else
        lb(i) = -1*u_lim;
        ub(i) = u_lim;
    end
end


z = quadprog(H,f,Aineq,bineq,Aeq,beq,lb,ub);

ud = z(N+1:end);
end
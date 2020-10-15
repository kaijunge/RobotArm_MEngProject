function force = SEC_force(x,xdot)
%SEC_force Returns the force produced by the SEC muscle spring
k       = 1000;
force   = k * x^2;

if x < 0
    force = 0;
end

end


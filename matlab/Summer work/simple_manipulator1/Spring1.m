function force = Spring1(q,qdot, k, l)

    % set default values for spring and damping constant
    if nargin<4, l = 0.001; end
    if nargin<3, k = 10; end

    %SEC_force Returns the force produced by the SEC muscle spring
    force   =  k * q + l * qdot ;
    

end



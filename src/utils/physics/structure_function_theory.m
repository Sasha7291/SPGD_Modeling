function D_theory = structure_function_theory(r, r_0, l_0, k_0)
    arguments
        r   double {mustBeVector, mustBeNonNan, mustBeNonempty, mustBeFinite}
        r_0 (1,1) double {mustBeNonNan, mustBeFinite}
        l_0 (1,1) double {mustBeNonNan, mustBeFinite}
        k_0 (1,1) double {mustBeNonNan, mustBeFinite}
    end

    r_2 = r.^2;
    
    D_theory = 7.75*(r_0^(-5/3))*(l_0^(-1/3))*r_2.*(1./(1 + 2.03*r_2/(l_0^2)).^(1/6) - 0.72*(k_0*l_0)^(1/3));
    D_theory(r == 0) = 0;
end
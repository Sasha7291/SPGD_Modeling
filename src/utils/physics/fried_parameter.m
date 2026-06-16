function r_0 = fried_parameter(lambda, L, C_n_2)
    arguments
        lambda  double {mustBeNonNan, mustBeFinite, mustBePositive}
        L       double {mustBeNonNan, mustBeFinite, mustBePositive}
        C_n_2   double {mustBeNonNan, mustBeFinite, mustBePositive}
    end

    r_0 = 0.185*(lambda^2/(L*C_n_2))^(3/5);
end
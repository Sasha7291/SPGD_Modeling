function w_L = overdrawing_theory(lambda, w_0, L, C_n_2)
    arguments
        lambda  (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive}
        w_0     (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive}
        L       (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive}
        C_n_2   (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive}
    end

    w_L = (w_0^2*(1 + (L/rayleigh_radius(lambda, w_0))^2 + (2*L*lambda/(2*pi*fried_parameter(lambda, L, C_n_2)))^2));
end
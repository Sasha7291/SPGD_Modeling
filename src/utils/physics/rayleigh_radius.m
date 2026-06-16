function r_r = rayleigh_radius(lambda, w_0)
    arguments
        lambda  (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive}
        w_0     (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive}
    end

    r_r = pi*w_0^2/lambda;
end
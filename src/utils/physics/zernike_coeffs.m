function a = zernike_coeffs(j, R_norm, r_0)
    arguments
        j       (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive, mustBeInteger}
        R_norm  (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive}
        r_0     (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive}
    end

    g = randn(1);
    sigma_j = 0.2944*(2*R_norm/r_0)^(5/3)*j^(-11/6);
    a = sqrt(sigma_j)*g;
end
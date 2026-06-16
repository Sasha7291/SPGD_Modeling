function Z = zernike_polynom(j, X, Y, R_norm)
    arguments
        j       (1,1) double {mustBePositive, mustBeInteger}
        X       double {mustBeMatrix, mustBeNonempty, mustBeFinite, mustBeNonNan}
        Y       double {mustBeMatrix, mustBeNonempty, mustBeFinite, mustBeNonNan}
        R_norm  (1,1) double {mustBePositive}
    end

    [n, m] = noll_to_zern(j);
    rho = min(sqrt(X.^2 + Y.^2) / R_norm, 1);
    R_nm = zernike_radial_polynomial(n, abs(m), rho);
    theta = atan2(Y, X);

    if m >= 0
        ang = cos(m * theta);
    else
        ang = sin(abs(m) * theta);
    end

    if m == 0
        Z = sqrt(n+1)*R_nm.*ang;
    else
        Z = sqrt(2*n+2) * R_nm .* ang;
    end

    Z(rho == 1 & (X.^2+Y.^2) > R_norm^2) = 0;
end
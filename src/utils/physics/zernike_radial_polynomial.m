function R = zernike_radial_polynomial(n, m, rho)
    arguments
        n   (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive, mustBeInteger}
        m   (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive, mustBeInteger}
        rho double {mustBeVector, mustBeNonNan, mustBeNonempty, mustBeFinite}
    end

    R = zeros(size(rho));

    for k = 0:(n - m)/2
        numer = (-1)^k * factorial(n - k);
        denom = factorial(k) * factorial((n + m)/2 - k) * factorial((n - m)/2 - k);
        R = R + (numer / denom) * rho.^(n - 2*k);
    end
end
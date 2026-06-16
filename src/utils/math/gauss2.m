function gauss = gauss2(X, Y, w)
    arguments
        X double {mustBeMatrix, mustBeNonNan, mustBeNonempty, mustBeFinite}
        Y double {mustBeMatrix, mustBeNonNan, mustBeNonempty, mustBeFinite}
        w (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive}
    end

    assert(isequal(size(X), size(Y)), 'X and Y must have the same size');

    gauss = sqrt(2/(pi*w^2))*exp(-(X.^2 + Y.^2)/w^2);
end
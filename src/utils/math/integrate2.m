function int2 = integrate2(F, dx, dy)
    arguments
        F   double {mustBeMatrix, mustBeNonempty}
        dx  (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive}
        dy  (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive}
    end

    int2 = sum(F(:))*dx*dy;
end
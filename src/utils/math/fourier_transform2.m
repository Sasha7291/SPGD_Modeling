function four = fourier_transform2(F, dx, dy)
    arguments
        F   double {mustBeMatrix, mustBeNonNan, mustBeNonempty, mustBeFinite}
        dx  (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive}
        dy  (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive}
    end

    four = fftshift(fft2(ifftshift(F)))*dx*dy;
end
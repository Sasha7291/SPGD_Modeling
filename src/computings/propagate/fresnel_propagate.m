function E_out = fresnel_propagate(E_in, wave_inv_metric_coords, wave_params, path_params)
    arguments
        E_in                    {mustBeMatrix, mustBeNonNan, mustBeNonempty, mustBeFinite}
        wave_inv_metric_coords  Mesh_WaveInverseMetricCoords
        wave_params             Parameters_Wave
        path_params             Parameters_Path
    end

    H = exp(-1i*pi*wave_params.lambda*path_params.dz*wave_inv_metric_coords.XY_2);
    E_out = ifft2(ifftshift(H.*fftshift(fft2(E_in))));
end
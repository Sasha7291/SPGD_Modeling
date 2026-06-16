function E_out = propogate( ...
    E_in, ...
    wave_number_coords, ...
    wave_inv_metric_coords, ...
    wave_params, ...
    turbulence_params, ...
    path_params ...
)
    arguments
        E_in                    {mustBeMatrix, mustBeNonempty, mustBeFinite, mustBeNonNan}
        wave_number_coords      Mesh_WaveNumberCoords
        wave_inv_metric_coords  Mesh_WaveInverseMetricCoords
        wave_params             Parameters_Wave
        turbulence_params       Parameters_Turbulence
        path_params             Parameters_Path
    end

    E_out = E_in;
    
    for idx = 1:path_params.N_screens
        phase = phase_screen(wave_number_coords, wave_params, turbulence_params, path_params);
        E_out = phase_shift(E_out, phase);
        E_out = fresnel_propagate(E_out, wave_inv_metric_coords, wave_params, path_params);
    end
end
function phase = phase_screen(wave_number_coords, wave_params, turbulence_params, path_params)
    arguments
        wave_number_coords  Mesh_WaveNumberCoords
        wave_params         Parameters_Wave
        turbulence_params   Parameters_Turbulence
        path_params         Parameters_Path
    end

    phi_phi = phase_spectral_power_density( ...
        wave_number_coords, ...
        wave_params, ...
        turbulence_params, ...
        path_params ...
    );
    phase = random_wave_phase(phi_phi, wave_number_coords);

    phase_sub = phase_subharmonics(5, 5, wave_number_coords, wave_params, turbulence_params, path_params);

    center_x = wave_number_coords.N_x/2 + 1;
    center_y = wave_number_coords.N_y/2 + 1;
    idx_x = center_x-2:center_x+2;
    idx_y = center_y-2:center_y+2;

    phase(idx_x, idx_y) = phase(idx_x, idx_y) + phase_sub;
    phase = phase - mean(phase(:));
end

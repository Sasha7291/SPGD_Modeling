function phase = random_wave_phase(phi_phi, wave_number_coords)
    arguments
        phi_phi             double {mustBeMatrix, mustBeNonempty, mustBeFinite, mustBeNonNan}
        wave_number_coords  Mesh_WaveNumberCoords
    end

    norm = sqrt(phi_phi*wave_number_coords.dx*wave_number_coords.dy)*wave_number_coords.N_x*wave_number_coords.N_y/sqrt(2);
    
    phase = ( ...
        randn(wave_number_coords.N_x, wave_number_coords.N_y) ...
        + 1j*randn(wave_number_coords.N_x, wave_number_coords.N_y) ...
    ).*norm;
    phase(1,1) = 0;

    phase = real(ifft2(ifftshift(phase)));
end
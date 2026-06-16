function phi_n = refractive_spectral_power_density( ...
    wave_number_coords, ...
    turbulence_params ...
)
    arguments
        wave_number_coords  Mesh_WaveNumberCoords
        turbulence_params   Parameters_Turbulence
    end

    coeff = 0.033*turbulence_params.C_n_2;

    phi_n_1 = exp(-wave_number_coords.XY_2/turbulence_params.k_m^2);
    phi_n_2 = (wave_number_coords.XY_2 + turbulence_params.k_0^2).^(11/6);
    phi_n = coeff*phi_n_1./phi_n_2;
end
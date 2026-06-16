function n = thermal_noise(noise_params)
    arguments
        noise_params Parameters_Noise
    end

    if noise_params.has_noise
        n = sqrt(noise_params.I_2)*randn();
    else
        n = 0;
    end
end
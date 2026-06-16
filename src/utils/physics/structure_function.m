function D_phi = structure_function(phase_screens)
    [N_x, N_y, n_screens] = size(phase_screens);
    max_radius_pix = min(floor(N_x/2), floor(N_y/2));
    
    B_sum = zeros(max_radius_pix, 1);
    count = zeros(max_radius_pix, 1);
    
    [X_pix, Y_pix] = meshgrid(-N_x/2:N_x/2-1, -N_y/2:N_y/2-1);
    R_pix = round(sqrt(X_pix.^2 + Y_pix.^2));
    
    for idx = 1:n_screens
        F = fft2(phase_screens(:, :, idx));
        S = real(fftshift(ifft2(F.*conj(F))));
        
        for r_idx = 1:max_radius_pix
            mask = (R_pix == r_idx);
            num_pixels = sum(mask(:));

            if num_pixels > 0
                B_sum(r_idx) = B_sum(r_idx) + sum(S(mask))/num_pixels;
                count(r_idx) = count(r_idx) + 1;
            end
        end
    end
    
    B_avg = B_sum./(count*N_x^2);
    
    D_phi = 2*(B_avg(1) - B_avg);
    D_phi(1) = 0;
end
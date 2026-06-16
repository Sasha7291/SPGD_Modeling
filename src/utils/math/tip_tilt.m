function E_out = tip_tilt(E_in, wave_metric_coords, wave_params, angles)
    arguments
        E_in                {mustBeMatrix, mustBeNonempty, mustBeFinite, mustBeNonNan}
        wave_metric_coords  Mesh_WaveMetricCoords
        wave_params         Parameters_Wave
        angles              (1, 2) double {mustBeNonempty, mustBeFinite, mustBeNonNan}
    end
    
    E_out = phase_shift(E_in, wave_params.k*(angles(1)*wave_metric_coords.X + angles(2)*wave_metric_coords.Y));
end
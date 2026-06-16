classdef Mesh_All < handle
    properties
        wave_metric_coords      Mesh_WaveMetricCoords
        wave_number_coords      Mesh_WaveNumberCoords
        wave_inv_metric_coords  Mesh_WaveInverseMetricCoords
        lens_metric_coords      Mesh_LensMetricCoords
    end

    methods
        function obj = Mesh_All(all_params)
            arguments
                all_params Parameters_All
            end

            obj.wave_metric_coords = Mesh_WaveMetricCoords(all_params.model_params);
            obj.wave_number_coords = Mesh_WaveNumberCoords(all_params.model_params);
            obj.wave_inv_metric_coords = Mesh_WaveInverseMetricCoords(all_params.model_params);
            obj.lens_metric_coords = Mesh_LensMetricCoords( ...
                all_params.wave_params, ...
                all_params.lens_params, ...
                all_params.model_params ...
            );
        end
    end
end
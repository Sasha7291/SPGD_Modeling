classdef Mesh_LensMetricCoords < Mesh
    methods
        function obj = Mesh_LensMetricCoords(wave_params, lens_params, model_params)
            arguments
                wave_params     Parameters_Wave
                lens_params     Parameters_Lens
                model_params    Parameters_Model
            end
            
            obj.N_x = model_params.N_x;
            obj.N_y = model_params.N_y;
            obj.dx = wave_params.lambda*lens_params.f/model_params.L_x;
            obj.dy = wave_params.lambda*lens_params.f/model_params.L_y;
            obj.create();
        end
    end
end
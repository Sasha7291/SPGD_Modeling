classdef Mesh_WaveMetricCoords < Mesh
    methods
        function obj = Mesh_WaveMetricCoords(model_params)
            arguments
                model_params Parameters_Model
            end
            
            obj.N_x = model_params.N_x;
            obj.N_y = model_params.N_y;
            obj.dx = model_params.dx;
            obj.dy = model_params.dy;

            obj.create();
        end
    end
end
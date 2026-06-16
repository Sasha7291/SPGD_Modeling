classdef Mesh_WaveNumberCoords < Mesh
    methods
        function obj = Mesh_WaveNumberCoords(model_params)
            arguments
                model_params Parameters_Model
            end
            
            obj.N_x = model_params.N_x;
            obj.N_y = model_params.N_y;
            obj.dx = 2*pi/model_params.L_x;
            obj.dy = 2*pi/model_params.L_y;
            obj.create();
        end
    end
end
classdef Parameters_Model < Parameters
    properties (SetAccess = immutable)
        N_x (1,1) double
        N_y (1,1) double
        L_x (1,1) double
        L_y (1,1) double
        dx  (1,1) double
        dy  (1,1) double
    end
    
    methods
        function obj = Parameters_Model(options)
            arguments
                options.N_x (1,1) double {mustBeInteger, mustBePositive, mustBeNonNan, mustBeFinite}
                options.N_y (1,1) double {mustBeInteger, mustBePositive, mustBeNonNan, mustBeFinite}
                options.L_x (1,1) double {mustBePositive, mustBeNonNan, mustBeFinite}
                options.L_y (1,1) double {mustBePositive, mustBeNonNan, mustBeFinite}
            end
            
            obj.N_x = options.N_x;
            obj.N_y = options.N_y;
            obj.L_x = options.L_x;
            obj.L_y = options.L_y;

            obj.dx = obj.L_x/obj.N_x;
            obj.dy = obj.L_y/obj.N_y;
        end
    end
end
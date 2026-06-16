classdef Parameters_Turbulence < Parameters
    properties (SetAccess = immutable)
        L_0     (1,1) double
        l_0     (1,1) double
        C_n_2   (1,1) double
        k_0     (1,1) double
        k_m     (1,1) double
    end
    
    methods
        function obj = Parameters_Turbulence(options)
            arguments
                options.L_0     (1,1) double {mustBePositive, mustBeNonNan}
                options.l_0     (1,1) double {mustBePositive, mustBeNonNan}
                options.C_n_2   (1,1) double {mustBePositive, mustBeNonNan, mustBeFinite}
            end
            
            obj.L_0 = options.L_0;
            obj.l_0 = options.l_0;
            obj.C_n_2 = options.C_n_2;

            obj.k_0 = 2*pi/obj.L_0;
            obj.k_m = 5.92/obj.l_0;
        end
    end
end
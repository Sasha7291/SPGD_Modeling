classdef Parameters_Wave < Parameters
    properties (SetAccess = immutable)
        lambda  (1,1) double
        w_0     (1,1) double
        k       (1,1) double
    end
    
    methods
        function obj = Parameters_Wave(options)
            arguments
                options.lambda  (1,1) double {mustBePositive, mustBeNonNan, mustBeFinite}
                options.w_0     (1,1) double {mustBePositive, mustBeNonNan, mustBeFinite}
            end
            
            obj.lambda = options.lambda;
            obj.w_0 = options.w_0;

            obj.k = 2*pi/obj.lambda;
        end
    end
end
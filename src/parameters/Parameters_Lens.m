classdef Parameters_Lens < Parameters
    properties (SetAccess = immutable)
        f   (1,1) double
        w_f (1,1) double
    end
    
    methods
        function obj = Parameters_Lens(options)
            arguments
                options.f   (1,1) double {mustBePositive, mustBeNonNan, mustBeFinite}
                options.w_f (1,1) double {mustBePositive, mustBeNonNan, mustBeFinite}
            end
            
            obj.f = options.f;
            obj.w_f = options.w_f;
        end
    end
end
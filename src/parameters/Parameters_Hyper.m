classdef Parameters_Hyper < Parameters
    properties (SetAccess = immutable)
        sigma   (1,1) double
        gamma   (1,1) double
        N_iter  (1,1) double
    end
    
    methods
        function obj = Parameters_Hyper(options)
            arguments
                options.sigma   (1,1) double {mustBePositive, mustBeFinite, mustBeNonNan}
                options.gamma   (1,1) double {mustBePositive, mustBeFinite, mustBeNonNan}
                options.N_iter  (1,1) double {mustBeInteger, mustBePositive, mustBeFinite, mustBeNonNan}
            end
            
            obj.sigma = options.sigma;
            obj.gamma = options.gamma;
            obj.N_iter = options.N_iter;
        end
    end
end
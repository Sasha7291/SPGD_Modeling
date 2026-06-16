classdef Parameters_Photodiode < Parameters
    properties (Constant)
        c (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive} = 299.792458e6;
        e (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive} = 9.109383713928e-31;
        h (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive} = 6.62607015e-34;
        k (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive} = 1.380649e-23;
    end

    properties (SetAccess = immutable)
        eta     (1,1) double
        lambda  (1,1) double
        alpha   (1,1) double
    end

    methods
        function obj = Parameters_Photodiode(options)
            arguments
                options.eta     (1,1) double {mustBePositive, mustBeNonNan, mustBeFinite}
                options.lambda  (1,1) double {mustBePositive, mustBeNonNan, mustBeFinite}
            end

            obj.eta = options.eta;
            obj.lambda = options.lambda;

            obj.alpha = obj.eta*obj.e*obj.lambda/(obj.h*obj.c);
        end
    end
end
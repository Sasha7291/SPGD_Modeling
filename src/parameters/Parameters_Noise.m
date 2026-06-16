classdef Parameters_Noise < Parameters
    properties (SetAccess = immutable)
        has_noise           (1,1) logical
        T                   (1,1) double
        R                   (1,1) double
        delta_f             (1,1) double
        I_2                 (1,1) double
        photodiode_params   Parameters_Photodiode
    end

    methods
        function obj = Parameters_Noise(options)
            arguments
                options.has_noise           (1,1) logical
                options.photodiode_params   Parameters_Photodiode
                options.T                   (1,1) double {mustBePositive}
                options.R                   (1,1) double {mustBePositive}
                options.delta_f             (1,1) double {mustBePositive} 
            end

            obj.has_noise = options.has_noise;
            obj.T = options.T;
            obj.R = options.R;
            obj.delta_f = options.delta_f;
            obj.photodiode_params = options.photodiode_params;

            obj.I_2 = 4*obj.photodiode_params.k*obj.T/(obj.R*options.photodiode_params.alpha);
        end
    end
end
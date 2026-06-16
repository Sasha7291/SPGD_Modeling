classdef Parameters_Gif < Parameters
    properties
        name    string
        delay   (1,1) double
    end

    methods
        function obj = Parameters_Gif(options)
            arguments
                options.name    string {mustBeScalarOrEmpty}
                options.delay   (1,1) double {mustBePositive}
            end

            obj.name = options.name;
            obj.delay = options.delay;
        end
    end
end
classdef Parameters_Path < Parameters
    properties (SetAccess = immutable)
        L           (1,1) double
        N_screens   (1,1) double
        N_subharm   (1,1) double
        dz          (1,1) double
    end
    
    methods
        function obj = Parameters_Path(options)
            arguments
                options.L          (1,1) double {mustBePositive}
                options.N_screens  (1,1) double {mustBeInteger, mustBePositive}
                options.N_subharm  (1,1) double {mustBeInteger, mustBePositive}
            end
            
            obj.L = options.L;
            obj.N_screens = options.N_screens;
            obj.N_subharm = options.N_subharm;

            obj.dz = obj.L/obj.N_screens;
        end
    end
end
classdef (Abstract) Mesh < handle
    properties
        N_x     (1,1) double
        N_y     (1,1) double
        dx      (1,1) double
        dy      (1,1) double
        X       double {mustBeMatrix, mustBeNonNan, mustBeFinite}
        Y       double {mustBeMatrix, mustBeNonNan, mustBeFinite}
        XY_2    double {mustBeMatrix, mustBeNonNan, mustBeFinite, mustBeNonnegative}
    end

    methods (Access = protected)
        function obj = create(obj)
            [obj.X, obj.Y] = meshgrid(...
                (-obj.N_x/2:obj.N_x/2-1)*obj.dx,...
                (-obj.N_y/2:obj.N_y/2-1)*obj.dy...
            );

            obj.XY_2 = obj.X.^2 + obj.Y.^2;
        end
    end
end
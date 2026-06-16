classdef Result < handle
    properties
        J_hist      double
        u_hist      double
        I_hist      cell
        I_cent_hist double
    end

    methods
        function obj = Result(n_iter)
            arguments
                n_iter (1,1) double {mustBeInteger, mustBePositive}
            end

            obj.J_hist = zeros(n_iter, 1);
            obj.u_hist = zeros(n_iter, 2);
            obj.I_hist = cell(n_iter);
            obj.I_cent_hist = zeros(n_iter, 2);
        end
    end
end
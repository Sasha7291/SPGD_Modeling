function [n, m] = noll_to_zern_coeffs(j)
    arguments
        j   (1,1) double {mustBeNonNan, mustBeFinite, mustBePositive, mustBeInteger}
    end

    if j == 1
        n = 0; m = 0;
        return
    end

    n = floor((sqrt(8*j-7)-1)/2);
    p = j - n*(n+1)/2 - 1;

    if mod(n,2) == 0
        if p == 0
            m = 0;
        else
            k = ceil(p/2);
            if mod(p,2) == 1
                m = 2*k;
            else
                m = -2*k;
            end
        end
    else
        k = ceil((p+1)/2);
        if mod(p,2) == 0
            m = 2*k - 1;
        else
            m = -(2*k - 1);
        end
    end
end
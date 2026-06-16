function E_out = phase_shift(E_in, phase)
    arguments
        E_in    {mustBeMatrix, mustBeNonempty, mustBeFinite, mustBeNonNan}
        phase   double {mustBeMatrix, mustBeNonempty, mustBeFinite, mustBeNonNan}
    end
    
    E_out = E_in.*exp(1j*phase);
end
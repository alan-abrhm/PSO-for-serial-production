function updatedInertia = getUpdatedInertia(Mg, h)
%getUpdatedInertia
%   calculate inertia of the current iteration
    updatedInertia = 0.0000001 + 0.0000009 * (Mg - h)/(Mg - 1);
end


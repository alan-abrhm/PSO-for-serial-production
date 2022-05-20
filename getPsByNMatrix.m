function PsByNMatrix = getPsByNMatrix(min, max, Ps, n)
%getPsByNMatrix
%   Function to generate Ps by N matrix
    PsByNMatrix = min + (max - min) * rand(Ps,n);
end


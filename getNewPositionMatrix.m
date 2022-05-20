function newPositionMatrix = getNewPositionMatrix(Xij, X0)
%getNewPositionMatrix
%   get new position matrix
%   first map elements of current position matrix to previous position
%   matrix
    mappedPositionMatrix = containers.Map(Xij, X0);
%   sort current position matrix
    sortedPositionMatrix = sort(Xij, 2);
    newPositionMatrix = zeros(size(Xij));
%   replace sorted matrix elements with corresponding elements of previous
    for i = 1:size(sortedPositionMatrix, 1)
        for j = 1:size(sortedPositionMatrix, 2)
            newPositionMatrix(i,j) = mappedPositionMatrix(sortedPositionMatrix(i,j));
        end
    end
end


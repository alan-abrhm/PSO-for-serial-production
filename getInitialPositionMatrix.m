function [ initialPositionMatrix ] = getInitialPositionMatrix(jobs, Ps)
%getInitialPositionMatrix
%   Function to get Ps number of permutations of n number of jobs
%   Ps particle size
    allJobSequences = perms(jobs);
    randomIndices = randperm(Ps);
    initialPositionMatrix = allJobSequences(randomIndices,:);
end


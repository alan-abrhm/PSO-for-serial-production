function [ initialPositionMatrix ] = getInitialPositionMatrix(jobs, Ps)
%getInitialPositionMatrix
%   Function to get Ps number of permutations of n number of jobs
%   Ps particle size
    %allJobSequences = perms(jobs);
    %randomIndices = randperm(Ps);
    %initialPositionMatrix = allJobSequences(randomIndices,:);
    n = size(jobs,2);
    if n > 9
        n = 9;
    end
    jobSequences = perms(jobs(1,1:n));
    randomIndices = randperm(Ps);
    n = size(jobs,2);
    initialPositionMatrix = zeros([Ps n]);
    positionMatrix = jobSequences(randomIndices,:);
    if n > 9
        for i = 1:Ps
            initialPositionMatrix(i,:) = [positionMatrix(i,:) jobs(1, 10:n)];
        end
    else
        initialPositionMatrix = positionMatrix;
    end
end


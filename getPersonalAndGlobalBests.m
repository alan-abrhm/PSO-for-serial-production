function [ personalBestPositionMatrix, globalBestPosition, globalBestFitnessValue, currentBestFitnessValue ] = getPersonalAndGlobalBests(prevPersonalBestPosition, prevGlobalBestPosition, prevGlobalBestFitnessValue, Xij, jobMachineTimings)
%getPersonalAndGlobalBests
%   compare new values with existing to find the best
    %   find maxpan of each particle in Xij
    Ps = size(Xij,1);
    currentBestFitnessValue = findMaxPan(Xij(1,:), jobMachineTimings);
    currentBestPosition = Xij(1,:);
    for i = 2:Ps
        currentFitnessValue = findMaxPan(Xij(i,:), jobMachineTimings);
        if (currentFitnessValue < currentBestFitnessValue)
            currentBestFitnessValue = currentFitnessValue;
            currentBestPosition = Xij(i,:);
        end
    end
    
    if (currentBestFitnessValue < prevGlobalBestFitnessValue)
        globalBestFitnessValue = currentBestFitnessValue;
        globalBestPosition = currentBestPosition;
        personalBestPositionMatrix = Xij;
    else
       globalBestPosition = prevGlobalBestPosition;
       globalBestFitnessValue = prevGlobalBestFitnessValue;
       personalBestPositionMatrix = prevPersonalBestPosition;
    end
end


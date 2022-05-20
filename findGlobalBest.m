function [ globalBestPosition, globalBestFitnessValue ] = findGlobalBest(n, m, c1, c2, Ps, Mg, d, w, Xmax, Xmin, Vmax, Vmin, jobMachineTimings)
%findGlobalBest
%   Detailed explanation goes here
%   n: number of jobs
%   m: number of machines
%   c1: self confidence factor
%   c2: swarm confidence factor
%   Ps: particle size
%   Mg: total number of generations
%   d: constriction factor
%   w: inertia weight
%   jobMachineTimings: n x m matrix; where each element stores the time
%   taken by a machine to process a job
%   t: iteration counter
%   jobs: vector of jobs
    jobs = 1:n;
%   initial values
    X0 = getInitialPositionMatrix(jobs, Ps);
    Xij = getPsByNMatrix(Xmin, Xmax, Ps, n);
    Vij = getPsByNMatrix(Vmin, Vmax, Ps, n);
%    get new Xij after sorting and rearranging
    Xij = getNewPositionMatrix(Xij, X0);
% store best fitness value of each iteration to be used for plotting
    bestFitnessValues = zeros(1, Mg+1);
% find and set initial best values
    [ personalBestPositionMatrix, globalBestPosition, globalBestFitnessValue, currentBestFitnessValue ]=  getPersonalAndGlobalBests(Xij, Xij(1,:), intmax('int64'), Xij, jobMachineTimings);
    bestFitnessValues(1) = currentBestFitnessValue;
%   w_prev: previous inertia
    w_prev = w;
%   Xij_prev: previous position matrix
    Xij_prev = Xij;
%   Vij_prev: previous velocity matrix
    Vij_prev = Vij;
%   iterate for Mg iterations
    for t = 1:Mg
        % updating inertia weight
        w = 0.0000001 + 0.0000009 * (Mg - t) * (Mg - 1);
        % updating velocity
        Vij = d * (w_prev * Vij_prev + c1 * rand() * (personalBestPositionMatrix - Xij_prev) + c2 * rand() * (repmat(globalBestPosition,Ps,1) - Xij_prev));
        Xij = Xij_prev - Vij;
        % get new Xij after sorting and rearranging
        Xij = getNewPositionMatrix(Xij,Xij_prev);
        % compare with current global best and update
        [ personalBestPositionMatrix, globalBestPosition, globalBestFitnessValue, currentBestFitnessValue ]=  getPersonalAndGlobalBests(personalBestPositionMatrix, globalBestPosition, globalBestFitnessValue, Xij, jobMachineTimings);
        bestFitnessValues(t+1) = currentBestFitnessValue;
        % store current X, V and w values to be used in the next iteration
        w_prev = w;
        Xij_prev = Xij;
        Vij_prev = Vij;
    end
%   plot the best fitness values obtained for each iteration
    plot(1:Mg+1,bestFitnessValues);
    ylabel('best fitness value');
    xlabel('iteration');
    title('Global fitness value change');
end


function maxPan = findMaxPan(jobSequence, jobMachineTimings)
%findMaxPan
%   find the time taken for the machines to complete the given job sequence
%   n: number of jobs
%   m: number of machines
%   jobTimings: n x m matrix storing job processing time for each machine
%   x: stores the time after a particular job is processed by a particular machine
    timeLapsedAfterJobs = zeros(size(jobMachineTimings) + 1);
    for i = 1:size(jobSequence, 2)
        currentJob = jobSequence(1,i);
        for j = 1:size(jobMachineTimings(1,:),2)
            prevJobCurrentMachineEndTime = timeLapsedAfterJobs(i,j+1);
            % current job starts on current machine after current job is completed by previous
            currentJobStartTime = timeLapsedAfterJobs(i+1,j);
            if (prevJobCurrentMachineEndTime > currentJobStartTime)
                currentJobStartTime = prevJobCurrentMachineEndTime;
            end
            % store the end time after current job is processed by current
            % machine
            timeLapsedAfterJobs(i+1,j+1) = currentJobStartTime + jobMachineTimings(currentJob,j);
        end
    end
    % max pan is the time taken by the machines to process all the jobs in
    % the given sequence
    maxPan = timeLapsedAfterJobs(end);
end


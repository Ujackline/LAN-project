function avgTransmissions = runCompoundNetworkSim(K, p, numIterations)
    totalTransmissions = zeros(1, numIterations); % To store transmission count for each iteration
    
    for iter = 1:numIterations
        transmissions = 0;
        for packet = 1:K
            success = false;
            while ~success
                % For each packet, simulate the parallel links
                if rand() < p % If first link fails
                    % Now the second link in parallel
                    if rand() >= p % If second link succeeds
                        success = true;
                    end
                else
                    success = true; % First link succeeded
                end
                transmissions = transmissions + 1;
            end
        end
        totalTransmissions(iter) = transmissions;
    end
    
    avgTransmissions = mean(totalTransmissions);
end

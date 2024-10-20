function result = runTwoParallelLinkSim(K, p, N)
    % Initialize an array to store results for each iteration
    simResults = zeros(1, N);
    
    % Run the simulation N times
    for i = 1:N
        txAttemptCount = 0;    % Count of transmission attempts
        pktSuccessCount = 0;   % Count of successfully transmitted packets
        
        % Continue until all K packets are successfully transmitted
        while pktSuccessCount < K
            txAttemptCount = txAttemptCount + 1;  % Increment transmission attempt count
            
            % Simulate transmission over two parallel links
            r1 = rand > p; % Success for link 1
            r2 = rand > p; % Success for link 2
            
            % If successful through either link, increment success count
            if r1 || r2
                pktSuccessCount = pktSuccessCount + 1; % Packet successfully transmitted
            end
        end
        simResults(i) = txAttemptCount;  % Store result for this iteration
    end
    
    result = mean(simResults);  % Return the average number of transmissions
end

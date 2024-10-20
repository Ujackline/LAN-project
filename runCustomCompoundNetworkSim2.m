function avgTransmissions = runCustomCompoundNetworkSim2(K, p1, p2, p3, numIterations)
    totalTransmissions = zeros(1, numIterations); % To store transmission count for each iteration
    
    for iter = 1:numIterations
        transmissions = 0;
        for packet = 1:K
            success = false;
            while ~success
                % Simulate the network with 3 links and different failure probabilities
                if rand() < p1 % First link fails
                    % Try the second and third links in series
                    if rand() >= p2 && rand() >= p3 % Both second and third links succeed
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

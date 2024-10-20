function result = runTwoSeriesLinkSim(K, p, N)
    simResults = ones(1, N);
    for i = 1:N
        txAttemptCount = 0;
        pktSuccessCount = 0;
        while pktSuccessCount < K
            % Simulate transmission through first link
            r1 = rand;
            txAttemptCount = txAttemptCount + 1;
            while r1 < p
                r1 = rand;
                txAttemptCount = txAttemptCount + 1;
            end
            
            % If successful through first link, simulate second link
            if r1 >= p
                r2 = rand;
                txAttemptCount = txAttemptCount + 1;
                while r2 < p
                    r2 = rand;
                    txAttemptCount = txAttemptCount + 1;
                end
                
                % If successful through both links, increment success count
                if r2 >= p
                    pktSuccessCount = pktSuccessCount + 1;
                end
            end
        end
        simResults(i) = txAttemptCount;
    end
    result = mean(simResults);
end
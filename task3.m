
% Values of K to simulate
K_values = [1, 5, 15, 50, 100];
p_values =0:0.01:0.99; % Probability values from 0 to 0.99
num_iterations = 1000; % Number of iterations for simulation

% Prepare storage for results
average_transmissions = zeros(length(K_values), length(p_values));

% Loop through each value of K
for i = 1:length(K_values)
    K = K_values(i);
    
    % Run simulations for each probability p
    for j = 1:length(p_values)
        p = p_values(j);
        
        % Store the results of all iterations
        transmissions = zeros(num_iterations, 1);
        for iter = 1:num_iterations
            % Now call with three parameters: K, p, and num_iterations
            transmissions(iter) = runTwoParallelLinkSim(K, p, num_iterations);
        end
        
        % Calculate the average number of transmissions
        average_transmissions(i, j) = mean(transmissions);
    end
    
    % Plot the results for this specific K
    figure;
    plot(p_values, average_transmissions(i, :), 'o', 'MarkerSize', 5, 'DisplayName', sprintf('K = %d', K));
    title(sprintf('Average Number of Transmissions for K = %d', K));
    xlabel('Probability of Failure (p)');
    ylabel('Average Transmissions (log scale)');
    grid on;
    legend show;
end

% Plot all results in a single figure
figure;
hold on;
for i = 1:length(K_values)
    plot(p_values, average_transmissions(i, :), 'o', 'MarkerSize', 5, 'DisplayName', sprintf('K = %d', K_values(i)));
end
title('Average Number of Transmissions for Different K Values');
xlabel('Probability of Failure (p)');
ylabel('Average Transmissions (log scale)');
grid on;
legend show;
hold off;

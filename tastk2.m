% Main script
K_values = [1, 5, 15, 50, 100];
p_values = 0:0.01:0.99; % Probability of failure from 0 to 0.99 with increment of 0.01
N = 1000; % Number of iterations for each simulation

% Preallocate space for results
simulated_results = zeros(length(K_values), length(p_values));
calculated_results = zeros(length(K_values), length(p_values));

% Main simulation loop
for i = 1:length(K_values)
    K = K_values(i);
    for j = 1:length(p_values)
        p = p_values(j);
        % Run the simulation
        simulated_results(i, j) = runTwoSeriesLinkSim(K, p, N);
        % Calculate the analytical result
        calculated_results(i, j) = calculateTheoreticalTwoLinks(K, p);
    end
end

% Plotting the results
colors = {'r', 'g', 'b', 'm', 'c'}; % Colors for different K values

% Plot individual figures for each K value
for i = 1:length(K_values)
    K = K_values(i);
    figure;
    semilogy(p_values, calculated_results(i, :), [colors{i}, '-'], 'LineWidth', 2);
    hold on;
    semilogy(p_values, simulated_results(i, :), [colors{i}, 'o'], 'MarkerFaceColor', 'w');
    title(sprintf('Average Number of Transmissions for K = %d (Two Series Links)', K));
    xlabel('Probability of Failure (p)');
    ylabel('Average Number of Transmissions');
    legend('Calculated Results', 'Simulated Results');
    grid on;
    set(gca, 'YScale', 'log');
    ylim([1, max(max(calculated_results))]); % Set y-axis limit
    hold off;
end

% Plot all K values in one figure
figure;
for i = 1:length(K_values)
    semilogy(p_values, calculated_results(i, :), [colors{i}, '-'], 'LineWidth', 2);
    hold on;
    semilogy(p_values, simulated_results(i, :), [colors{i}, 'o'], 'MarkerFaceColor', 'w');
end
title('Average Number of Transmissions for All K Values (Two Series Links)');
xlabel('Probability of Failure (p)');
ylabel('Average Number of Transmissions');
legend('K=1 (Calc)', 'K=1 (Sim)', 'K=5 (Calc)', 'K=5 (Sim)', ...
       'K=15 (Calc)', 'K=15 (Sim)', 'K=50 (Calc)', 'K=50 (Sim)', ...
       'K=100 (Calc)', 'K=100 (Sim)', 'Location', 'northwest');
grid on;
set(gca, 'YScale', 'log');
ylim([1, max(max(calculated_results))]); % Set y-axis limit
hold off;
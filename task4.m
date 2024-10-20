% Parameters
K_values = [1, 5, 15, 50, 100];  % Different K values
p_values = 0:0.01:0.99;  % Probability range
numIterations = 1000;  % Number of iterations

% Loop through each K value and run simulations
all_results = cell(length(K_values), 1); % Store results for all K

for i = 1:length(K_values)
    K = K_values(i);
    avgTransmissionsPerP = zeros(1, length(p_values)); % Store results for each p
    
    % Simulate for each p value
    for j = 1:length(p_values)
        p = p_values(j);
        avgTransmissionsPerP(j) = runCompoundNetworkSim(K, p, numIterations);
    end
    
    % Store results for later use in combined figure
    all_results{i} = avgTransmissionsPerP;
    
       % Plot the results for this specific K
    figure;
    plot(p_values, avgTransmissionsPerP, 'o', 'MarkerFaceColor', 'none', 'MarkerEdgeColor', 'b'); % Hollow circles
    set(gca, 'YScale', 'log');  % Logarithmic y-scale
    xlabel('p (Probability of unsuccessful transmission)');
    ylabel('Average Number of Transmissions');
    title(['Average Number of Transmissions for K = ' num2str(K)]);
end

% Combined figure for all K values 
% Plot all results in a single figure
figure;
hold on;
for i = 1:length(K_values)
    plot(p_values, all_results{i}, 'o-', 'MarkerFaceColor', 'none', 'DisplayName', ['K = ' num2str(K_values(i))]);
end

set(gca, 'YScale', 'log');  % Logarithmic y-scale
xlabel('p (Probability of unsuccessful transmission)');
ylabel('Average Number of Transmissions');
title('Average Number of Transmissions for Different K Values');
legend show;
hold off;

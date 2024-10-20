% Parameters
K_values = [1, 5, 10];  % Different K values
p_values = 0.01:0.01:0.99;  % Probability range (1% to 99% for p3)
numIterations = 1000;  % Number of iterations

% Define the sets of probabilities for each figure (p1 and p2 are fixed)
probability_sets = {
    [0.10, 0.60], % For figure 1 (p1 = 0.10, p2 = 0.60)
    [0.60, 0.10], % For figure 2 (p1 = 0.60, p2 = 0.10)
    [0.10, 0.01], % For figure 3 (p1 = 0.10, p2 = 0.01)
    [0.60, 0.01], % For figure 4 (p1 = 0.60, p2 = 0.01)
    [0.01, 0.10], % For figure 5 (p1 = 0.01, p2 = 0.10)
    [0.01, 0.60], % For figure 6 (p1 = 0.01, p2 = 0.60)
};

% Loop through each figure's probability set
for figIdx = 1:length(probability_sets)
    prob_set = probability_sets{figIdx}; % Get p1 and p2 for this figure
    
    % Initialize a figure
    figure;
    hold on;
    
    % Loop through each K value and run the simulation for varying p3
    for i = 1:length(K_values)
        K = K_values(i);
        avgTransmissionsPerP3 = zeros(1, length(p_values)); % Store results for each p3
        
        % Simulate for each p3 value
        for j = 1:length(p_values)
            p3 = p_values(j);
            p1 = prob_set(1);
            p2 = prob_set(2);
            avgTransmissionsPerP3(j) = runCustomCompoundNetworkSim(K, p1, p2, p3, numIterations);
        end
        
        % Plot results for this K value
        plot(p_values, avgTransmissionsPerP3, 'o-', 'MarkerFaceColor', 'none', 'DisplayName', ['K = ' num2str(K)]);
    end
    
    % Customize the plot
    set(gca, 'YScale', 'log');  % Logarithmic y-scale
    xlabel('p_3 (Probability of unsuccessful transmission on Link 3)');
    ylabel('Average Number of Transmissions');
    title(['Figure ' num2str(figIdx) ': p_1 = ' num2str(prob_set(1)) ', p_2 = ' num2str(prob_set(2))]);
    legend show;
    hold off;
end

clear;

N_array = [10 40];
M_array = [1000 35000];
x_range_array = [1 10]

figure;

pos = 1;

for i=1:length(M_array)
    for j = 1:length(N_array)
        for z = 1:length(x_range_array)
            % Sample size of each sample
            N = N_array(j);
            
            % The number of samples
            M = M_array(i)
            
            x_range = x_range_array(z)
            
            % Set random seed
            rng(1);
            
            % Generate m x n matrix from the range [-x_range, x_range]
            uniform_samples = -x_range + 2 * x_range * rand(M, N);
            
            % Calculate means for each rows of the matrix
            sample_means = mean(uniform_samples, 2);
            
            mean_of_means = mean(sample_means);
            std_of_means = std(sample_means);
    
            subplot(length(N_array) * length(M_array), length(x_range_array), pos);
            hold on;
    
            histogram(sample_means, 50);
            
            x = linspace(-4 * std_of_means, 4 * std_of_means, 100);
            
            bin_width = (max(sample_means) - min(sample_means)) / 50;
            
            % Expected counts = Probability density × Total samples × Bin width
            y = normpdf(x, 0, std_of_means) * M * bin_width;
            plot(x, y);
    
            title(['M:', num2str(M), ',N:', num2str(N), ',x_range:', num2str(x_range)]);
            hold off
    
            pos = pos + 1;
        end
    end
end
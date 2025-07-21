N_array = [100 1000 10000 1e5 1e6 1e7 1e8 1e9];

for k=1:length(N_array)

    % Define bound range
    a = 0;
    b = 2;
    c = 0;
    d = 4;
    
    % Define number of samples
    N = N_array(k);
    
    % Generate random points
    
    % x in [0, 2]
    x = a + (b - a) * rand(N, 1);
    
    % y in [0, 4]
    y = c + (d - c) * rand(N, 1);
    
    
    % Count points under the curve
    under_curve_counts = sum(y <= f(x));
    
    % Calculate the estimate integral
    estimate_value = (under_curve_counts / N) * (b - a) * (d - c);
    
    % Calculate the true value
    true_value = integral(@f, a, b);
    
    % Analyze the error
    error_array(k) = abs(estimate_value - true_value);
end

loglog(N_array,error_array,'*r');
title('Error Between Estimate Value and  True Value');            
xlabel('Number of Randowm Points');        
ylabel('Error');

function fx = f(x)
fx = x.^x;
end


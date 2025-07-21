clc
clear
close all


mu_values_segment_1 = -3:0.01:-0.5;
roots_segment_1 = zeros(size(mu_values_segment_1));

for i=1:length(mu_values_segment_1)
    mu = mu_values_segment_1(i);

    starting_value = 0.5;
    roots_segment_1(i) = newton_raphson(starting_value, 1e-6, mu);
    
end

plot(mu_values_segment_1, roots_segment_1);
xlabel('\mu');
ylabel('\lambda');
title(['\gamma=5/3, \delta=10']);
hold on;


starting_value_array = [-2 0 3 5];
mu_values_segment_2 = -0.5:0.01:3.0;
roots_segment_2 = zeros(size(mu_values_segment_2));

for k=1:length(starting_value_array)
    for i=1:length(mu_values_segment_2)
        mu = mu_values_segment_2(i);
        starting_value = starting_value_array(k);
        roots_segment_2(i) = newton_raphson(starting_value, 1e-6, mu);
    end

    plot(mu_values_segment_2, roots_segment_2);
end

hold off;



function [func,deriv] = evalfunc(lambda,mu)
    gamma = 5/3;
    delta = 10;
    % construct the coefficients using equation 25 in the paper
    aa = 1;
    bb = 1-delta/(2.*gamma);
    cc = -delta.*((2.*gamma-1)/(2.*gamma.^2)+mu)/2;
    dd = ((2.*gamma.*mu+1).*delta)/(4.*gamma.^2);
    % define the cubic function and its derivative
    func = aa.*lambda.^3 + bb.*lambda.^2 + cc.*lambda + dd;
    deriv = 3.*aa.*lambda.^2 + 2.*bb.*lambda + cc;
end

function root = newton_raphson(lam,tol,mu)
    error = 2*tol;
    while ( error > tol )
        lam_old = lam;
        [func,deriv] = evalfunc(lam,mu);
        lam = lam - func/deriv;
        error = abs( (lam-lam_old)/lam );
    end
    root = lam;
end

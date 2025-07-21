# Advanced Computational Mathematics
Just do some Matlab programs to explore more mathematical models!

## Custom Calendar
Write a MATLAB function that takes as its argument a date in the form of three numbers:
(day,month,year). Use fact that the 1st of January, 2000, was a Saturday to calculate the day of
the week for the given date and let this be the return variable of the function. Make sure you take
leap years into account. Test your function.

## A Simple Monte-Carlo Integrator
Here we want to estimate the integral
    <img width="252" height="103" alt="image" src="https://github.com/user-attachments/assets/1ed4354e-842a-4ded-9353-93874791d859" />
Suppose we also know that for a ≤ x ≤ b, the function is bounded according to c ≤ f(x) ≤ d.
Next we choose random points (x, y) so that a ≤ x ≤ b and c ≤ y ≤ d, and determine the fraction
that lie below the curve y = f(x). This fraction can then be used to approximate the integral.
Implement this method and use it to come up with an estimate for the integral of f(x) = x
x with
limits a = 0 and b = 2. Investigate how the error in your solution changes as you change the
number of random points used.

## Central Limit Theorem
The central limit theorem states that if you take a large number of samples of random numbers, and
ffnd the mean of each sample, then the set of means you obtain will follow a Normal Distribution.
Test this by taking random numbers in some range centered on zero, e.g. [−xr, xr]. The problem
can be described using the following 3 parameters: (1) the size of each random sample; (2) the
number of samples to use; (3) the maximum range of the random numbers (i.e. xr).
Generate a histogram and overplot the corresponding normal distribution, centered on zero with
whatever standard deviation you obtained. By adjusting the 3 parameters above, try to reproduce
the plot below (it doesn’t have to be a perfect match, but should be similar).
<img width="709" height="523" alt="image" src="https://github.com/user-attachments/assets/09aba41b-75f8-4e3c-89dd-0e2ee75e97ef" />

## Find Roots of a Cubic
In the stability analysis of the heliopause certain types of waves may have positive growth rates
due to the Rayleigh-Taylor and/or Kelvin-Helmholtz instabilities. To ffnd these growth rates
we must solve the corresponding dispersion relation. The attached page from a research paper
(Florinski, Zank & Pogorelov, 2005, JGR) shows such a dispersion relation (equation 25) along
with a plot of solutions for λ that satisfy this equation for values of µ between -3 and 3.
Write a root-ffnding algorithm based on the Newton-Raphson method that will ffnd the real roots
(solid lines in the ffgure) of the dispersion relation for −3 < µ < 3 (i.e. choose a ffnite set of

µ’s and ffnd the λ’s that satisfy the equation for each of these). Plot these for the same range
as Figure 1 in the paper. Use γ = 5/3 and δ = 10. Note that there is only one real root for

µ ⪅ −0.312.
<img width="883" height="1186" alt="image" src="https://github.com/user-attachments/assets/faed47cb-c689-4874-936c-7fcdc698278d" />

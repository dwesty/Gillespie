function [T, N] = get_trajectory(n_0, t_max)
% GET_TRAJECTORY - Computes a single Gillespie trajectory.
% Outputs:
% T - transition times
% N - counts at each transition time
% Inputs:
% n_0 - initial number of molecules.
% t_max - length of time of the simulation.

global a b
t = 0;
j = 1;
T(1) = 0;
N(1) = n_0;
runningSum=0;
while t < t_max
    j = j+1;
%     const = 1/(t_max-j+1);
%     runningSum = runningSum + N(j).*N(j+i);
    u=rand;
    dt = -1/(b + a*N(j-1))*log(u);
    t = t + dt;
    T(j) = t;
    u=rand;
    if u > a*N(j-1)/(b + a*N(j-1))
        N(j) = N(j-1) + 1;
    else
        N(j) = N(j-1) - 1;
    end
%     S_j=const*runningSum
end
end
function gillespie_algorithm()
global a b
a = .1; % alpha
b = 1; % beta

n_0 = 10; % Initial count
nt = 1; % Number of trajectories
t_max = 10000; %Minutes for simulation (Approx).

G = cell(nt,2);
figure(1);
hold on
for i = 1:nt
    [T, N] = get_trajectory(n_0, t_max);
    G{i,1} = T;
    G{i,2} = N;
    stairs(G{i,1},G{i,2})
end
[T_int, N_int] = const_intervals(T, N, t_max, 1);
mean(N_int)
var(N_int)
plot(T_int,N_int,'.');
hold off
end

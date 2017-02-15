function nc = print_progress_bar(c, t, msg)
%% Input arguments
% c - completed (e.g., 15)
% t - total (e.g., 100)
% msg - Message to show

% -- Output --
% nc - number of characters

%% CONFIG:
N = 10; % Number of ticks

%% 
nb = round(double(c) / double(t) * N);
if nb < 0; 
    nb = 0;
end

if nb > N
    nb = N;
end

fprintf(1, '%s: [', msg);
for i1 = 1 : nb
    fprintf(1, '-');
end
for i1 = 1 : N - nb
    fprintf(1, ' ');
end

fprintf(1, ']');

nc = length(msg) + 4 + N;

return
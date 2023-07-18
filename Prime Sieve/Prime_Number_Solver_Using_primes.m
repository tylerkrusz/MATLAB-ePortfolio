clear
clc

max = 3000000;

%3000000 will take around 0.007245 sec and have 216816 primes
tic
numbers = primes(max);
toc

disp(length(numbers))
disp("Done")
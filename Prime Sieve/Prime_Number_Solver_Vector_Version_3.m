clear
clc
clf
close all
format long

%3000000 will take around 2.191731 sec and have 216816 primes
tic
max = 10000000;
stoppingPoint = ceil(sqrt(max));

numbers = linspace(2,max, max - 1);

for i = 2:stoppingPoint
    numbers(numbers ~= i & mod(numbers, i) == 0) = [];
end
toc
disp(length(numbers))
disp("Done")
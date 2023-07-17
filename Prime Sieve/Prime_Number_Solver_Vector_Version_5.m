clear
clc
clf
close all
format long

%3000000 will take around 0.138470 sec and have 216816 primes
tic
max = 3000000;
stoppingPoint = floor(sqrt(max));

numbers = 1:1:max;
isPrime = true(1, max);
isPrime(1) = 0;

for i = 2:stoppingPoint
    remove = i:i:max;
    remove(1) = [];
    isPrime(remove) = 0;
end
toc
numbers(not(isPrime)) = [];
disp(length(numbers))
disp("Done")
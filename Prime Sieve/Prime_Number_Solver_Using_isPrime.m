clear
clc
clf
close all
format long

tic
%3000000 will take around 14.014116 sec and have 216816 primes
max = 3000000;
numbers = linspace(1,max, max);

primes = isprime(numbers);

numbers = numbers(primes);
toc
disp(length(numbers))
disp("Done")
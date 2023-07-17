clear
clc
clf
close all
format long

%3000000 will take around 1021.326412 sec and have 216816 primes
tic
max = 3000000;
stoppingPoint = ceil(sqrt(max));

allNumbers = linspace(2,max, max - 1);
testNumbers = linspace(2, stoppingPoint, stoppingPoint - 1);

multiplyNumbers = reshape(allNumbers(1:end), [], 1);
removeNumber = multiplyNumbers .* testNumbers;

primeNumbers = setdiff(allNumbers, removeNumber);
toc
disp(length(primeNumbers))
disp("Done")
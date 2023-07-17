clear
clc
clf
close all
format long

%3000000 will take around 7.434608 sec and have 216816 primes
tic
max = 3000000;
stoppingPoint = ceil(sqrt(max));

numbers = linspace(2,max, max - 1);

for i = 2:stoppingPoint
    remove = i:i:max;
    remove(1) = [];
    numbers = setdiff(numbers, remove);
end
toc
disp(length(numbers))
disp("Done")
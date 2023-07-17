clear
clc
clf
close all
format long

%3000000 will take around 0.620596 sec and have 216816 primes
tic
max = 3000000;
stoppingPoint = floor(sqrt(max));

%Creates a vector of all odd numbers
numbers = 1:2:max;
%Adds 2 and removes 1
numbers(1) = 2;
%Creates Vector of all test values
test = 3:2:stoppingPoint;
%Goes through each test value
while (not(isempty(test)))
    remove = test(1);
    %Removes all values evenly divisible by the selected test value
    numbers(numbers ~= remove & mod(numbers, remove) == 0) = [];
    test(mod(test, remove) == 0) = [];
end
toc
disp(length(numbers))
disp("Done")
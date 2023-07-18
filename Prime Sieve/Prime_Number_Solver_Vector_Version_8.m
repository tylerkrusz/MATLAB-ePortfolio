clear
clc

%3000000 will take around 0.007600 sec and have 216816 primes
tic
max = 3000000;
stoppingPoint = floor(sqrt(max));

isPrime = true(1, ceil(max / 2));
isTest = true(1, ceil(stoppingPoint / 2));
isTest(1) = false;

while any(isTest)
    index = find(isTest, 1);
    i = 2 * index - 1;

    isPrime(index:i:length(isPrime)) = false;
    isPrime(index) = true;

    isTest(index:i:length(isTest)) = false;
end
numbers = find(isPrime) * 2 - 1;
numbers(1) = 2;
toc
disp(length(numbers))
%all(numbers == primes(max))
disp("Done")
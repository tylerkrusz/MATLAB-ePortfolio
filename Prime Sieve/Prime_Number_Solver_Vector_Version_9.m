clear
clc

%3000000 will take around 0.006841 sec and have 216816 primes
tic
max = 3000000;
stoppingPoint = floor(sqrt(max));

isPrime = true(1, ceil(max / 2));

for i = 3:2:stoppingPoint
    if(isPrime((i + 1) / 2))
        isPrime(((i^2 + 1) / 2):i:length(isPrime)) = false;
    end
end
numbers = find(isPrime) * 2 - 1;
numbers(1) = 2;
toc
disp(length(numbers))
%test = find(~isprime(numbers));
%all(numbers == primes(max))
disp("Done")
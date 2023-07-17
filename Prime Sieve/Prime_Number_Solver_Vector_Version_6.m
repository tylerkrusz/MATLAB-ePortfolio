clear
clc

%3000000 will take around 0.034346 sec and have 216816 primes
tic
max = 3000000;
stoppingPoint = floor(sqrt(max));

numbers = 1:2:max;
numbers(1) = 2;
isPrime = true(1, length(numbers));
test = 3:2:stoppingPoint;

while(not(isempty(test)))
   i = test(1);
   start = i - ceil(i / 2) + 1;
   remove = start:i:length(numbers);
   remove(1) = [];
   isPrime(remove) = 0;
   
   test(mod(test, i) == 0) = [];
end
numbers(not(isPrime)) = [];
toc
disp(length(numbers))
disp("Done")
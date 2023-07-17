clear
clc

%3000000 will take around 0.028370 sec and have 216816 primes
tic
max = 3000000;
stoppingPoint = floor(sqrt(max));

numbers = 1:2:max;
numbers(1) = 2;
isPrime = true(1, length(numbers));

test = 3:2:stoppingPoint;
isTest = true(1, length(test));

while(any(isTest))
   i = test(find(isTest, 1));

   start = i - ceil(i / 2) + 1;
   remove = start:i:length(numbers);

   removeEnd = ceil(length(test) / i);
   testRemove = remove(1:removeEnd);

   remove = remove(2:end);
   isPrime(remove) = 0;
   
   %remove = (start - 1):i:length(test);
   testRemove = testRemove - 1;
   isTest(testRemove) = 0;
end
numbers(~isPrime) = [];
toc
disp(length(numbers))
disp("Done")
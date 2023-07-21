clear
clc
%format longG

start = 1;
ending = 50000;
factor = 100;
collection = cell(factor, 2);
for i = start:ending
    versionFunction = @() version5(i);
    time = timeit(versionFunction);
    if (mod(i, factor) ~= 0)
        collection(mod(i, factor), :) =  {i, time};
    else
        collection(factor, :) =  {i, time};
    end
    if (i == ending || mod(i, factor) == 0)
        writecell(collection,'TimerData.txt','WriteMode','append', ...
        'Delimiter','tab')
        collection = {};
        disp(i / ending  * 100)
    end
end

disp("Done")

function primeNumbers = version1(max)
    stoppingPoint = ceil(sqrt(max));

    allNumbers = linspace(2,max, max - 1);
    testNumbers = linspace(2, stoppingPoint, stoppingPoint - 1);

    multiplyNumbers = reshape(allNumbers(1:end), [], 1);
    removeNumber = multiplyNumbers .* testNumbers;

    primeNumbers = setdiff(allNumbers, removeNumber);
end

function numbers = version2(max)
    stoppingPoint = ceil(sqrt(max));

    numbers = linspace(2,max, max - 1);

    for i = 2:stoppingPoint
        remove = i:i:max;
        remove(1) = [];
        numbers = setdiff(numbers, remove);
    end
end

function numbers = version3(max)
    stoppingPoint = ceil(sqrt(max));

    numbers = linspace(2,max, max - 1);

    for i = 2:stoppingPoint
        numbers(numbers ~= i & mod(numbers, i) == 0) = [];
    end
end

function numbers = version4(max)
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
end

function numbers = version5(max)
    stoppingPoint = floor(sqrt(max));

    numbers = 1:1:max;
    isPrime = true(1, max);
    isPrime(1) = 0;

    for i = 2:stoppingPoint
        remove = i:i:max;
        remove(1) = [];
        isPrime(remove) = 0;
    end
    numbers(not(isPrime)) = [];
end

function numbers = version6(max)
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
end

function numbers = version7(max)
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
end

function numbers = version8(max)
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
end

function numbers = version9(max)
    stoppingPoint = floor(sqrt(max));

    isPrime = true(1, ceil(max / 2));

    for i = 3:2:stoppingPoint
        if(isPrime((i + 1) / 2))
            isPrime((1.5 * i + 0.5):i:length(isPrime)) = false;
        end
    end
    numbers = find(isPrime) * 2 - 1;
    numbers(1) = 2;
end

function numbers = usingIsPrime(max)
    numbers = linspace(1,max, max);

    primes = isprime(numbers);

    numbers = numbers(primes);
end

function numbers = usingPrimes(max)
    numbers = primes(max);
end
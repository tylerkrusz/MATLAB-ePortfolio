clear
clc
clf
close all
format long

syms f(x)
f(x) = sqrt(1 + cos(x)^2);
a = 0;
b = pi / 4;
n = 1000;

x = 1:1:n;
version1Total = [];
version2Total = [];
for i = 1:n
    version1Function = @() version1(f, a, b, i);
    version1Total = [version1Total timeit(version1Function)];
    
    version2Function = @() version2(f, a, b, i);
    version2Total = [version2Total timeit(version2Function)];
end

hold on
scatter(x, version1Total, 'b', 'filled')
scatter(x, version2Total, 'r', 'filled')
xlabel('Value of n')
ylabel('Time (s)')

xFit = linspace(min(x), max(x), 1000);
coefficients1 = polyfit(x, version1Total, 1);
yFit1 = polyval(coefficients1 , xFit);

coefficients2 = polyfit(x, version2Total, 1);
yFit2 = polyval(coefficients2 , xFit);

plot(xFit, yFit1, 'b');
plot(xFit, yFit2, 'r');

version1Legend = coefficients1(1) + "x +" + coefficients1(2);
version2Legend = coefficients2(1) + "x +" + coefficients2(2);

legend("Version 1", "Version 2", version1Legend, version2Legend)

function h = version1(f, a, b, n)
    deltaX = (b - a) / n;
    sum = 0;
    alt = 4;
    for i = 1:(n + 1)
        x = vpa(f(a + (deltaX * (i - 1))));
        if(i == 1 || i == (n + 1))
            alt = 1;
        end
        sum = sum + (alt * x);
        if (alt == 4)
            alt = 2;
        else 
            alt = 4;
        end
    end
    h = vpa((deltaX / 3) * sum);
end

function h = version2(f, a, b, n)
    deltaX = (b - a) / n;
    y = vpa(f(linspace(a + deltaX, b - deltaX, n - 1)));
    total = f(a) + f(b);
    odd = 4 .* y(1:2:end);
    even = 2 .* y(2:2:end);
    total = total + sum(odd) + sum(even);
    h = vpa((deltaX / 3) * total);
end
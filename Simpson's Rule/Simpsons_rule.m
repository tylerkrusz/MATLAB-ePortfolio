clear
clc
clf
close all
format long

syms f(x)
f(x) = sqrt(1 + cos(x)^2);
a = 0;
b = pi / 4;
n = 100000;
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
disp(vpa((deltaX / 3) * sum));
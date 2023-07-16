tic
clear
clc
clf
close all
format long

syms f(x)
f(x) = sqrt(1 + cos(x)^2);
func = @(x) sqrt(1 + cos(x).^2);
a = 0;
b = pi / 4;
n = 1000000;
deltaX = (b - a) / n;

tic
y = vpa(f(linspace(a + deltaX, b - deltaX, n - 1)));
disp("Got y")
toc

total = f(a) + f(b);

tic
odd = 4 .* y(1:2:end);
even = 2 .* y(2:2:end);
disp("Got odds and evens")
toc

tic
total = total + sum(odd) + sum(even);
disp("Got Total")
toc

disp(vpa((deltaX / 3) * total));
disp(vpa(integral(func, a, b)))
disp("Done")
toc
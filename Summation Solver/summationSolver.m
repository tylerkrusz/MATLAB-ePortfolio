clear
clc
clf
close all
format longg

decimals = 14;
digits(decimals)
syms a_n(x)
a_n(x) = ((-1)^(x+1) * ((1+sqrt(3*x)) / (x + 2)));

n = 1;
max = 10^6;
x = a_n(linspace(n, max, max));
sum = sum(x);

disp(vpa(sum))
disp(0.43554155527698)
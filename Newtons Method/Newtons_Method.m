clear
clc
clf
close all
format longg

syms f(x)
f(x) = ((75*x) - x^3 - 125);
dxfunc = diff(f, x);
x_n = 2;
n = 6;
for i = 1:n
    num = f(x_n);
    den = dxfunc(x_n);
    temp = x_n;
    x_n = vpa(x_n - (num / den));
    if(temp == x_n)
        disp("Lost Percision at n = " + i)
        break;
    end
end
disp(x_n)
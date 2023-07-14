clear
clc
clf
close all
format long

syms f(x)
f(x) = 8 - x^2;

a = 0;
b = sqrt(8);
h = b;
x = linspace(a,b,1000);
y = f(x);

hold on;
view(3)
plot3(zeros(length(x), 1), x, y, 'r');
plot3(y, x, zeros(length(x), 1), 'b')
set(gca, 'ydir', 'reverse')
set(gca, 'xdir', 'reverse')
xlabel('x')
ylabel('y')
zlabel('z')

p1 = [0 h/2 f(h/2)];
p2 = [0 h/2 0];
p3 = [f(h/2) h/2 0];
p4 = [f(h/2) h/2 f(h/2)];
rectangle = fill3([p1(1) p2(1) p3(1) p4(1) p1(1)], [p1(2) p2(2) p3(2) p4(2) p1(2)], ...
    [p1(3) p2(3) p3(3) p4(3) p1(3)], 'y');
view(-75,26)
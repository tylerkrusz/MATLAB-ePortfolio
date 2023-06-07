clear
clc
clf
close all
format long

func = @(x) (1+x.^2);
P = [1 1.5 2 3 4 5];
c = [1 1.5 2 3 4];
d = [1.5 2 3 4 5];

a = P(1);
b = P(length(P));
x = linspace(a,b,1000);
y = func(x);
lineWidth = 10;

plot(x, y, "Color", "black", "LineWidth", lineWidth);
hold on

axis = gca;
axis.FontSize = 50;

%for i = 1:length(c)
   % plot([c(i) c(i)], [0 func(c(i))], ...
       % "Color", "red", "LineWidth", lineWidth);
%end
sum = 0;
for i=1:length(P) - 1
    x1 = P(i);
    x2 = P(i + 1);
    deltaX = x2 - x1;
    height = func(c(i));
    sum = sum + (deltaX * height);
    r = rectangle('Position',[x1, 0, deltaX, abs(height)], ...
                'FaceColor','b');
    uistack(r,'bottom')
end
disp(sum);
sum = 0;
for i=1:length(P) - 1
    x1 = P(i);
    x2 = P(i + 1);
    deltaX = x2 - x1;
    height = func(d(i));
    sum = sum + (deltaX * height);
    r = rectangle('Position',[x1, 0, deltaX, abs(height)], ...
                'FaceColor','r');
    uistack(r,'bottom')
end
disp(sum);
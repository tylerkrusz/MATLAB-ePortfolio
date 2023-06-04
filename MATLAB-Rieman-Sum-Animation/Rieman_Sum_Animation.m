clear
clc
clf
close all
format long

%Rieman Sum Variables
a = 1;
b = exp(1);
n = 100;
x = linspace(a,b,100);
fun = @(x)  log(x);
y = fun(x);
h = figure;
exact = integral(fun, a, b, 'RelTol',0,'AbsTol', 1e-12);

%Video Variables
name = func2str(fun);
writer = VideoWriter(name +  " " + n + '.avi');
writer.FrameRate = floor(n / 10);
writer.Quality = 100;

open(writer);
writeVideo(writer, getframe(h));
hold on
for i = 1:n
    clf
    plot(x,y, 'LineWidth', 1);
    sum = 0;
    for j = 1:i
        title(name + " Rectangles: " + i + " Estimation: " + sum + " Exact: " + exact);
        deltaX = (b - a) / i;
        x2 = a + j*deltaX;
        x1 = x2 - deltaX;
        height = fun(x1);
        if (height < 0)
            r = rectangle('Position',[x1, height, deltaX, abs(height)], ...
                'FaceColor','b');
        else
            r = rectangle('Position',[x1, 0, deltaX, height], ...
                'FaceColor','r');
        end
        if (i >= 500)
            r.LineStyle = 'none';
        end
        sum = sum + (deltaX * height);
        uistack(r,'bottom')
    end
    writeVideo(writer, getframe(h));
    disp ((i / n) * 100);
end
close(writer);
disp('Done');
clear all
close all
clc

x = [8 10];
y = [2 -2];
n = length(x);

P = "";

for i = 1:n
    P = P + "((" + y(i) + "*";
    for j = 1:n
        if(j ~= i)
            if (x(j) > 0)
             P = P + "(x-" + x(j) + ")*";
            else
                P = P + "(x+" + abs(x(j)) + ")*";
            end
        end
    end
    P = extractBefore(P, strlength(P));
    P = P + ")/";
    temp = 1;
    for j = 1:n
        if(j ~= i)
            temp = temp * (x(i) - x(j));
        end
    end
    P = P + temp + ")" + "+";
end
P = extractBefore(P, strlength(P));
disp(P);
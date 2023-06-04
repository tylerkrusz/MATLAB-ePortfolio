clear
clc
clf
format long G

iterations = 3000;
digits(5000)

% greg's infinite series
denomenator = 1;
gregPi = vpa(0);

%Nilakantha's infinite series
num = 2;
nilPi = vpa(3);

%ran pi
coPrime = 0;
ranPi = 0;
randMax = 2^53 - 1;

%formula using arctan
arc5 = 0;
odd = 1;
number5 = vpa(((1/5)^odd) / odd);
arc239 = 0;
number239 = vpa(((1/239)^odd) / odd);

for i = 1:iterations
    % greg's infinite series
    if mod(i, 2) == 0
        gregPi = gregPi + (4/denomenator);
    else
        gregPi = gregPi - (4/denomenator);
    end
    gregy(i) = percentError(abs(gregPi));
    denomenator = denomenator + 2;

    %formula using arctan
    if(mod(i, 2) == 0)
            arc5 = arc5 - number5;
            arc239 = arc239 - number239;
        else    
            arc5 = arc5 + number5;
            arc239 = arc239 + number239;
    end
        odd = odd + 2;
        number5 = ((1/5)^odd) / odd;
        number239 = ((1/239)^odd) / odd;
    x(i) = i;
    arcy(i) = percentError(vpa(4*((4*abs(arc5))- abs(arc239))));
    piey(i) = [vpa(pi)];
    
    %Nilakantha's infinite series
    if mod(i - 1, 2) == 0
        nilPi = nilPi + (vpa(4/(num*(num+1)*(num+2))));
    else
        nilPi = nilPi - (vpa(4/(num*(num+1)*(num+2))));
    end
    nily(i) = percentError(nilPi);
    num = num + 2;
    
    %ran pi
    if(iscoprime([randi([1, randMax]), randi([1,randMax])]))
        coPrime = coPrime + 1;
    end
    if(coPrime > 0)
        rany(i) = percentError(sqrt(6/(coPrime/(i + 1))));
    end
end

hold on
start = 1;
%plot(x, piey, 'LineWidth', 2)
plot(x(start:end), arcy(start:end))
plot(x(start:end), gregy(start:end))
plot(x(start:end), nily(start:end))
plot(x(start:end), rany(start:end))
legend('ArcTan', 'Greg', 'Nil', 'Random')
%ylim([0, 0.5])
disp('Done')

function y = percentError(num)
    y = abs((num - vpa(pi)) / vpa(pi)) * 100;
end
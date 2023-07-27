clear
clc
format longG

tic
factor = 2000;

data = readtable("Time Data Last Few To 1 Million.xlsx", 'Sheet','Data', ...
    'Range', "A:D", 'VariableNamingRule','preserve');

average = table();

for i = 1:width(data)
    count = 1;
    columnName = strcat('Average_', ...
        cell2mat(data.Properties.VariableNames(i)));
    for start = 1:factor:height(data)
        ending = start + factor - 1;
        if (ending > height(data))
            values = data(start:end, i);
        else
            values = data(start:ending, i);
        end
        values = table2array(values);
        sectionAverage = mean(values);
        average(count,columnName) = {sectionAverage};
        count = count + 1;
    end
end

writetable(average, "Time Data Last Few To 1 Million.xlsx", ...
    'Sheet','Average')

disp("Done")
toc
a = [16.5 17.5 18 20 20.5 21 22 22.5 23 23.5 24 24.5 25 25.5 26 26.5 27 27.5 28 28.5 29 29.5 30 30.5 31 31.5 33 35.5 36.5];
b = [80 107 160 117 158 197 41 206 160 130 53 110 91 118 60 94 71 131 26 62 62 84 81 54 21 41 23 45 30];

disp(size(a));
disp(length(a));
[x, y] = removeDuplicatedData(a, b);
disp([x;y]);
disp(size(x));
disp(length(x));

n = length(x);
result = zeros(1, n);
for index = 1 : n
    processX = x([1 : index - 1, index + 1 : n]);
    processY = y([1 : index - 1, index + 1 : n]);
    result(index) = Lagrange(processX, processY, x(index));
end

plot(result);
hold on;
plot(x);
hold off;

disp(result);

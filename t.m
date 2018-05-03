a = [1 2 2 2 2 3 4 5 2 4 6 7 8 2];
b = [1 2 2 3 5 3 4 5 6 7 8 9 0 8];
disp(size(a));
disp(length(a));
[x, y] = removeDuplicatedData(a, b);
disp([x;y]);
disp(size(x));
disp(length(x));
load data;
date_interpolation = length(X) + 1;
a = Newton(X, Y, date_interpolation);
b = Lagrance(X, Y, date_interpolation);
c = AitkenNeville(X, Y, date_interpolation);
disp(Y);
disp(a);
disp(b);
disp(c);
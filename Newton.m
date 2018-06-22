function [output] = Newton(x, y, p)
    input_size = length(y);
    a(1) = y(1);

    % Ti hieu cap 1 divice_subtract_table[i, j] = (yi - yj)/(xi - yj)
    for index = 1 : input_size - 1
       divice_subtract_table(index, 1) = (y(index+1) - y(index))/(x(index+1) - x(index));
    end

    % Ti hieu cap 2 -> n - 1
    % Ti hieu cap 3: divice_subtract_table[i,j,k] =
    % (divice_subtract_table(i, j) - divice_subtract_table(j,  k)) / (xi - xk)
    for j = 2 : input_size - 1
       for k = 1 : input_size - j
          divice_subtract_table(k, j) = (divice_subtract_table(k+1, j - 1) - divice_subtract_table(k, j - 1))/(x(k+j) - x(k));
       end
    end

    for j = 2 : input_size
       a(j) = divice_subtract_table(1, j-1);
    end

    % Tong noi suy 
    polynomial(1) = 1;
    interpolation_table(1) = a(1);
    for j = 2 : input_size
       polynomial(j)=(p - x(j-1)) .* polynomial(j-1);
       interpolation_table(j) = a(j) .* polynomial(j);
    end
    output=sum(interpolation_table);
end


function [output] = MatrixNewton(X, Y)
    inputLength = length(X);
    output = zeros(1, inputLength);
    output(1) = Y(1);
    output(2) = Y(2);
    for index = 3 : inputLength
        output(index) = (Newton(X(1 : index - 1), Y(1 : index -1), index));
    end
    disp(output);
end
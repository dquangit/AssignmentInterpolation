function out = shepard_2(X, Y, Z, x,y, p)
    h = zeros(size(X));
    lengthInput = length(X);
    sumH = 0;
    
    for index = 1 : lengthInput
        h(index) = sqrt((x - X(index))^2 + (y - Y(index)^2))^-p;
        sumH = sumH + h(index);
    end

    w = zeros(size(X));
    for index = 1 : lengthInput
        w(index) = h(index)/sumH;
    end

    result  = 0;
    for index = 1 : lengthInput
        result = result + (w(index)*Z(index));
    end
    disp(result);
end

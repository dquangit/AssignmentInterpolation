function out = shepard_2(X, Y, Z, x, y)
    p = 2;
    h = zeros(size(X));
    lengthInput = length(X);    
    duplicate = false;
    for index = 1 : lengthInput
        distance = sqrt(power((x - X(index)),2) + power(y - Y(index), 2));
        if (distance == 0)
            duplicate = true;
            out = Z(index);
            break;
        end
        h(index) = power(distance, -p);
    end
    
    if (~duplicate)
        sumH = sum(h);
        w = zeros(size(X));
        for index = 1 : lengthInput
            w(index) = h(index)/sumH;
        end

        result  = 0;
        for index = 1 : lengthInput
            result = result + (w(index)*Z(index));
        end
        out = result;
    end
end

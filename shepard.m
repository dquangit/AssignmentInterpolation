function out = shepard(X, Y, x, k)
    sumH = 0;
    lengthInput = length(X);
    
    for index = 1 : lengthInput
        h(index) = abs(x - X(index))^-k;
        sumH = sumH + h(index);
    end

    w = zeros(size(X));
    for index = 1 : lengthInput
        w(index) = h(index)/sumH;
    end

    out  = 0;
    for index = 1 : lengthInput
       out = out + (w(index)*Y(index));
    end

    if isnan(out)
        for index = lengthInput : -1 : 1
            if (X(index) == x)
                out = Y(index);
                break;
            end
        end
    end
end
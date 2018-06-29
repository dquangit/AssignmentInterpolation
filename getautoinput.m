rainInterpol = [4 0 0 0 0 0 4 3 0 0 0 4 4 5 1 0 0 0 0 0 0 0 5 2 0 2 6 3 1 1 0];
tempInterpol = [20.0 19.5 20.5 22.0 20.5 19.5 19.5 18.0 15.5 17.5 16.5 16.0 17.0 16.5 15.5 16.5 15.0 14.0 15.0 15.0 17.0 16.5 17.5 19.0 18.5 17.0 16.5 16.0 17.5 17.5 16.0];

lengthInput = length(rainInterpol);
aqiInterpol = zeros(size(rainInterpol));
[~, temp, rain, aqi] = loadRealData();
for index = 1 : lengthInput
    
    result = griddata(temp, rain, aqi, tempInterpol(index), rainInterpol(index));
    
        
    if (isnan(result) || result < 0 || result> 500)
        [tempX, aqiX] = removeDuplicatedData(temp, rain);
        result = Lagrange(tempX, aqiX, tempInterpol(index));
    end
    
    if (isnan(result) || result < 0 || result > 500)
        [rainX, aqiX] = removeDuplicatedData(rain, aqi);
        result = Lagrange(rainX, aqiX, rainInterpol(index));
    end
    aqiInterpol(index) = result;
%     disp(result);
end

disp(aqiInterpol);

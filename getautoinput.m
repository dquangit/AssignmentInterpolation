rainInterpol = [4 0 0 0 1 1 0 0 1 12 46 11 1 0 0 0 3 0 1 2 0 0 0 0 0 0 0 0 0 0 0 1 0 2 4 0 0 0 3 1 0 0 0 0 1 0 0 0 0 0 0 1 0 4 2 1 0 0 0 ];
tempInterpol = [18.0 21.0 22.5 21.0 21.5 21.5 23.0 22.5 21.5 20.5 21.0 16.0 14.0 15.5 15.5 15.0 16.5 18.0 18.5 16.5 15.0 16.5 17.5 17.5 20.0 20.5 20.0 20.0 21.5 22.0 20.5 20.0 21.0 19.5 22.0 20.5 20.0 21.0 21.0 14.5 13.0 13.0 16.0 17.5 16.5 18.5 21.0 21.5 22.0 22.0 22.5 23.5 25.0 17.5 13.5 13.0 15.5 16.5 18.0];

lengthInput = length(rainInterpol);
aqiInterpol = zeros(size(rainInterpol));
[~, temp, rain, aqi] = loadRealData();
for index = 1 : lengthInput
    
    result = griddata(temp, rain, aqi, tempInterpol(index), rainInterpol(index));
    
    if (isnan(result) || result < 0 || result> 500)
        [tempX, aqiX] = removeDuplicatedData(temp, rain);
        result = interp1(tempX, aqiX, tempInterpol(index));
    end
    
    if (isnan(result) || result < 0 || result > 500)
        result = 0;
        [rainX, aqiX] = removeDuplicatedData(rain, aqi);
        result = interp1(rainX, aqiX, rainInterpol(index));
    end

    aqiInterpol(index) = result;
%     disp(result);
end

disp(aqiInterpol);
dlmwrite('autoinput.txt', aqiInterpol, 'delimiter', ' ');

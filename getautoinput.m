rainInterpol = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
tempInterpol = [29.0 29.0 29.0 28.0 27.5 29.5 29.5 30.5 30.0 30.0 31.5 31.0 32.0 32.5 31.5 29.0 28.0 29.0 ];

lengthInput = length(rainInterpol);
aqiInterpol = zeros(size(rainInterpol));
[~, temp, rain, aqi] = loadRealData();

temp = temp(320 : 500);
rain = rain(320 : 500);
aqi = aqi(320 : 500);

for index = 1 : lengthInput
    
    result = griddata(temp, rain, aqi, tempInterpol(index), rainInterpol(index));
    
    if (isnan(result) || result <= 0 || result> 500)
        [tempX, aqiX] = removeDuplicatedData(temp, rain);
        result = interp1(tempX, aqiX, tempInterpol(index));
    end
    
    if (isnan(result) || result <= 0 || result > 500)
        result = 0;
        [rainX, aqiX] = removeDuplicatedData(rain, aqi);
        result = interp1(rainX, aqiX, rainInterpol(index));
    end

    aqiInterpol(index) = result;
%     disp(result);
end

disp(aqiInterpol);
dlmwrite('autoinput.txt', aqiInterpol, 'delimiter', ' ');

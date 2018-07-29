rainInterpol = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 18 17];
tempInterpol = [33.5 33.5 34.5 34.0 35.0 33.5 30.5 28.5 30.0 29.0 30.5 31.5 31.0 27.5 28.0 29.0 29.5 29.5 27.5 28.0 27.5 30.0 31.5 31.0 28.5 28.0 27.5 28.0 28.0 27.5 ];

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

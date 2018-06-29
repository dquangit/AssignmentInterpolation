rainInterpol = [0 0 3 1 2 1 3 2 3 1 0 0 0 0 0 1 0 0 0 1 0 3 1 1 1 11 5 7 1 1 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ];
tempInterpol = [17.0 18.5 18.5 19.0 20.0 20.0 21.0 16.0 10.0 12.0 13.0 14.0 14.5 15.5 16.5 17.5 19.0 19.0 21.5 19.5 20.5 20.0 21.5 22.0 23.0 20.0 18.0 14.5 10.0 9.5 10.0 11.5 11.5 11.5 11.0 10.5 11.5 12.0 13.0 15.0 16.0 13.5 13.5 15.5 18.5 19.5 21.5 20.5 20.0 22.5 23.0 22.0 17.5 15.0 18.0 19.5 19.5 20.0 22.0 23.5 24.0 25.5 27.5 26.0 23.5 23.5 17.5 18.5 18.5 17.5 19.5 21.0 22.0 24.0 22.5 24.0 23.5 23.5 23.0 21.0 20.0 20.5 21.5 22.0 22.5 23.0 23.0 24.0 24.5 25.0 25.0 25.5 24.5 25.5 25.0 21.5 19.5 19.5 21.0 23.5 25.0 27.0 28.0 24.5 22.0 21.5 23.0 24.0 24.0 26.0 27.5 29.0 28.5 27.0 24.5 26.0 24.5 25.5 25.5 27.5 28.5 28.0 26.5 28.5 28.0 30.0 32.0 31.0 29.5 28.5 28.0 28.0 27.0 29.5 30.5 31.5 31.5 30.5 30.0 30.0 30.0 30.0 30.5 31.0 32.0 32.5 29.5 27.0 29.0 30.5 30.5];

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

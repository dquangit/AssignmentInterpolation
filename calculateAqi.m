function output = calculateAqi(tempData, rainData, aqiData, tempInput, rainInput)
    if isempty(tempInput) && isempty(rainInput)
        output = -1;
    elseif isempty(tempInput)
        [rainData, aqiData] = removeDuplicatedData(rainData, aqiData);
        output = Lagrange(rainData, aqiData, str2double(rainInput));
    elseif isempty(rainInput)
        [tempData, aqiData] = removeDuplicatedData(tempData, aqiData);
        output = Lagrange(tempData, aqiData, str2double(tempInput));
    else
        output = griddata(tempData, rainData, aqiData, str2double(tempInput), str2double(rainInput));
    end
end


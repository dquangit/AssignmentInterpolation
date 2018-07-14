function output = calculateAqi(tempData, rainData, aqiData, tempInput, rainInput)
    if isnan(tempInput) && isnan(rainInput)
        output = -1;
    elseif isnan(tempInput)
        [rainData, aqiData] = removeDuplicatedData(rainData, aqiData);
        output = Lagrange(rainData, aqiData, rainInput);
    elseif isnan(rainInput)
        [tempData, aqiData] = removeDuplicatedData(tempData, aqiData);
        output = Lagrange(tempData, aqiData, tempInput);
    else
        [uniqueFactor, uniqueAqi] = removeDuplicatedData([tempData; rainData], aqiData);
        uniqueTempData = uniqueFactor(1, :);
        uniqueRainData = uniqueFactor(2, :);
        output = shepard_2(uniqueTempData, uniqueRainData, uniqueAqi, tempInput, rainInput);
    end
end


function rain = getRainByDate(dateInput)
    dataPath;
    rain = getRealRain(dateInput);
    if rain == -1
        rain = getForcastRain(dateInput);
    end
    if rain == -1
        rain = getInterpolationRain(dateInput);
    end
    
end

function output = getRealRain(dateInput)
    [date, ~, rain, ~] = loadRealData();
    datePosition = getDatePosition(dateInput, date);
    if datePosition ~= -1
        output = rain(datePosition);
    else
        output = -1;
    end
end

function output = getForcastRain(dateInput)
    [date, ~, rain] = loadForecastData();
    datePosition = getDatePosition(dateInput, date);
    if (datePosition ~= -1) 
        output = rain(datePosition);
    else
        output = -1;
    end
end 

function output = getInterpolationRain(dateInput)
    [date, ~, rain] = loadInterpolationFactorData();
    datePosition = getDatePosition(dateInput, date);
    if (datePosition ~= -1) 
        output = rain(datePosition);
    else
        output = getInterpolationRainByDate(dateInput);
    end
end

function output = getInterpolationRainByDate(inputDate)
    [date, ~, rain, ~] = loadRealData();
    [interpolationDate, ~, interpolationRain] = loadInterpolationFactorData();
    [~, realDateLength] = size(date);
    lastRealDate = date(:, realDateLength);
    lastDatePositionInInterpolationData = getDatePosition(lastRealDate, interpolationDate);
    [~, interpolationRainLength] = size(interpolationDate);
    if lastDatePositionInInterpolationData ~= -1 && lastDatePositionInInterpolationData < interpolationRainLength
        rain = [rain interpolationRain(lastDatePositionInInterpolationData + 1 : end)];
        date = [date interpolationDate(lastDatePositionInInterpolationData + 1 : end)];
    end
    output = interpolationRainByDate(date, rain, inputDate);
end

function ouput = interpolationRainByDate(dateData, rainData, inputDate)
    dataLength = length(rainData);
    lastDate = datetime(dateData(3, dataLength), dateData(2, dataLength), dateData(1, dataLength));
    firstInterpolationDate = lastDate + caldays(1);
    interpolationDate = firstInterpolationDate : inputDate;
    interpolationLenght = length(interpolationDate);
    for index = 1 : interpolationLenght
        dataLength = length(rainData);
        x1 = rainData(1 : end - 2);
        x2 = rainData(2 : end - 1);
        y = rainData(3 : end);
        out = griddata(x1, x2, y, rainData(dataLength - 1), rainData(dataLength));
        rainData = [rainData out];
    end
    ouput = rainData;
end


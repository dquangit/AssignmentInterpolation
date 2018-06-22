function temp = getTempByDate(dateInput)
    dataPath;
    temp = getRealTemp(dateInput);
    if temp == -1
        temp = getForcastTemp(dateInput);
    end
    if temp == -1
        temp = getInterpolationTemp(dateInput);
    end
end


function output = getRealTemp(dateInput)
    [date, temp, ~, ~] = loadRealData();
    datePosition = getDatePosition(dateInput, date);
    if datePosition ~= -1
        output = temp(datePosition);
    else
        output = -1;
    end
end

function output = getForcastTemp(dateInput)
    [date, temp, ~] = loadForecastData();
    datePosition = getDatePosition(dateInput, date);
    if (datePosition ~= -1) 
        output = temp(datePosition);
    else
        output = -1;
    end
end 

function output = getInterpolationTemp(dateInput)
    [date, temp, ~] = loadInterpolationFactorData();
    datePosition = getDatePosition(dateInput, date);
    if (datePosition ~= -1) 
        output = temp(datePosition);
    else
        output = getInterpolationTempByDate(dateInput);
    end
end

function output = getInterpolationTempByDate(inputDate)
    [date, temp, ~, ~] = loadRealData();
    [interpolationDate, ~, interpolationTemp] = loadInterpolationFactorData();
    [~, realDateLength] = size(date);
    lastRealDate = date(:, realDateLength);
    lastDatePositionInInterpolationData = getDatePosition(lastRealDate, interpolationDate);
    [~, interpolationTempLength] = size(interpolationDate);
    if lastDatePositionInInterpolationData ~= -1 && lastDatePositionInInterpolationData < interpolationTempLength
        temp = [temp interpolationTemp(lastDatePositionInInterpolationData + 1 : end)];
        date = [date interpolationDate(lastDatePositionInInterpolationData + 1 : end)];
    end
    output = interpolationTempByDate(date, temp, inputDate);
end

function ouput = interpolationTempByDate(dateData, tempData, inputDate)
    disp(size(dateData));
    disp(length(tempData));
    dataLength = length(tempData);
    dateInput = datetime(inputDate(3), inputDate(2), inputDate(1));
    lastDate = datetime(dateData(3, dataLength), dateData(2, dataLength), dateData(1, dataLength));
    firstInterpolationDate = lastDate + caldays(1);
    interpolationDate = firstInterpolationDate : dateInput;
    interpolationLenght = length(interpolationDate);
    for index = 1 : interpolationLenght
        dataLength = length(tempData);
        x1 = tempData(1 : end - 2);
        x2 = tempData(2 : end - 1);
        y = tempData(3 : end);
        out = griddata(x1, x2, y, tempData(dataLength - 1), tempData(dataLength));
        tempData = [tempData out];
    end
    ouput = round(tempData(end));
end

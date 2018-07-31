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
        if (datePosition + 6 < length(temp))
            output = temp(datePosition : datePosition + 6);
        else
            output = temp(datePosition : end);
        end
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
    lastDate = datetime(dateData(3, dataLength), dateData(2, dataLength), dateData(1, dataLength));
    firstInterpolationDate = lastDate + caldays(1);
    interpolationDate = firstInterpolationDate : inputDate;
    interpolationLenght = length(interpolationDate);
    x1 = tempData(1 : end - 2);
    x2 = tempData(2 : end - 1);
    y = tempData(3 : end);
    result = zeros([1 (interpolationLenght + 2)]);
    result(1) =  tempData(end - 1);
    result(2) = tempData(end);
    [xFactor, y] = removeDuplicatedData([x1;x2], y);
    x1 = xFactor(1, :);
    x2 = xFactor(2, :);
    for index = 3 : interpolationLenght + 2
        out = shepard_2(x1, x2, y, result(index - 2), result(index - 1));
        result(index) = out;
    end
    ouput = result(3 : end);
end


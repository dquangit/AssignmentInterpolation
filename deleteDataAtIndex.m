function deleteDataAtIndex(index)
    dataPath;
    [date, temp, rain, aqi] = loadRealData();
    if index >= 0 && index <= length(aqi)
        temp(index) = [];
        rain(index) = [];
        aqi(index) = [];
        date(:, index) = [];
        save(date, temp, rain, aqi);
    end    
end

function save(dateData, rainData, tempData, aqiData)
    global datePath;
    global tempPath;
    global aqiPath;
    global rainPath;
    saveMatrix(aqiData, aqiPath);
    saveMatrix(rainData, rainPath);
    saveMatrix(tempData, tempPath);
    saveMatrix(dateData, datePath);
end

function saveMatrix(matrix, fileName)
    dlmwrite(fileName, matrix, 'delimiter', ' ');
end
function UpdateData(index,temp,rain,aqi)
    dataPath;
    [date, tempData, rainData, aqiData] = loadRealData();
    if index >= 0 && index <= length(aqiData)
        disp("@@@");
        disp(index);
        tempData(index) = temp;
        rainData(index) = rain;
        aqiData(index) = aqi;
        save(date, tempData, rainData, aqiData);
    end    
end

function save(dateData,  tempData,rainData, aqiData)
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
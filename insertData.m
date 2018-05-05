function [outputArg1] = insertData(date, temp, rain, aqi)
    dataPath;
    dateData = getDateData();
   
    n = length(dateData);
    dateInput = datetime(date(3), date(2), date(1));
    
    if (dateInput < dateFromDateData(dateData(:, 1)))
        insertFirst(date, temp, rain, aqi);
    elseif (dateInput > dateFromDateData(dateData(:, n)))
        insertLast(date, temp, rain, aqi);
    else
        for index = 1 : n
            dateElement = dateFromDateData(dateData(:,index));
            if (dateElement == dateInput)
                disp('Fuck');
                insertAtIndex(date, temp, rain, aqi, index);
                break;
            end
        end
    end
end

function date = dateFromDateData(dateData)
    date = datetime(dateData(3), dateData(2), dateData(1));
end

function output = insertFirst(date, temp, rain, aqi)    
    [dateData, rainData, tempData, aqiData] = loadData();
    dateData = [date dateData];
    rainData = [rain rainData];
    tempData = [temp tempData];
    aqiData = [aqi aqiData];
    save(dateData, rainData, tempData, aqiData);
end

function output = insertLast(date, temp, rain, aqi)
    [dateData, rainData, tempData, aqiData] = loadData();
    dateData = [dateData date];
    rainData = [rainData rain];
    tempData = [tempData temp];
    aqiData = [aqiData aqi];
    save(dateData, rainData, tempData, aqiData);
end

function output = insertAtIndex(date, temp, rain, aqi, index)
    [dateData, rainData, tempData, aqiData] = loadData();
    n = length(dateData);
    dateData = [dateData(:, 1 : index) date dateData(:, index : n)];
    rainData = [rainData(1 : index) rain];
    tempData = [tempData temp];
    aqiData = [aqiData aqi];
    save(dateData, rainData, tempData, aqiData);
end

function [dateData, rainData, tempData, aqiData] = loadData() 
    rainData = getRain();
    aqiData = getAqi();
    dateData = getDateData();
    tempData = getTemperature();
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
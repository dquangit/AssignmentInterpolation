function insertData(date, temp, rain, aqi)
    dataPath;
    dateData = getDateData();
   
    n = length(dateData);
    dateInput = datetime(date(3), date(2), date(1));
    
    if (dateInput < dateFromDateData(dateData(:, 1)))
        insertFirst(date, temp, rain, aqi);
    elseif (dateInput > dateFromDateData(dateData(:, n)))
        insertLast(date, temp, rain, aqi);
    else
        for index = 1 : n - 1
            dateBefore = dateFromDateData(dateData(:,index));
            dateAfter = dateFromDateData(dateData(:, index + 1));
            if ((dateInput < dateAfter) && (dateInput > dateBefore))
                insertAtIndex(date, temp, rain, aqi, index);
                break;
            end
        end
    end
end

function date = dateFromDateData(dateData)
    date = datetime(dateData(3), dateData(2), dateData(1));
end

function insertFirst(date, temp, rain, aqi)    
    [dateData, rainData, tempData, aqiData] = loadData();
    dateData = [reshape(date, [3, 1]) dateData];
    rainData = [rain rainData];
    tempData = [temp tempData];
    aqiData = [aqi aqiData];
    save(dateData, rainData, tempData, aqiData);
end

function insertLast(date, temp, rain, aqi)
    [dateData, rainData, tempData, aqiData] = loadData();
    out = [dateData reshape(date, [3, 1])];
    rainData = [rainData rain];
    tempData = [tempData temp];
    aqiData = [aqiData aqi];
    save(out, rainData, tempData, aqiData);
end

function insertAtIndex(date, temp, rain, aqi, index)
    [dateData, rainData, tempData, aqiData] = loadData();
    n = length(dateData);
    dateData = [dateData(:, 1 : index) reshape(date, [3, 1]) dateData(:, index + 1 : n)];
    rainData = [rainData(1 : index) rain rainData(index + 1 : n)];
    tempData = [tempData(1 : index) temp tempData(index + 1 : n)];
    aqiData = [aqiData(1 : index) aqi aqiData(index + 1 : n)];
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
function insertInterpolationData(date, aqi)
    dataPath;
    [dateData, ~] = loadInterpolationData();
    
    n = length(dateData);
    if (n == 0)
        insertFirst(date, aqi);
        return;
    end
    dateInput = datetime(date(3), date(2), date(1));
    
    if (dateInput < dateFromDateData(dateData(:, 1)))
        insertFirst(date, aqi);
    elseif (dateInput > dateFromDateData(dateData(:, n)))
        insertLast(date, aqi);
    else
        for index = 1 : n - 1
            dateBefore = dateFromDateData(dateData(:,index));
            dateAfter = dateFromDateData(dateData(:, index + 1));
            if ((dateInput < dateAfter) && (dateInput > dateBefore))
                insertAtIndex(date, aqi, index);
                break;
            end
        end
    end
end


function date = dateFromDateData(dateData)
    date = datetime(dateData(3), dateData(2), dateData(1));
end

function insertFirst(date, aqi)    
    [dateData, aqiData] = loadInterpolationData();
    dateData = [reshape(date, [3, 1]) dateData];
    aqiData = [aqi aqiData];
    save(dateData, aqiData);
end

function insertLast(date, aqi)
    [dateData, aqiData] = loadInterpolationData();
    out = [dateData reshape(date, [3, 1])];
    aqiData = [aqiData aqi];
    save(out, aqiData);
end

function insertAtIndex(date, aqi, index)
    [dateData, aqiData] = loadInterpolationData();
    n = length(dateData);
    dateData = [dateData(:, 1 : index) reshape(date, [3, 1]) dateData(:, index + 1 : n)];
    aqiData = [aqiData(1 : index) aqi aqiData(index + 1 : n)];
    save(dateData, aqiData);
end

function save(dateData, aqiData)
    global dateInterpolationPath;
    global aqiInterpolationPath;
    saveMatrix(aqiData, aqiInterpolationPath);
    saveMatrix(dateData, dateInterpolationPath);
end

function saveMatrix(matrix, fileName)
    dlmwrite(fileName, matrix, 'delimiter', ' ');
end
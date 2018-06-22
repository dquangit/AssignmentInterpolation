function insertInterpolationData(date, aqi,temp)
    if (~isnan(aqi)) 
        [dateData, ~,~] = loadInterpolationData();
        [~, n] = size(dateData);
        if (n == 0)
            insertFirst(date, aqi,temp);
            return;
        end
        dateInput = datetime(date(3), date(2), date(1));

        if (dateInput < dateFromDateData(dateData(:, 1)))
            insertFirst(date, aqi,temp);
        elseif (dateInput > dateFromDateData(dateData(:, n)))
            insertLast(date, aqi,temp);
        else
            for index = 1 : n - 1
                dateBefore = dateFromDateData(dateData(:,index));
                dateAfter = dateFromDateData(dateData(:, index + 1));
                if ((dateInput < dateAfter) && (dateInput > dateBefore))
                    insertAtIndex(date, aqi, index,temp);
                    break;
                end
            end
        end
    end
end


function date = dateFromDateData(dateData)
    date = datetime(dateData(3), dateData(2), dateData(1));
end

function insertFirst(date, aqi,temp)    
    [dateData, aqiData,tempData] = loadInterpolationData();
    dateData = [reshape(date, [3, 1]) dateData];
    aqiData = [aqi aqiData];
    tempData = [temp aqiData];
    save(dateData, aqiData,tempData);
end

function insertLast(date, aqi,temp)
    [dateData, aqiData,tempData] = loadInterpolationData();
    out = [dateData reshape(date, [3, 1])];
    aqiData = [aqiData aqi];
    tempData = [tempData temp];
    save(out, aqiData,tempData);
end

function insertAtIndex(date, aqi, index,temp)
    [dateData, aqiData,tempData] = loadInterpolationData();
    n = length(dateData);
    dateData = [dateData(:, 1 : index) reshape(date, [3, 1]) dateData(:, index + 1 : n)];
    aqiData = [aqiData(1 : index) aqi aqiData(index + 1 : n)];
    tempData = [tempData(1 : index) temp tempData(index + 1 : n)];
    save(dateData, aqiData,tempData);
end

function save(dateData, aqiData,tempData)
    global dateInterpolationPath;
    global aqiInterpolationPath;
    global tempInterpolationPath;
    saveMatrix(aqiData, aqiInterpolationPath);
    saveMatrix(dateData, dateInterpolationPath);
    saveMatrix(tempData, tempInterpolationPath);
end

function saveMatrix(matrix, fileName)
    dlmwrite(fileName, matrix, 'delimiter', ' ');
end
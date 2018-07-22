[date, temp, rain, aqi] = loadRealData;
startPos = getDatePosition(datetime(2017,3,6), date);
endPos = getDatePosition(datetime(2017,12,30), date);
aprStart = getDatePosition(datetime(2018,1,1), date);
aprEnd = getDatePosition(datetime(2018,1,30), date);
[interDate, interTemp, interRain, interAqi] = getDataInRange(date, temp, rain, aqi, startPos, startPos + 30);
[aprTemp, aprRain, aprAqi] = getDataInRange(date, temp, rain, aqi, aprStart, aprEnd);


disp(interDate);
disp(interTable);
disp(size(interTable));
name =  {'Temp'; 'Rain'; 'Aqi'};
disp(table(interTemp', interRain', interAqi'));

function [outDate, outTemp, outRain, outAqi] = getDataInRange(date, temp, rain, aqi, startPos, endPos)
    outTemp = temp(startPos : endPos);
    outRain = rain(startPos : endPos);
    outAqi = aqi(startPos : endPos);
    outDate = date(:, startPos : endPos);
end
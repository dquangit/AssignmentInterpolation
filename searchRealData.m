function [temp, rain, aqi] = searchRealData(dateData, tempData, rainData, aqiData, dateInput)
    datePosition = getDatePosition(dateInput, dateData);
    temp = -1;
    rain = -1;
    aqi = -1;
    if datePosition ~= -1
        temp = tempData(datePosition);
        rain = rainData(datePosition);
        aqi = aqiData(datePosition);
    end
end


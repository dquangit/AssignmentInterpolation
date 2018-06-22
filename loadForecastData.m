function [date, temp, rain,aqi] = loadForecastData()
    dataPath;
    global dateForecastPath;
    global tempForecastPath;
    global rainForecastPath;
    global aqiForecastPath;
    date = load(dateForecastPath);
    temp = load(tempForecastPath);
    rain = load(rainForecastPath);
    aqi = load(aqiForecastPath);
end


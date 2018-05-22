function [date, temp, rain] = loadForecastData()
    dataPath;
    global dateForecastPath;
    global tempForecastPath;
    global rainForecastPath;
    date = load(dateForecastPath);
    temp = load(tempForecastPath);
    rain = load(rainForecastPath);
end


function [date, temp, rain, aqi] = loadRealData()
    dataPath;
    global datePath;
    global tempPath;
    global rainPath;
    global aqiPath;
    date = load(datePath);
    temp = load(tempPath);
    rain = load(rainPath);
    aqi = load(aqiPath);
end


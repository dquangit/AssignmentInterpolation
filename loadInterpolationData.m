function [date,aqi] = loadInterpolationData()
    dataPath;
    global dateInterpolationPath;
    global aqiInterpolationPath;
    date = load(dateInterpolationPath);
    aqi = load(aqiInterpolationPath);
end


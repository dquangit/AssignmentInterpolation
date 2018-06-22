function [date,aqi,temp] = loadInterpolationData()
    dataPath;
    global dateInterpolationPath;
    global aqiInterpolationPath;
    global tempInterpolationPath;
    date = load(dateInterpolationPath);
    aqi = load(aqiInterpolationPath);
    temp = load(tempInterpolationPath);
end


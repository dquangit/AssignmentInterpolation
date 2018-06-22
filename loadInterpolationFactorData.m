function [date, temp, rain] = loadInterpolationFactorData()
    dataPath;
    global dateInterpolationFactorPath;
    global tempInterpolationFactorPath;
    global rainInterpolationFactorPath;
    
    date = load(dateInterpolationFactorPath);
    temp = load(tempInterpolationFactorPath);
    rain = load(rainInterpolationFactorPath);
end


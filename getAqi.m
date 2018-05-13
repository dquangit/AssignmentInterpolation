function [output] = getAqi()
    global aqiPath;
    output = load(aqiPath);
end
function [output] = getTemperature()
    global tempPath;
    output = load(tempPath);
end


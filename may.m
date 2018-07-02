[~,temp,rain,aqi] = loadRealData;
tempMay = temp(381:411);
rainMay = rain(381:411);
aqiMay = aqi(381:411);

temp = [temp(1 : 439) temp(471 : end)];
rain = [rain(1 : 439) rain(471 : end)];
aqi = [aqi(1 : 439) aqi(471 : end)];

result = zeros(size(aqiMay));
lengthInput = length(aqiMay);

for index = 1 : lengthInput
    result(index) = griddata(temp, rain, aqi, tempMay(index), rainMay(index));
end

bar(result);
hold on;
plot(aqiMay);
hold off;
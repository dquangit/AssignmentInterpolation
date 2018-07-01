[~,temp,rain,aqi] = loadRealData;
tempMay = temp(381:411);
rainMay = rain(381:411);
aqiMay = aqi(381:411);

temp = [temp(1 : 380) temp(412 : end)];
rain = [rain(1 : 380) rain(412 : end)];
aqi = [aqi(1 : 380) aqi(412 : end)];

result = zeros(size(aqiMay));
lengthInput = length(aqiMay);

for index = 1 : lengthInput
    result(index) = griddata(temp, rain, aqi, tempMay(index), rainMay(index));
end

bar(result);
hold on;
plot(aqiMay);
hold off;
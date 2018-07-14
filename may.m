[~,temp,rain,aqi] = loadRealData;
tempMay = temp(440:470);
rainMay = rain(440:470);
aqiMay = aqi(440:470);

temp = [temp(1 : 439) temp(471 : end)];
rain = [rain(1 : 439) rain(471 : end)];
aqi = [aqi(1 : 439) aqi(471 : end)];
lengthInput = length(aqiMay);
result = zeros(size(aqiMay));
x  = [temp; rain];
[x, aqi] = removeDuplicatedData(x, aqi);
temp = x(1,:);
rain = x(2,:);

for index = 1 : lengthInput
    result(index) = shepard_2(temp, rain, aqi, tempMay(index), rainMay(index));
end

bar(aqiMay);
hold on;
plot(result);
hold off;
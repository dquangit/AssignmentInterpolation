tempJune = [28.5 28.5 29.5 30.5 29.5 31.5 32.5 32.5 31 31 30.5 32 32 30 28 28.5 29 30.5 32 32.5 32.5 33 32.5 31 30.5 29 29 30 31.5 29.5];
rainJune = zeros(size(tempJune));
aqiJune = [100 83.61 68.15 96.01 31.92 58.09 129.5 154.41 504.41 335.71 264.1 105.88 41.03 93.51 59.34 135.56 88.35 130.82 106.05 97.42 181.48 32 73.92 127.7 77.64 42.89 70.24 41.21]; 

[~, temp, rain, aqi] = loadRealData;

result = zeros(size(aqiJune));

for index = 1 : juneSize
    result(index) = griddata(temp, rain, aqi, tempJune(index), rainJune(index));
end

bar(result);
hold on;
plot(aqiJune);
hold off;
[~, temp, rain, aqi] = loadRealData;
[uniqueData, aqi]= removeDuplicatedData([temp; rain], aqi);
temp = uniqueData(1, :);
rain = uniqueData(2, :);
x = 28;
y = 0;
result = shepard_2(temp, rain, aqi, x, y);
disp(result);
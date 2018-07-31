[date, temp, rain, aqi] = loadRealData;
startPos = getDatePosition(datetime(2017,1,1), date);
endPos = getDatePosition(datetime(2017,12,31), date);
aprStart = getDatePosition(datetime(2018,1,1), date);
aprEnd = getDatePosition(datetime(2018,1,31), date);
[interTemp, interRain, interAqi] = getDataInRange(temp, rain, aqi, startPos, endPos);
[aprTemp, aprRain, aprAqi] = getDataInRange(temp, rain, aqi, aprStart, aprEnd);
result = zeros(size(aprTemp));
matlabMethod = zeros(size(aprTemp));
[outp, interAqi] = removeDuplicatedData([interTemp; interRain], interAqi);
interTemp = outp(1, :);
interRain = outp(2, :);
% [interTemp, interAqi] = removeDuplicatedData(interTemp, interAqi);

for index = 1 : length(result)
    result(index) = shepard_2(interTemp, interRain, interAqi, aprTemp(index), aprRain(index));
    matlabMethod(index) = griddata(interTemp, interRain, interAqi, aprTemp(index), aprRain(index));
%     result(index) = Lagrange(interTemp, interAqi, aprTemp(index));
end

maxError = max(abs(result - aprAqi));
minError = min(abs(result - aprAqi));
average = sum(abs(result - aprAqi))/length(result);
bar(matlabMethod);
hold on;
plot(result);
hold off;
disp(maxError);
disp(minError);
disp(average);

function [outTemp, outRain, outAqi] = getDataInRange(temp, rain, aqi, startPos, endPos)
    outTemp = temp(startPos : endPos);
    outRain = rain(startPos : endPos);
    outAqi = aqi(startPos : endPos);
end
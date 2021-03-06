% TestMatrix = zeros([1 190]);
% Result = zeros(size(TestMatrix));
p = 2;

[dateData, tempData, rainData, aqiData] = loadRealData();

dateTime = [11;2017];

tempData1 = tempData(60:277);
rainData1 = rainData(60:277);
aqiData1  = aqiData(60:277);

[~, n] = size(aqiData);
date=[];
temp = [];
rain = [];
aqi = [];

for i=1:n
    if isequal(dateTime,dateData(2:3,i))
        date  = [date,dateData(1,i)];
        temp = [temp,tempData(i)];
        rain = [rain,rainData(i)];
        aqi = [aqi,aqiData(i)];
    end
end
[~,n1] = size(aqi);
result = zeros(1,n1);
error = zeros(size(result));
% a = [1 4 2 5 6 2 7 8 9 3];
% c = [3 4 5 6 7 4 8 9 0 10];
% b = [];
% lengthA = length(a);
% e = [1 2 3];
% lengthE = length(e);

n3 = length(temp);
i = 1;
while (i<=length(tempData1))
    for j=1:n3
        if (temp(j) == tempData1(i))
            tempData1(i) = [];
            rainData1(i) = [];
            aqiData1(i) = [];
            i = i - 1;
            break;
        end
    end
    i = i + 1;
end
% for i = 1 : n18
% %     x = index/10;
% %     TestMatrix(index) = x;
%     result(i) =  shepard(tempData, aqiData, temp(i), p);
%     error(i) = result(i) - aqi(i);
% end
for i = 1:n1
    result(i) = shepard_2(tempData1, rainData1,aqiData1, temp(i),rain(i), p);
    error(i) = result(i) - aqi(i);
end
% disp(error);
% disp(result);
% disp(aqi);
figure;
hold on
plot ( aqi, 'b-', 'Linewidth', 3 );
plot ( result, 'r-', 'Linewidth', 4 );
% plot ( TestMatrix, Result, 'k.', 'Markersize', 20 );
xlabel ( '<--- X --->' );
ylabel ( '<--- Y --->' );
title ( 'Shepard interpolation with p = 2' );
grid on
hold off

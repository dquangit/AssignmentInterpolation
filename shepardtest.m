TestMatrix = zeros([1 190]);
Result = zeros(size(TestMatrix));
k = 2;
% [dateData, tempData, rainData, aqiData] = loadRealData();
% [~, n] = size(dateData);
% dateTime = [6;2018];
% 
% temp = [];
% rain = [];
% aqi = [];
% for i=1:n
%     if isequal(dateTime,dateData(2:3,i))
%         temp = [AA,tempData(i)];
%         rain = [BB,rainData(i)];
%         aqi = [CC,aqiData(i)];
%     end
% end

for index = 1 : 190
    x = index/10;
    TestMatrix(index) = x;
    Result(index) =  shepard(AA, BB, x, k);
end

% for i = 1:22
%     shepard_2(tempData, rainData,aqiData, temp(i),rain(i), k);
% end

figure;
hold on
plot ( CC, 'b-', 'Linewidth', 3 );
plot ( Result, 'r-', 'Linewidth', 4 );
% plot ( TestMatrix, Result, 'k.', 'Markersize', 20 );
xlabel ( '<--- X --->' );
ylabel ( '<--- Y --->' );
title ( 'Shepard interpolation with p = 10' );
grid on
hold off
% plot(TestMatrix, Result);
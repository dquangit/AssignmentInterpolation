[date, temp, rain, aqi] = loadRealData;

dateMatrix = zeros(size(temp));
for index = 1 : length(temp)
    dateInput = date(:, index);
%     x = datetime(str2double(dateInput(3)), str2double(dateInput(2)), str2double(dateInput(1)));
    dateMatrix(index) = index;
end
bar(dateMatrix, aqi);
hold on;
plot(dateMatrix, temp, 'r', 'LineWidth', 2);
hold on;
plot(dateMatrix, rain, 'g', 'LineWidth', 2);
hold off;
A = [1 2 3 4 5];
B = [8 4 2 9 7];
TestMatrix = zeros([1 190]);
Result = zeros(size(TestMatrix));
k = 40;
[dateData, tempData, rainData, aqiData] = loadRealData();
n = length(tempData);
dateTime = [6;2018];
disp(dateData(2:3,:));
% for i = 0 : n
%     if isequal(datetime,dateData(2:3,i))
%         disp(i);
%     end
% end
% AA = [temData];
% disp(AA);
% BB = [4 5 6 6 5 3 1 1 1 3 4 4 3 3 4 4 3 0];
% for index = 1 : 190
%     x = index/10;
%     TestMatrix(index) = x;
%     Result(index) =  shepard(AA, BB, x, k);
% end
% 
% figure;
% hold on
% % plot ( AA, BB, 'b-', 'Linewidth', 3 );
% plot ( TestMatrix,Result, 'r-', 'Linewidth', 4 );
% % plot ( TestMatrix, Result, 'k.', 'Markersize', 20 );
% xlabel ( '<--- X --->' );
% ylabel ( '<--- Y --->' );
% title ( 'Shepard interpolation with p = 10' );
% grid on
% hold off
% plot(TestMatrix, Result);
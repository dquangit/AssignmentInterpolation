A = [1 2 3 4 5];
B = [8 4 2 9 7];
TestMatrix = zeros([1 50]);
Result = zeros(size(TestMatrix));
k = 100;
for index = 1 : 50
    x = index/10;
    TestMatrix(index) = x;
    Result(index) =  shepard(A, B, x, k);
end

figure;
plot(TestMatrix, Result);
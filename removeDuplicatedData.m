function [outputArg1,outputArg2] = removeDuplicatedData(inputArg1,inputArg2)
    [outputArg1, ya, ~] = unique(inputArg1);
    outputArg2 = inputArg2(ya);
end


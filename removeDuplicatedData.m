function [outputArg1,outputArg2] = removeDuplicatedData(input, target)
    outputArg1 = input;
    outputArg2 = target;
    [~, width] = size(outputArg1);
    for index = 1 : (width - 1)
        count = 1;
        subIndexArray = [];
        if (index > width)
            break;
        end
        for subIndex = (index + 1) : width
            if isequal(outputArg1(:, index), outputArg1(:, subIndex))
                count = count + 1;
                outputArg2(index) = outputArg2(index) + outputArg2(subIndex);
                subIndexArray = [subIndexArray subIndex];
            end
        end
        outputArg2(index) = outputArg2(index)/count;
        outputArg1(:,subIndexArray) = [];
        outputArg2(:,subIndexArray) = [];
        [~, width] = size(outputArg1);
    end
end


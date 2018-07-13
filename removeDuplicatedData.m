function [outputArg1,outputArg2] = removeDuplicatedData(input, target)
    inversedInput = input';
    inversedTarget = target';
    inversedTargetString = num2str(inversedTarget);
    inversedTargetCell = cellstr(inversedTargetString);
    disp(inversedTargetCell);
    disp(inversedInput);
    inputTable = table(inversedInput,'RowNames', inversedTargetCell);
    uniqueTable = unique(inputTable);
    inversedTargetOut = uniqueTable.Properties.RowNames;
    targetOut = str2double(inversedTargetOut);
    outputArg1 = table2array(uniqueTable)';
    outputArg2 = targetOut';
end


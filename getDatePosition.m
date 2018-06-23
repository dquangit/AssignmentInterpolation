function position = getDatePosition(dateInput, dateTagetArray)
    position = -1;
    [~, dateDataLength] = size(dateTagetArray);
    for index = 1 : dateDataLength
        comparedDate = datetime(dateTagetArray(3, index), dateTagetArray(2, index), dateTagetArray(1, index));
        if comparedDate == dateInput
           position = index;
           break;
        end
    end
end


function position = getDatePosition(dateInput, dateTagetArray)
    position = -1;
    disp(size(dateInput));
    inputDate = datetime(dateInput(3,1), dateInput(2,1), dateInput(1,1));
    [~, dateDataLength] = size(dateTagetArray);
    for index = 1 : dateDataLength
        comparedDate = datetime(dateTagetArray(3, index), dateTagetArray(2, index), dateTagetArray(1, index));
        if comparedDate == inputDate
           position = index;
           break;
        end
    end
end


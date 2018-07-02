function varargout = tabtest(varargin)
% TABTEST MATLAB code for tabtest.fig
%      TABTEST, by itself, creates a new TABTEST or raises the existing
%      singleton*.
%
%      H = TABTEST returns the handle to a new TABTEST or the handle to
%      the existing singleton*.
%
%      TABTEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TABTEST.M with the given input arguments.
%
%      TABTEST('Property','Value',...) creates a new TABTEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tabtest_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tabtest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tabtest

% Last Modified by GUIDE v2.5 01-Jun-2018 21:12:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tabtest_OpeningFcn, ...
                   'gui_OutputFcn',  @tabtest_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

% End initialization code - DO NOT EDIT


% --- Executes just before tabtest is made visible.
function tabtest_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tabtest (see VARARGIN)

% Choose default command line output for tabtest
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global firstTimeClick;

firstTimeClick = true;

dataPath;
set(handles.uipanel9,'visible','off')


% UIWAIT makes tabtest wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tabtest_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'visible','on');
set(handles.uipanel2,'visible','off');
set(handles.uipanel7,'visible','off');
set(handles.uipanel9,'visible','on');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'visible','off');
set(handles.uipanel2,'visible','on');
set(handles.uipanel7,'visible','off');
set(handles.uipanel9,'visible','off');

monthfilter_Callback(hObject, eventdata, handles)



function searchDay_Callback(hObject, eventdata, handles)
% hObject    handle to searchDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of searchDay as text
%        str2double(get(hObject,'String')) returns contents of searchDay as a double


% --- Executes during object creation, after setting all properties.
function searchDay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to searchDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in searchMonth.
function searchMonth_Callback(hObject, eventdata, handles)
% hObject    handle to searchMonth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns searchMonth contents as cell array
%        contents{get(hObject,'Value')} returns selected item from searchMonth


% --- Executes during object creation, after setting all properties.
function searchMonth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to searchMonth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in year.
function year_Callback(hObject, eventdata, handles)
% hObject    handle to year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns year contents as cell array
%        contents{get(hObject,'Value')} returns selected item from year


% --- Executes during object creation, after setting all properties.
function year_CreateFcn(hObject, eventdata, handles)
% hObject    handle to year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in searchButton.
function searchButton_Callback(hObject, eventdata, handles)
% hObject    handle to searchButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

date = get(handles.searchDay,'string');
month = get(handles.searchMonth,'value');
[dateData, tempData, rainData, aqiData] = loadRealData();
[~, dateDataLength] = size(dateData);
yearString = get(handles.year, 'string');
yearChosen = get(handles.year, 'value');
year = yearString(yearChosen);
year = str2double(year);
date = str2double(date);
realDataIndex = 0;
chosenDate = datetime(year, month, date);
for index = 1 : dateDataLength
    comparedDate = datetime(dateData(3, index), dateData(2, index), dateData(1, index));
    if comparedDate == chosenDate
       realDataIndex = index;
       break;
    end
end
readlDataLength = length(aqiData);
aqi = 0;
rain = 0;
temp = 0;
if (realDataIndex > 0 && realDataIndex <= readlDataLength) 
    aqi = aqiData(realDataIndex);
    rain = rainData(realDataIndex);
    temp = tempData(realDataIndex);
end

forecastDataIndex = 0;
if (realDataIndex == 0)
    [forecastDate, forecastTemp, forecastRain] = loadForecastData();
    forecastDataLength = length(forecastDate);
    for index = 1 : forecastDataLength
        comparedDate = datetime(forecastDate(3, index), forecastDate(2, index), forecastDate(1, index));
        if comparedDate == chosenDate
           rain = forecastRain(index);
           temp = forecastTemp(index);
           forecastDataIndex = index;
           break;
        end
    end 
    
    if forecastDataIndex ~= 0
        [dateInterpolation, aqiInterpolation,tempa] = loadInterpolationData();
        interpolationAqi = 0;
        interpolationtemp = 0;
        [~, interpolationDataLength] = size(dateInterpolation);
        for index = 1 : interpolationDataLength
            comparedDate = datetime(dateInterpolation(3, index), dateInterpolation(2, index), dateInterpolation(1, index));
            if comparedDate == chosenDate
               interpolationAqi = aqiInterpolation(index);
               interpolationtemp = tempa(index);
               break;
            end
        end
        aqi = interpolationAqi;
        temp = interpolationtemp;
        
        if (aqi == 0 )
            aqiLength = length(aqiData);
            tempLength = length(tempData);
            rainLength = length(rainData);
            minimum = min([aqiLength tempLength rainLength]);
            aqiData = aqiData(1 : minimum);
            tempData = tempData(1 : minimum);
            rainData = rainData(1 : minimum);
            aqi = griddata(tempData, rainData, aqiData, temp, rain);
%             temp = griddata(rainData, aqiData, tempData, aqi, rain);
            dateInput = [date; month; year];
            insertInterpolationData(dateInput, aqi);
%             insertInterpolationData(dateInput, temp);
        end
        
         if (temp == 0 )
             disp("@@");
            aqiLength = length(aqiData);
            tempLength = length(tempData);
            rainLength = length(rainData);
            minimum = min([aqiLength tempLength rainLength]);
            aqiData = aqiData(1 : minimum);
            tempData = tempData(1 : minimum);
            rainData = rainData(1 : minimum);
            temp = griddata(rainData, aqiData, tempData, aqi, rain);
            dateInput = [date; month; year];
            insertInterpolationData(dateInput, temp);
        end
    
        
    end    
end

if aqi ~= 0 && temp ~=0
    set(handles.searchRain,'string', rain);
    set(handles.searchTemp,'string', temp);
    set(handles.searchAqi,'string',aqi);
    dateTimeShown = chosenDate + [-3 : 3];
    dateShowQuantity = 7;
    realAqiMatrix = zeros([1, dateShowQuantity]);
    %son
    realtemp = zeros([1,dateShowQuantity]);
   
    interpolationAqiMatrix = zeros([1, dateShowQuantity]);
    
    %son
    interpolationtempMatrix = zeros([1,dateShowQuantity]);
    
    realDataLength = length(aqiData);
    for i = 1 : dateShowQuantity
        for j = 1 : realDataLength
            comparedDateTime = datetime(dateData(3, j), dateData(2, j), dateData(1, j));
            if dateTimeShown(i) == comparedDateTime
                realAqiMatrix(i) = aqiData(j);
                realtemp(i) = tempData(j);
            end
        end
    end
    
    [interpolationDate, interpolationAqi,interpolationtemp] = loadInterpolationData();
    interpolationDataLength = length(interpolationAqi);
    
    count = 0;
    count1 = 0;
    for i = 1 : dateShowQuantity
        for j = 1 : interpolationDataLength
            comparedTime = datetime(interpolationDate(3, j), interpolationDate(2, j), interpolationDate(1, j));
            if dateTimeShown(i) == comparedTime
                count = count + 1;
                interpolationAqiMatrix(i) = interpolationAqi(j);
                interpolationtempMatrix(i) = interpolationtemp(j);
            end
        end
    end
 
    if (count1 ~= dateShowQuantity)
        [forecastDate, forecastTemp, forecastRain,forecastAqi] = loadForecastData();
        forcastDataLength = length(forecastRain);
        for i = 1 : dateShowQuantity
            if (interpolationAqiMatrix(i) == 0 || interpolationtempMatrix(i) == 0)
                for j = 1 : forcastDataLength
                    comparedTime = datetime(forecastDate(3, j), forecastDate(2, j), forecastDate(1, j));
                    if dateTimeShown(i) == comparedTime
                        aqiLength = length(aqiData);
                        tempLength = length(tempData);
                        rainLength = length(rainData);
                        minimum = min([aqiLength tempLength rainLength]);
                        aqiData = aqiData(1 : minimum);
                        tempData = tempData(1 : minimum);
                        rainData = rainData(1 : minimum);
                        interpolationAqi = griddata(tempData, rainData, aqiData, forecastTemp(j), forecastRain(j));
                        interpolationAqiMatrix(i) = interpolationAqi;
                        disp("****"+interpolationAqi);
                        disp("@@@");

                        interpolationtemp = griddata(aqiData,rainData,tempData,forecastAqi(j),forecastRain(j));
                        disp("@@@");
                        disp("%%%%"+interpolationtemp);
                        interpolationtempMatrix(i) = interpolationtemp;
                        insertInterpolationData(forecastDate(:, j), interpolationAqi,interpolationtemp);
%                         insertInterpolationData(forecastDate(:, j), interpolationtemp);
                        %(forecastDate(:, j), interpolationtemp);
                    end
                end
            end
        end 
    end
    
    
    
    
    
    axes(handles.weekAxes);
    zero_indeces = realAqiMatrix == 0;
    zero_indeces1 = realtemp == 0;
    realAqiMatrix(zero_indeces) = [];
    realtemp(zero_indeces1) = [];
    realDateTimeShow = dateTimeShown;
    realDateTimeShow(zero_indeces) = [];
    for index = 1 : length(realDateTimeShow)
        for j = 1 : dateShowQuantity
            if (realDateTimeShow(index) == dateTimeShown(j))
                interpolationAqiMatrix(j) = realAqiMatrix(index);
                interpolationtempMatrix(j) = realtemp(index);
            end
        end
    end
else
    % noi suy luong mua + nhiet do 
    chosenDate = [date; month; year];
    interpolationRain = getRainByDate(chosenDate);
    interpolationTemp = getTempByDate(chosenDate);
    aqi = griddata(tempData, rainData, aqiData, interpolationTemp, interpolationRain);
    set(handles.searchRain,'string', interpolationRain);
    set(handles.searchTemp,'string', interpolationTemp);
    set(handles.searchAqi,'string', aqi);
end
    %disp(realAqiMatrix);
    %disp(interpolationAqiMatrix);
    %plot(dateTimeShown, interpolationAqiMatrix, 'r-', realDateTimeShow, realAqiMatrix, 'b-');
    
    axes(handles.axes8);
    disp(realtemp);
    disp(interpolationtempMatrix);
    plot(dateTimeShown,interpolationtempMatrix,'r-',realDateTimeShow,realtemp,'b-');
    
    
    
    if aqi <= 50
        set(handles.searchAqiLevel,'String','Good');
        set(handles.text10,'String','Air quality is considered satisfactory, and air pollution poses little or no risk');
    elseif aqi <= 100
        set(handles.searchAqiLevel,'String','Moderate');
        set(handles.text10,'String','Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution.');
    elseif aqi <= 150
        set(handles.searchAqiLevel,'String','Unhealthy for Sensitive Groups');
        set(handles.text10,'String','Members of sensitive groups may experience health effects. The general public is not likely to be affected.');
    elseif aqi <= 200
        set(handles.searchAqiLevel,'String','Unhealthy');
        set(handles.text10,'String', 'Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects');
    elseif aqi <= 300
        set(handles.searchAqiLevel,'String','Very Unhealthy');
        set(handles.text10, 'String', 'Health warnings of emergency conditions. The entire population is more likely to be affected.');
    else
        set(handles.searchAqiLevel,'String','Good');
        set(handles.text10, 'String', 'Health alert: everyone may experience more serious health effects.');
    end


% --- Executes on selection change in monthfilter.
function monthfilter_Callback(hObject, eventdata, handles)
% hObject    handle to monthfilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns monthfilter contents as cell array
%        contents{get(hObject,'Value')} returns selected item from monthfilter

[loadfilemonth, ~, ~, loadfileAqi] = loadRealData();
n = length(loadfileAqi);

value = get(handles.monthfilter,'value');
choose = get(handles.monthfilter,'string');

splitMonth = split(choose(value),"/");
[~, n1] = size(loadfilemonth);
datetime = [str2double(splitMonth(1));str2double(splitMonth(2))];
disp(datetime);
x = [];
for i=1:n1
    if isequal(datetime,loadfilemonth(2:3,i))
%         disp(loadfileAqi(i));
        x = [x,loadfileAqi(i)];
    end
end
axes(handles.axes1);
bar(x);


% x =[];
% switch choose
%     case 1
%         %for i=1:n
%          %   if i<19
%                 %axes(handles.axes1);
%                 %bar(loadfileAqi(:,1:18));
%                 %x = [1,10,loadfileAqi(:,1:19)];
%                 %disp(loadfileAqi(:,1:18));
%                 %bar(loadfileAqi(:,1:18));
%                 %set(gca,'XTickLabel',{'6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'});
%                 %set(gca,'XTickLabel',x);
%                 %xlabel('ngay');
%                 %bar(3,24,[loadfileAqi(i)]);
%           %  end
%         %end
%         
%         for i =1 :c
%             if loadfilemonth(2,i) == 3
%                 %axes(handles.axes1);
%                 %x = [x;loadfileAqi(i)];
%                 x = [x,loadfileAqi(i)];
%                 
%                 %disp(loadfileAqi(i));
%                 
%             end
%         end
%         bar(x);
%     case 2
%         for i =1 :c
%             if loadfilemonth(2,i) == 4
%                 axes(handles.axes1);
%                 x = [x,loadfileAqi(i)];
%                 %disp(loadfileAqi(i));
%             end
%         end
%         bar(x);
%     case 3
%         for i =1 :c
%             if loadfilemonth(2,i) == 5
%                 axes(handles.axes1);
%                 x = [x,loadfileAqi(i)];
%                 %disp(loadfileAqi(i));
%             end
%         end
%         bar(x);
%     case 4
%         for i =1 :c
%             if loadfilemonth(2,i) == 6
%                 axes(handles.axes1);
%                 x = [x,loadfileAqi(i)];
%                 %disp(loadfileAqi(i));
%             end
%         end
%         bar(x);
%     case 5
%         for i =1 :c
%             if loadfilemonth(2,i) == 7
%                 axes(handles.axes1);
%                 x = [x,loadfileAqi(i)];
%                 %disp(loadfileAqi(i));
%             end
%         end
%         bar(x);
%     case 6
%         for i =1 :c
%             if loadfilemonth(2,i) == 8
%                 axes(handles.axes1);
%                 x = [x,loadfileAqi(i)];
%                 %disp(loadfileAqi(i));
%             end
%         end
%         bar(x);
%     case 7
%         for i =1 :c
%             if loadfilemonth(2,i) == 9
%                 axes(handles.axes1);
%                 x = [x,loadfileAqi(i)];
%                 %disp(loadfileAqi(i));
%             end
%         end
%         bar(x);
%     case 8
%        for i =1 :c
%             if loadfilemonth(2,i) == 10
%                 axes(handles.axes1);
%                x = [x,loadfileAqi(i)];
%                 %disp(loadfileAqi(i));
%             end
%        end
%         bar(x);
%     case 9
%         for i =1 :c
%             if loadfilemonth(2,i) == 11
%                 axes(handles.axes1);
%                 x = [x,loadfileAqi(i)];
%                 %disp(loadfileAqi(i));
%             end
%         end
%         bar(x);
% end



% --- Executes during object creation, after setting all properties.
function monthfilter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to monthfilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function tempa_Callback(hObject, eventdata, handles)
% hObject    handle to tempa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tempa as text
%        str2double(get(hObject,'String')) returns contents of tempa as a double


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    temp = get(handles.forecastTemp,'String');
    ra = get(handles.forecastRain,'String'); 
    [~, tempData, rainData, aqiData] = loadRealData();
    aqiLength = length(aqiData);
    tempLength = length(tempData);
    rainLength = length(rainData);
    minimum = min([aqiLength tempLength rainLength]);
    %disp([aqiLength tempLength rainLength]);
    aqiData = aqiData(1 : minimum);
    tempData = tempData(1 : minimum);
    rainData = rainData(1 : minimum);
    
    if (isempty(ra) || (isempty(temp)))
        if (isempty(ra) && isempty(temp))
            msgbox('Invalidate input');
        elseif (~isempty(ra))
            [rainData, aqiData] = removeDuplicatedData(rainData, aqiData);
            disp(rainData);
            output = Lagrange(rainData, aqiData, str2double(ra));
        elseif (~isempty(temp))
            [tempData, aqiData] = removeDuplicatedData(tempData, aqiData);
            output = Lagrange(tempData, aqiData, str2double(temp));
        end
    else
        output = griddata(tempData, rainData, aqiData, str2double(temp), str2double(ra));
    end
    
    set(handles.result, 'string', num2str(output));
    if output <= 50
        set(handles.evaluate,'String','Good');
        set(handles.warning,'String','Air quality is considered satisfactory, and air pollution poses little or no risk');
    elseif output <= 100
        set(handles.evaluate,'String','Moderate');
        set(handles.warning,'String','Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution.');
    elseif output <= 150
        set(handles.evaluate,'String','Unhealthy for Sensitive Groups');
        set(handles.warning,'String','Members of sensitive groups may experience health effects. The general public is not likely to be affected.');
    elseif output <= 200
        set(handles.evaluate,'String','Unhealthy');
        set(handles.warning,'String', 'Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects');
    elseif output <= 300
        set(handles.evaluate,'String','Very Unhealthy');
        set(handles.warning, 'String', 'Health warnings of emergency conditions. The entire population is more likely to be affected.');
    else
        set(handles.evaluate,'String','Good');
        set(handles.warning, 'String', 'Health alert: everyone may experience more serious health effects.');
    end



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
global firstTimeClick;
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(handles.uipanel7,'visible','on');
set(handles.uipanel9,'visible','off');
set(handles.uipanel1,'visible','off');
set(handles.uipanel2,'visible','off');
set(handles.uipanel15,'visible','on');

date = load('data/realdata/date.txt');
aqi = load('data/realdata/aqi03-072017.txt');
r = load('data/realdata/rain03-052017.txt');
disp(length(aqi));
disp(length(r));
disp(length(date));

dateInput = date(:,end-7+1:end);
% disp(dateInput);
AqiInput = aqi(:,end-7+1:end);
% disp(AqiInput);
RainInput = r(:,end-7+1:end);
% disp(RainInput);

aqidata = [AqiInput];
[RainInput, AqiInput] = removeDuplicatedData(RainInput, AqiInput);
output = Lagrange(RainInput,AqiInput,0);
disp(output);
aqiforecast = load('aqiforecast.txt');
if firstTimeClick
    fid =fopen('aqiforecast.txt','a');
    fwrite(fid,' '+string(output));
    fclose(fid);
    firstTimeClick = false;
end
axes(handles.axes6);
disp(dateInput(1,:));
plot(aqidata,'b');
grid on;
hold on;
plot(aqiforecast,'r');
hold off;


% dateInput = [10;5;2018];
% n = length(date);
% 
% d = 0;
% for i =1:n
%     if isequal(aaa,date(:,i))
% %         d=d+i;
%         disp(i);
%     end
%     
% end
% disp(d);
% originalAqi = [];
% originalrain= [];
% for j=d:n
%     for k=d:n
%         if j == k    
%             originalAqi = [originalAqi,aqi(k)];
%             originalrain = [originalrain,r(k)];
%         end
%     end
% end
% %disp(originalrain(end));



function updateTemp_Callback(hObject, eventdata, handles)
% hObject    handle to updateTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of updateTemp as text
%        str2double(get(hObject,'String')) returns contents of updateTemp as a double


% --- Executes during object creation, after setting all properties.
function updateTemp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to updateTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function updateRain_Callback(hObject, eventdata, handles)
% hObject    handle to updateRain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of updateRain as text
%        str2double(get(hObject,'String')) returns contents of updateRain as a double


% --- Executes during object creation, after setting all properties.
function updateRain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to updateRain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function tempa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tempa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function forecastTemp_Callback(hObject, eventdata, handles)
% hObject    handle to forecastTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of forecastTemp as text
%        str2double(get(hObject,'String')) returns contents of forecastTemp as a double


% --- Executes during object creation, after setting all properties.
function forecastTemp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to forecastTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function date_Callback(hObject, eventdata, handles)
% hObject    handle to date (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of date as text
%        str2double(get(hObject,'String')) returns contents of date as a double


% --- Executes during object creation, after setting all properties.
function date_CreateFcn(hObject, eventdata, handles)
% hObject    handle to date (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to updateTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of updateTemp as text
%        str2double(get(hObject,'String')) returns contents of updateTemp as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to updateTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to updateRain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of updateRain as text
%        str2double(get(hObject,'String')) returns contents of updateRain as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to updateRain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function updateAqi_Callback(hObject, eventdata, handles)
% hObject    handle to updateAqi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of updateAqi as text
%        str2double(get(hObject,'String')) returns contents of updateAqi as a double


% --- Executes during object creation, after setting all properties.
function updateAqi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to updateAqi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
dataPath;
dateData = getDateData();
date = str2double(get(handles.date, 'String'));
month = get(handles.popupmenu8,'value');

yearChosen = get(handles.popupmenu9, 'value');

year = yearChosen + 2015;

dateInput = [date; month; year];

invalidateDate = false;
if (~isdatetime(datetime(year, month, date)) || datetime(year, month, date) > datetime('now'))
    invalidateDate = true;
end
[~, n] = size(dateData);
update = false;
isDuplicated = false;
for index = 1 : n
    if isequal(dateInput, dateData(:,index))
        isDuplicated = true;
        break;
    end
end
aqiInput = get(handles.updateAqi, 'String');
tempInput = get(handles.updateTemp, 'String');
rainInput = get(handles.updateRain, 'String');

invalidateData = false;
if (isempty(aqiInput) || isempty(tempInput) || isempty(rainInput))
    invalidateData = true;
end
aqiInput = str2double(aqiInput);
tempInput = str2double(tempInput);
rainInput = str2double(rainInput);
if (invalidateDate)
    msgbox('Time is incorrect');
elseif (isDuplicated)
    msgbox('Data duplicated');
elseif (invalidateData)
    msgbox('Invalidated data');
else
    [~, tempData, rainData, aqiData] = loadRealData();
    aqiLength = length(aqiData);
    tempLength = length(tempData);
    rainLength = length(rainData);
    minimum = min([aqiLength tempLength rainLength]);
    disp([aqiLength tempLength rainLength]);
    aqiData = aqiData(1 : minimum);
    tempData = tempData(1 : minimum);
    rainData = rainData(1 : minimum);
    aqiInterpolation = griddata(tempData, rainData, aqiData, tempInput, rainInput);
    disp(aqiInput);
    disp(aqiInput - aqiInterpolation);
    if (abs(aqiInput - aqiInterpolation) > 25)
        answer = questdlg('Inputs are difference too much from interpolation result', ...
            'Do you want to continue update?', ...
            'Yes','No thank you', 'No thank you');
        if (answer == 'Yes') 
            update = true;
        end
    else 
        update = true;
    end
end

if update
    insertData(dateInput, tempInput, rainInput, aqiInput);
    msgbox('Update Successful');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu8.
function popupmenu8_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu8


% --- Executes during object creation, after setting all properties.
function popupmenu8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu9.
function popupmenu9_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu9


% --- Executes during object creation, after setting all properties.
function popupmenu9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function forecastRain_Callback(hObject, eventdata, handles)
% hObject    handle to forecastRain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of forecastRain as text
%        str2double(get(hObject,'String')) returns contents of forecastRain as a double


% --- Executes during object creation, after setting all properties.
function forecastRain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to forecastRain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
set(handles.uipanel1,'visible','off')
set(handles.uipanel2,'visible','off')
set(handles.uipanel7,'visible','off')
set(handles.uipanel9,'visible','off')
%set(handles.uipanel13,'visible','on')

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

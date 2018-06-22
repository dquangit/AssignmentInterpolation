function varargout = AQIForecast(varargin)
% AQIFORECAST MATLAB code for AQIForecast.fig
%      AQIFORECAST, by itself, creates a new AQIFORECAST or raises the existing
%      singleton*.
%
%      H = AQIFORECAST returns the handle to a new AQIFORECAST or the handle to
%      the existing singleton*.
%
%      AQIFORECAST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AQIFORECAST.M with the given input arguments.
%
%      AQIFORECAST('Property','Value',...) creates a new AQIFORECAST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AQIForecast_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AQIForecast_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AQIForecast

% Last Modified by GUIDE v2.5 19-Jun-2018 12:13:27
% Last Modified by GUIDE v2.5 18-Jun-2018 12:49:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AQIForecast_OpeningFcn, ...
                   'gui_OutputFcn',  @AQIForecast_OutputFcn, ...
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


% --- Executes just before AQIForecast is made visible.
function AQIForecast_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AQIForecast (see VARARGIN)

% Choose default command line output for AQIForecast
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.tabSearchData,'visible','on');
set(handles.tabFCast,'visible','off');
set(handles.tabCalculator,'visible','off');
set(handles.tabMonthFilter,'visible','off');
set(handles.tabUpdate,'visible','off');

% UIWAIT makes AQIForecast wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AQIForecast_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tabSearch.
function tabSearch_Callback(hObject, eventdata, handles)
% hObject    handle to tabSearch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.tabSearchData,'visible','on');
set(handles.tabFCast,'visible','off');
set(handles.tabCalculator,'visible','off');
set(handles.tabMonthFilter,'visible','off');
set(handles.tabUpdate,'visible','off');


% --- Executes on button press in tabForecast.
function tabForecast_Callback(hObject, eventdata, handles)
% hObject    handle to tabForecast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.tabSearchData,'visible','off');
set(handles.tabFCast,'visible','on');
set(handles.tabCalculator,'visible','off');
set(handles.tabMonthFilter,'visible','off');
set(handles.tabUpdate,'visible','off');

% --- Executes on button press in tabFilterMonth.
function tabFilterMonth_Callback(hObject, eventdata, handles)

% hObject    handle to tabFilterMonth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.tabSearchData,'visible','off');
set(handles.tabFCast,'visible','off');
set(handles.tabCalculator,'visible','off');
set(handles.tabMonthFilter,'visible','on');
set(handles.tabUpdate,'visible','off');

[loadfilemonth, ~, ~, loadfileAqi] = loadRealData();
yearMonth = [loadfilemonth(3,:);
     loadfilemonth(2,:)];
y = unique(yearMonth','rows')';
monthYear = [y(2,:);
             y(1,:)];
str = [monthYear(1,:)+"/"+monthYear(2,:)];
dateInput = cellstr(str);
set(handles.selectMonth,'string',dateInput);


% --- Executes on button press in tabUpdateData.
function tabUpdateData_Callback(hObject, eventdata, handles)
% hObject    handle to tabUpdateData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.tabSearchData,'visible','off');
set(handles.tabFCast,'visible','off');
set(handles.tabCalculator,'visible','off');
set(handles.tabMonthFilter,'visible','off');
set(handles.tabUpdate,'visible','on');

[dateData, tempData, rainData, aqiData] = loadRealData();
% n = length(dateData);
% o = [];
% for i=1 :n
%     o=[o;dateData(1,i)+"/"+dateData(2,i)+"/"+dateData(3,i)];
% end
% % disp(cellstr(o));
% oo = cellstr(o);

rain = load('data/realdata/rain.txt');
temp = load('data/realdata/temp.txt');
aqi = load('data/realdata/aqi.txt');
day = dateData(1,:);
month = dateData(2,:);
year = dateData(3,:);
str = [day+"/"+month+"/"+year];
dateInput = cellstr(str);

str1 = [rain+" "];
rainInput = cellstr(str1);

str2 = [temp+" "];
tempInput = cellstr(str2);

str3 = [aqi+" "];
aqiInput = cellstr(str3);

datos = [dateInput' tempInput' rainInput' aqiInput'];
set(handles.uitable1,'data',datos);



% --- Executes on button press in tabCal.
function tabCal_Callback(hObject, eventdata, handles)
% hObject    handle to tabCal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.tabSearchData,'visible','off');
set(handles.tabFCast,'visible','off');
set(handles.tabCalculator,'visible','on');
set(handles.tabMonthFilter,'visible','off');
set(handles.tabUpdate,'visible','off');

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


% --- Executes on button press in selectDay.
function selectDay_Callback(hObject, eventdata, handles)
% hObject    handle to selectDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
day = uicalendar;
disp(day);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in selectForeCastDay.
function selectForeCastDay_Callback(hObject, eventdata, handles)
% hObject    handle to selectForeCastDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in selectUpdateDay.
function selectUpdateDay_Callback(hObject, eventdata, handles)
% hObject    handle to selectUpdateDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

uicalendar('Weekend', [1 0 0 0 0 0 1], ...  
'SelectionType', 1, ...  
'DestinationUI',handles.edit5);




function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
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



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in UpdateData.
function UpdateData_Callback(hObject, eventdata, handles)
% hObject    handle to UpdateData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dataPath;
dateData = getDateData();
day = get(handles.edit5,'string');
formatIn = 'dd/mm/yyyy';
dateInput = datestr(day,formatIn)

dateInput = split(dateInput,'/')
day= str2double(dateInput(1));
month= str2double(dateInput(2));
year= str2double(dateInput(3));
dateInput = [day;month;year];

invalidateDate = false;
if (~isdatetime(datetime(year, month, day)) || datetime(year, month, day) > datetime('now'))
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
aqiInput = get(handles.edit8, 'String');
tempInput = get(handles.edit6, 'String');
rainInput = get(handles.edit7, 'String');

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
    tabUpdateData_Callback(hObject, eventdata, handles);
end



% --- Executes on selection change in selectMonth.
function selectMonth_Callback(hObject, eventdata, handles)

[loadfilemonth, ~, ~, loadfileAqi] = loadRealData();
n = length(loadfileAqi);
value = get(handles.selectMonth,'value');
choose = cellstr(get(handles.selectMonth,'string'));
splitMonth = split(choose(value),"/");
datetime = [str2double(splitMonth(1));str2double(splitMonth(2))];
[~,n] = size(loadfilemonth);
x = [];
day = [];
for i=1:n
    if isequal(datetime,loadfilemonth(2:3,i))
%         disp(loadfileAqi(i));
        day = [day,loadfilemonth(1,i)];
        x = [x,loadfileAqi(i)];
    end
end

axes(handles.axes7);
daylength = [1:length(day)];
bar(daylength,x);
set(gca, 'XTick', 1:length(day),'XTickLabel',day);

maximun = max(x);
minimun = min(x);
set(handles.highestAqi,'string',maximun);
set(handles.LowestAqi,'string',minimun);
n = length(x);
pollutiondays = [];
unpollutiondays = [];
daymax = [];
daymin = [];
for i = 1:n
    if x(i) > 100
        pollutiondays = [pollutiondays,day(i)];
    else
        unpollutiondays = [unpollutiondays,day(i)];
    end
    if x(i) == maximun
        daymax = [daymax,day(i)];
    elseif x(i) == minimun
        daymin = [daymin,day(i)];
    end
end
set(handles.PollutedDaysQuantity,'string',num2str(pollutiondays));
set(handles.UnpollutedDaysQuantity,'string',num2str(unpollutiondays));
set(handles.HighestAqiDay,'string',daymax);
set(handles.LowestAqiDay,'string',daymin);
if length(pollutiondays) > length(unpollutiondays)
    set(handles.EvaluateMonth,'string','Unhealthy');
elseif length(pollutiondays) < length(unpollutiondays)
    set(handles.EvaluateMonth,'string','Good');
end
% hObject    handle to selectMonth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns selectMonth contents as cell array
%        contents{get(hObject,'Value')} returns selected item from selectMonth


% --- Executes during object creation, after setting all properties.
function selectMonth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to selectMonth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function calTemp_Callback(hObject, eventdata, handles)
% hObject    handle to calTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of calTemp as text
%        str2double(get(hObject,'String')) returns contents of calTemp as a double


% --- Executes during object creation, after setting all properties.
function calTemp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to calTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function calRain_Callback(hObject, eventdata, handles)
% hObject    handle to calRain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of calRain as text
%        str2double(get(hObject,'String')) returns contents of calRain as a double


% --- Executes during object creation, after setting all properties.
function calRain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to calRain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
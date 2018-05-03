function varargout = updateData(varargin)
% UPDATEDATA MATLAB code for updateData.fig
%      UPDATEDATA, by itself, creates a new UPDATEDATA or raises the existing
%      singleton*.
%
%      H = UPDATEDATA returns the handle to a new UPDATEDATA or the handle to
%      the existing singleton*.
%
%      UPDATEDATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UPDATEDATA.M with the given input arguments.
%
%      UPDATEDATA('Property','Value',...) creates a new UPDATEDATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before updateData_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to updateData_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help updateData

% Last Modified by GUIDE v2.5 29-Apr-2018 07:49:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @updateData_OpeningFcn, ...
                   'gui_OutputFcn',  @updateData_OutputFcn, ...
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


% --- Executes just before updateData is made visible.
function updateData_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to updateData (see VARARGIN)

% Choose default command line output for updateData
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes updateData wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = updateData_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on selection change in month.
function month_Callback(hObject, eventdata, handles)
% hObject    handle to month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns month contents as cell array
%        contents{get(hObject,'Value')} returns selected item from month


% --- Executes during object creation, after setting all properties.
function month_CreateFcn(hObject, eventdata, handles)
% hObject    handle to month (see GCBO)
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



function temp_Callback(hObject, eventdata, handles)
% hObject    handle to temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of temp as text
%        str2double(get(hObject,'String')) returns contents of temp as a double


% --- Executes during object creation, after setting all properties.
function temp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rain_Callback(hObject, eventdata, handles)
% hObject    handle to rain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rain as text
%        str2double(get(hObject,'String')) returns contents of rain as a double


% --- Executes during object creation, after setting all properties.
function rain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in update.
function update_Callback(hObject, eventdata, handles)
dateData = load('date.txt');
date = str2double(get(handles.date, 'String'));
month = get(handles.month,'value');
yearChosen = get(handles.year, 'value');
year = yearChosen + 2016;
dateInput = [date; month; year];
[m, n] = size(dateData);
answer = '';
for index = 1 : n
    if isequal(dateInput, dateData(:,index))
        answer = questdlg('Duplicate data', ...
            'Do you want to override?', ...
            'Yes','No thank you', 'No thank you');
        break;
    end
end
update = 1;
switch answer
    case 'Yes'
        update = 1;
        disp([answer ' coming right up.'])
    case 'No thank you'
        disp([answer ' coming right up.'])
        update = 0;
end

if (update == 1)
    aqiData = load('aqi03-072017.txt');
    tempData = load('temp03-052017.txt');
    rainData = load('rain03-052017.txt');
    aqiInput = get(handles.aqi, 'String');
    tempInput = get(handles.temp, 'String');
    rainInput = get(handles.rain, 'String');
    aqiLength = length(aqiData);
    tempLength = length(tempData);
    rainLength = length(rainData);
    minimum = min([aqiLength tempLength rainLength]);
    disp([aqiLength tempLength rainLength]);
    aqiData = aqiData(1 : minimum);
    tempData = tempData(1 : minimum);
    rainData = rainData(1 : minimum);
    aqiInterpolation = griddata(tempData, rainData, aqiData, str2double(tempInput), str2double(rainInput));
    disp(aqiInterpolation);
    disp(str2double(aqiInput) - aqiInterpolation);
    if (abs(str2double(aqiInput) - aqiInterpolation) > 25)
        answer = questdlg('Inputs are difference too much from interpolation result', ...
            'Do you want to continue update?', ...
            'Yes','No thank you', 'No thank you');
    end
end

function aqi_Callback(hObject, eventdata, handles)
% hObject    handle to aqi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aqi as text
%        str2double(get(hObject,'String')) returns contents of aqi as a double


% --- Executes during object creation, after setting all properties.
function aqi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aqi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
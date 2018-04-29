function varargout = dateFilter(varargin)
% DATEFILTER MATLAB code for dateFilter.fig
%      DATEFILTER, by itself, creates a new DATEFILTER or raises the existing
%      singleton*.
%
%      H = DATEFILTER returns the handle to a new DATEFILTER or the handle to
%      the existing singleton*.
%
%      DATEFILTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATEFILTER.M with the given input arguments.
%
%      DATEFILTER('Property','Value',...) creates a new DATEFILTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dateFilter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dateFilter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dateFilter

% Last Modified by GUIDE v2.5 27-Apr-2018 18:34:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dateFilter_OpeningFcn, ...
                   'gui_OutputFcn',  @dateFilter_OutputFcn, ...
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


% --- Executes just before dateFilter is made visible.
function dateFilter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dateFilter (see VARARGIN)

% Choose default command line output for dateFilter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dateFilter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dateFilter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
date = get(handles.edit4,'string');
month = get(handles.popupmenu2,'value');
disp(date);
disp(month);
loadfiledate = load('date.txt');
disp(length(loadfiledate));
[r,c] = size(loadfiledate);
d = 0;
for j = 1:c
    if loadfiledate(1,j) == str2num(date) && loadfiledate(2,j)== month && loadfiledate(3,j) == 2017
       d =d + j;
    end
end
disp(d);
if d == 0
    msgbox('Du lieu chua duoc cap nhap');
end
loadfileAQI = load('aqi03-072017.txt');
n = length(loadfileAQI);
aqi = 0;
for i = 1:n
    if i==d
        aqi = aqi+loadfileAQI(i);
    end
end

if aqi ~= 0
    set(handles.text5,'string',aqi);
    if aqi <= 50
        set(handles.text6,'String','Good');
        set(handles.text7,'String','Air quality is considered satisfactory, and air pollution poses little or no risk');
    elseif aqi <= 100
        set(handles.text6,'String','Moderate');
        set(handles.text7,'String','Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution.');
    elseif aqi <= 150
        set(handles.text6,'String','Unhealthy for Sensitive Groups');
        set(handles.text7,'String','Members of sensitive groups may experience health effects. The general public is not likely to be affected.');
    elseif aqi <= 200
        set(handles.text6,'String','Unhealthy');
        set(handles.text7,'String', 'Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects');
    elseif aqi <= 300
        set(handles.text6,'String','Very Unhealthy');
        set(handles.text7, 'String', 'Health warnings of emergency conditions. The entire population is more likely to be affected.');
    else
        set(handles.text6,'String','Good');
        set(handles.text7, 'String', 'Health alert: everyone may experience more serious health effects.');
    end
end

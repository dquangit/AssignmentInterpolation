function varargout = forecast(varargin)
% FORECAST MATLAB code for forecast.fig
%      FORECAST, by itself, creates a new FORECAST or raises the existing
%      singleton*.
%
%      H = FORECAST returns the handle to a new FORECAST or the handle to
%      the existing singleton*.
%
%      FORECAST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORECAST.M with the given input arguments.
%
%      FORECAST('Property','Value',...) creates a new FORECAST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before forecast_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to forecast_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help forecast

% Last Modified by GUIDE v2.5 22-Apr-2018 09:09:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @forecast_OpeningFcn, ...
                   'gui_OutputFcn',  @forecast_OutputFcn, ...
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


% --- Executes just before forecast is made visible.
function forecast_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to forecast (see VARARGIN)

% Choose default command line output for forecast
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes forecast wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = forecast_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function temperature_Callback(hObject, eventdata, handles)
% hObject    handle to temperature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of temperature as text
%        str2double(get(hObject,'String')) returns contents of temperature as a double


% --- Executes during object creation, after setting all properties.
function temperature_CreateFcn(hObject, eventdata, handles)
% hObject    handle to temperature (see GCBO)
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


% --- Executes on button press in execute.
function execute_Callback(hObject, eventdata, handles)


temp = get(handles.temperature,'String');
ra = get(handles.rain,'String');
temp = get(handles.temperature,'String');
ra = get(handles.rain,'String'); 

aqiData = load('aqi03-072017.txt');
tempData = load('temp03-052017.txt');
    rainData = load('rain03-052017.txt');
    aqiLength = length(aqiData);
    tempLength = length(tempData);
    rainLength = length(rainData);
    minimum = min([aqiLength tempLength rainLength]);
    disp([aqiLength tempLength rainLength]);
    aqiData = aqiData(1 : minimum);
    tempData = tempData(1 : minimum);
    rainData = rainData(1 : minimum);
    
    if (isempty(ra) || (isempty(temp)))
        if (isempty(ra) && isempty(temp))
            msgbox('Invalidate input');
        elseif (~isempty(ra))
            [rainData, aqiData] = removeDuplicatedData(rainData, aqiData);
            output = Lagrange(rainData, aqiData, str2double(ra));
            disp(output);
        elseif (~isempty(temp))
            [tempData, aqiData] = removeDuplicatedData(tempData, aqiData);
            output = Lagrange(tempData, aqiData, str2double(temp));
            disp(output);
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
    guidata(hObject, handles);
    

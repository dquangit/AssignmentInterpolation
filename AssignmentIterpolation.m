function varargout = AssignmentIterpolation(varargin)
% ASSIGNMENTITERPOLATION MATLAB code for AssignmentIterpolation.fig
%      ASSIGNMENTITERPOLATION, by itself, creates a new ASSIGNMENTITERPOLATION or raises the existing
%      singleton*.
%
%      H = ASSIGNMENTITERPOLATION returns the handle to a new ASSIGNMENTITERPOLATION or the handle to
%      the existing singleton*.
%
%      ASSIGNMENTITERPOLATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENTITERPOLATION.M with the given input arguments.
%
%      ASSIGNMENTITERPOLATION('Property','Value',...) creates a new ASSIGNMENTITERPOLATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AssignmentIterpolation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AssignmentIterpolation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AssignmentIterpolation

% Last Modified by GUIDE v2.5 02-Apr-2018 06:21:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AssignmentIterpolation_OpeningFcn, ...
                   'gui_OutputFcn',  @AssignmentIterpolation_OutputFcn, ...
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


% --- Executes just before AssignmentIterpolation is made visible.
function AssignmentIterpolation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AssignmentIterpolation (see VARARGIN)

% Choose default command line output for AssignmentIterpolation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AssignmentIterpolation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AssignmentIterpolation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in aqiDataButton.
function aqiDataButton_Callback(hObject, eventdata, handles)
[filename1, filepath1]=uigetfile({'*.txt'},...
  'Select AQI Data File');
  aqiDataPath = [filepath1 filename1];
  setappdata(0, 'aqiDataPath', aqiDataPath);


% --- Executes on button press in pollutionFactorButton.
function pollutionFactorButton_Callback(hObject, eventdata, handles)
[filename1, filepath1]=uigetfile({'*.txt'},...
  'Select Pollution Factor Data File');
  cd(filepath1);
  factorDataPath=[filepath1 filename1];
  setappdata(0, 'factorDataPath', factorDataPath);



function inputTxt_Callback(hObject, eventdata, handles)
% hObject    handle to inputTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputTxt as text
%        str2double(get(hObject,'String')) returns contents of inputTxt as a double


% --- Executes during object creation, after setting all properties.
function inputTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in algorithmChooser.
function algorithmChooser_Callback(hObject, eventdata, handles)
 
 aqiDataFilePath = getappdata(0, 'aqiDataPath');
 aqiData = load(aqiDataFilePath);
 
 factorDataFilePath = getappdata(0, 'factorDataPath');
 factorData = load(factorDataFilePath);
 
 dataPoint = str2double(get(handles.inputTxt, 'String'));

 
 algorithmChooser = get(handles.algorithmChooser,'Value');
 if algorithmChooser == 1
     output = Lagrange(factorData, aqiData, dataPoint);
 elseif algorithmChooser == 2
     output = Newton(factorData, aqiData, dataPoint);
 elseif algorithmChooser == 3
     output = AitkenNeville(factorData, aqiData, dataPoint);
 else
    factorDataX = factorData(1, :);
    factorDataY = factorData(2, :);
    disp(factorDataX);
    dataPoint = strsplit(get(handles.inputTxt, 'String'));
    dataPointX = str2double(dataPoint(1));
    dataPointY = str2double(dataPoint(2));
    flag = false;
    for index = 1 : length(aqiData)
        if ((factorDataX(index) == dataPointX) && (factorDataY(index) == dataPointY))
            output = aqiData(index);
            flag = true;
            break;
        end
    end
    if flag == false
        output = griddata(factorDataX, factorDataY, aqiData, dataPointX, dataPointY);
    end
 end
 
 output = round(output);
 disp(output);
 set(handles.resultTxt, 'string', num2str(output));
    if output <= 50 
        handles = setLevelAndMessage(handles, 'Good', 'Air quality is considered satisfactory, and air pollution poses little or no risk');
    elseif output <= 100
        handles = setLevelAndMessage(handles, 'Moderate', 'Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution.');
    elseif output <= 150
        handles = setLevelAndMessage(handles, 'Unhealthy for Sensitive Groups', 'Members of sensitive groups may experience health effects. The general public is not likely to be affected.');
    elseif output <= 200
        handles = setLevelAndMessage(handles, 'Unhealthy', 'Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects');
    elseif output <= 300
        handles = setLevelAndMessage(handles, 'Very Unhealthy', 'Health warnings of emergency conditions. The entire population is more likely to be affected.');
    else
        handles = setLevelAndMessage(handles, 'Hazardous', 'Health alert: everyone may experience more serious health effects.');
    end
    guidata(hObject, handles);
    
% --- Executes during object creation, after setting all properties.
function algorithmChooser_CreateFcn(hObject, eventdata, handles)
% hObject    handle to algorithmChooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function [out] = setLevelAndMessage(handles, level, message)
    set(handles.levelTxt, 'string', level);
    set(handles.messageTxt, 'string', message);
    out = handles;

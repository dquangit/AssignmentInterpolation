function varargout = monthFilter(varargin)
% MONTHFILTER MATLAB code for monthFilter.fig
%      MONTHFILTER, by itself, creates a new MONTHFILTER or raises the existing
%      singleton*.
%
%      H = MONTHFILTER returns the handle to a new MONTHFILTER or the handle to
%      the existing singleton*.
%
%      MONTHFILTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MONTHFILTER.M with the given input arguments.
%
%      MONTHFILTER('Property','Value',...) creates a new MONTHFILTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before monthFilter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to monthFilter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help monthFilter

% Last Modified by GUIDE v2.5 22-Apr-2018 08:22:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @monthFilter_OpeningFcn, ...
                   'gui_OutputFcn',  @monthFilter_OutputFcn, ...
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


% --- Executes just before monthFilter is made visible.
function monthFilter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to monthFilter (see VARARGIN)

% Choose default command line output for monthFilter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes monthFilter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = monthFilter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in monthChooser.
function monthChooser_Callback(hObject, eventdata, handles)
% hObject    handle to monthChooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns monthChooser contents as cell array
%        contents{get(hObject,'Value')} returns selected item from monthChooser

loadfileAqi = load('aqi03-072017.txt');
n = length(loadfileAqi);
disp(n);
choose = get(handles.monthChooser,'value');
switch choose
    case 1
        %for i=1:n
         %   if i<19
                axes(handles.axes1);
                %x = [1,10,loadfileAqi(:,1:19)];
                disp(loadfileAqi(:,1:18));
                bar(loadfileAqi(:,1:18));
                %set(gca,'XTickLabel',{'6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'});
                %set(gca,'XTickLabel',x);
                %xlabel('ngay');
                %bar(3,24,[loadfileAqi(i)]);
          %  end
        %end
    case 2
        axes(handles.axes1);
        bar(loadfileAqi(:,19:43));
    case 3
        axes(handles.axes1);
        bar(loadfileAqi(:,44:74));
    case 4
        axes(handles.axes1);
        bar(loadfileAqi(:,75:104));
    case 5
        axes(handles.axes1);
        bar(loadfileAqi(:,105:135));
    case 6
        axes(handles.axes1);
        bar(loadfileAqi(:,136:166));
    case 7
        axes(handles.axes1);
        bar(loadfileAqi(:,167:196));
    case 8
        axes(handles.axes1);
        bar(loadfileAqi(:,197:216));
    case 9
        axes(handles.axes1);
        bar(loadfileAqi(:,217:227));
end


% --- Executes during object creation, after setting all properties.
function monthChooser_CreateFcn(hObject, eventdata, handles)
% hObject    handle to monthChooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

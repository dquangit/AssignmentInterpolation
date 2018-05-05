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

% Last Modified by GUIDE v2.5 05-May-2018 10:29:12

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
set(handles.uipanel1,'visible','on')
set(handles.uipanel2,'visible','off')
set(handles.uipanel7,'visible','off')
set(handles.uipanel9,'visible','on')


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'visible','off')
set(handles.uipanel2,'visible','on')
set(handles.uipanel7,'visible','off')
set(handles.uipanel9,'visible','off')



function day_Callback(hObject, eventdata, handles)
% hObject    handle to day (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of day as text
%        str2double(get(hObject,'String')) returns contents of day as a double


% --- Executes during object creation, after setting all properties.
function day_CreateFcn(hObject, eventdata, handles)
% hObject    handle to day (see GCBO)
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


% --- Executes on button press in search.
function search_Callback(hObject, eventdata, handles)
% hObject    handle to search (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
date = get(handles.day,'string');
month = get(handles.month,'value');
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
    set(handles.text6,'string',aqi);
    if aqi <= 50
        set(handles.text8,'String','Good');
        set(handles.text10,'String','Air quality is considered satisfactory, and air pollution poses little or no risk');
    elseif aqi <= 100
        set(handles.text8,'String','Moderate');
        set(handles.text10,'String','Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution.');
    elseif aqi <= 150
        set(handles.text8,'String','Unhealthy for Sensitive Groups');
        set(handles.text10,'String','Members of sensitive groups may experience health effects. The general public is not likely to be affected.');
    elseif aqi <= 200
        set(handles.text8,'String','Unhealthy');
        set(handles.text10,'String', 'Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects');
    elseif aqi <= 300
        set(handles.text8,'String','Very Unhealthy');
        set(handles.text10, 'String', 'Health warnings of emergency conditions. The entire population is more likely to be affected.');
    else
        set(handles.text8,'String','Good');
        set(handles.text10, 'String', 'Health alert: everyone may experience more serious health effects.');
    end
end


% --- Executes on selection change in monthfilter.
function monthfilter_Callback(hObject, eventdata, handles)
% hObject    handle to monthfilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns monthfilter contents as cell array
%        contents{get(hObject,'Value')} returns selected item from monthfilter


loadfileAqi = load('aqi03-072017.txt');
n = length(loadfileAqi);
%disp(n);
choose = get(handles.monthfilter,'value');

loadfilemonth = load('date.txt');
[r,c] = size(loadfilemonth);

% for i =1 :c
%     if loadfilemonth(2,i) == 4
%         disp(loadfileAqi(i));
%     end
% end
x =[];
switch choose
    case 1
        %for i=1:n
         %   if i<19
                %axes(handles.axes1);
                %bar(loadfileAqi(:,1:18));
                %x = [1,10,loadfileAqi(:,1:19)];
                %disp(loadfileAqi(:,1:18));
                %bar(loadfileAqi(:,1:18));
                %set(gca,'XTickLabel',{'6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'});
                %set(gca,'XTickLabel',x);
                %xlabel('ngay');
                %bar(3,24,[loadfileAqi(i)]);
          %  end
        %end
        
        for i =1 :c
            if loadfilemonth(2,i) == 3
                %axes(handles.axes1);
                %x = [x;loadfileAqi(i)];
                x = [x,loadfileAqi(i)];
                
                %disp(loadfileAqi(i));
                
            end
        end
        bar(x);
    case 2
        for i =1 :c
            if loadfilemonth(2,i) == 4
                axes(handles.axes1);
                x = [x,loadfileAqi(i)];
                %disp(loadfileAqi(i));
            end
        end
        bar(x);
    case 3
        for i =1 :c
            if loadfilemonth(2,i) == 5
                axes(handles.axes1);
                x = [x,loadfileAqi(i)];
                %disp(loadfileAqi(i));
            end
        end
        bar(x);
    case 4
        for i =1 :c
            if loadfilemonth(2,i) == 6
                axes(handles.axes1);
                x = [x,loadfileAqi(i)];
                %disp(loadfileAqi(i));
            end
        end
        bar(x);
    case 5
        for i =1 :c
            if loadfilemonth(2,i) == 7
                axes(handles.axes1);
                x = [x,loadfileAqi(i)];
                %disp(loadfileAqi(i));
            end
        end
        bar(x);
    case 6
        for i =1 :c
            if loadfilemonth(2,i) == 8
                axes(handles.axes1);
                x = [x,loadfileAqi(i)];
                %disp(loadfileAqi(i));
            end
        end
        bar(x);
    case 7
        for i =1 :c
            if loadfilemonth(2,i) == 9
                axes(handles.axes1);
                x = [x,loadfileAqi(i)];
                %disp(loadfileAqi(i));
            end
        end
        bar(x);
    case 8
       for i =1 :c
            if loadfilemonth(2,i) == 10
                axes(handles.axes1);
               x = [x,loadfileAqi(i)];
                %disp(loadfileAqi(i));
            end
       end
        bar(x);
    case 9
        for i =1 :c
            if loadfilemonth(2,i) == 11
                axes(handles.axes1);
                x = [x,loadfileAqi(i)];
                %disp(loadfileAqi(i));
            end
        end
        bar(x);
end



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


temp = get(handles.edit7,'String');
ra = get(handles.rain,'String'); 


aqiData = load('aqi03-072017.txt');
tempData = load('temp03-052017.txt');

    rainData = load('rain03-052017.txt');
    disp(length(rainData));
    disp(length(aqiData));
    disp(length(tempData));
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
            [output,x] = Lagrange(rainData, aqiData, str2double(ra));
             axes(handles.axes4);
             disp(output);
             plot(x);
             grid on;
             hold on;
             plot(aqiData);
        elseif (~isempty(temp))
            [tempData, aqiData] = removeDuplicatedData(tempData, aqiData);
            [output,x] = Lagrange(tempData, aqiData, str2double(temp));
             axes(handles.axes4);
%            x = [aqiData];
             plot(x);
             grid on;
             hold on;
             plot(aqiData);
            
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
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel7,'visible','on');
set(handles.uipanel9,'visible','off');
set(handles.uipanel1,'visible','off')
set(handles.uipanel2,'visible','off')



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
% hObject    handle to temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of temp as text
%        str2double(get(hObject,'String')) returns contents of temp as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to rain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rain as text
%        str2double(get(hObject,'String')) returns contents of rain as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
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
if (datetime(year, month, date) > datetime('now'))
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
aqiInput = get(handles.aqi, 'String');
tempInput = get(handles.temp, 'String');
rainInput = get(handles.rain, 'String');

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
    aqiData = getAqi();
    tempData = getTemperature();
    rainData = getRain();
    aqiLength = length(aqiData);
    tempLength = length(tempData);
    rainLength = length(rainData);
    minimum = min([aqiLength tempLength rainLength]);
    disp([aqiLength tempLength rainLength]);
    aqiData = aqiData(1 : minimum);
    tempData = tempData(1 : minimum);
    rainData = rainData(1 : minimum);
    aqiInterpolation = griddata(tempData, rainData, aqiData, tempInput, rainInput);
    disp(aqiInterpolation);
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

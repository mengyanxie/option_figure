function varargout = optionui(varargin)
% OPTIONUI MATLAB code for optionui.fig
%      OPTIONUI, by itself, creates a new OPTIONUI or raises the existing
%      singleton*.
%
%      H = OPTIONUI returns the handle to a new OPTIONUI or the handle to
%      the existing singleton*.
%
%      OPTIONUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPTIONUI.M with the given input arguments.
%
%      OPTIONUI('Property','Value',...) creates a new OPTIONUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before optionui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to optionui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help optionui

% Last Modified by GUIDE v2.5 28-May-2015 17:10:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @optionui_OpeningFcn, ...
                   'gui_OutputFcn',  @optionui_OutputFcn, ...
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


% --- Executes just before optionui is made visible.
function optionui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to optionui (see VARARGIN)

% Choose default command line output for optionui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using optionui.
if strcmp(get(hObject,'Visible'),'off')
    plot(rand(5));
end

% UIWAIT makes optionui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = optionui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in add_button.
function add_button_Callback(hObject, eventdata, handles)
% hObject    handle to add_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get_quantity=get(handles.quantity,'String');
get_strikeprice=get(handles.strike_price,'String');
get_optionprice=get(handles.rate,'String');
get_longshort=handles.long_short;
get_callput=handles.call_put;

%set(handles.test_Text,'String',get_number);

%newdata=[olddata;Data];

option_Data{1}=get_callput;
option_Data{2}=get_longshort;
option_Data{3}=get_strikeprice;
option_Data{4}=get_optionprice;
option_Data{5}=get_quantity;

old_data=get(handles.option_table,'Data');

if isempty(old_data{1,1})
    %set(handles.test_Text,'String',option_Data);
    %option_Data

    new_data=option_Data;
else
    new_data=[old_data;option_Data];
end
set(handles.option_table,'Data',new_data);
%set(handles.test_Text,'String',new_data);
guidata(hObject,handles);


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});



function quantity_Callback(hObject, eventdata, handles)
% hObject    handle to quantity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of quantity as text
%        str2double(get(hObject,'String')) returns contents of quantity as a double
input=str2num(get(hObject,'String'));
if (isempty(input))
    set(hObject,'String','0')
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function quantity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to quantity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in run_button.
function run_button_Callback(hObject, eventdata, handles)
% hObject    handle to run_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.test_Text,'String','Please wait');
cla;
data=get(handles.option_table,'Data');
markx=[];
strikeMat = cell2mat([cellfun(@str2num,data(:,3),'un',0).']);
optionMat = cell2mat([cellfun(@str2num,data(:,4),'un',0).']);
max_strike=max(strikeMat);
max_option_price=max(optionMat);
min_strike=min(strikeMat);
min_option_price=min(optionMat);
maxiter=3*max(max_strike,max_option_price);
%miniter=min(min_strike,min_option_price);
miniter=0;
nums=10000;
length=floor((maxiter-miniter)*nums);
gap=(maxiter-miniter)/length;
x=zeros(1,length);
slope=zeros(1,length);
y=zeros(1,length);
j=0;
%disp(size(x));
threshold=0.00001;
iteration=1;
for i=miniter:gap:maxiter
    x(iteration)=i;
    y(iteration)=option_price(data,i);
    if iteration~=1
        slope(iteration)=y(iteration)-y(iteration-1);
    end
    
    if iteration~=1 && iteration~=2
        if abs(slope(iteration)-slope(iteration-1))>threshold && isempty(markx)
            markx(j+1,:)=[i,y(iteration)];
            j=j+1;
        elseif abs(slope(iteration)-slope(iteration-1))>threshold && i-markx(j)>0.00002
            markx(j+1,:)=[i,y(iteration)];
            j=j+1;
        end
    end
    iteration=iteration+1;
end
%f=figure(x,y);
plot(x,y);
hold on;
disp(size(x));
disp(size(y));
for i=1:size(markx)
    xmark=markx(i,1);
    ymark=markx(i,2);
    strmark=[num2str(xmark),num2str(ymark)];
    %strmarky=num2str(ymark);
    plot(xmark,ymark,'*');
    %text(0.9*maxiter,ymark+i*0.5*maxiter,strmark,'FontSize',15);
    text(xmark,ymark+0.05*i,strmark,'FontSize',15)
    hold on;
end
xlabel('Strike price','FontSize',15);
ylabel('Pay off','FontSize',15);
title('Option pay off figure','FontSize',15)
    
%y=long_call(data,1)+short_call(data,1)+long_put(data,1)+short_put(data,1);
%set(handles.test_Text,'String',y);
%set(handles.option_figure,x,y);
guidata(hObject,handles)


% --- Executes on selection change in long_short.
function long_short_Callback(hObject, eventdata, handles)
% hObject    handle to long_short (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns long_short contents as cell array
%        contents{get(hObject,'Value')} returns selected item from long_short
str = get(hObject, 'String');
val = get(hObject,'Value');
% Set current data to the selected data set.
switch str{val};
    case 'select'
        handles.long_short='0';
    case 'long' % User selects peaks.
        handles.long_short = '+';
    case 'short' % User selects membrane.
        handles.long_short = '-';
end
% Save the handles structure.
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function long_short_CreateFcn(hObject, eventdata, handles)
% hObject    handle to long_short (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function strike_price_Callback(hObject, eventdata, handles)
% hObject    handle to strike_price (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of strike_price as text
%        str2double(get(hObject,'String')) returns contents of strike_price as a double
input=str2num(get(hObject,'String'));
if (isempty(input))
    set(hObject,'String','0')
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function strike_price_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strike_price (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rate_Callback(hObject, eventdata, handles)
% hObject    handle to rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rate as text
%        str2double(get(hObject,'String')) returns contents of rate as a double
input=str2num(get(hObject,'String'));
if (isempty(input))
    set(hObject,'String','0')
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function rate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in call_put.
function call_put_Callback(hObject, eventdata, handles)
% hObject    handle to call_put (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns call_put contents as cell array
%        contents{get(hObject,'Value')} returns selected item from call_put
% Determine the selected data set.
str = get(hObject, 'String');
val = get(hObject,'Value');
% Set current data to the selected data set.
switch str{val};
    case 'select'
        handles.call_put='0';
    case 'call option' % User selects peaks.
        handles.call_put = 'c';
    case 'put option' % User selects membrane.
        handles.call_put = 'p';
end
% Save the handles structure.
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function call_put_CreateFcn(hObject, eventdata, handles)
% hObject    handle to call_put (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function test_Text_Callback(hObject, eventdata, handles)


function test_Text_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function option_table_CreateFcn(hObject, eventdata, handles)
colnames={'call or put','long or short','strike price','option price','quantity'};
columnwidth={125 125 125 125 125};
set(hObject,'ColumnName',colnames,'ColumnWidth',columnwidth);
guidata(hObject,handles)

function[value]= option_price(option_data,x)
value=0;
for i=1:size(option_data,1)
    disc=[option_data{i,1},option_data{i,2}];
    st=str2num(option_data{i,3});
    c=str2num(option_data{i,4});
    num=str2num(option_data{i,5});
    switch disc
        case 'c+'
            if x<st
                value=value-c*num;
            else
                value=value+(x-st-c)*num;
            end 
        case 'c-'
            if x<st
                value=value+c*num;
            else
                value=value-(x-st-c)*num;
            end
        case 'p+'
            if x<st
                value=value+(-x+st-c)*num;
            else
                value=value-c*num;
            end
        case 'p-'
            if x<st
                value=value+(x-st+c)*num;
            else
                value=value+c*num;
            end
        otherwise 
            value=0;
    end
end
   



function expiration_time_Callback(hObject, eventdata, handles)
% hObject    handle to expiration_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of expiration_time as text
%        str2double(get(hObject,'String')) returns contents of expiration_time as a double


% --- Executes during object creation, after setting all properties.
function expiration_time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to expiration_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in select_yield.
function select_yield_Callback(hObject, eventdata, handles)
% hObject    handle to select_yield (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns select_yield contents as cell array
%        contents{get(hObject,'Value')} returns selected item from select_yield


% --- Executes during object creation, after setting all properties.
function select_yield_CreateFcn(hObject, eventdata, handles)
% hObject    handle to select_yield (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

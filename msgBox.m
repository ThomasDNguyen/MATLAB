%-------------------------------------------------------------------------%
%------------------------------Notations----------------------------------%
%-------------------------------------------------------------------------%
%
% This is a function to create a custom message box.
% Usage: 
% 1. 'msgBox(enter_str_here)' ;or 
% 2. Change the message content by uncommenting the line below the %Display
% and enter string.
% Customization:
% - Change the message box's position and size constants in the %Const.
% - Change the message box's visual presentation in the %Properties.
% *NOTE: highly reuseable code.

%-------------------------------------------------------------------------%
%--------------------------------msgBOX-----------------------------------%
%-------------------------------------------------------------------------%
%
function[] = msgBox(str)

%Display:
%str="Enter_a_string_here"; %message

%Consts: 
hor=400; %horizontal shift 
ver=440; %vertical shift
leng=160; %box's length
wid=55; %box's width
           
%Properties
h = msgbox(str); %message box function
ah = get( h, 'CurrentAxes' );
ch = get( ah, 'Children' );
set(h, 'position', [hor ver leng wid]); %box position and size
set(ch, 'FontSize', 18); %font size
set(ch, 'FontName', 'Times New Roman'); %font type
    
end%msgBOX
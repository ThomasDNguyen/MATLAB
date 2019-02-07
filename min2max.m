%-------------------------------------------------------------------------%
%------------------------------Notations----------------------------------%
%-------------------------------------------------------------------------%
%
%This is a function to swap the values of 2 variables if the former is 
%larger than the latter.
%Usage: min2max(a,b) => if a>b then swap; else return.

%-------------------------------------------------------------------------%
%-------------------------------min2max-----------------------------------%
%-------------------------------------------------------------------------%
%
function[min,max] = min2max(min,max)
if min>max %if former>latter
    holder=min; %store min's value to holder
    min=max; %assign max's value to min
    max=holder; %assign holder's value (which is = to min's) to max
else
    return
end
%Write a function that takes a 1xn matrix as input and outputs 2 seperate 
%matrixes: one containing all and only the even elements of the input  
%matrix, the other containing all and only the odd elements.

%Sample input for A:
%A=[1 4 5 6 2 6 7 3 64 5 4 1 7] ;or
%A = randi([1 50],1,15)

%Main function here:
function[] = sortEvenOdd(A)
[Aodd,Aeven] = sort(A);                %calling the local func
disp('Even numbers of matrix A: ');    %display message
disp(Aeven);                           %display the even row array
disp('Odd numbers of matrix A: ');     %display message
disp(Aodd);                            %display the odd row array
end%sortEvenOdd()

%Local function:
function[Aodd,Aeven] = sort(A)
even = rem(A,2) == 0;     %even is a logical array that takes value 1 for every even int element of A 
Aeven = A(even);          
Aodd = A(~even);          
end%sort()
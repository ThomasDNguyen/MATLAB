function [] = exam_2018 (task)
 
%Please follow the instructions in the following tasks. 
%In each section of the if-structure you are given an assignment. 
%Modify this file such that your contribution fulfills the given task. 
%Do NOT change the if-structure! Lines marked by comment %JOJ
%Try to use the routines given in HINTs. 
%Remember Matlab help! Pay attention to save your work sufficiently often. 
%USE COMMENT LINES! 
 
 
 
if(task==1)%JOJ
%Compute%JOJ
%a) (2+3)*(4+5)%JOJ
%b) the square root of 2%JOJ
%c) the dot product of vectors [1 2 3 ... 100] and [2 5 8 ... 299].%JOJ
%HINT: sqrt, sum, [a:n:b]%JOJ
disp(['--------------------------------------------------------------------------------']);%JOJ
disp(['Exercise ',num2str(task),':']);%JOJ

a=(2+3)*(4+5);
b=sqrt(2);
c=[1:1:100]*[2:3:299]';
%Alternative way to do the dot product
%c1=[1:1:100];
%c2=[2:3:299];
%C=dot(c1,c2); 
disp(['a) ', num2str(a)]);
disp(['b) ', num2str(b)]);
disp(['c) ', num2str(c)]);
%disp(['C) ', num2str(C)]);
 
elseif(task==2)%JOJ
%Produce a graph of a function of your choice%JOJ
%(a sinusoidal function in the interval [0,2*pi] for example).%JOJ
%HINT: linspace , sin, figure, plot%JOJ
disp(['--------------------------------------------------------------------------------']);%JOJ
disp(['Exercise ',num2str(task),':']);%JOJ

disp(['(Check Figure ',num2str(task),')']);
%This is a function of a circle
%Here is where we define the CONSTs 
fig=2;
N=1000; %Number of points
r=4; %Radius

%Here is where we define our algorithms
theta=linspace(0,2.*pi,N); %table of contents of the angle theta  
rho=cos(theta).*r; %function
%rho=sin(theta).*r; %it's all the same 'cause they both make a full revolusion

%Here is where we plot the figure
figure(fig);
clf;
hold on;
polar(theta,rho,'b.');
title('Circle drawn with the "polar" function');
grid on;
 
elseif(task==3)%JOJ
%Produce another figure including graphs of%JOJ
%a straight line with slope 1 passing through point (x,y)=(0,-2)%JOJ
%and a rightwards opening parabola (the root function).%JOJ
%What are the interception points of those graphs?%JOJ
%HINT: linspace , figure, clf, hold, plot, grid, axis%JOJ
disp(['--------------------------------------------------------------------------------']);%JOJ
disp(['Exercise ',num2str(task),':']);%JOJ

disp(['(Check Figure ',num2str(task),')']);
 
%Global Const:
N=1000; %Number of points

%------------------------------------------------------------------------%
%--------------------------------Parabola--------------------------------%
%------------------------------------------------------------------------%
%Function of the open-right Parabola: x=a*(y-k).^2+h %Vertex form

%Here is where we specify the Consts:
Ymax=10; %Maximum value of y (starting from the vertex)
%Vertex=(h,k)
h=0; %horizontal shift
k=0; %vertical shift 
a=1; %slope (probably :v idk what 'a' in the quadratic formula is called :w)
dy=2*Ymax/(N-1); %Step size

%Here is where we specify the x,y values for plotting%
y=[-Ymax:dy:Ymax]; %Table of content of y values
x=a*(y-k).^2+h;

%-------------------------------------------------------------------------%
%------------------------------Straight Line------------------------------%
%-------------------------------------------------------------------------%
%Function of the Straight Line: Y=A*X+B

%Here is where we specify the Consts:
Xmax=10; %Maximum value of x (starting form the midpoint)
A=1; %slope
B=-2; %y-intercept
%(-B/A)is the x-intercept btw
dx=2*Xmax/(N-1); %Step size

%Here is where we specify the x,y values for plotting%
X=[-Xmax:dx:Xmax]; %Table of content of x values
Y=A*X+B;

%-------------------------------------------------------------------------%
%---------------------------Intersection Points---------------------------%
%-------------------------------------------------------------------------%
%Intersection points equation: a*(yIP-k).^2+h = (1/A)*yIP-(B/A)

syms yIP
eqn=a*yIP^2-yIP*(2*a*k+1/A)+a*k^2+h+B/A==0;
soly = solve(eqn,yIP);
x1=(soly(1)-B)/A;
x2=(soly(2)-B)/A;
disp(['Intersection points:']);
disp(['(x1, y1)=(',num2str(char(x1)),', ',num2str(char(soly(1))),')']);
disp(['(x2, y2)=(',num2str(char(x2)),', ',num2str(char(soly(2))),')']);

%-------------------------------------------------------------------------%
%Here is where we plot the graphs:
figure(3);
clf;
hold on;
plot(x,y,'b.-','DisplayName',strcat('x = ',num2str(a),'[y-(',num2str(k),')]^2+(',num2str(h),')'));
plot(X,Y,'r.-','DisplayName',strcat('y = ',num2str(A),'x+(',num2str(B),')'));
text(x1,soly(1),strcat('(',num2str(char(x1)),', ',num2str(char(soly(1))),')\rightarrow'),'HorizontalAlignment','right')
text(x2,soly(2),strcat('\leftarrow(',num2str(char(x2)),',',num2str(char(soly(2))),')'),'HorizontalAlignment','left')
grid on;
xlabel('x-axis');
ylabel('y-axis');
legend;


elseif(task==4)%JOJ
%Solve the system of equations:%JOJ
%x+2y+3z+4w=5%JOJ
%2x+3y+4z+5w=6%JOJ
%3x-4y-5z-6w=7%JOJ
%5x-4y+3z-2w=1%JOJ
%HINT: [,,;,,]', \, inv%JOJ
disp(['--------------------------------------------------------------------------------']);%JOJ
disp(['Exercise ',num2str(task),':']);%JOJ

A=[1 2 3 4;... %coefficients
   2 3 4 5;...
   3 -4 -5 -6;...
   5 -4 3 -2];
B=[5 6 7 1]'; %results

%Equation: A*X = B ==> X = inv(A)*B or X = A\B (NOTE: it's A 'backslash' B)
X=A\B;
x=X(1);
y=X(2);
z=X(3);
w=X(4);
disp(['x = ',num2str(x)])
disp(['y = ',num2str(y)])
disp(['z = ',num2str(z)])
disp(['w = ',num2str(w)])


%Alternative solution (NOTE: requires 'Symbolic Math Toolbox')
%syms x y z w
%eqn1=x+2*y+3*z+4*w==5;
%eqn2=2*x+3*y+4*z+5*w==6;
%eqn3=3*x-4*y-5*z-6*w==7;
%eqn4=5*x-4*y+3*z-2*w==1;

%sol = solve([eqn1, eqn2, eqn3, eqn4], [x, y, z, w]);
%xSol = sol.x
%ySol = sol.y
%zSol = sol.z
%wSol = sol.w

elseif(task==5)%JOJ
%Compare the speeds of matrix inversion routines 'inv' and '\' (slash).%JOJ
%Test matrices of different sizes.%JOJ
%You may want to draw a figure of the timing data.%JOJ
%Which do you consider faster?%JOJ
%HINT: zeros, for, rand, tic, toc, plot%JOJ
disp(['--------------------------------------------------------------------------------']);%JOJ
disp(['Exercise ',num2str(task),':']);%JOJ

disp(['(Check Figure ',num2str(task),')']);

%Global Const:
N=100; %Number of measurements

%-------------------------------------------------------------------------%
%Main:
t1 = zeros(1,N); %Creating a matrix of N cells to contain the toc values
t2 = zeros(1,N);
for n = 1:N %Creating a loop to do the measuring N times
    a = rand(n,n); %random (n,n) matrix 
    b = rand(n,1); %random (n,1) matrix 
    tic; %Start timer
    x = a\b; %Using '\'
    t1(n) = toc; %Assigning toc(elasped time) to one of t1's cells
    tic; %Start timer
    X = inv(a)*b; %Using 'inv()'
    t2(n) = toc; %Assigning toc(elasped time) to one of t2's cells
end

%-------------------------------------------------------------------------%
%Here is where we compare the 2 matrix inversion routines' speed
M1=mean(t1); %Finding mean value of t1
M2=mean(t2); %Finding mean value of t2
if M1>M2
    disp('Using "inv()" is faster.')
elseif M2>M1
    disp('Using " \ " is faster.')
else 
    disp('They are surprisingly the same... at least in this measurement :p')
end

%-------------------------------------------------------------------------%
%Here is where we plot the graphs:
figure(5);
clf;
hold on;
plot(t1);
plot(t2);
title("Graph comparing the speeds of matrix inversion routines")
legend('inv()',' \ ')
grid on;
warning off;

elseif(task==6)%JOJ
%Integrate sin(x/2)/x with respect to x from 0 to 1.%JOJ
%HINT: sum%JOJ
disp(['--------------------------------------------------------------------------------']);%JOJ
disp(['Exercise ',num2str(task),':']);%JOJ

N=100; %Number of integrations
x=linspace(0,1,N); %N values of x from 0 -> 1
t=sum(sin(x/2)/x); %Fun fact: you don't need to use function sum(), t=sin(x/2)/x calculates the sum of all values of x on it's own
disp(['The integration of sin(x/2)/x with respect to x from 0 to 1 is: ',num2str(t)]);
 
elseif(task==7)%JOJ
%Calculate the derivative function of sin(x/2)/x with respect to x%JOJ
%in the interval from 0 to 1.%JOJ
%HINT: diff%JOJ
disp(['--------------------------------------------------------------------------------']);%JOJ
disp(['Exercise ',num2str(task),':']);%JOJ
 
N=10; %Number of integrations
x=linspace(0,1,N); %N values of x from 0 -> 1
for n = 1:N
    t(n)=sin(x(n)/2)/x(n);
end
disp('Derivative function of sin(x/2)/x with respect to x from 0 to 1 is:');
disp (['[',num2str(diff(t)),']']);

disp('    |--------------------------------------------------------------------|');
disp('    | **NOTE**: "NaN" stands for "Not a Number". This is due to the      |');
disp('    | 1st calculation which yields "sin(0/2)/0" (error "divide by zero") |');
disp('    |--------------------------------------------------------------------|');

elseif(task==8)%JOJ
%Find all triplets (a,b,c) of integers between 0 and 100%JOJ
%such that a*a + b*b = c*c.%JOJ
%HINT: for(),end%JOJ
disp(['--------------------------------------------------------------------------------']);%JOJ
disp(['Exercise ',num2str(task),':']);%JOJ

count=0;
disp('Triplets:') 
for (a=[1:99])
    for (b=[1:99])
        for (c=[1:99])
            C=a*a+b*b;
            if C==c*c
                disp(['(',num2str(a),',',num2str(b),',',num2str(c),')'])
                count=count+1;
            end
        end    
    end
end
disp(['Total number of triplets ',num2str(count),'.']);

elseif(task==9)%JOJ
%Solve a numerical approximation for y(x) in%JOJ
%y'(x)+2*y(x)=6, y(0)=7.%JOJ
%Note: you may write a procedure here or use Simulink, for example.%JOJ
%HINT: Simulink, Euler, Runge-Kutta,%JOJ
%      y(x)=4*exp(-2*x)+3 (for comparison, if you will)%JOJ
disp(['--------------------------------------------------------------------------------']);%JOJ
disp(['Exercise ',num2str(task),':']);%JOJ
 
 
 
elseif(task==10)%JOJ
%Come up with an idea of your own.%JOJ
disp(['--------------------------------------------------------------------------------']);%JOJ
disp(['Exercise ',num2str(task),':']);%JOJ

%Find an alternative way to draw  
%a circle using the 'plot' function.

disp(['(Check Figure ',num2str(task),')']);

%Here is where we define the CONSTs 
fig=10;
r=4; %Radius
N=1000; %Number of points (100 is to see the even distribution, change to 1000 for a full circle)
x0=0; %x coordinate of the center of the circle
y0=0; %y coordinate of the center of the circle

%Here is where we define our algorithms
t=linspace(0,2.*pi,N); %creating a vector of N evenly spaced points in the interval [0,2.*pi]
X=r.*cos(t)+x0; %table of contents of x  
Y=r.*sin(t)+y0; %table of contents of y

%Here is where we plot the figure
figure(fig);
clf; %clear figure
hold on; 
plot(X,Y,'b.');
title('Circle drawn with the "plot" function');
grid on;
  
end%JOJ
%For task 9...%JOJ
%The soln for f'(x)+a*f(x)=b, f(0)=A is%JOJ
%f(x)=(A-b/a)*exp(-a*x)+b/a.%JOJ
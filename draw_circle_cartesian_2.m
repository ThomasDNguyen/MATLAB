function [] = draw_circle_cartesian_2 (fig)
%This function is an alternative way to draw  
%a circle using the cartesian coordinates formula
%given the center coordinates and the radius r.

%Here is where we define the CONSTs 
fig=3;
r=4; %Radius
N=100; %Number of points
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
end %draw_circle_cartesian_2
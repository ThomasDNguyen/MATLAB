function [] = draw_circle_polar (fig)
%This is a function to draw a circle 
%using the polar coordinates

%Here is where we define the CONSTs 
fig=1;
N=1000; %Number of points
r=4; %Radius

%Here is where we define our algorithms
theta=linspace(0,2.*pi,N); %table of contents of the angle theta  
rho=cos(theta).*r; %table of contents of the angle theta
%rho=sin(theta).*r; %it's all the same 'cause they both make a full revolusion

%Here is where we plot the figure
figure(fig);
clf;
hold on;
polar(theta,rho,'b.');
end %draw_circle_polar
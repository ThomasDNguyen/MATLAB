function [] = draw_circle_cartesian (fig)
%This is a function to draw a circle 
%using the cartesian coordinates

%Here is where we define the CONSTs 
fig=2;
R=4; %Radius
N=1000; %Number of points

%Here is where we define our algorithms
dx=2.*R/(N-1);
x=[-R:dx:R]; %table of contents of x  
y=sqrt(R.^2-x.^2); %table of contents of y

%Here is where we plot the figure
figure(fig);
clf;
hold on; %to keep the plot of the upper half as the other is ploted => form a circle
plot(x,y,'b.'); %plotting the upper part of the circle
plot(x,-y,'b.');%plotting the under part of the circle
end %draw_circle_cartesian_1
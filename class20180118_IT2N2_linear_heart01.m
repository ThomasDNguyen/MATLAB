clear;

%common parameter
t=[0.0...
   1.5 ...
   2.5 ...
   5.5];

x=[0.0 ...
   1.0 ...
   2.0 ...
   0.0];

y=[0.0 ...
   1.0 ...
   0.2 ...
  -2.5];

%restrictions for x

Ax=vander(t);%the coordinate value requirements
Ax=Ax(:,end:-1:1);%reverse the order to agree on our formulation
Ax(:,end+1)=[t'].^4;%adding to complete 4th order case

t0=t(3);%at t2...
Ax(end+1,:)=[0 1 2*t0 3*t0^2 4*t0^3];%...extremity required
bx=[x';0];

%restrictions for y

Ay=vander(t);%the coordinate value requirements
Ay=Ay(:,end:-1:1);%reverse the order to agree on our formulation
Ay(:,end+1)=[t'].^4;%adding to complete 4th order case

t0=t(2);%at t1...
Ay(end+1,:)=[0 1 2*t0 3*t0^2 4*t0^3];%...extremity required
by=[y';0];

%solving for parameters
px=Ax\bx;
py=Ay\by;

N=10^3;
tplot=linspace(min(t),max(t),N);
xplot=polyval(px(end:-1:1),tplot);
yplot=polyval(py(end:-1:1),tplot);
%noise
noisex=cumsum(randn(size(xplot)));
xplot=xplot+0.005*noisex;
noisey=cumsum(randn(size(yplot)));
yplot=yplot+0.005*noisey;

Xplot=polyval(px(end:-1:1),t);
Yplot=polyval(py(end:-1:1),t);

%plotting
figure(1);
clf;

vert=3;
horz=3;

subplot(vert,horz,[1:6]);
hold on;
plot(xplot,yplot,'b.-');
plot(-xplot,yplot,'b.-');
plot(Xplot,Yplot,'ro');
grid on;
xlabel('x');
ylabel('y');
%axis([-x(3) x(3) 1.2*y(4) y(2)]);

subplot(vert,horz,[7]);
hold on;
plot(tplot,xplot,'c.-');
plot(t,Xplot,'ro');
grid on;
xlabel('t');
ylabel('x');

subplot(vert,horz,[8]);
hold on;
plot(tplot,yplot,'m.-');
plot(t,Yplot,'ro');
grid on;
xlabel('t');
ylabel('y');

subplot(vert,horz,[9]);
hold on;
plot(tplot,noisex,'c.-');
plot(tplot,noisey,'m.-');
grid on;
xlabel('t');
ylabel('noise');
clear;%clear for posssible existing variables in the workspace
clc;

%choosing some (reference) values for parameter t
t0=0;%x,y
t1=0.2;%dummy
t2=0.4;%x
t3=0.5;%y
t4=0.6;%x
t5=0.8;%dummy
t6=1;%x,y

T=[t0 t1 t2 t3 t4 t5 t6];

x0=0;
x1=2;
x2=4;

y0=0;
y1=2;
y2=4;
y3=6;
y4=8;

Ax=[1 t0 t0^2 t0^3;...
    1 t2 t2^2 t2^3;...
    1 t4 t4^2 t4^3;...
    1 t6 t6^2 t6^3 ...
   ];
ux=[x0 x2 x0 x2]';
px=Ax\ux;

Ay=[1 t0 t0^2 t0^3;...
    1 t2 t2^2 t2^3;...
    1 t4 t4^2 t4^3;...
    1 t6 t6^2 t6^3 ...
   ];
uy=[y1 y1 y3 y3]';
py=Ay\uy;


N=10^4;
t=linspace(0,1,N);
x=px(1)+px(2)*t+px(3)*t.^2+px(4)*t.^3;
y=py(1)+py(2)*t+py(3)*t.^2+py(4)*t.^3;

X=px(1)+px(2)*T+px(3)*T.^2+px(4)*T.^3;
Y=py(1)+py(2)*T+py(3)*T.^2+py(4)*T.^3;

figure(1);
clf;
hold on;
plot(x,y,'b.-');
plot(X,Y,'ro');
grid on;
function [] = non_linear_equation()

X=Newton(4,10);
format long;X',format;

end%non_linear_equation()

function [X] = Newton(x0,nmax)
%solving f(x)=0 for x
%with initial guess xinit and 
%maximum number of interations nmax

err_lim=10^-2;
err=err_lim+1;

X(1)=x0;
[f,Df]=values_f_Df(X(1));
X(2)=X(1)-f/Df;
n=1; %counter for integrations
while(err>err_lim & n<nmax)
    [f,Df]=values_f_Df(X(n+1))
    X(n+2)=X(n+1)-f/Df;
    err=abs(X(n+1)-X(n));
    n=n+1;
    
    visualization(X);
end%while loop

end%Newton(xinit,nmax)

function [f,Df] = values_f_Df(x)
%Defines the problem f(x)=0
f=x.^2-4;
Df=2*x;
end%values_f_Df(x)

function [] = visualization(X)
xmin=min(X);
xmax=max(X);
Dx=xmax-xmin;
space=0.1*Dx;
x=linspace(xmin-space,xmax+space,10^3);
[fx,Dfx]=values_f_Df(x);

figure(1);
clf;
hold on;
plot(x,fx,'b-');
plot(X,zeroes(size(X)),'ro');
grid on;

end%visualization(X)
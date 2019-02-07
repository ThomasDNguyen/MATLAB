function [] = class20180207_IT2N2_Newton ()

X=Newton(4,10);
format long;X',format;

end%class20180207_IT2N2_Newton


function [X] = Newton (x0,nmax)
%Solving f(x)=0 for x 
%with initial guess x0 and 
%maximum number of iterations nmax.
err_lim=10^(-2);
err=err_lim+1;

X(1)=x0;
[f,Df]=values_f_Df(X(1));
X(2)=X(1)-f/Df;
n=1;%counter for iterations
while(err>err_lim & n<nmax)
    %Newton's iteration
    [f,Df]=values_f_Df(X(n+1));
    X(n+2)=X(n+1)-f/Df;
    err=abs(X(n+1)-X(n));
    n=n+1;
    
    visualization(X);
end%while

end%class20180207_IT2N2_Newton


function [f,Df] = values_f_Df (x)
%Defines the problem f(x)=0.
f=x.^2-4;
Df=2*x;
end%values_f_Df

function [] = visualization(X)
xmin=min(X);
xmax=max(X);
Dx=xmax-xmin;
space=0.1*Dx;
x=linspace(xmin-space,xmax+space,10^6);
[fx,Dfx]=values_f_Df(x);
[fX,DfX]=values_f_Df(X);

figure(1);
clf;
hold on;
plot(x,fx,'b.-');
plot(X,zeros(size(X)),'ro');
plot(X,fX,'ro');
grid on;

end%visualization


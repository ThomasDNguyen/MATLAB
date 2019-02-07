function [] = exam_2018 (task)
task=4;
if(task==4)
syms x y z w
eqn1=x+2*y+3*z+4*w==5;
eqn2=2*x+3*y+4*z+5*w==6;
eqn3=3*x-4*y-5*z-6*w==7;
eqn4=5*x-4*y+3*z-2*w==1;

sol = solve([eqn1, eqn2, eqn3, eqn4], [x, y, z, w]);
xSol = sol.x;
ySol = sol.y;
zSol = sol.z;
wSol = sol.w;
x=xSol;
y=ySol;
z=zSol;
w=wSol;

disp(['x= ', x]);
disp(['y= ', y]);
disp(['z= ', z]);
disp(['w= ', w]);
end
end
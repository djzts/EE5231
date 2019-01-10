clc;
clear all;
%% HW5 Q3
disp('HW5_Q3')
%% Part(a)
%% initialize the state problem
Ad=[ 1    0     0    0   0;
    0    0     1    0   0;
    0  -0.5   -1    0   0;
    0    0     0    0   1;
    0    0     0  -0.5  1];
Bd=[1 0 1 1 0]';

%% (a)D-T Controllable test
disp('(a)')
[n,CoM]=Controllable_Test(Ad,Bd);
disp(' ');

%% (b) find approperiate input
disp('(b)')
x0=[-2 -2 2 -4 -3]';
u=inv(CoM)*(-Ad^n*x0);
u=[0;0;0;1;1];
x=x0;
for i=1:5
    disp(['step',num2str(i),', input= ',num2str(u(5-i+1))]);
    x=Ad*x+Bd*u(n-i+1);
    disp(x);
    if sum(x)==0
        break;
    end
end
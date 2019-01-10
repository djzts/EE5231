clc
clear all;
A=[0  1 ;
   -1  -2 ];
B=[1 0;
   0 1 ];
Lamda=diag(eig(A));
K=place(A,B,[0,0])
disp(A-B*K);

%% q2

% no A-B(1)K=[-k1,1-k2;-1,-2]; not possible

%% q3

% yes A-B(2)K=[0,1;-1-k3,-2-k4]; possible 
% k3=-1, k4=-2 done 




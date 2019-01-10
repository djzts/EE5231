clc;
clear all;
%% HW 5 Q5
disp('HW5_Q5')
%% Part(a)
%% initialize the state problem
syms b1 b2 c1 c2;
A=[ 1  1;
    0  1];
B=[b1 b2]';
C=[c1 c2];
[B,A*B]
[C;C*A]
pinv(C)

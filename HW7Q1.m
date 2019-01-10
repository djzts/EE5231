clc
clear all;
%% original system
A=[3  3   0   2;
   0  87  0   60;
   6  3   -3  2;
   0 -126 0   -87 ];
B=[0;3;-1;4];
Lamda=diag(eig(A));
s=tf('s');
y=inv(s*eye(4)-A)*B
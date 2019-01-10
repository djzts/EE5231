clc
clear all;
A=[3,5,4,0,0;
   0,1,2,0,1;
   2,0,1,1,0;
   0,0,0,0,5;
   0,0,0,-5,0];
B=[1,1,1,1,1]';
C=[3 1 0 1 0];
%n1=rank(A);
%n2=rank(ctrbf(A,B,C));
%n3=rank(obsvf(A,B,C));
%% yes full rank

%K1=place(A,B,[-2, -2, -3, -5, -5])
h=rank(ctrb(A,B))

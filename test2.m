function [A,B] = test2(L,J,m,r,Jb,g,v0,t,t0,p0)
%syms v0 t t0 p0 m g Jb r J;
p=v0*(t-t0)+p0;
pp=v0;
t=0;
tt=0;
Block1=Jb/r^2+m;
Block2=m*p*p+J+Jb;
L=L;
tau=m*g*p;

a1=m*tt*tt/Block1;
a2=0/Block1;
a3=-m*g*cos(t)/Block1;
a4=(2*m*p*tt)/Block1;
a5=m*((2*m*pp*tt+m*g*cos(t))*p*p-2*tau*p-2*(J+Jb)*pp*tt-(J+Jb)*g*cos(t))/(Block2)^2;
a6=-2*m*p*tt/Block2;
a7=m*g*p*sin(t)/Block2;
a8=-2*m*p*pp/Block2;

A=[0 1 0 0;
   a1 a2 a3 a4;
   0 0 0 1;
   a5 a6 a7 a8];
B=[0;
   0;
   0;
   1/Block2];

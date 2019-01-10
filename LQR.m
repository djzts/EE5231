clc
clear all;
A = [0 1 0 0
     0 0 -1 0
     0 0 0 1
     0 0 9 0];
B = [0;0.1;0;-0.1];
C = [0 0 1 0];   %????
D = 0;




Q = [100 0 0 0
     0 10 0 0
     0 0 100 0
     0 0 0 1
    ];
R = 0.1;
%?????????????K
K = lqr(A,B,Q,R);
Ac = A - B*K;
%???????
x0 = [0.1;0;0.1;0]; %????
t = 0:0.05:10;
u = dirac(t);
idt = u == Inf; % find Inf
u(idt) = 0.25;     % set Inf to finite value

[y,~]=lsim(Ac,B,C,D,u,t,x0); 
plot(t,y,'b:');
hold on;



Q1 = [1 0 0 0
     0 10 0 0
     0 0 1 0
     0 0 0 1
    ];
R = 0.1;
%?????????????K
K = lqr(A,B,Q1,R);
Ac = A - B*K;
%???????
x0 = [0.1;0;0.1;0]; %????
[y,x]=lsim(Ac,B,C,D,u,t,x0); 
plot(t,y,'r-');
hold on;

Q1 = [1 0 0 0
     0 10 0 0
     0 0 1 0
     0 0 0 1
    ];
R = 100;
%?????????????K
K = lqr(A,B,Q1,R);
Ac = A - B*K;
%???????
x0 = [0.1;0;0.1;0]; %????
[y,x]=lsim(Ac,B,C,D,u,t,x0); 
plot(t,y,'g--');
hold on;
grid on;


Q1 = [100 0 0 0
     0 10 0 0
     0 0 100 0
     0 0 0 1
    ];
R = 100;
%?????????????K
K = lqr(A,B,Q1,R);
Ac = A - B*K;
%???????
x0 = [0.1;0;0.1;0]; %????
[y,x]=lsim(Ac,B,C,D,u,t,x0); 
plot(t,y,'.');
hold on;
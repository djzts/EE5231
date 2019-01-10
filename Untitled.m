clc
syms q1 q2 w
A=[0  w^2 1    0;
  -1  0   0    0;
  q1  0   0    1;
  0   q2  -w^2 0
  ];

eig(A) 
%[V,D] = eig(A)

%eqn1 =  -(q1/2 + (q1^2 - 4*q1*w^2 - 4*q2)^(1/2)/2 - w^2)^(1/2) == -10*w;
%eqn2 =  -(q1/2 - (q1^2 - 4*q1*w^2 - 4*q2)^(1/2)/2 - w^2)^(1/2) == -10*w;
%sol = solve([eqn1], [q1, q2]);
%q1Sol = sol.q1
%q2Sol = sol.q2

eqn1=cosh(-at)
clc
clear all;
syms Aco A13 A21 Aco1 A23 A24 Ac1o A43 Ac1o1
syms Bco Bco1 Cco Cco1 D
%Phi=[Aco 0   A13   0;
%     A21 Aco1 A23   A24;
%     0   0    Ac1o  0  ;
%     0   0    A43   Ac1o1
%    ];
Phi=[2 0   3   0;
     5 7   11  13;
     0   0     17  0  ;
     0   0     19   23
    ];
B=[31;41;0;0];
C=[43 0 47 0];
D=[1];
ss2tf(Phi,B,C,D)
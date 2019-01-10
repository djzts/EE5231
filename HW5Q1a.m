clc;
clear all;
%% HW 5 Q1
disp('HW5_Q1')
%% Part(a)
%% initialize the state problem
A=[-10   0   -10   0;
    0  -0.7   9    0;
    0   -1   -0.7  0;
    1    0    0    0];
B=[20   2.8;
    0  -3.13;
    0    0;
    0    0];



%% (a)C-T Controllable test
disp('(a)')
[~,CoM1]=Controllable_Test(A,B)
disp(' ');
[~,CoM2]=Controllable_Test(A,B(:,1))
disp(' ');
[~,CoM3]=Controllable_Test(A,B(:,2))
disp(' ');

%% (b)C-T Observable_test
disp('(b)')
% Becuase only gyro scope,Hence
C=[1 0 0 0];
[~,ObM]=Observable_Test(A,C)
disp(' ');


%% (c)C-T Observable_test
disp('(c)')
% Becuase only has the bank indicator,Hence
C1=[0 0 0 1];
[~,ObM1]=Observable_Test(A,C1)

disp(' ');

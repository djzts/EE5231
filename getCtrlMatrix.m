function [A,B] = getCtrlMatrix(v0,t,t0,p0)
%% set up the equilibrium point ss function
% x=[p p_dot th th_dot]';

%% initial parameters and coefficients
L=1;         %Length
J=0.0676;    % beam inertia
m=0.9048;    % mass
r=0.03;      % Ball redius
Jb=0.000326; % Ball inertia
g=9.81;      % Gravity here



%% set up the system martix

[A,B] = test2(L,J,m,r,Jb,g,v0,t,t0,p0);
    
end
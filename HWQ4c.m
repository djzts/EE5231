clc
A=[-0.1 1;-1 -0.1];
B=[1;0];
C=[1,0];
D=[0];
sys = ss(A,B,C,D) ;

%%
a=-0.1;
w=1;
mean=-a/(a^2+w^2);

y3=@(x)(exp(a*x)*w*sin(w*x)+a*exp(a*x)*w*cos(w*x)-a)/(a^2+w^2);


figure(1)
%subplot(1,2,1)

[y1,t] = step(sys,60) 
y = mean*ones(length(t));
plot(t,y1,t,y,'--')
%subplot(1,2,2)
hold on;
fplot(@(x) (exp(a*x)*w*sin(w*x)+a*exp(a*x)*w*cos(w*x)-a)/(a^2+w^2),[0,60],'--','LineWidth',2)
legend({'real','mean','prediction'},'Location','northeast')
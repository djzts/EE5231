clear all
clc
lw = 2; fs = 18;
m=0.9048;
g=9.81; 
n=4;
%% Q(3)
p=0.25;
p_dot=0;
%[A,B]=getCtrlMatrix(v0,t,t0,p0)
[A,B]=getCtrlMatrix(0,0,0,0.25)
C=[1,0,0,0];
x_0=[p;0;0;0];
%% Q(C)
eig(A)
sys_nom=ss(A,B,C,0);
[Y0,tnom,xnom]=initial(sys_nom,x_0,8);
figure('Name','Q(3)xnom')
for ii = 1:n
    subplot(n,1,ii)
    plot(tnom,xnom(:,ii),'b-','LineWidth',lw);
    grid on;
    set(gca,'FontSize',fs);
    legend('real')
    ylabel(['x(' num2str(ii) ')'],'FontSize',fs)
    xlabel('Time','FontSize',fs)
end
figure('Name','Q(3)Ynom')
plot(tnom,Y0,'b-','LineWidth',lw);
grid on;
set(gca,'FontSize',fs);
ylabel(['x(' num2str(ii) ')'],'FontSize',fs)
    xlabel('Time','FontSize',fs)

%% create the dirac sig 

Tfinal=8; %%%%%%%%%%  you can play at here. Tfinal
t = 0:0.01:Tfinal;
u = dirac(t);
idt = u == Inf; % find Inf
u(idt) = m*g*0.25;     % set Inf to finite value

%% sig
sys=ss(A,B,[],[]); %get the sys

[~,t,x_1]=lsim(sys,u,t,x_0');
figure('Name','Q(3)')
set(gcf, 'Position',  [100, 0, 625, 2500]);
for ii = 1:n
    subplot(4,1,ii)
    plot(t,x_1(:,ii),'b-','LineWidth',lw);
    grid on;
    set(gca,'FontSize',fs);
    legend('real')
    ylabel(['x(' num2str(ii) ')'],'FontSize',fs)
    xlabel('Time','FontSize',fs)
end

%% Q(D)
RankA=rank(A)
Ctrb=rank(ctrb(A,B))
Obsv=rank(obsv(A,C))

sys=ss(A,B,C,[]);
sysr = minreal(sys);
[Amin,Bmin,Cmin,Dmin] = ssdata(sysr)   %%it is already a min system

%% Q(5)
%%????[-5,-10]??????????(0-4),(4-6),(6+)??
%%?????????Peak?
%%???????*10??Obsv ???10??


x0=[1;1;1;1];
OptionList=[-1 -4 -5 -6 -7 -10];
N=length(OptionList);
n=4;
figure('Name','Part(5)-test');
set(gcf, 'Position',  [100, 0, 6000, 2500]);

for j=1:N
vec=OptionList(j)*ones(4,1);
K=acker(A,B,vec);
sys=ss(A-B*K,B,C,0);

    [Xz0,t0,x_r]=initial(sys,x0,8);
    for ii= 1:n
        subplot(n,N,j+N*(ii-1))
        plot(t0,x_r(:,ii),'b-','LineWidth',lw);
        grid on
        set(gca,'FontSize',fs);
        l=strjoin(string(x0));
        str='Reponse to x0=['+l+'] in K='+num2str(OptionList(j));
        %legend(str)
        ylabel(['x(' num2str(ii) ')'],'FontSize',fs)
        xlabel('Time','FontSize',fs)
        if(ii == 1)
            title(str)
        end
    end
end

% ????????????-5????

%% Q(6)
N=1;
x_0=[0 0 0 0];
vec=-5*ones(4,1);
K6=acker(A,B,vec);
sys6=ss(A-B*K6,B,C,0);
[~,t,x_6]=lsim(sys6,u,t,x_0');
for ii = 1:n
    subplot(4,1,ii)
    plot(t,x_6(:,ii),'b-','LineWidth',lw);
    grid on;
    set(gca,'FontSize',fs);
    legend('real')
    ylabel(['x(' num2str(ii) ')'],'FontSize',fs)
    xlabel('Time','FontSize',fs)
end
% quite good plot it converges in 2s


%% Q(7)
po=-50*ones(1,4);
G1=acker(A',C',po)';

Aob1=A-G1*C;


PA=[A,-B*K6;G1*C,A-B*K6-G1*C];
PB=[B;B];
PC=[C,zeros([1,length(C)])];
PD=[0];

sys7=ss(PA,PB,PC,PD);



N=1;
n=4;
x_real0=[0.25;0;0;0];

t1 = 0:0.005:0.8;
u1 = dirac(t1);
idt = u1 == Inf; % find Inf
u1(idt) = m*g*0.25;     % set Inf to finite value

[~,~,x_1]=lsim(sys_nom,u1,t1,x_real0');
[~,~,x_7]=lsim(sys7,u1,t1,[x_real0;x_0']);

figure('Name','Part(7)-1');
set(gcf, 'Position',  [100, 0, 625, 2500]);
    for ii = 1:n
        subplot(4,N,1+N*(ii-1))
        plot(t1,x_7(:,ii),'b-','LineWidth',lw);
        hold on;
        plot(t1,x_1(:,ii),'r--','LineWidth',lw);
        hold on;
        plot(t1,x_7(:,ii+n),'g:','LineWidth',lw);
        grid on
        str='Reponse to dirac u0=0.25';
        if(ii == 1)
            title(str)
        end
        set(gca,'FontSize',fs);
        %l=strjoin(string(x_real0));
        
        legend('CloseLoop[0.25,0,0,0]','OpenLoop[0.25,0,0,0]','CL-EST-Error[0,0,0,0]')
        ylabel(['x(' num2str(ii) ')'],'FontSize',fs)
        xlabel('Time','FontSize',fs)
    end
    
%% Q(8)

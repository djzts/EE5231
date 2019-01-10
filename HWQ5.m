clear all; close all; clc
A=[-8,-8;-0.01,-2];
f = @(t,Y) A*[Y(1);Y(2)];
y1 = linspace(-8,8,20);
y2 = linspace(-8,8,20);


[x,y] = meshgrid(y1,y2);

u = zeros(size(x));
v = zeros(size(x));


t=0; % we want the derivatives at each point at t=0, i.e. the starting time
for i = 1:numel(x)
    Yprime = f(t,[x(i); y(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end
quiver(x,y,u,v,'r'); figure(gcf)
xlabel('y_1')
ylabel('y_2')
axis tight equal;
hold on
for y20 = [-8 -4 -2 -1 0 1 2 4 8]
    [ts,ys] = ode45(f,[0,50],[0;y20]);
    plot(ys(:,1),ys(:,2),'LineWidth',2)
    plot(ys(1,1),ys(1,2),'bx') % starting point
    plot(ys(end,1),ys(end,2),'ko') % ending point
end
for y20 = [-8 -4 -2 -1 0 1 2 4 8]
    [ts,ys] = ode45(f,[0,50],[y20;y20]);
    plot(ys(:,1),ys(:,2),'LineWidth',2)
    plot(ys(1,1),ys(1,2),'bx') % starting point
    plot(ys(end,1),ys(end,2),'ko') % ending point
end
hold off
ylim([-8,8]);
xlim([-8,8]);

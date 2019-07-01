%%
clc;
clear;
%%

tspan=10;
g = 9.81;

l1 = input('Enter l1:');
l2 = input('Enter l2:');
m1 = input('Enter m1:');
m2 = input('Enter m2:');
theta1_degree = input('Enter theta 1:');
theta2_degree = input('Enter theta 2:');

theta1= theta1_degree * pi/180;
theta1_prime=0;
theta2= theta2_degree * pi/180;
theta2_prime=0;

[t,y]=ode45(@(t,y)DPD(t,y,m1,m2,l1,l2,g), [0 ,tspan], [theta1 theta2 theta1_prime theta2_prime]);

%%

x1=l1*sin(y(:,1));
y1=-l1*cos(y(:,1));
x2=l1*sin(y(:,1))+l2*sin(y(:,2));
y2=-l1*cos(y(:,1))-l2*cos(y(:,2));

figure(1)
plot(x1,y1,'linewidth',2);
hold on
plot(x2,y2,'r','linewidth',2);
h=gca; 
get(h,'fontSize') ;
set(h,'fontSize',14);
xlabel('X','fontSize',14);
ylabel('Y','fontSize',14);
title('Double Pendulum','fontsize',14);
fh = figure(1);
set(fh, 'color', 'white'); 

figure(2);
plot(y(:,1),'linewidth',2);
hold on
plot(y(:,2),'r','linewidth',2);
h=gca; 
get(h,'fontSize');
set(h,'fontSize',14);
legend('\theta_1','\theta_2');
xlabel('time','fontSize',14);
ylabel('theta','fontSize',14);
fh = figure(2);
set(fh, 'color', 'white'); 

figure(3)
Ncount=0;
frame=0;
   
for i=1:length(y)
    Ncount = Ncount+1;
    frame = frame+2;
    plot(0, 0,'.','markersize',20);
    hold on
    plot(x1(i),y1(i),'.','markersize',20);
    plot(x2(i),y2(i),'.','markersize',20);
    hold off
    line([0 x1(i)], [0 y1(i)],'Linewidth',2);
    axis([-(l1+l2) l1+l2 -(l1+l2) l1+l2]);
    line([x1(i) x2(i)], [y1(i) y2(i)],'linewidth',2);
    h=gca; 
    get(h,'fontSize'); 
    set(h,'fontSize',12);
    xlabel('X','fontSize',12);
    ylabel('Y','fontSize',12);
    title('Chaotic Motion','fontsize',14);
    fh = figure(3);
    set(fh, 'color', 'white'); 
    F=getframe;
end
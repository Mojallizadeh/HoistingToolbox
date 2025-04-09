clc;clear;close all;

%% Simulation parameters
h=1e-5; % Sampling time
tf=25; % Final time
len=floor(tf/h); % vector lengths

g=9.8;
L=3;
m=100;
M=1;

x1(1)=-10;
x2(1)=0;
x3(1)=0;
x4(1)=0;

c1=1;
c2=1;
c3=1;
c4=1;
beta=0.1;
for k=1:len
    t(k)=k*h;

    f1(k)=(M*L*x4(k)^2*(sin(x3(k)))+m*g*sin(x3(k))*cos(x3(k)))/(M+m*(sin(x3(k))^2));
    g1(k)=(1)/(M+m*(sin(x3(k)))^2);
    f2(k)=((M+m)*g*sin(x3(k))+m*L*x4(k)^2*sin(x3(k))*cos(x4(k)))/((M+m*(sin(x3(k))^2))*L);
    g2(k)=(cos(x3(k)))/((M+m*(sin(x3(k)))^2)*L);

    s(k)=0.5*(x1(k)^2+(x3(k)-pi)^2);

    den=x1(k)*g1(k)+(x3(k)-pi)*g2(k);
    if abs(den)<1e-3
        den=1e-3;
    end
    ueq(k)=-(x1(k)*f1(k)+(x3(k)-pi)*f2(k))/(den);
    us(k)=(-beta*sign(s(k)))/(den);
    uss(k)=ueq(k)+us(k);

    u(k)=-100*x1(k)-100*x2(k);


    x1(k+1)=h*(x2(k))+x1(k);
    x2(k+1)=h*(f1(k)+g1(k)*u(k))+x2(k);
    x3(k+1)=h*(x4(k))+x3(k);
    x4(k+1)=h*(f2(k)+g2(k)*u(k))+x4(k);

end
t(end+1)=t(end);

subplot(4,1,1)
plot(t,x1,'LineWidth',3)
ylabel('$x_1$','Interpreter','latex','FontSize',28)
set(gca,'xtick',[])
set(gca,'FontSize',28)
grid on
subplot(4,1,2)
plot(t,x2,'LineWidth',3)
ylabel('$x_2$','Interpreter','latex','FontSize',28)
set(gca,'xtick',[])
set(gca,'FontSize',28)
grid on
subplot(4,1,3)
plot(t,x3,'LineWidth',3)
ylabel('$x_3$','Interpreter','latex','FontSize',28)
set(gca,'xtick',[])
set(gca,'FontSize',28)
grid on
subplot(4,1,4)
plot(t,x4,'LineWidth',3)
ylabel('$x_4$','Interpreter','latex','FontSize',28)
xlabel("Time (s)",'Interpreter','latex','FontSize',28)
set(gca,'FontSize',28)


figure 
subplot(2,1,1)
plot(s)
subplot(2,1,2)
plot(uss)
hold on 
plot(u)
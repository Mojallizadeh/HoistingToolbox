clc;clear;close all;

%% Simulation parameters
h=1e-5; % Sampling time
tf=40; % Final time
len=floor(tf/h); % vector lengths

g=9.8;
L=3;
m=10;
M=100;

x1(1)=-1;
x2(1)=0;
x3(1)=pi;
x4(1)=0;
x1_e(1)=-1;
x2_e(1)=0;
x3_e(1)=pi;
x4_e(1)=0;

c1=1;
c2=1;
c3=1;
c4=1;
beta=100;
for k=1:len
    t(k)=k*h;

    f1(k)=(M*L*x4(k)^2*(sin(x3(k)))+m*g*sin(x3(k))*cos(x3(k)))/(M+m*(sin(x3(k))^2));
    g1(k)=(1)/(M+m*(sin(x3(k)))^2);
    f2(k)=((M+m)*g*sin(x3(k))+m*L*x4(k)^2*sin(x3(k))*cos(x4(k)))/((M+m*(sin(x3(k))^2))*L);
    g2(k)=(cos(x3(k)))/((M+m*(sin(x3(k)))^2)*L);

    % s(k)=0.5*(x1(k)^2+(x3(k)-pi)^2);
    s(k)=x1(k)+1*x2(k);

    den=g1(k);
    if abs(den)<1e-9
        den=1e-9;
    end
    ueq(k)=-(x2(k)+f1(k))/(den);

    if k==1
        us(k)=(beta*0.1*sat(s(k)/(h*beta)))/(den);
    else
        us(k)=(beta*0.1*sat((s(k)-s(k-1)/(h*beta))))/(den);
    end

    u(k)=ueq(k)+us(k);

    x1(k+1)=h*(x2(k))+x1(k);
    x2(k+1)=h*(f1(k)+g1(k)*u(k))+x2(k);
    x3(k+1)=h*(x4(k))+x3(k);
    x4(k+1)=h*(f2(k)+g2(k)*u(k))+x4(k);


%--------------------------------------------------------------
    f1_e(k)=(M*L*x4_e(k)^2*(sin(x3_e(k)))+m*g*sin(x3_e(k))*cos(x3_e(k)))/(M+m*(sin(x3_e(k))^2));
    g1_e(k)=(1)/(M+m*(sin(x3_e(k)))^2);
    f2_e(k)=((M+m)*g*sin(x3_e(k))+m*L*x4_e(k)^2*sin(x3_e(k))*cos(x4_e(k)))/((M+m*(sin(x3_e(k))^2))*L);
    g2_e(k)=(cos(x3_e(k)))/((M+m*(sin(x3_e(k)))^2)*L);

    % s(k)=0.5*(x1(k)^2+(x3(k)-pi)^2);
    s_e(k)=x1_e(k)+1*x2_e(k);

    den=g1_e(k);
    if abs(den)<1e-9
        den=1e-9;
    end
    ueq_e(k)=-(x2_e(k)+f1_e(k))/(den);

    us_e(k)=(-beta*sign(s_e(k)))/(den);

    u_e(k)=ueq_e(k)+us_e(k);

    x1_e(k+1)=h*(x2_e(k))+x1_e(k);
    x2_e(k+1)=h*(f1_e(k)+g1_e(k)*u_e(k))+x2_e(k);
    x3_e(k+1)=h*(x4_e(k))+x3_e(k);
    x4_e(k+1)=h*(f2_e(k)+g2_e(k)*u_e(k))+x4_e(k);
    

end
t(end+1)=t(end);

subplot(4,1,1)
plot(t,x1,'LineWidth',3)
hold on
plot(t,x1_e,'LineWidth',3)
legend('Deadbeat','Euler forward','Interpreter','latex','FontSize',28)
ylabel('$x_1$','Interpreter','latex','FontSize',28)
set(gca,'xtick',[])
set(gca,'FontSize',28)
grid on
subplot(4,1,2)
plot(t,x2,'LineWidth',3)
hold on
plot(t,x2_e,'LineWidth',3)
legend('Deadbeat','Euler forward','Interpreter','latex','FontSize',28)
ylabel('$x_2$','Interpreter','latex','FontSize',28)
set(gca,'xtick',[])
set(gca,'FontSize',28)
grid on
subplot(4,1,3)
plot(t,x3*180/pi,'LineWidth',3)
hold on
plot(t,x3_e*180/pi,'LineWidth',3)
legend('Deadbeat','Euler forward','Interpreter','latex','FontSize',28)
ylabel('$x_3$','Interpreter','latex','FontSize',28)
set(gca,'xtick',[])
set(gca,'FontSize',28)
grid on
subplot(4,1,4)
plot(t,x4,'LineWidth',3)
hold on
plot(t,x4_e,'LineWidth',3)
legend('Deadbeat','Euler forward','Interpreter','latex','FontSize',28)
ylabel('$x_4$','Interpreter','latex','FontSize',28)
xlabel("Time (s)",'Interpreter','latex','FontSize',28)
set(gca,'FontSize',28)

s(end+1)=s(end);
s_e(end+1)=s_e(end);

u(end+1)=u(end);
u_e(end+1)=u_e(end);

ueq(end+1)=ueq(end);
ueq_e(end+1)=ueq_e(end);

us(end+1)=us(end);
us_e(end+1)=us_e(end);

figure


subplot(4,1,1)
plot(t,s,'LineWidth',3)
hold on
plot(t,s_e,'LineWidth',3)
legend('Deadbeat','Euler forward','Interpreter','latex','FontSize',28)
ylabel('$s$','Interpreter','latex','FontSize',28)
set(gca,'xtick',[])
set(gca,'FontSize',28)
grid on
subplot(4,1,2)
plot(t,u,'LineWidth',3)
hold on
plot(t,u_e,'LineWidth',3)
legend('Deadbeat','Euler forward','Interpreter','latex','FontSize',28)
ylabel('$u$','Interpreter','latex','FontSize',28)
set(gca,'xtick',[])
set(gca,'FontSize',28)
grid on
subplot(4,1,3)
plot(t,ueq,'LineWidth',3)
hold on
plot(t,ueq_e,'LineWidth',3)
legend('Deadbeat','Euler forward','Interpreter','latex','FontSize',28)
ylabel('$u_{eq}$','Interpreter','latex','FontSize',28)
set(gca,'xtick',[])
set(gca,'FontSize',28)
grid on
subplot(4,1,4)
plot(t,us,'LineWidth',3)
hold on
plot(t,us_e,'LineWidth',3)
legend('Deadbeat','Euler forward','Interpreter','latex','FontSize',28)
ylabel('$u_{s}$','Interpreter','latex','FontSize',28)
set(gca,'xtick',[])
set(gca,'FontSize',28)
grid on
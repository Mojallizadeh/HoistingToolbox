clc;clear;close all;

dt=1e-3;
h=dt;
t_f=100;
len=t_f/dt;

M=100;
m=1000;
g=-9.81;
c1=1;c2=10;c3=1;c4=1;
kapa=1;
eta=10;

L=1;
u=zeros(1,len);
x1=zeros(1,len);
x2=zeros(1,len);
x3=zeros(1,len);
x4=zeros(1,len);
s=zeros(1,len);
ueq=zeros(1,len);
usw=zeros(1,len);
f1=0;b1=0;f2=0;b2=0;

x3(1)=0;

for k=1:len
    
    if c2*b1+c4*b2==0
        eps1=1e-6;
    else 
        eps1=0;
    end
    
    
    if M+m*sin(x3(k))^2==0
        eps2=1e-6;
    else 
        eps2=0;
    end     
    
    f1=(M*L*x4(k)^2*sin(x3(k))+m*g*sin(x3(k))*cos(x3(k)))/(M+m*sin(x3(k))^2+eps2);
    b1=1/(M+m*sin(x3(k))^2+eps2);
    f2=((M+m)*g*sin(x3(k))+m*L*x4(k)^2*sin(x3(k))*cos(x4(k)))/((M+m*sin(x3(k))^2)*L+eps2);
    b2=(cos(x3(k)))/((M+m*sin(x3(k))^2)*L+eps2);
    
    
    
    s(k)=c1*(x1(k)-2)+c2*x2(k)+c3*x3(k)+c4*x4(k);
    
    

    ueq(k)=-(c1*x2(k)+c3*x4(k)+c2*f1+c4*f2)/(c2*b1+c4*b2+eps1);
    bk=-s(k);
    a=(h*eta)/(1+h*kapa);
    
% explicit===================================================
%     usw(k)=-(kapa*s(k)+eta*sign(s(k)))/(c2*b1+c4*b2+eps1);
% implicit===================================================    
    if bk<-a
        sk1=s(k)-a;
        usw(k)=-(kapa*sk1+eta)/(c2*b1+c4*b2+eps1);
    elseif bk>a
        sk1=s(k)+a;
        usw(k)=-(kapa*sk1-eta)/(c2*b1+c4*b2+eps1);
    else
        zeta=-bk*(1+h*kapa)/(h*eta);
        usw(k)=-(eta*zeta)/(c2*b1+c4*b2+eps1);
    end

    
    u(k)=ueq(k)+usw(k);


    x1(k+1)=dt*(x2(k))+x1(k);
    x2(k+1)=dt*(f1+b1*u(k))+x2(k);
    x3(k+1)=dt*(x4(k))+x3(k);
    x4(k+1)=dt*(f2+b2*u(k))+x4(k);
    
end

u(end+1)=u(end);
ueq(end+1)=ueq(end);
usw(end+1)=usw(end);
s(end+1)=s(end);

t=0:dt:t_f;

subplot(2,2,1)
plot(t,x1)
subplot(2,2,2)
plot(t,x2)
subplot(2,2,3)
plot(t,x3)
subplot(2,2,4)
plot(t,x4)


figure

subplot(2,2,1)
plot(t,ueq)
subplot(2,2,2)
plot(t,usw)
subplot(2,2,3)
plot(t,u)
subplot(2,2,4)
plot(t,s)

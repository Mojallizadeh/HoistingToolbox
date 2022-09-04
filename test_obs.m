clc;clear;close all


m=10000;
m1=2000;
m2=40000;

L1=10;
L2=1;

dx=0.1;
d1=0.01;
d2=0.01;
g=9.81;


Ap=[m+m1+m2     ,    (m1+m2)*L1     ,    m2*L2;...
  (m1+m2)*L1   ,    (m1+m2)*L1^2   ,    m2*L1*L2;...
   m2*L2       ,    m2*L1*L2       ,    m2*L2^2];

Bp=[dx 0 0;0 d1 0;0 0 d2];

Cp=[0 0 0;...
    0 (m1+m2)*g*L1 0;...
    0  0  m2*g*L2];


A=[zeros(3,3) eye(3) ; -inv(Ap)*Cp  -inv(Ap)*Bp];

B=zeros(6,1);B(4)=1/(m+m1+m2);

C=eye(6);

D=zeros(6,1);

obsm=obsv(A,C);

rank(obsm)







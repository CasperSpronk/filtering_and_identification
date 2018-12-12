%%
% This code is made by:
% Casper Spronk
% 4369475
clc
clear all
close all
%% variables 
load("rocket.mat");
delta_t = 0.1;          % [s]
m = 100;                % [kg]
g = 9.81;               % [m/s]
y_zero = 0;             % [m]
ydot_zero = 0;
x_zero = [y_zero; ydot_zero]; 

%% Question 1
A = [1 delta_t; 
     0 1];
B = [(delta_t^2)/(2*m) -(delta_t^2)/2 -(delta_t^2)/(2*m);
     delta_t/m -delta_t -delta_t/m];
C = [1 0];
D = 0;
sys1 = ss(A,B,C,D,delta_t);

[y1, t1] = lsim(sys1,u,[],x_zero);
plot(t1,y1)
hold on
plot(t1,ytrue)
legend("y1","true y")
xlabel("time in [s]")
ylabel("height in [m]")
% the resulting graph looks significantly different from the 
% results show by simulating with the estimated drag

%% Question 2

p = [0.8 0.7];
K = place(A',C',p);

Ahat = A-K'.*C;
Bhat = [B K'];
uplusy = [u y];

sys2 = ss(Ahat,Bhat,C,D,delta_t);
[y2, t2, x] = lsim(sys2,uplusy,[],x_zero);

figure
subplot(2,1,1)
plot(t2,y2)
hold on
plot(t2,ytrue)
legend("y2","true y")
xlabel("time in [s]")
ylabel("height in [m]")

ydotmeasured = x(1:end,2);
subplot(2,1,2)
plot(t2, ydotmeasured)
hold on
plot(t2, ydottrue)
legend("ydot measured","ydottrue")
xlabel("time [s]")
ylabel("velocity [m/s]")

%% Question 3
% 
% Q = 2;
% R = 30;
% 
% sys3 = ss(A,[B B],C,0,delta_t);
% 
% [kest,L,P,M] = kalman(sys3,Q,R);
% kest = kest(1,:);
% 
% A3 = A;
% B3 = [B B 0*B];
% C3 = [C;C];
% D3 = 0;
% P = ss(A3,B3,C3,D3,delta_t);
% sys = parallel(P,kest,1,1,[],[]);
% 
% SimModel = feedback(sys,1,4,2,1);
% SimModel = SimModel([1 3],[1 2 3]);     
% 
% w = sqrt(Q)*randn(3501,1);
% v = sqrt(R)*randn(3501,1);
% 
% input = [w,v,u];
% out = lsim(SimModel,input,[],x_zero); %This line causes an error due to
% the input data U being of an unexpected size









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

[y t] = lsim(sys1,u,[],x_zero);
plot(t,y)
hold on
plot(t,ytrue)
legend("y","true y")
xlabel("time in [s]")
ylabel("height in [m]")
hold off
% the resulting graph looks significantly different from the 
% results show by simulating with the estimated drag

%% Question 2

p = [0.8 0.7];
K = place(A',C',p);

Ahat = A-K.*C;













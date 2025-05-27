% function void = main_2ndOrderRxn(void)

% main file

%% restart anew
% clear all; close all; clc;

%% parameter values
k1 = 0.1;
k2 = 0.2;
A0 = 2.0;
B0 = 1;
C0 = 3.0;
D0 = 0;

params.k1 = k1;
params.k2 = k2;
params.A0 = A0;
params.B0 = B0;
params.C0 = C0;
params.D0 = D0;

%% initial conditions

tspan = [0, 50];
B0=params.B0;
I0=0;
D0=params.D0;
initial_cond = [B0; I0; D0];

% then run the ode
[t_soln, x_soln] = ode45(@(t,x)systemODE(t,x,params), tspan, initial_cond);

B_sol = x_soln(:,1);
I_sol = x_soln(:,2);
D_sol = x_soln(:,3);

%% now plot things
p(1)=plot(t_soln, B_sol, 'b'); hold on;
p(2)=plot(t_soln, I_sol,'m'); hold on;
p(3)=plot(t_soln, D_sol,'g'); hold on;
xlabel('Time (t)');
ylabel('Concentration of B, D, and I');
title('Numerical Solution of DE Systems');

% legend(p,{'B(t)','I(t)','D(t)'},"Location","NorthWest");
legend(p,{'B(t)','I(t)','D(t)'},"Location",[0.8 0.6 0.1 0.2]);
                                   % x-position, y-position, width, height
% grid on;
% disp([t_soln,B_sol;I_sol;D_sol]) %having issues getting this to work, I was trying to troubleshoot displying it as table of all the solutions

disp('2nd order system integrate!')
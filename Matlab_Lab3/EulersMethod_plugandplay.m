%% script: Euler's method
% Differential equation here is:
% x' = f(t,x)

%% in this code
% f(t,x) is defined as a matlab function that can be evaluated
% additionally, the analytic solution, g(t), is defined as a matlab
% function that can be evaluated -- you must solve for g(t) by hand !!

clear all; close all; clc;

my_rgb_colors = [78 132 193; 209 109 106; 236 180 118]/255;


%% Modify the time interval
%  time array: from t0 to tf with N equal intervals

N = 4; % number of sample points, i.e., mesh size
t0 = 0;
tf = 2;
dt = (tf-t0)/N;

% spits out number of points, N
num_mesh = 'N = %d intervals ';
fprintf(num_mesh,(N))

% spits out dt
length_mesh = 'with length, dt = %2.2f \n\n';
fprintf(length_mesh,dt)


% create time array for Euler's method
dt = (tf-t0)/N;
t_values = 0:dt:tf;


% finer resolution time array
t_fine = t0:0.01:tf;

%% Modify the initial condition
x0 = 1; % initial condition: x(0)=1

%% Modify anlytic solutions
% Here is the calculated analytic solution: you must solve for g(t) by hand or Maple !!
g = @(t) t-1+2*exp(-t);

% analytic solution at the same mesh points used in Euler's method
x_soln_pts = feval(g,t_values);

% analytic solution at finer mesh points
x_soln = feval(g,t_fine);


%% Modify the right-hand-side of the DE
f = @(t,x) t - x;


%% for loop: Euler's method

% initialize x and t:
x_prev = x0;
t_prev = t0;
this_x_val = [];

% create array for numerical approximation of solution
x_values = zeros(size(t_values));
x_values(1) = x0;
% this_x_val = x0;


for kk=2:length(t_values)

    % print these t, x values
    formatSpec = 't_pts = %4.2f, x_values = %4.3f \n';
    fprintf(formatSpec,[t_prev,x_prev]);

    % this is Euler's method:
    % x_n+1 = x_n + x'(t_n)*dt = x_n + f(t_n,x_n)*dt
    this_x_val =  x_prev + feval(f,t_prev,x_prev)*dt;
    x_values(kk) = this_x_val;

    % store n+1 as n for the next iteration
    x_prev = this_x_val;
    t_prev = t_values(kk);


end


% print the last t, x values
formatSpec = 't_pts = %4.2f, x_values = %4.3f \n';
fprintf(formatSpec,[t_prev,x_prev]);


%% plot stuff
f1 = figure(1); set(f1, 'Position', [100 800 800 650]);
p(1)=plot(t_fine,x_soln,'Color',my_rgb_colors(2,:),'linewidth',6); hold on;
plot(t_values,x_soln_pts,'.','Color',my_rgb_colors(2,:),'MarkerSize',40); hold on;
p(2)=plot(t_values,x_values,'Color','k','linewidth',6); hold on;
plot(t_values,x_values,'.','Color',my_rgb_colors(1,:),'MarkerSize',40); hold on;

legend(p,'Analytic Solution','Eulers Method','location','SouthEast');

xlim([0 2]);
ylim([0.2 1.4]);
xlabel('Time');
ylabel('Solution, $x(t)$','interpreter','latex');
title(['Number of Intervals, $N = $ ',num2str((N),'%d')],'interpreter','latex');
f1=gca;
f1.LineWidth = 1;
f1.FontSize = 28;
f1.FontWeight = 'normal';
f1.FontName = 'Times New Roman';





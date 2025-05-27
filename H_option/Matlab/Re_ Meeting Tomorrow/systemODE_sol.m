% function void = systemODE_sol(void)

tspan = [0, 50];
I0=0;
D0=0;
initials = [B0; I0; D0];
[t, sol] = ode45(@systemODE, tspan, initials);
B_sol = sol(:,1);
I_sol = sol(:,2);
D_sol = sol(:,3);
plot(t, B_sol, 'b',t, I_sol,'m', t, D_sol,'g');
xlabel('Time (t)');
ylabel('Concentration of B, D, and I');
title('Numerical Solution of DE Systems');
grid on;
disp([t,B_sol;I_sol;D_sol]) %having issues getting this to work, I was trying to troubleshoot displying it as table of all the solutions
function dydt = systemODE(t, y, params)

k1 = params.k1;
k2 = params.k2;
A0 = params.A0;
B0 = params.B0;
C0 = params.C0;
D0= params.D0;

B = y(1);
I = y(2);
D = y(3);

dBdt = -k1 * B * (A0 - B0 + B);
dIdt = k1 * ((A0 - B0) + B) * B - k2 * I * (C0 - (D - D0));
dDdt = k2 * I * (C0 - (D - D0));

dydt = [dBdt; dIdt; dDdt];

end
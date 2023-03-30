function [vp] = system_dynamic(x, v, vref)

qu = v(1);
qw = v(2);


chi_1 = x(1);
chi_2 = x(2);
chi_3 = x(3);
chi_4 = x(4);
chi_5 = x(5);
chi_6 = x(6);


M_11 = chi_1;
M_12 = 0;
M_21 = 0;
M_22 = chi_2;
M = [[M_11, M_12];...
     [M_21, M_22]];


C_11 = chi_4;
C_12 = -chi_3*qw;
C_21 = chi_5*qw;
C_22 = chi_6;

C = [[C_11, C_12];...
     [C_21, C_22]];

   
vp = -inv(M)*C*v + inv(M)*vref;
end


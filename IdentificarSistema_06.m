%% Programa para identificar el sistema
% Autor Jeysson Tapia
clc; clear; close all;

%% Definición de la señal de referencia en distancias 
t_s=0.01;
f=1/t_s;
t_f=10;
t=0:t_s:t_f;
x= 10*sin(0.5*t);
y= 10*cos(0.5*t); 

figure(1)
plot(x,y)
grid on
title('Trayectoría')
xlabel('x [m]');
ylabel('y [m]');

%% Creación de la señal en velocidades
dx = 10 * 0.5 * cos(0.5*t);
dy = -10 * 0.5 * sin(0.5*t);
theta = atan2(dy, dx);

a = 0.1;

for k = 1:length(t)
    J_11 = cos(theta(k));
    J_12 = -a*sin(theta(k));
    J_21 = sin(theta(k));
    J_22 = a*cos(theta(k));
    J = [J_11, J_12;J_21, J_22];
    hp = [dx(k);dy(k)];
    vc(:, k) = inv(J)*hp;
end
% 
figure(2)
plot(vc')
legend('Velocidad lineal','Velocidad angular')
grid on



figure(3)
plot(t,x,t,dx)
legend('x','dx')
grid on

figure(4)
plot(t,y,t,dy)
legend('y','dy')
grid on

figure(5)
plot(t,theta)
legend('theta')
grid on
%% Programa para identificar el sistema
% Autor Jeysson Tapia
clc; clear; close all;

%% Definición de la señal de referencia en distancias 
t_s=0.1;
f=1/t_s;
t_f=180;
t=0:t_s:t_f-t_s;
x_max=5;
y_max=1;
x=x_max*(t/max(t));
y=sin(0.002/2*pi*f*t)+sin(0.003/2*pi*f*t)+sin(0.005/2*pi*f*t)+sin(0.007/2*pi*f*t); 
y=y_max*(y/max(y));

figure(1)
plot(x,y)
grid on
title('Trayectoría')
xlabel('x [m]');
ylabel('y [m]');

% %% Creación de la señal en velocidades
% dx = zeros(1, length(t)-1);
% dx(1,1:end) = diff(x)./t_s;
% dy = zeros(1, length(t)-1);
% dy(1,1:end) = diff(y)./t_s;
% 
% theta = zeros(1, length(t));
% theta(1,1:end-1) = atan2(dy,dx);
% theta(1,1)=0;
% 
% a = 0.1;
% 
% for k = 1:length(t)-1
%     J_11 = cos(theta(k));
%     J_12 = -a*sin(theta(k));
%     J_21 = sin(theta(k));
%     J_22 = a*cos(theta(k));
%     J = [J_11, J_12;...
%         J_21, J_22];
% 
%     hp = [dx(k);dy(k)];
%     vc(:, k) = inv(J)*hp;
% end
% 
% figure(2)
% plot(t(1:end-1),vc(1,:)',t(1:end-1),vc(2,:)')
% legend('Velocidad lineal','Velocidad angular')
% grid on
% xlabel('x [m]');
% ylabel('y [m]');

%% Gráfico robot moviendose con trayectoría
% Figura3=figure(3);
% for i=1:1:length(t)
%     plot(x(i),y(i),'ok')
%     axis([0 x_max min(y) max(y)])
%     grid on
%     xlabel('x [m]');
%     ylabel('y [m]')
%     pause(t_s/20)
%     clear Figura3
% end

% %% Gráfico robot moviendose con velociades
% x_cal = zeros(1, length(t));
% y_cal = zeros(1, length(t));
% theta_cal = zeros(1, length(t));
% 
% for k = 1:length(t)-1
%     J_11 = cos(theta(k));
%     J_12 = -a*sin(theta(k));
%     J_21 = sin(theta(k));
%     J_22 = a*cos(theta(k));
%     J = [J_11, J_12;...
%         J_21, J_22];
%     hp_cal(:, k) = J*vc(:,k);
%     x_cal(k+1)=x_cal(k)+(hp_cal(1,k)*t_s);
%     y_cal(k+1)=y_cal(k)+(hp_cal(2,k)*t_s);
%     theta_cal(k+1)=atan(y_cal(k+1)/x_cal(k+1));
% end
% 
% % Figura4=figure(4);
% % for i=1:1:length(t)
% %     plot(x_cal(i),y_cal(i),'ok')
% %     axis([min(x_cal) max(x_cal) min(y_cal) max(y_cal)])
% %     grid on
% %     xlabel('x [m]');
% %     ylabel('y [m]')
% %     pause(t_s/20)
% %     clear Figura4
% % end
% 
% largo = 0.325;
% ancho = 0.317;
% % SIMULACION(a,largo,ancho,x_cal,y_cal,x,y,theta_cal,t_s/20);
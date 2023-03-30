%% PARAMETROS DE TIEMPO
clc,clear all,close all;
%% PARAMETROS OBTENIDOS DE LA ESTIMACION DE PARAMETROS
load('IDENTIFICACION_DATOS');
load('PARAMETROS');
t=[to:ts:tf-30];
%% DISTANCIAS DE LA PALTAFORMA MOVIL
a=0.08;
%% VELOCIDADES INICIALES 
u_d(1) = 0;
w_d(1) = 0;
[uref_c,wref_c] = SENAL_1(t,1);
for k=1:length(t)
     tic
     %% VECTORES PARA FORMA GENERAL
     v=[uref_c(k) wref_c(k)]';
     %% DINAMICA DE LA PLATAFORMA MOVIL
     uref(k)=uref_c(k);
     wref(k)= wref_c(k);
     vref =[uref(k) wref(k)]';
     Dinamica = MOVIL_DINAMICA(vref,v,ts,PARAMETROS);
     %% VELOCIDADES DEL ROBOT
     u_d(k+1)=Dinamica(1);
     w_d(k+1)=Dinamica(2);
     %% POSICIONES DEL ROBOT 
     toc
end
%% GRAFICAS DEL SISTEMA
figure
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperSize', [4 2]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 10 4]);
    subplot(2,1,1)
    plot(t,u(1:length(t)),'Color',[226,76,44]/255,'linewidth',1); hold on
    plot(t,uref,'Color',[46,188,89]/255,'linewidth',1); hold on
    plot(t,u_d(1:length(t)),'Color',[83,57,217]/255,'linewidth',1); hold on
    grid on
    title('$\textrm{Validation}$','Interpreter','latex','FontSize',9);
    legend({'$\mu$','$\mu_{ref}$','$\mu_{m}$'},'Interpreter','latex','FontSize',11,'Orientation','horizontal');
    legend('boxoff')
    ylabel('$[m/s]$','Interpreter','latex','FontSize',9);
    subplot(2,1,2)
    plot(t,w(1:length(t)),'Color',[226,76,44]/255,'linewidth',1); hold on
    plot(t,wref,'Color',[46,188,89]/255,'linewidth',1); hold on
    plot(t,w_d(1:length(t)),'Color',[83,57,217]/255,'linewidth',1); hold on
    grid on
    legend({'$\dot\psi$','$\dot\psi_{ref}$','$\dot\psi_{m}$'},'Interpreter','latex','FontSize',11,'Orientation','horizontal');
    legend('boxoff')
    xlabel('$\textrm{Time}[s]$','Interpreter','latex','FontSize',9);ylabel('$[rad/s]$','Interpreter','latex','FontSize',9);
print -dpng VALIDATION
print -depsc VALIDATION
figure
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperSize', [4 2]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 10 4]);
  subplot(2,1,1)
    plot(t,uref,'g','LineWidth',0.8); hold on
    plot(t,u_d(1:length(t)),'b','LineWidth',0.8); hold on
    grid on
    title('$\textrm{Velocidad Lineal}$','Interpreter','latex','FontSize',13);
    legend({'$\mu_{ref}$','$\mu_{m}$'},'Interpreter','latex','FontSize',13);
    xlabel('$\textrm{Tiempo }[s]$','Interpreter','latex','FontSize',13); ylabel('$[m/s]$','Interpreter','latex','FontSize',13);
    subplot(2,1,2)
    plot(t,wref,'g','LineWidth',0.8); hold on
    plot(t,w_d(1:length(t)),'b','LineWidth',0.8); hold on
    grid on
    legend({'$\dot\psi_{p_{ref}}$','$\dot\psi_{p_{m}}$'},'Interpreter','latex','FontSize',13);
    title('$\textrm{Velocidad Angular}$','Interpreter','latex','FontSize',13)
    xlabel('$\textrm{Tiempo }[s]$','Interpreter','latex','FontSize',13); ylabel('$[rad/s]$','Interpreter','latex','FontSize',13);

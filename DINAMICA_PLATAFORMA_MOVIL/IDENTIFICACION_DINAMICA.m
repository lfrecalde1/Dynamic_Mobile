%XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
%XXXXXXXXXXXXXXXXXXXIDENTIFICACION DINAMICA DE LA PLATAFORMA MOVILXXXXXXXXXXXXXXXXXX
%XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
%% PARAMETROS DE TIEMPO
clc,clear all,close all;
ts=0.1;
tf=60;
to=0;
t=[to:ts:tf];
%% INICIALIZACION DE LA COMUNICACION CON ROS
rosshutdown
setenv('ROS_MASTER_URI','http://192.168.22.128:11311')
setenv('ROS_IP','192.168.1.2')
rosinit
%% ENLACE A A TOPICOS DE ROS NECESARIOS
robot = rospublisher('/cmd_vel');
velmsg = rosmessage(robot);
odom = rossubscriber('/odom');
%% LECTURA DEL ROBOT PARA CONDICIONES INICIALES
odomdata = receive(odom,3);
pose = odomdata.Pose.Pose;
vel=odomdata.Twist.Twist;
quat = pose.Orientation;
angles = quat2eul([quat.W quat.X quat.Y quat.Z]);
%% DISTANCIAS DE LA PALTAFORMA MOVIL
a=0.05;
%% POSICIONES INICIALES 
hx(1)=pose.Position.X;
hy(1)=pose.Position.Y;
phi(1)=angles(1);
%% VELOCIDADES INICIALES 
u(1) = vel.Linear.X;
w(1) = vel.Angular.Z;
%% CINEMATICA DIRECTA 
hx(1)=hx(1)+a*cos(phi(1));
hy(1)=hy(1)+a*sin(phi(1));
hxp(1)=0;
hyp(1)=0;
[uref_c,wref_c] = SENAL_1(t,1);
for k=1:length(t)
     tic
     %% ERRORES DE VELOCIDAD VREF
     ue(k)=uref_c(k)-u(k);
     we(k)=wref_c(k)-w(k);
     %% ENVIO DE DATOS AL ROBOT
     velmsg.Angular.Z =wref_c(k);
     velmsg.Linear.X =uref_c(k);
     send(robot,velmsg);
     %% LECTURA DE LAS VELOCIDADES Y ESTADOS DEL ROBOT
     odomdata = receive(odom,3);
     pose = odomdata.Pose.Pose;
     vel=odomdata.Twist.Twist;
     quat = pose.Orientation;
     angles = quat2eul([quat.W quat.X quat.Y quat.Z]);
     %% VELOCIDADES DEL ROBOT
     u(k+1)=vel.Linear.X;
     w(k+1)=vel.Angular.Z;
     %% CINEMATICA DIRECTA
     phi(k+1)=angles(1);
     hx(k+1)=pose.Position.X+a*cos(phi(k+1));
     hy(k+1)=pose.Position.Y+a*sin(phi(k+1));
     while(toc<ts)
     end
     toc
end
%% DETENER A LA PALTAFORMA MOVIL
velmsg.Linear.X = 0;
velmsg.Angular.Z = 0;
send(robot,velmsg);
rosshutdown;
%% PARAMETROS PARA SIMULACION
largo=0.4;
ancho=0.3;
% SIMULACION_DINAMICA(a,largo,ancho,hx,hy,phi,ts)
%% ALMACENACION DATOS PARA LA ESTIMACION
save('IDENTIFICACION_DATOS.mat','u','w','uref_c','wref_c','ts','tf','to');
%% GRAFICAS DEL SISTEMA
figure
plot(hx,hy,'k'); grid
title('Trayectoria Descrita')
legend('Trayectoria Descrita');
xlabel('x [m]'); ylabel('y [m]');

figure
  subplot(2,1,1)
    plot(t,u(1:length(t)),'r'); hold on
    plot(t,w(1:length(t)),'k'); hold on
    plot(t,uref_c,'y'); hold on
    plot(t,wref_c,'c'); hold on
    grid on
    title('Velocidades a la Salida del Robot Y Velocidades de Excitacion')
    legend('Velocidad u','Velocidad w','Velocidad uref_c','Velocidad wref_c')
    xlabel('Tiempo [s]'); ylabel('[m/s rad/s]');
 subplot(2,1,2)

    plot(t,ue,'k'); hold on
    plot(t,we,'c'); hold on
    grid on;
    legend('Error ue','Error de we')
    title('Errores de Velocidad')
    xlabel('Tiempo [s]'); ylabel('Error [m/s rad/s]');

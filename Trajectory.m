%% ************TRAYECOTRIAS EN XYZ *******************
% [Pox,Pox_p,Pox_2p,Poy,Poy_p,Poy_2p,Poz,Poz_p,Poz_2p,Popsi,Popsi_p]=Trajectory(t,ts,trayectoria);
function [x,y,psi,xp,yp,psip] = Trajectory(t,ts,n)
switch n
    case 1 %silla
        no=1.5*2;
        x = 5*cos(0.05*no*t)-0.95;       xp = -5*0.05*no*sin(0.05*no*t);      xpp = -5*0.05*0.05*no*no*cos(0.05*no*t);
        y = 5*sin(0.05*no*t)+1.93;       yp =  5*0.05*no*cos(0.05*no*t);      ypp = -5*0.05*0.05*no*no*sin(0.05*no*t);
        z = 0.5*sin(0.1*no*t)+8;      zp =  0.5*0.1*no*cos(0.1*no*t);      zpp = -0.5*0.1*0.1*no*no*sin(0.1*no*t);
        
        psi = 45*(pi/180)*(ones(1,length(t)));
        psip = 0*(pi/180)*(ones(1,length(t)));

                
    case 2 
        %Trayectoria circular en Y Z
        tt=t;
        no=0.04*4;
        x = 8*sin(no*tt)+5;
        y = 6*cos(no*tt)-4;
        z = 0.75*cos(0.2*4*tt)+10;
        
        [xp,xpp]=derivate(x,ts);
        [yp,ypp]=derivate(y,ts);
        [zp,zpp]=derivate(z,ts);  
        
        psi = 45*(pi/180)*(ones(1,length(t)));
        psip = 0*(pi/180)*(ones(1,length(t)));


    case 3      %circulo con z variaciones
        f=1/ts;
        x_max=5;
        y_max=1;
        x=x_max*(t/max(t));
        y=sin(0.002/2*pi*f*t)+sin(0.003/2*pi*f*t)+sin(0.005/2*pi*f*t)+sin(0.007/2*pi*f*t);
        y=y_max*(y/max(y));
        
        %% Creación de la señal en velocidades
        [xp,xpp] = derivate(x,ts);
        [yp,ypp] = derivate(y,ts);
        psi = atan2(yp, xp);
        psip = 0*(pi/180)*(ones(1,length(t)));
        
    case 4
        tt=t;
        no=0.07*2.5;
        y = 4*sin(2*no*tt)+2;                              %Posici�n x
        x = 8*cos(no*tt)-1;
        z = 0.5*sin(3*no*tt)+7;
        [xp,xpp]=derivate(x,ts);
        [yp,ypp]=derivate(y,ts);
        [zp,zpp]=derivate(z,ts);  
        psi = 45*(pi/180)*(ones(1,length(t)));
        psip = 0*(pi/180)*(ones(1,length(t)));
        
    case 5
        tt=t;
        no=0.1*2;
        mo=50;
        x = 2*tt/mo.*cos(1.2*no*tt)-2;
        y = 3.5*tt/mo.*sin(1.2*no*tt)+1;
        z = 2*tt/mo+5;
        [xp,xpp]=derivate(x,ts);
        [yp,ypp]=derivate(y,ts);
        [zp,zpp]=derivate(z,ts);
        psi = 45*(pi/180)*(ones(1,length(t)));
        psip = 0*(pi/180)*(ones(1,length(t)));
end


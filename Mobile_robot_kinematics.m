%% Simulation fo the mobile Robot %%

% Clear variables
clc, clear all, close all;

% Time definition variables
t_s = 0.05;
t_final = 60;
t = (0:t_s:t_final);

% System Geometric Parameters
a = 0.2;

% Genearl vector parameters
L1 = [a];

%  Desired Trajectory
[xd,yd,psid,xdp,ydp,psidp] = Trajectory(t, t_s, 3);   
% Desired Trajectory
qd = [xd;...
      yd];
  
qdp = [xdp;...
       ydp];
 
% Initial conditions of the system
x_i = xd(1);
y_i = yd(1);
theta = psid(1);

% Initial conditions of the system general vector
q = zeros(3, length(t)+1);

q(:, 1) = [x_i + a*cos(theta);...
           y_i + a*sin(theta);...
           theta];

% Dynamic parameters
chi = [0.3037;0.2768;-0.0004018;0.9835;0.003818;1.0725];

% Robot mobile definitition
mobile_1 = mobile_robot(L1, chi, q(:,1), t_s);

% Control Signal
u = [0.1*ones(1, length(t));...
       0*ones(1, length(t))];
   

% Control gains
K1 = 1*eye(2);
K2 = 1*eye(2);


% Loop Simulation
for k = 1:length(t)
    % error vector
    states = q(:, k);
    qe(:, k) = qd(:, k) - states(1:2);
    % Control law
    u(:, k) = kinematic_controller(qd(:, k), qdp(:, k), q(:, k), K1, K2, L1);
    
    q(:, k+1) = mobile_1.system_f(u(:, k));
end

largo = 0.4;
ancho = 0.3;
% SIMULACION(a,largo,ancho,q(1,:),q(2,:),qd(1, :),qd(2, :),q(3, :),t_s);
% Save Data
save("Mobile_Kinematics.mat", "t", "q", "u", "qd", "qe", "t_s");



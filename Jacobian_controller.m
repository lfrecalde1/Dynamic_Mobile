function [J] = Jacobian_controller(h, L)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
q_x = h(1);
q_y = h(2);
theta = h(3);

a = L(1);
% get Jacobian Matrix of the system

J_11 = cos(theta);
J_12 = -a*sin(theta);

J_21 = sin(theta);
J_22 = a*cos(theta);


J = [J_11, J_12;...
    J_21, J_22];
end


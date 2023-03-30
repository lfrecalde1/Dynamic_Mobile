function [u] = kinematic_controller(hd, hdp, h, K1, K2, L)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
J = Jacobian_controller(h, L);

%% Operator Control

%% Control Error
xe = hd -h(1:2);
v =  (hdp + K2*tanh(inv(K2)*K1*xe));

u = inv(J)*(v);
end


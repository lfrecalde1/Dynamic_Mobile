function [he] = error_dynamic(vref, vref_system, N)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
he = [];
VREF = [vref];
for k=1:N
    he = [he; VREF(:,k)-vref_system(:,k)];
end
end


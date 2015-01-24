function [ pixel ] = scharr_scalar( in )
%SCHARR_SCALAR Summary of this function goes here
%   Detailed explanation goes here

G_x = 
G_y = 

G = sqrt(G_x^2 + G_y^2);

pixel = min(G/8, 1);
end


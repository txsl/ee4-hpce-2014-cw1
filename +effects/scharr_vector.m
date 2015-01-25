function [ pixel ] = scharr_vector( in )
% scharr_scalar Perform the Scharr kernel on a 3x3 matrix
%   in - 3x3 matrix of neighbouring greyscale pixels
%
%   Returns: pixel, the difference between the inputs (as one value).
%   Usefel for edge detection.

G_x = ([ 3 10 3; 0 0 0; -3 -10 -3 ] .* in);
G_y = ([ 3 0 -3; 10 0 -10; 3 0 -3 ] .* in);

G_x = sum(G_x(:));
G_y = sum(G_y(:));

G = sqrt(G_x^2 + G_y^2);

pixel = min(G/8, 1);

end


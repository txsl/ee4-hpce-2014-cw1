function [ pixel ] = scharr_vector( in )
% scharr_scalar Perform the Scharr kernel on a 3x3 matrix
%   in - 3x3 matrix of neighbouring greyscale pixels
%
%   Returns: pixel, the difference between the inputs (as one value).
%   Usefel for edge detection.

G_x = 3*in(1,1:end-2) + 10*in(1,2:end-1) + 3*in(1,3:end) ...
        - 3*in(3,1:end-2) - 10*in(3,2:end-1) - 3*in(3,3:end);

G_y = 3*in(1,1:end-2)  -  3*in(1,3:end) ...
       + 10*in(2,1:end-2)  -  10*in(2,3:end) ...
       + 3*in(3,1:end-2)  -  3*in(3,3:end);

G = sqrt(G_x.^2 + G_y.^2);

pixel = min(G/8, 1);

end


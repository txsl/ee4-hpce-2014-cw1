function [ pixel ] = median_scalar( in )
% median filter Calculate median pixel of input matrix
%   
%   in - Square input matrix of odd dimension (eg 1x1, 3x3, 5x5)
%
%   Returns pixel: the median pixel

pixel = median(in(:));


end


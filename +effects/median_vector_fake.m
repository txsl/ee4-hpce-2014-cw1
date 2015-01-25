function [ pixel_row ] = median_vector_fake( in )
% median filter Calculate median pixel of input matrix
%   
%   in - Square input matrix of odd dimension (eg 1x1, 3x3, 5x5)
%
%   Returns pixel: the median pixel
w_out = size(in, 1);
length = size(in, 2);

border = w_out/2 - 0.5;

pixel_row = nan(1, length-2*border);


for i=1:length-2*border
    tmp = in(:, i:i+2*border);
    pixel_row(i) = median(tmp(:));
end



end

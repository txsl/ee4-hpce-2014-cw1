function [ pixel_row ] = median_vector( in )
% median filter Calculate median pixel of input matrix
%   
%   in - Square input vec of odd height (ie 1, 3, 5, etc high)
%
%   Returns pixel: the vector of median pixels

w_out = size(in, 1);
length = size(in, 2);

border = w_out/2 - 0.5;

output_len = length-2*border;

index_trix = transpose(1:9);
index_trix = repmat(index_trix, [1, output_len]);

index_trix = index_trix + 3*repmat(0:output_len-1, [9, 1]);

pixel_row = median(in(index_trix));

end


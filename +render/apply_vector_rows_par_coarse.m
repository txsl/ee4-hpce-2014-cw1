function [out]=apply_vector_rows_par_coarse(f, border, in)
% apply_scalar_vector_rows Applies a pixel-by-pixel effect to an image,
% using a coarse parfor loop.
%
% f - A function taking a 2*border+1 x 2*border+w row of pixels,
%     and producing a 1 x w row of output pixels
% border - How much extra surrounding input is needed to produce one pixel
% in - Input image as a gray-scale double-precision matrix
%
% Given an input image of width=size(in,2) and height=size(in,1), this
% produces an image of size (height-2*border) x (width-2*border).
%
% Ensures that for all border<y<=height-border and border<x<=width-border
%  out(y-border,1:end) = f( in(y-border:y+border,:) )
%
% > [out]=render.apply_vector_rows(@(x)(1-x), 0, image); % invert an image

NUM_PAR = 16;

hIn=size(in,1);
wIn=size(in,2);

hOut=hIn-2*border;
wOut=wIn-2*border;

assert(hOut>=1);
assert(wOut>=1);

% out=zeros(hOut,wOut);
out = [];

chunk_height = floor(hOut/NUM_PAR);

yC = (0:NUM_PAR)*chunk_height;
yC(NUM_PAR + 1) = hOut - 1;
yC = yC + 1;

counter = 1;
for y=1:NUM_PAR;
    local_loop = in(yC(y):yC(y+1)-1, :);

    tmp = 0;
    for yfine= counter:counter+size(local_loop, 1)
        tmp = tmp + 1;
        nhood = in(yfine:yfine+2*border,:);
        local_out(yfine,:) = f(nhood);
    end
    counter = counter + tmp;
    
    out = [out; local_out];
end

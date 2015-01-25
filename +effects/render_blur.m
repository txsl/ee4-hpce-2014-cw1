function [out] = render_blur(in)
% render_blur Directly blurs an image
%
%  This function is defined by equivalence with scalar_apply and blur_scalar:
%  > [o1]=render.apply_scalar(@effects.blur_scalar, 1, im);
%  > [o2]=render.render_blur(im);
%  > assert(o1==o2);
%
%  As much as possible this should be a simple de-abstraction, with the
%  body of effects.blur_scalar inserted directly into render.apply_scalar,
%  with no further optimisations.

hIn=size(in,1);
wIn=size(in,2);

hOut=hIn-2;
wOut=wIn-2;

assert(hOut>=1);
assert(wOut>=1);

out=zeros(hOut,wOut);

for y=1:hOut
    for x=1:wOut
        out(y,x) =   (in(y,x+1)                ...
       + in(y+1,x)+4*in(y+1,x+1)+in(y+1,x+2)   ...
                 + in(y+2,x+1))/8;
    end
end


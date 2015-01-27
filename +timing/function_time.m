function [ t ] = function_time( f )
% function_time Return the execution time for a single execution of f() in seconds
% 
%  f : A function with no inputs
% 
% The timing accuracy is 10% or better. So if the true time is
% "t" and the measured time is "m", it should attempt to ensure
% that abs((m-t)/t) < 0.1". This function supports
% execution times of f from micro-seconds to minutes
% efficiently.
%
% The user of this function takes on responsibility for
% making sure that the machine is not loaded, and that
% frequency scaling is turned off.
%    
% Examples:
%  
% > f=@()( sin(1) );  timing.function_time(f)
%
% > timing.function_time(@()( randn(1000)*randn(1000) ) )

NUM_ITERS = 100;


% run it once to ensure the JIT compiles it - including the timing
% function!
timing.simple_function_time(f);

t1 = timing.simple_function_time(f);
t2 = timing.simple_function_time(f);

avg = mean([t1 t2]);

if avg > 1
    t = avg;
elseif abs((t2-t1)/t1) >= 0.1
    timings = 0;
    for i=1:NUM_ITERS
        timings = timings + timing.simple_function_time(f);
    end
    t = timings/NUM_ITERS;
else
    t = avg;
end

end


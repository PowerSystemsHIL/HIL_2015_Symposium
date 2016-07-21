% Copyright (c) 2015 Massachusetts Institute of Technology
% Permission is hereby granted, free of charge, to any person obtaining a copy of this 
% software and associated documentation files (the "Software"), to deal in the Software
% without restriction, including without limitation the rights to use, copy, modify, 
% merge, publish, distribute, sublicense, and/or sell copies of the Software, and to 
% permit persons to whom the Software is furnished to do so, subject to the following 
% conditions:
% 
% 
% The above copyright notice and this permission notice shall be included in 
% all copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
% INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
% PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
% HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION 
% OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

function [y, sync] = scopeBuffer(u)
% find zero crossing of u and periodically capture one cycle waveform in a
% vector.  Sync is high when new data available.
% If a vector of signals is input into u the first one is used for trig
% purposes.

%#codegen

Ts = 80e-6;
holdOff = 0.2-2*Ts; % must be less than triggering signal or hold off will be delayed


bufLen = floor(1/60/Ts); % this makes a 1 cycle capture
persistent m1 i hoCount outBuff 

w=length(u);

if isempty(m1)
    m1 = zeros(w,bufLen,'double');
    outBuff = m1;
    i = bufLen;
    hoCount = 0;
end

% determine proper index for circular buffer
i=i+1;
if(i>bufLen)
    i=1;
end
in1 = i-1; % i for n-1, or previous sample
if(in1<1)
    in1=bufLen;
end
m1(:,i) = u; % save to buffer

% state machine
if hoCount > floor(holdOff/Ts) % sample if we holdoff has elapsed
    if (m1(1,i) > 0) && (m1(1,in1) < 0) % we just had a positive going zc
        outBuff = circshift(m1,[0 -in1]);
        % outBuff = m1;    
        sync = 1;
        hoCount = 0;
    else
        sync = 0;
    end
else
    hoCount = hoCount + 1;
    sync = 0;
    %y = zeros(w,bufLen,'double');
end

y = outBuff;
    
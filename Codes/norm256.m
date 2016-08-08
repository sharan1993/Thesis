function normalised=norm256(wholesig,fs)
% Normalization signal to 256 Hz
if (fs==200)
        normalised=resample(wholesig,256,200);
else
    if (fs==512)
            normalised=resample(wholesig,1,2);
    else
            normalised=wholesig;
    end
end
    
    
function f=SpectralEdge(signal,sr)
%Determined Spectral edge frequency of signal
pxx=pwelch(signal,[],[],[],sr);
p=(pxx);
p_90percent=bandpower(p)*0.75;
for i=2:length(p)
    tempp=bandpower(p(1:i),(1:i),'psd');
    if tempp>=p_90percent
        f=i;
        break;
    end
end

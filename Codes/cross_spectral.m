function cross_spectral(signal1,signal2)
%Cross spectral density determination
if length(signal1)>length(signal2)
    pad_size=length(signal1)-length(signal2);
    padded=padarray(signal2,[0 floor(pad_size/2)],'pre');
    padded=padarray(padded,[0 ceil(pad_size/2)],'post');
    longer=signal1;
elseif length(signal2)>length(signal1)
    pad_size=length(signal2)-length(signal1);
    padded=padarray(signal1,[0 floor(pad_size/2)],'pre');
    padded=padarray(padded,[0 ceil(pad_size/2)],'post');
    longer=signal2;
else
    padded=signal2;longer=signal1;
end
figure;
cpsd(longer,padded);

%To calculate the spectral entropy of a signal 
%using psds and sampling frequency as inputs

%psd should be normalized between 0-1 to act as probability density
%function

function se = SEwPSD(psd)

se=0;                           %Spectral Entropy Initialized
%Normalization of PSDs

for i =1 : length(psd)
    p(i)=psd(i)/sum(psd);
end

for i=1:length(p)
    if p(i)==0
        se=se+0;
    else
    se=se+p(i)*log(p(i));
    end
end
se=-se;
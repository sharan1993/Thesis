function Feature_Vec=Features(Signal_1,Signal_2)
%Extracts features for yellow boxing from members of pairs
H(1)=spectral_E(Signal_1,256);
H(2)=spectral_E(Signal_2,256);
H(3)=H(2)/(H(1)+H(2));
p1=pwelch(Signal_1,[],[],[],256);
p2=pwelch(Signal_2,[],[],[],256);
H(4)=SEwPSD(p2(26:40))/(SEwPSD(p1(26:40))+SEwPSD(p2(26:40))); %gamma subband
H(5)=SEwPSD(p2(14:25))/(SEwPSD(p1(14:25))+SEwPSD(p2(14:25))); %beta subband
H(6)=SEwPSD(p2(9:13))/(SEwPSD(p1(9:13))+SEwPSD(p2(9:13))); %alpha subband
H(7)=SEwPSD(p2(5:8))/(SEwPSD(p1(5:8))+SEwPSD(p2(5:8))); %theta subband
H(8)=SEwPSD(p2(1:4))/(SEwPSD(p1(1:4))+SEwPSD(p2(1:4))); %delta subband
H(9)=bandpower(Signal_1)/bandpower(Signal_2);
H(10)=max(Signal_1)/max(Signal_2);

Feature_Vec=H;
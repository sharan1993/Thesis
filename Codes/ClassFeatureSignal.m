function H=ClassFeatureSignal(signal)

%Extracts features from a single signal

    i=1;
    p=pwelch(signal,[],[],[],256);
    H(i,1)=SEwPSD(p(26:40));
    H(i,2)=SEwPSD(p(14:25));
    H(i,3)=SEwPSD(p(9:13));
    H(i,4)=SEwPSD(p(5:8));
    H(i,5)=SEwPSD(p(1:4));
    H(i,6)=SEwPSD(p);
    H(i,7)=H(i,1)/H(i,6);
    H(i,8)=H(i,2)/H(i,6) ;
    H(i,9)=H(i,3)/H(i,6);
    H(i,10)=H(i,4)/H(i,6);
    H(i,11)=H(i,5)/H(i,6);
    H(i,13)=skewness(p);
H(i,12)=geomean(p)/mean(p);
H(i,14)=0;
function H=ExtractFeatures(dset)
%Extracts feature from Detection Set: dseet can be members d or nd in
%detection set
k=1;
for i=1:length(dset.combo)
   out.Signal_1{k}= dset.pair{i}{1}{1};
   out.Signal_2{k}= dset.pair{i}{2}{1};
   if strcmp(dset.combo{i},'NonAEP-AEP') || strcmp(dset.combo{i},'AEP-NonAEP')
       out.class(k)=2;
   else out.class(k)=1;
   end
   k=k+1;
end

H=out.class';k=1;
for i=1:length(H)
    if length(out.Signal_1{i})>20 && length(out.Signal_2{i})>20
        H(k,2)=spectral_E(out.Signal_1{i},256);
        H(k,3)=spectral_E(out.Signal_2{i},256);
        H(k,4)=H(k,3)/(H(k,2)+H(k,3));
        p1=pwelch(out.Signal_1{i},[],[],[],256);
        p2=pwelch(out.Signal_2{i},[],[],[],256);
        H(k,5)=SEwPSD(p2(26:40))/(SEwPSD(p1(26:40))+SEwPSD(p2(26:40))); %gamma subband
        H(k,6)=SEwPSD(p2(14:25))/(SEwPSD(p1(14:25))+SEwPSD(p2(14:25))); %beta subband
        H(k,7)=SEwPSD(p2(9:13))/(SEwPSD(p1(9:13))+SEwPSD(p2(9:13))); %alpha subband
        H(k,8)=SEwPSD(p2(5:8))/(SEwPSD(p1(5:8))+SEwPSD(p2(5:8))); %theta subband
        H(k,9)=SEwPSD(p2(1:4))/(SEwPSD(p1(1:4))+SEwPSD(p2(1:4))); %delta subband
        H(k,10)=geomean(p1)/mean(p1);
        H(k,11)=geomean(p2)/mean(p2);
        k=k+1;
    end
end

H(k:end,:)=[];


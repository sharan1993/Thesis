%calculate Spectral entropy of subbands ratio
for i=1:length(overall_db.Event_ID)
p=(overall_db.PSD_pxx{i});s=sum(p);
SEGamma(i)=SEwPSD(p(26:40));
SEBeta(i)=SEwPSD(p(14:25));
SEAlpha(i)=SEwPSD(p(9:13));
SETheta(i)=SEwPSD(p(5:8));
SEDelta(i)=SEwPSD(p(1:4));
end

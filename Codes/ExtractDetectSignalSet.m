function [nondetect, detect, out]=ExtractDetectSignalSet(data)
%Extracs nd and d for detection
k=1;k1=1;k2=1;
for no=1:length(data.Sigdata)
    for i=1:length(data.Sigdata{no})-1
       out.pair{k}{1}=data.Sigdata{no}(1,i);
       out.pair{k}{2}=data.Sigdata{no}(1,i+1);
       out.combo{k}=strcat(data.Sigdata{no}(2,i),'-',data.Sigdata{no}(2,i+1));
       if strcmp(data.Sigdata{no}(2,i),'NonAEP')
          nondetect.pair{k1}=out.pair{k};
          nondetect.combo{k1}=out.combo{k};k1=k1+1;
       else
          detect.pair{k2}=out.pair{k};
          detect.combo{k2}=out.combo{k};k2=k2+1;
       end
       k=k+1;
    end
end
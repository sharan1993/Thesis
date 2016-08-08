function data=GenerateAEPnNonAEPSet(AEPtime,db)
%Generates potential AEP and not yellow boxed portions of data based on
%classification data
k=1;
for i=1:length(AEPtime.AEPRegion(:,1))
    index=AEPtime.MontageSigIndex(i);
    sig=norm256(db.montage_signal{index},db.samplerate(index));k=1;
    for j=1:length(AEPtime.AEPRegion{i,1})
          if j==1
           data.Sample{i}{k}=sig(1,1:AEPtime.AEPRegion{i,1}(1,1));
           data.SampleClass{i}{k}='NonAEP';data.MontageIndex(i)=index;
           k=k+1;
          end
          if j==length(AEPtime.AEPRegion{i,1})
            data.Sample{i}{k}=sig(1,AEPtime.AEPRegion{i,1}(1,j-1):AEPtime.AEPRegion{i,1}(1,j));
           data.SampleClass{i}{k}='AEP';data.MontageIndex(i)=index;
           k=k+1;
           data.Sample{i}{k}=sig(1,AEPtime.AEPRegion{i,1}(1,j):end);
           data.SampleClass{i}{k}='NonAEP';data.MontageIndex(i)=index;
           k=k+1;
          end
         if mod(j,2)==0 && j~=length(AEPtime.AEPRegion{i,1})
            data.Sample{i}{k}=sig(1,AEPtime.AEPRegion{i,1}(1,j-1):AEPtime.AEPRegion{i,1}(1,j));
           data.SampleClass{i}{k}='AEP';data.MontageIndex(i)=index;
           k=k+1;
           data.Sample{i}{k}=sig(1,AEPtime.AEPRegion{i,1}(1,j):AEPtime.AEPRegion{i,1}(1,j+1));
           data.SampleClass{i}{k}='NonAEP';data.MontageIndex(i)=index;
           k=k+1;
         end
           
    end
end

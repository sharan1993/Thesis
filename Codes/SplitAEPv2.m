function out=SplitAEPv2(AllData)

%Splits AEP for creating detection pair

temp=[];
for no=1:length(AllData.MontageSigIndex)
for i=1:length(AllData.SigData{no}(1,:))
    if strcmp(AllData.SigData{no}(2,i),'AEP')
        if length(AllData.SigData{no}{1,i})>30 %Too ensure segment is big enough for feature extraction
        temp{1,end+1}=AllData.SigData{no}{1,i}(1:floor(length(AllData.SigData{no}{1,i})/2));
        temp{2,end}='AEP';
        temp{1,end+1}=AllData.SigData{no}{1,i}(floor(length(AllData.SigData{no}{1,i})/2)+1:end);
        temp{2,end}='AEP';
        else
           temp{1,end+1}=AllData.SigData{no}{1,i}(1:end);
           temp{2,end}='AEP';
        end
    else
        temp{1,end+1}=AllData.SigData{no}{1,i};
        temp{2,end}='NonAEP';
    end
end
   out.Sigdata{no}=temp;
   temp=[];
end
   out.table_key=AllData.table_key;
   out.MontageSigIndex=AllData.MontageSigIndex;
   out.Sigdata=out.Sigdata';

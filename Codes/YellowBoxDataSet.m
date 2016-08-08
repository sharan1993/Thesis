function data=YellowBoxDataSet(unidata,len)
%Generates Yellow Box data set by dividing signal into segments of size 100
%unidata contains signal divided into chunks of not yellow boxed and yellow
% boxed segments
for i=1:length(unidata.MontageIndex)
    temp=[];
    for j=1:length(unidata.Sample{i})
    if  length(unidata.SampleClass{i}{j})==6   
        if sum(unidata.SampleClass{i}{j}=='NonAEP')==6
         tno=floor(length(unidata.Sample{i}{j})/len);
         remain_sample=length(unidata.Sample{i}{j})-tno*len;
         if remain_sample~=length(unidata.Sample{i}{j})
             temp_index=horzcat(remain_sample+len,len*ones(tno-1,1)');
         else temp_index=remain_sample;
         end
         
         temp1=mat2cell(unidata.Sample{i}{j},1,temp_index);
         temp2=ones(1,length(temp_index));temp2=num2cell(temp2);
         for x=1:length(temp2)
             if temp2{x}==1
                 temp2{x}='NonAEP';
             end
         end
         temp=horzcat(temp,vertcat(temp1,temp2));
        end
    else
        temp{1,end+1}=unidata.Sample{i}{j};
        temp{2,end}='AEP';
    end
    end
    data{i}=temp;
end
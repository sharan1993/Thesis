%Script for running AEP detection through the montage signals where
%AEPs were boxed

clear;
%Loads database containing AEP data
load('Overlord Database.mat');

hit=0;miss=0;index=[];pn(200)=0;hit_f(200)=0;len(200)=0;l(89)=0;
for i=1:length(listet.Anno_no)
    i                               %Displays Annotated AEP searched for
    fla=0;
    n=str2num(listet.Filname_id{i}(4:6));
    
if n<10
    fname=['G:\Univ\thesis\spike dataset 3_7-18-14\s3_00',num2str(n),'.edf'];
end
if n>=10 && n<100 
    fname=['G:\Univ\thesis\spike dataset 3_7-18-14\s3_0',num2str(n),'.edf'];
end
if n>=100
    fname=['G:\Univ\thesis\spike dataset 3_7-18-14\s3_',num2str(n),'.edf'];
end
    [s,e,len(n),pn(n)]=detect(fname,listet.montage_id(i),listet.channel_no(i),0);
    if find(index==listet.montage_id(i)*listet.channel_no(i))
        fla=1;
    else
    index=vertcat(index,listet.montage_id(i)*listet.channel_no(i));
    end
    A=(listet.start_time(i)-(n-1)*30)*256;%start sample
    B=(listet.end_time(i)-(n-1)*30)*256;%end sample
   for j=1:length(s)
       
     %Determine AEP detection hit and miss
    if (s(j)>A && e(j)<B) || (s(j)<A && e(j)>B) ||(s(j)<A && e(j)<B && e(j)>A) || (s(j)>A && s(j)<B)
        hit=hit+1;
       l(i)=abs(s(j)-e(j));
        if fla==1 && hit_f(n)~=0
            miss=miss-1;
        end
    elseif fla==0 
        miss=miss+1;
    end
   end
   
   %Displays hits and misses so far
   hit
   miss
   hit_f(n)=hit_f(n)+1;
   clear A B j s e n fname;
end
neg=floor(len./100);
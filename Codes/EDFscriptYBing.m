%Script to find AEPs in all 200 EDF files

clear;
load('Overlord Database.mat');
load('fiile et list.mat');
hit=0;miss=0;index=[];
for i=1:200
    n=i;
if n<10
    fname=['G:\Univ\thesis\spike dataset 3_7-18-14\s3_00',num2str(n),'.edf'];
end
if n>=10 && n<100 
    fname=['G:\Univ\thesis\spike dataset 3_7-18-14\s3_0',num2str(n),'.edf'];
end
if n>=100
    fname=['G:\Univ\thesis\spike dataset 3_7-18-14\s3_',num2str(n),'.edf'];
end
    [s,e,len]=detectFile(fname,0);
    if find(index==listet.montage_id(i)*listet.channel_no(i))
        fla=1;
    else
    index=vertcat(index,listet.montage_id(i)*listet.channel_no(i));
    end
    A=(listet.start_time(i)-(n-1)*30)*256;%start sample
    B=(listet.end_time(i)-(n-1)*30)*256;%end sample
   for j=1:length(s)
    if (s(j)>A && e(j)<B) || (s(j)<A && e(j)>B) ||(s(j)<A && e(j)<B && e(j)>A) || (s(j)>A && s(j)<B)
        hit=hit+1;
         if fla==1 && hit_f(n)~=0
            miss=miss-1;
        end
    elseif fla==0 
        miss=miss+1;
    end
   end
   hit
   miss
   hit_f(n)=hit_f(n)+1;
   clear A B j s e len n fname;
end
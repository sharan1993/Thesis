function [FV,start,en,time,signal,ps]=detectAnn(signal,ann,len)

%Detects AEPs
%Returns start and end sample with features extracted
%Also plots out the AEP on the montage
%Inputs are montage signal, ANN used for detection, and length of Window used 

i=1;o=[];start=[];en=[];k=1;
time=[];
while i<length(signal)-2*(len+1)
   Considered_Window=signal(i:i+len-1); 
   Next_Seg=signal(i+len:i+2*len-1);
   FV=(Features(Considered_Window,Next_Seg)-ann.u)*ann.M;
   FV(11)=0;
   [ou,~]=testwBias(ann,FV);
   o=vertcat(o,ou);
   if ou==1
       i=i+20;                  %Overlap Samples
   else 
       start=vertcat(start,i);time(k)=i;
       en=vertcat(en,i+len-1);time(k+1)=i+len-1;
       k=k+2;
       i=i+len;
   end
end

i=1;
while i<length(time)
   if time(i+1)-time(i)<200 && mod(i,2)==0    %Concatenating Adjacent segments
       time(i)=[];time(i)=[];
   else
       i=i+1;
   end
end

start=[];en=[];i=1;
while i<length(time)
        start=vertcat(start,time(i));
        en=vertcat(en,time(i+1));
    i=i+2;
end

if isempty(en)~=1 && en(end)/length(signal)>0.90 %Removal of yellow boxes towards end of montage where signal flatlines to zero
    en(end)=[];start(end)=[];
end

i=1;
while i<length(start)           %Limiting Yellow Box size
    yb=signal(start(i):en(i));
    if length(yb)>400
       yb=[];en(i)=start(i)+80;
       if start(i)>101
           yb=signal(start(i)-100:en(i)+20);
       else yb=signal(1:en(i));
       end
    end
    H=ClassFeatureSignal(yb);
    
    %Loads Classication ANN
    load('G:\Univ\thesis\Revised Data\latest data\classiification\ann_class.mat');
    H=horzcat((H(1:end-1)-ann.u)*ann.M,0);
    [o,~]=testwBias(ann,H);
    H=[];
    if o~=2
        start(i)=[];en(i)=[];i=i-1;
    else
         start(i)=start(i)-100;
         if start(i)<1
             start(i)=1;
         end
         en(i)=en(i)+100;
    end
        i=i+1;
end
% 
% i=2;
% while i<length(start)
%    if start(i)-en(i-1)<150 
%        start(i)=[];en(i-1)=[];
%    else
%        i=i+1;
%    end
% end

for i=1:length(signal)
    ps(i)=NaN;
end


for i=1:length(start)
    ps(start(i):en(i))=signal(start(i):en(i));
end

% plot(signal);
% hold on;
% plot(ps);
% hold off;

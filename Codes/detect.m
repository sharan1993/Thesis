function [s,e,len,pn]=detect(filename,montage_no,ch_no,flag)

%Detects AEP in a edf filen in a certain montage no and channel id
%Flag idicates if signal should be plotted(1) or not(0)

%montage no from 9,10,11,12,13,16,17
signal=getMontage(filename);
len=length(signal);

%loads Detection ANN
load('G:\Univ\thesis\Revised Data\latest data\detection stuf\flat\ann60len2.mat');
%ann=ann1;

%determine montage channels
if montage_no==9
    c=ch_no+1;
    % ks=1;ke=18;
elseif montage_no==10
    c=ch_no+20;
    %ks=20;ke=37;
elseif montage_no==11
    c=ch_no+39;
    %ks=39;ke=52;
elseif montage_no==12
    c=ch_no+54;
    %ks=54;ke=69;
elseif montage_no==13
    c=ch_no+71;
    %ks=71;ke=88;
elseif montage_no==16
    c=ch_no+90;
    %ks=90;ke=108;
elseif montage_no==17
    c=ch_no+110;
    %ks=110;ke=130;
else 
    exit;
end

%figure;hold on
%for i=ks:ke
[FV,s,e,time,ps,pso]=detectAnn(signal(c,:),ann,60);
if flag==1
figure;
plot(ps,'b');hold on;
plot(pso,'r');hold off;
end
pn=sum(isnan(ps));
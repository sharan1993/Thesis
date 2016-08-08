function [signal]=getMontage(filename)

%Obtains all montage signal from EDF

%loads data file containing montage and signal lists
load('\..\Data Files\Signal and Montage List.mat');

[hdr,record]=edfread(filename);

[~,ts]=size(record);
sr=ts/(hdr.records*hdr.duration);
record(52,:)=mean(record(2:23,:));
mon=[];
for i=1:length(montage_list(:,1))
    %Determines signals for montage derivation
    a1=montage_list.ch1(i);
    a2=montage_list.ch2(i);
    %Extracts signal data
    x1=strmatch(a1,signal_list.label);
    x2=strmatch(a2,signal_list.label);
    %omits montages based on ECG signals
    if length(x1)~=2 
      temp=(record(x1,:)-record(x2,:));
      temp=norm256(temp,sr);
      mon=vertcat(mon,temp);
    else
        mon=vertcat(mon,zeros(1,length(mon(1,:))));
    end
end

signal=mon;
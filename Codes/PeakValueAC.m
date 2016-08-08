%Caculate peak value of Auto Corr by normalizing each Peak value by its own
%signals max amplitude and then normalizing all over

function [norm,unnorm]=PeakValueAC(overall_db)
unnorm(length(overall_db.Event_ID))=0;
norm=unnorm;
for i=1:length(overall_db.Event_ID)
   unnorm(i)= max(xcorr(overall_db.norm_spike{i},overall_db.norm_spike{i}));
   unnorm(i)=unnorm(i)/max(overall_db.norm_spike{i});
end

norm=normalize(unnorm);
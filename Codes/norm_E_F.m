function db = norm_E_F(db)
%Normalizes all Potential AEP segments in database to 256 Hz

for i=1:length(db.Event_ID)
   db.norm_spike{i}=normfreq(db.montage_signal{i},db.samplerate(i),db.start_time(i),db.end_time(i));
end
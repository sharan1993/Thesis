function sf=SpectralFlatness(db)
%Extracts Spectral Flatness for overlord database signals
for i=1:length(db.Event_ID)
   sf(i)=geomean(db.PSD_pxx{i})/mean(db.PSD_pxx{i}); 
end

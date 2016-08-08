function scf=spectralcrest(overall_db)
%Determines Spectral crest factor (was not used as a feature)
for i=1:length(overall_db.Event_ID)
    m=max(overall_db.PSD_pxx{i});
    scf(i,1)=m/mean(overall_db.PSD_pxx{186}(1:4));
    scf(i,2)=m/mean(overall_db.PSD_pxx{186}(5:8));
    scf(i,3)=m/mean(overall_db.PSD_pxx{186}(9:13));
    scf(i,4)=m/mean(overall_db.PSD_pxx{186}(14:25));
    scf(i,5)=m/mean(overall_db.PSD_pxx{186}(26:40));
end
function H=ClassFeature(db,classinex)
%Extracts Feature for Classification
for i=1:length(db.Event_ID)
    p=(db.PSD_pxx{i});
    pre=pwelch(db.prespike{i},[],[],[],256);
    post=pwelch(db.postspike{i},[],[],[],256);
    H(i,1)=SEwPSD(p(26:40));
    H(i,2)=SEwPSD(p(14:25));
    H(i,3)=SEwPSD(p(9:13));
    H(i,4)=SEwPSD(p(5:8));
    H(i,5)=SEwPSD(p(1:4));
    H(i,6)=SEwPSD(p);
    H(i,7)=H(i,1)/H(i,6);
    H(i,8)=H(i,2)/H(i,6);
    H(i,9)=H(i,3)/H(i,6);
    H(i,10)=H(i,4)/H(i,6);
    H(i,11)=H(i,5)/H(i,6);
    H(i,13)=skewness(db.PSD_pxx{i});
end
H(:,12)=SpectralFlatness(db)';
H(:,14)=classinex;
function data= GenerateYBSet(db)
%Generates not yellow boxed (undivided) and yellow boxed segments of EEG signal
k=1;
for i=1:length(db.table_key(:,1))
    for j=1:length(db.SigData{i})-1
        data.Sig{k}{1}=db.SigData{i}{1,j};
        data.Sig{k}{2}=db.SigData{i}{1,j+1};
        data.SigMonIndex{k}=db.MontageSigIndex(i);
        if (length(db.SigData{i}{2,j+1})==length(db.SigData{i}{2,j}))
            data.SigClass{k}='NonAEP';
        elseif length(db.SigData{i}{2,j})==3
            data.SigClass{k}='AEPBefore';
        elseif length(db.SigData{i}{2,j+1})==3
            data.SigClass{k}='AEPAfter';
        end
        k=k+1;
    end
end
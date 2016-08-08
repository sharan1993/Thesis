function [list,table]=GetETList(db,classinex)
%Gets list of AEPs and their details
list=[];k=1;
for i=1:length(db.Event_ID)
    if classinex(i)==1
        list.Anno_no(k,1)=i;
        list.start_time(k,1)=db.start_time(i);
        list.end_time(k,1)=db.end_time(i);
        list.channel_no(k,1)=db.channel_no(i);
        list.montage_id(k,1)=db.montage_id(i);
        list.Filname_id(k,1)=db.Filename(i);
        list.Anno{k,1}=db.norm_spike{i};
        k=k+1;
    end
end

table=struct2table(list);
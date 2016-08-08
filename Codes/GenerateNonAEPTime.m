function NonAEP=GenerateNonAEPTime(db)
 %Generates time periods that have no AEPs in vincity
 
 ch_mon_key=[];file_key=[];                             %Keep track of montages considered
 k=1;
 for i=1:length(db.Event_ID)
     flag=0;
     table_key=horzcat(num2cell(ch_mon_key),file_key');
     if ~isempty(ch_mon_key)
        for x=1:length(table_key(:,1))
           if db.channel_no(i)==table_key{x,1} && db.montage_id(i)==table_key{x,2} && sum(db.Filename{i}==table_key{x,3})==length(table_key{x,3}) 
              flag=1;
              j=x;
           end
        end
     end
     if flag==0;
        ch_mon_key(k,:)=horzcat(db.channel_no(i),db.montage_id(i));
        file_key{k}=db.Filename{i};
        NonAEP.Channel(k)=db.channel_no(i);
        NonAEP.MontageID(k)=db.montage_id(i);
        NonAEP.AEPRegion{k}(1)=floor(256*mod(db.start_time(i),30))-20;
        NonAEP.AEPRegion{k}(2)=floor(256*mod(db.end_time(i),30))+15;
        NonAEP.Filename(k)=db.Filename(i);
        NonAEP.MontageSigIndex(k)=i;
        k=k+1;
     else
                NonAEP.AEPRegion{j}(end+1)=floor(256*mod(db.start_time(i),30))-20;
                NonAEP.AEPRegion{j}(end+1)=floor(256*mod(db.end_time(i),30))+15;
                NonAEP.AEPRegion{j}=sort(NonAEP.AEPRegion{j});    

     end
 end
 NonAEP=rmfield(NonAEP,{'Channel','MontageID','Filename'});
 NonAEP.table_key=table_key;
 NonAEP.MontageSigIndex=NonAEP.MontageSigIndex';
 NonAEP.AEPRegion=NonAEP.AEPRegion';
 ch_mon_key=[];
 
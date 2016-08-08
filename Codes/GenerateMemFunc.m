function [mf, mfAEP, mfNonAEP]=GenerateMemFunc(db)
%Generates membership function of each member with respect to each
%confidence level
mf(length(db.Event_ID),5)=0;
temp=horzcat(db.Class_by_12,db.Class_by_22,db.Class_by_54,db.Class_by_55,db.Class_by_60,db.Class_by_68,db.Class_by_69);
for i=1:length(db.Event_ID)
    mf(i,1)=0*sum(temp(i,:)==201)/7;
    mf(i,2)=20*sum(temp(i,:)==202)/7;
    mf(i,3)=50*sum(temp(i,:)==203)/7;
    mf(i,4)=80*sum(temp(i,:)==204)/7;
    mf(i,5)=100*sum(temp(i,:)==205)/7;
end

mfAEP=mf(:,5)+mf(:,4);
mfNonAEP=mf(:,1)+mf(:,2);
function [Final_Class]=ClassMembership(db)
%Simplifies five confidence levels to a two class problem with class0
%represent DNK, class 1 AEP, class 2 non AEP
ConfMatrix=horzcat(db.Class_by_12,db.Class_by_22,db.Class_by_54,db.Class_by_55,db.Class_by_60,db.Class_by_68,db.Class_by_69);

for j=1:length(ConfMatrix(1,:))
    for i=1:length(ConfMatrix(:,1))
        if ConfMatrix(i,j)==201 || ConfMatrix(i,j)==202
            Class(i,j)=2;
        elseif ConfMatrix(i,j)==204 || ConfMatrix(i,j)==205
            Class(i,j)=1;
        else Class(i,j)=0;
        end
    end
end

sumAEP=sum(Class'==1);
sumNonAEP=sum(Class'==2);
sumDNC=sum(Class'==0);
for i=1:length(Class)
    if sumAEP(i)==sumNonAEP(i)
        Final_Class(i)=0;
    elseif sumAEP(i)>sumNonAEP(i)
        Final_Class(i)=1;
    else Final_Class(i)=2;
    end
end

Final_Class=Final_Class';


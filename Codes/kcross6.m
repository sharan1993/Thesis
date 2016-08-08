function [subset1,subset2,subset3,subset4,subset5,subset6]=kcross6(sortedH)
%subsets for k=6 cross validation
for i=1:length(sortedH(:,1))
    if sortedH(i,end)==-1
        classindex(i)=1;
    else classindex(i)=2;
    end
end

index=crossvalind('Kfold',classindex,6);

subset1=[];subset2=[];subset3=[];subset6=[];subset9=[];subset7=[];subset4=[];subset5=[];subset8=[];
for i=1:length(index)
    if index(i)==1
        subset1=vertcat(subset1,sortedH(i,:));
    elseif index(i)==2
        subset2=vertcat(subset2,sortedH(i,:));
    elseif index(i)==3
        subset3=vertcat(subset3,sortedH(i,:));
    elseif index(i)==4
        subset4=vertcat(subset4,sortedH(i,:));
     elseif index(i)==5
         subset5=vertcat(subset5,sortedH(i,:));
    else
        subset6=vertcat(subset6,sortedH(i,:));
    end
end
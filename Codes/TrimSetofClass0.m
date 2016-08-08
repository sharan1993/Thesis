function [AllSet]=TrimSetofClass0(H)
%Trims classification set of unsure classes
k=1;
for i=1:length(H(:,1))
    if H(i,length(H(1,:)))~=0
        AllSet(k,:)=H(i,:);
        k=k+1;
    end
end
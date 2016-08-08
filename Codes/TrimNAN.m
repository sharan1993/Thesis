function [Hndtrim]=TrimNAN(Hnd)
%Trims feature vectors containing features with values of NaN
k=1;
for i=1:length(Hnd(:,1))
if ~isnan(sum(Hnd(i,:)))
Hndtrim(k,:)=Hnd(i,:);
k=k+1;
end
end
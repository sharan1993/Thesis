function out=normalize(array)
%Normalization to a scale of 0 and 1
for i=1:length(array)
   out(i)=(array(i)-min(array))/(max(array)-min(array)); 
end
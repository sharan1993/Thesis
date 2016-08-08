function centroid=centroid_spec(auto,lag)
%Calculates centroid
nsum=0;dsum=0;
for i=1:length(lag)
   nsum=nsum+lag(i)*auto(i);
   dsum=dsum+auto(i);
end

centroid=nsum/dsum;
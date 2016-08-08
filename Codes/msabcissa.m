function msa=msabcissa(auto,lag)
%Calculates mean square abcissa
nsum=0;dsum=0;
for i=1:length(lag)
   nsum=nsum+lag(i)*lag(i)*auto(i);
   dsum=dsum+auto(i);
end

msa=nsum/dsum;
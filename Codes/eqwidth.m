function eqw=eqwidth(auto,lag)
%Determines equalwidth
nsum=0;dsum=0;
for i=1:length(lag)
   nsum=nsum+auto(i);
end
dsum=max(auto);
eqw=nsum/dsum;
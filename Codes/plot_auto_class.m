function plot_auto_class(overall_db,class,No_Agreed)
%Cross correlation
[~,ic]=count_class(overall_db,class,No_Agreed);

figure;
hold on
for i=1:length(ic)
   [acor,lag]=xcorr(overall_db.norm_spike{ic(i)},overall_db.norm_spike{ic(i)}); 
   plot(lag,acor);
   lag=[];acor=[];
end
hold off
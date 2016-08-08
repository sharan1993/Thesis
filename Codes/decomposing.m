function decompWavelets= decomposing(overall_db)
%Wavelet decompostion of all signals in database
for i=1:length(overall_db.Event_ID)
   [decompWavelets.C{i},decompWavelets.L{i}]=wavedec(overall_db.norm_spike{i},4,'db4');
end
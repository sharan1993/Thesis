%Script to generate d and nd for detection

clear
load('Overlord Database.mat')
unidata=GenerateAEPnNonAEPSet(GenerateNonAEPTime(overall_db),overall_db);
trial=YellowBoxDataSet(unidata,60);
final60.MontageSigIndex=unidata.MontageIndex;
final60.SigData=trial;
NonAEPtime=GenerateNonAEPTime(overall_db)
final60.table_key=NonAEPtime.table_key;
[nd,d,out]=ExtractDetectSignalSet(SplitAEPv2(final60));
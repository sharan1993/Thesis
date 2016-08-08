****************Master's thesis files - Sharan Rajendran****************************************************************

Main Directory:
-Codes : Contains Functions used (Comments in each respective file)
-Data Files : Contains data files used and generated before determing results at each step
-Results : Results for detection and classification
-Thesis Document : Contains LaTex files, figures and final document

Codes:
-AEPscriptYBing : Used to check performance of overall detection with finalized 89 AEPs
-EDFscriptYBing : Runs detection over all montages in all EDFs
-Generate_d_nd_set : generates overlord database for use of detection

Data Files:
-Overlord Database : Root database 
(IMP: Contains structure "overall_db" which contains all yellow boxed data. Can be used for generating all other feature sets)

-Classificaton H : contains feature set used for classification
-Detect Pair Set (L=60) : Contains d and nd for window size of 60
-Detect Pair Set (L=100) : Contains d and nd for window size of 100
-Detection Feature Set : feature set for detection
-Signal and Montage List : contains list of signals in EEG and montage signal derivations

Results:
Classification : Contains ANN data obtained during training for classification
Detection : Contains ANN data (pre context, post context: window sizw 60 and 100, and training on balanced data)
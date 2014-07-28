Codebook.md

run_analysis.R takes the data from the UCIHAR Dataset and processes it (details below). The file needs to changed such that the "yourPath" variable specifices where the UCIHAR Dataset variables have been downloaded and uncompressed to. The path specification system is consistent with linux operating systems. 

The UCIHAR Dataset is the described as following from the source[1]:

run_analysis.R works by reading in the files from test and training sets, loading in variable names and appropriately name the R variables' columns and rows. The Test and Train datasets are merged into a singl matrix of (observations) x (variables), where each observation is one of the 10299 data points captured in the appropriate study[2], and each of the rows is one of the variables measured. The script proceeds to creating a reduced version of the dataset where only "means" of the 3D data are included in the "reduced" version of the dataset. This reduced dataset is write to the path in a csv format to the file xMatrixReduced.csv

run_analysis.R also produces a new dataset which consists in taking the mean variable values for each subject and creating a matrix of (variables) x (subjects) where entry (i,j) is the mean of the ith variable for the jth subject. This varibale is called newData and is writen to the path onto a file newData.csv 
•which is contained in the zip file of the downloadable data. 


Sources:

[1] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones [2] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

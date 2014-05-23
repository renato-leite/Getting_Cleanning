
## Infos about the analysis

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

30 subjects have done 6 diferent activities, walking, walking upstairs, walking downstairs, sitting, standing and laying, several times, while they had their motion measured by the smartphone.

* The analysis starts with the importation of all the files described at README.md, except features_info.

* The train files are concatenated (A), as well as the test files (B). 
* The columns receive temporary label.

* Both datasets are merged, creating only one big data set (Base).

* A new dataset is created selecting only the useful measures from the previous one (NewBase).

* To identify each combination of action and subject a vector (CAT) is created.

* The current dataset is split according to the vector CAT creating SDT.

* The averege os all the measures is calculated for each activity and each subject TD.

* The activities labels are merged to the dataset creating the Tidy dataset.

* English like descriptive activity names are given to the measures and activities in the data set.

* The tidy dataset is ordered in a more intuitive form.
The tidy data is exported.



######################################
#
#  This script imports and transform the data from the Coursera Project
#  into a Tidy data.
#  The description is in the README.MD
#
######################################

##Imports accelerometer data

A1=read.table("train/subject_train.txt")
A2=read.table("train/X_train.txt")
A3=read.table("train/y_train.txt")

B1=read.table( "test/subject_test.txt")
B2=read.table("test/X_test.txt")
B3=read.table("test/y_test.txt")

#imports MetaData

L = read.table("activity_labels.txt")
N = read.table("features.txt")

#extracts features names
NM = N[,2]
rm(N)
NM=as.character(NM)

# criates vector that identifies trainning and test data. Just for eventual control
A4 = matrix("A",dim(A1)[1],dim(A1)[2])
B4 = matrix("B",dim(B1)[1],dim(B1)[2])

#agregates columns
A = cbind(A4,A1,A3,A2)
B = cbind(B4,B1,B3,B2)
rm(A1)
rm(A2)
rm(A3)
rm(A4)
rm(B1)
rm(B2)
rm(B3)
rm(B4)

# gives functional names to the fundamental columns
names(A)[1] = "base"
names(A)[2] = "id"
names(A)[3] = "Y"
names(A)[4:dim(A)[2]] = NM

names(B)[1] = "base"
names(B)[2] = "id"
names(B)[3] = "Y"
names(B)[4:dim(B)[2]] = NM

# combines tranning and test data
Base = rbind(A,B)
rm(A)
rm(B)

# Selects mean and standard deviation measurements for each measurement
NewBase = Base[,c(1,2,3,
          4, 5, 6, 7, 8, 9, 
          44, 45, 46, 47, 48, 49, 
          84, 85, 86, 87, 88, 89, 
          124, 125, 126, 127, 128, 129, 
          164, 165, 166, 167, 168, 169, 
          204, 205, 
          217, 218, 
          230, 231, 
          243, 244, 
          256, 257, 
          269, 270, 271, 272, 273, 274, 
          348, 349, 350, 351, 352, 353, 
          427, 428, 429, 430, 431, 432, 
          506, 507, 
	  519, 520,
          532, 533,
	  545, 546)]

rm(Base)

# Merge activity label
LBase = merge(NewBase,L,by.x = "Y",by.y = "V1")

# creates useful subject ID vector
ID = LBase[,3]

# creates useful Activity vector
Activity = LBase[,dim(LBase)[2]]

# Selects and converts measurements into matrix
DT = as.matrix(LBase[4:(dim(NewBase)[2])])

# Creates new DataFrame
PTD = as.data.frame(cbind(ID,Activity,DT))

# Concatenates subject ID and Activity to create a new variable that, alone identifies each variable for each activity
CAT = paste(ID,Activity)

# Splits measurements by each variable and each activity
SDT = split(PTD,CAT)


rm(CAT)
rm(DT)
rm(LBase)

# Calculates the average of each variable for each activity and each subject
TD = do.call(rbind,lapply(SDT, colMeans))
rm(SDT)

# Merges Activity Label lost in previous transformation
Temp = merge(TD,L,by.x = "Activity",by.y = "V1")
rm(TD)
Temp[,1] = Temp[,dim(Temp)[2]]
Temp = Temp[,-dim(Temp)[2]]


# Puts Tidy data in final object
Tidy = Temp

# Saves descriptive activity names to name the activities in the data set
english.names =  c("Activity","ID",
"t.Body.Acceleration.Mean.X","t.Body.Acceleration.Mean.Y","t.Body.Acceleration.Mean.Z",
"t.Body.Acceleration.Std.X","t.Body.Acceleration.Std.Y","t.Body.Acceleration.Std.Z",
"t.Gravity.Acceleration.Mean.X","t.Gravity.Acceleration.Mean.Y","t.Gravity.Acceleration.Mean.Z",
"t.Gravity.Acceleration.Std.X","t.Gravity.Acceleration.Std.Y","t.Gravity.Acceleration.Std.Z",
"t.Body.Acceleration.Jerk.Mean.X","t.Body.Acceleration.Jerk.Mean.Y","t.Body.Acceleration.Jerk.Mean.Z",
"t.Body.Acceleration.Jerk.Std.X","t.Body.Acceleration.Jerk.Std.Y","t.Body.Acceleration.Jerk.Std.Z",
"t.Body.Gyro.Mean.X","t.Body.Gyro.Mean.Y","t.Body.Gyro.Mean.Z",
"t.Body.Gyro.Std.X","t.Body.Gyro.Std.Y","t.Body.Gyro.Std.Z",
"t.Body.Gyro.Jerk.Mean.X","t.Body.Gyro.Jerk.Mean.Y","t.Body.Gyro.Jerk.Mean.Z",
"t.Body.Gyro.Jerk.Std.X","t.Body.Gyro.Jerk.Std.Y","t.Body.Gyro.Jerk.Std.Z",
"t.Body.Acceleration.Magnitude.Mean","t.Body.Acceleration.Magnitude.Std",
"t.Gravity.Acceleration.Magnitude.Mean","t.Gravity.Acceleration.Magnitude.Std",
"t.Body.Acceleration.Magnitude.Mean","t.Body.Acceleration.Magnitude.Std",
"t.Body.Gyro.Magnitude.Mean","t.Body.Gyro.Magnitude.Std",
"t.Body.Gyro.Magnitude.Mean","t.Body.Gyro.Magnitude.Std",
"f.Body.Acceleration.Mean.X","f.Body.Acceleration.Mean.Y","f.Body.Acceleration.Mean.Z",
"f.Body.Acceleration.Std.X","f.Body.Acceleration.Std.Y","f.Body.Acceleration.Std.Z",
"f.Body.Acceleration.Jerk.Mean.X","f.Body.Acceleration.Jerk.Mean.Y","f.Body.Acceleration.Jerk.Mean.Z",
"f.Body.Acceleration.Jerk.Std.X","f.Body.Acceleration.Jerk.Std.Y","f.Body.Acceleration.Jerk.Std.Z",
"f.Body.Gyro.Mean.X","f.Body.Gyro.Mean.Y","f.Body.Gyro.Mean.Z",
"f.Body.Gyro.Std.X","f.Body.Gyro.Std.Y","f.Body.Gyro.Std.Z",
"f.Body.Acceleration.Magnitude.Mean","f.Body.Acceleration.Magnitude.Std",
"f.Body..Magnitude.Mean","f.Body..Magnitude.Std",
"f.Body.Gyro.Magnitude.Mean","f.Body.Gyro.Magnitude.Std",
"f.Body.Gyro.Magnitude.Mean","f.Body.Gyro.Magnitude.Std")

# Aplly new names into datasets
names(Tidy) = english.names
names(PTD) = english.names

# Order Tidy data in a more intuitive form
Tidy = Tidy[ order(Tidy[,2], Tidy[,1]), ]

# Writes tidy data into Work Directory
write.table(Tidy, "TidyData.txt", sep="\t")

## COURSE: Exploratory Data Analysis
## student: lanthano, fgonzalezalonso@outlook.es
## date: 20150911
##
## NOTE: My level of English is low, Excuse me for the mistakes will commit in the comments.
## 
## Here are the data for the project:
## INFO:
## https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
## DOWNLOAD:
## https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip


## Targets:
## For each plot you should Construct the plot and save it to a PNG file with a
## width of 480 pixels and a height of 480 pixels.

## Name each of the plot files as plot1.png, plot2.png, etc.
## Create a separate R code file (plot1.R, plot2.R, etc.) that constructs 
## the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot.
## Your code file should include code for reading the data so that the plot can
## be fully reproduced. You must also include the code that creates the PNG file.
## Add the PNG file and R code file to the top-level folder of your 
## git repository (no need for separate sub-folders)

## When you are finished with the assignment, push your git repository to GitHub
## so that the GitHub version of your repository is up to date. There should be
## four PNG files and four R code files, a total of eight files in the top-level
## folder of the repo.

## The four plots that you will need to construct are shown below.
## Plot 1 -> ExDataCP1Plot1.png
## Plot 2 -> ExDataCP1Plot2.png
## Plot 3 -> ExDataCP1Plot3.png
## Plot 4 -> ExDataCP1Plot4.png

## This script is for generation of plot4.

## BEGIN

## Config global Vars
dataZip <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip";
dataFile <- "household_power_consumption.txt"
pngfile <- "plot4.png";

## Download the datafile:
download.file(dataZip, destfile = "./Dataset.zip");
unzip("./Dataset.zip");

## Loading Data:
df.housepwr <- read.csv(dataFile, sep=";", header=TRUE );

## Convert Date column to date format:
df.housepwr[, "Date"] <- as.Date(df.housepwr[, "Date"], "%d/%m/%Y");

## Subset only "2006-02-01" or  "2006-02-02" date measures:
df.housepwr <- df.housepwr[df.housepwr$Date == "2007-02-01" | df.housepwr$Date == "2007-02-02",];

## Convert df.Global_active_power column to number
df.housepwr[,"Global_active_power"]<-as.numeric(paste(df.housepwr[,"Global_active_power"]));

## Convert df.Global_reactive_power column to number
df.housepwr[,"Global_reactive_power"]<-as.numeric(paste(df.housepwr[,"Global_reactive_power"]));

## Convert df.Voltage column to number
df.housepwr[,"Voltage"]<-as.numeric(paste(df.housepwr[,"Voltage"]));

## Convert df.Global_intensity column to number
df.housepwr[,"Global_intensity"]<-as.numeric(paste(df.housepwr[,"Global_intensity"]));

## Convert df.Sub_metering_1 column to number
df.housepwr[,"Sub_metering_1"]<-as.numeric(paste(df.housepwr[,"Sub_metering_1"]));

## Convert df.Sub_metering_2 column to number
df.housepwr[,"Sub_metering_2"]<-as.numeric(paste(df.housepwr[,"Sub_metering_2"]));

## Convert df.Sub_metering_3 column to number
df.housepwr[,"Sub_metering_3"]<-as.numeric(paste(df.housepwr[,"Sub_metering_3"]));

## create new column Data+Time column to date format:
strDateTime <- paste(df.housepwr[, "Date"], df.housepwr[, "Time"]);
posixltDateTime <- strptime(strDateTime, "%Y-%m-%d %H:%M:%S"); 
df.housepwr$posixltDateTime<-posixltDateTime;

## Create the scatterplot in screen device:

## define "table"
par (mfrow = c(2,2))
par(mar=c(4,4,2,2))


## ****** PLOT1 *******

## Create the scatterplot in screen device:
plot(df.housepwr$posixltDateTime,             ## define X-data of histogram 
     df.housepwr$Global_active_power,         ## define y-data of histogram
     type= "l",
     main= "",                                ## define Main title of graph  
     xlab= "",                                ## define x-asis title of graph
     ylab= "Global Active Power", ## define y-asis title of graph
);


## ****** PLOT2 *******

plot(df.housepwr$posixltDateTime,             ## define X-data of histogram 
     df.housepwr$Voltage,         ## define y-data of histogram
     type= "l",
     main= "",                                ## define Main title of graph  
     xlab= "datetime",                                ## define x-asis title of graph
     ylab= "Voltage", ## define y-asis title of graph
);


## ****** PLOT3 *******

plot(df.housepwr$posixltDateTime,              ## define X-data of histogram 
     df.housepwr$Sub_metering_1,               ## define y-data of histogram
     type= "l",
     main= "",                                ## define Main title of graph  
     xlab= "",                                ## define x-asis title of graph
     ylab= "Energy sub Metering", ## define y-asis title of graph
);

points(df.housepwr$posixltDateTime,        ## define X-data of histogram 
       df.housepwr$Sub_metering_2, type= "l", col="red");         ## define y-data of histogram

points(df.housepwr$posixltDateTime,        ## define X-data of histogram 
       df.housepwr$Sub_metering_3, type= "l",  col="blue");         ## define y-data of histogram

legend( "topright", 
        paste("Sub_metering_", 1:3), 
        col = c(1,2,4), 
        lty = 1,
        cex = 0.6
)


## ****** PLOT4 *******

plot(df.housepwr$posixltDateTime,             ## define X-data of histogram 
     df.housepwr$Global_reactive_power,       ## define y-data of histogram
     type= "l",
     main= "",                                ## define Main title of graph  
     xlab= "datetime",                        ## define x-asis title of graph
     ylab= "Global_reactive_power"            ## define y-asis title of graph
);


## Copy my plot to a PNG file
dev.copy(png, file = pngfile, width = 480, height = 480); 

## Close the PNG device  
dev.off();  


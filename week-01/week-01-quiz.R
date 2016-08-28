##### Getting & Cleaning Data Week 1 Quiz

library(data.table)
library(dplyr)
library(RCurl)
library(rJava)
library(xlsx)
library(XLConnect)
library(XML)
setwd("./Github/coursera-getting-and-cleaning-data/week-01")


##### Housing Survey
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
              "american-community-survey-housing-2006.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf",
              "american-community-survey-housing-2006-cookbook-pdf")
survey <- read.csv("american-community-survey-housing-2006.csv")
str(survey)
 # Homes with property value over $1,000,000
mansions <- dplyr::filter(survey, survey$VAL == 24)
str(mansions)
# ANSWER: 53 with value over $1,000,000 (VAL==24)


##### Natural Gas Acquisition Program
##### Data originally from 
#####   http://catalog.data.gov/dataset/natural-gas-acquisition-program
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",
              "natural-gas-acquisition.xlsx")
dat <- readWorksheetFromFile("natural-gas-acquisition.xlsx",
                            sheet = "NGAP Sample Data",
                            region = "G18:O23", header = TRUE)
sum(dat$Zip*dat$Ext,na.rm=T) # Script from Coursera
 # Resulting sum is 36534720


##### Baltimore Restaurants
##### XML Import Exercise
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",
              "baltimore-restaurants.xml")
dateDownloaded <- date()
doc <- xmlTreeParse("baltimore-restaurants.xml", useInternal = TRUE)
rootNode <- xmlRoot(doc)
sum(xpathSApply(rootNode, "//zipcode", xmlValue) == "21231")
 # 127 Restaurants with the ZIP code 21231


##### American Community Survey: 2006 Idaho
##### data.table Speed Exercise
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url=fileURL, destfile = "acs-2006-fsspid.csv",
              mode = "w", method = "curl")

DT <- fread(input="acs-2006-fsspid.csv")

 # Testing method speeds
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(rowMeans(DT)[DT$SEX==1], rowMeans(DT)[DT$SEX==2])
system.time(mean(DT[DT$SEX==1,]$pwgtp15), mean(DT[DT$SEX==2,]$pwgtp15))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
 # Pretty much all are 0. Apparently answer is 
 # "sapply(split(DT$pwgtp15,DT$SEX),mean)"
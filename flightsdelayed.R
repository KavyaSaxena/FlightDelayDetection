origdata <- read.csv2("C:\\Users\\kavya saxena\\Desktop\\702123122_T_ONTIME_REPORTING.csv", sep=",", header = TRUE, stringsAsFactors = FALSE)
> nrow(origdata)
[1] 469968
> airports <- c('ATL', 'LAX', 'ORD', 'DFW', 'JFK', 'SFO', 'CLT', 'LAS', 'PHX')
> origdata <- subset(origdata, DEST %in% airports & ORIGIN %in% airports)
> nrow(origdata)
[1] 32716
> head(origdata,2)
DAY_OF_MONTH DAY_OF_WEEK OP_UNIQUE_CARRIER
1            1           4                AA
2            1           4                AA
OP_CARRIER_AIRLINE_ID OP_CARRIER TAIL_NUM
1                 19805         AA   N787AA
2                 19805         AA   N795AA
OP_CARRIER_FL_NUM ORIGIN_AIRPORT_ID
1                 1             12478
2                 2             12892
ORIGIN_AIRPORT_SEQ_ID ORIGIN DEST_AIRPORT_ID
1               1247802    JFK           12892
2               1289203    LAX           12478
DEST_AIRPORT_SEQ_ID DEST DEP_TIME DEP_DEL15
1             1289203  LAX      855      0.00
2             1247802  JFK      856      0.00
DEP_TIME_BLK ARR_TIME ARR_DEL15 CANCELLED DIVERTED
1    0900-0959     1237      0.00      0.00     0.00
2    0900-0959     1651      0.00      0.00     0.00
DISTANCE  X
1  2475.00 NA
2  2475.00 NA
> tail.matrix(origdata,2)
DAY_OF_MONTH DAY_OF_WEEK OP_UNIQUE_CARRIER
469922           31           6                OO
469923           31           6                OO
OP_CARRIER_AIRLINE_ID OP_CARRIER TAIL_NUM
469922                 20304         OO   N593ML
469923                 20304         OO   N973SW
OP_CARRIER_FL_NUM ORIGIN_AIRPORT_ID
469922              6452             12892
469923              6453             12892
ORIGIN_AIRPORT_SEQ_ID ORIGIN DEST_AIRPORT_ID
469922               1289203    LAX           14107
469923               1289203    LAX           14107
DEST_AIRPORT_SEQ_ID DEST DEP_TIME DEP_DEL15
469922             1410702  PHX      810      0.00
469923             1410702  PHX     1604      0.00
DEP_TIME_BLK ARR_TIME ARR_DEL15 CANCELLED
469922    0800-0859     1033      0.00      0.00
469923    1600-1659     1828      0.00      0.00
DIVERTED DISTANCE  X
469922     0.00   370.00 NA
469923     0.00   370.00 NA
> origdata$X <- NULL
> head(origdata,2)
DAY_OF_MONTH DAY_OF_WEEK OP_UNIQUE_CARRIER
1            1           4                AA
2            1           4                AA
OP_CARRIER_AIRLINE_ID OP_CARRIER TAIL_NUM
1                 19805         AA   N787AA
2                 19805         AA   N795AA
OP_CARRIER_FL_NUM ORIGIN_AIRPORT_ID
1                 1             12478
2                 2             12892
ORIGIN_AIRPORT_SEQ_ID ORIGIN DEST_AIRPORT_ID
1               1247802    JFK           12892
2               1289203    LAX           12478
DEST_AIRPORT_SEQ_ID DEST DEP_TIME DEP_DEL15
1             1289203  LAX      855      0.00
2             1247802  JFK      856      0.00
DEP_TIME_BLK ARR_TIME ARR_DEL15 CANCELLED DIVERTED
1    0900-0959     1237      0.00      0.00     0.00
2    0900-0959     1651      0.00      0.00     0.00
DISTANCE
1  2475.00
2  2475.00
> cor(origdata[c"ORIGIN_AIRPORT_SEQ_ID","ORIGIN_AIRPORT_ID"])
Error: unexpected string constant in "cor(origdata[c"ORIGIN_AIRPORT_SEQ_ID""
> cor(origdata[c("ORIGIN_AIRPORT_SEQ_ID","ORIGIN_AIRPORT_ID")])
ORIGIN_AIRPORT_SEQ_ID
ORIGIN_AIRPORT_SEQ_ID                     1
ORIGIN_AIRPORT_ID                         1
ORIGIN_AIRPORT_ID
ORIGIN_AIRPORT_SEQ_ID                 1
ORIGIN_AIRPORT_ID                     1
> cor(origdata[c("DEST_AIRPORT_SEQ_ID","DEST_AIRPORT_ID")])
DEST_AIRPORT_SEQ_ID DEST_AIRPORT_ID
DEST_AIRPORT_SEQ_ID                   1               1
DEST_AIRPORT_ID                       1               1
> origdata$ORIGIN_AIRPORT_SEQ_ID <- NULL
> origdata$DEST_AIRPORT_SEQ_ID <- NULL
> mismatched <- origdata[origdata$OP_CARRIER != origdata$OP_UNIQUE_CARRIER,]
> nrow(mismatched)
[1] 0
> origdata$OP_UNIQUE_CARRIER <- NULL
> head(origdata,2)
DAY_OF_MONTH DAY_OF_WEEK OP_CARRIER_AIRLINE_ID
1            1           4                 19805
2            1           4                 19805
OP_CARRIER TAIL_NUM OP_CARRIER_FL_NUM
1         AA   N787AA                 1
2         AA   N795AA                 2
ORIGIN_AIRPORT_ID ORIGIN DEST_AIRPORT_ID DEST
1             12478    JFK           12892  LAX
2             12892    LAX           12478  JFK
DEP_TIME DEP_DEL15 DEP_TIME_BLK ARR_TIME ARR_DEL15
1      855      0.00    0900-0959     1237      0.00
2      856      0.00    0900-0959     1651      0.00
CANCELLED DIVERTED DISTANCE
1      0.00     0.00  2475.00
2      0.00     0.00  2475.00
> onTimeData <- origdata[!is.na(origdata$DEP_DEL15) & origdata$DEP_DEL15 != "",]
> nrow(origdata)
[1] 32716
> nrow(onTimeData)
[1] 32166
> onTimeData$DISTANCE <- as.integer(onTimeData$DISTANCE)
> onTimeData$CANCELLED <- as.integer(onTimeData$CANCELLED)
> onTimeData$DIVERTED <- as.integer(onTimeData$DIVERTED)
> onTimeData$DEP_DEL15 <- as.factor(onTimeData$DEP_DEL15)
> onTimeData$DEST_AIRPORT_ID <- as.factor(onTimeData$DEST_AIRPORT_ID)
> onTimeData$ORIGIN_AIRPORT_ID <- as.factor(onTimeData$ORIGIN_AIRPORT_ID)
> onTimeData$DAY_OF_WEEK <- as.factor(onTimeData$DAY_OF_WEEK)
> onTimeData$OP_CARRIER <- as.factor(onTimeData$OP_CARRIER)
> onTimeData$DEST <- as.factor(onTimeData$DEST)
> onTimeData$ORIGIN <- as.factor(onTimeData$ORIGIN)
> onTimeData$DEP_TIME_BLK <- as.factor(onTimeData$DEP_TIME_BLK)
> onTimeData$ARR_DEL15 <- as.factor(onTimeData$ARR_DEL15)
> onTimeData <- origdata[!is.na(origdata$DEP_DEL15) & origdata$DEP_DEL15 != "" & !is.na(origdata$ARR_DEL15) & origdata$ARR_DEL15 != "",]
> nrow(onTimeData)
[1] 32124
> tapply(onTimeData$ARR_DEL15, onTimeData$DEP_DEL15, length)
0.00  1.00 
25946  6178 
> 
  
  > (6178/(25946+6178))
[1] 0.1923173
> source('C:/Users/kavya saxena/Desktop/flightsdelayed.R')
Error in source("C:/Users/kavya saxena/Desktop/flightsdelayed.R") : 
  C:/Users/kavya saxena/Desktop/flightsdelayed.R:12:23: unexpected symbol
11: 
  12: OP_CARRIER_AIRLINE_ID OP_CARRIER
^
  > source('C:/Users/kavya saxena/Desktop/flightsdelayed.R')
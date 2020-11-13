#Behind the scene: need to determine in which lines our data 
# for 01/02/2007 is located.
#library(lubridate)
#data_full <- read.csv2("household_power_consumption.txt")
#data_full$Date <- dmy(data_full$Date)
#Date1 <- dmy("01/02/2007")
#Date2 <- dmy("01/02/2007")
#data <- subset(data_full, Date == Date1 | Date == Date2)
# We can see that the data is from line 66637 to line 69516, 
# 2880 rows. We read data from the original file accordingly

headers = read.csv2("household_power_consumption.txt", header = F,
                    nrows = 1, as.is = T)
data <- read.csv2("household_power_consumption.txt", 
                  colClasses = c(rep("character", 2), rep("numeric", 7)),
                  header = FALSE, skip = 66637, nrows = 2880, dec = ".")
colnames(data) <- headers
png("Plot1.png")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global active power")
dev.off()



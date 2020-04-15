
WD = setwd("C:/Users/Peter/Music/Rprojects/DataoldTotest/Data")

pollutantmean = function(directory, pollutant, id = 1:332){
    data_location = paste(WD, directory, sep="/")
    mean_columns = numeric(length(id))
    temp = list.files(path =data_location ,pattern="*.csv")
    
    for (monitor_id in id){
            
            monitordataCSV = read.csv(paste(data_location, temp[monitor_id], sep = "/"))
            
            mean_columns[monitor_id] = mean(monitordataCSV[[pollutant]], 
                                            na.rm = TRUE)
    } 
    mean_columns = mean(mean_columns, na.rm = TRUE)
    mean_columns
}

i.d = 1:10
data_location = paste(WD, "specdata", sep="/")
mean_columnsT = numeric(length(i.d))
tempT = list.files(path =data_location ,pattern="*.csv")

for (monitor_id in i.d){
        
        monitordataCSVT = read.csv(paste(data_location, tempT[monitor_id], sep = "/"))
        
        mean_columnsT[monitor_id] = mean(monitordataCSVT[["sulfate"]], 
                                        na.rm = TRUE)
}
mean_columnsT


monitor_id = mean(monitordataCSVT[["sulfate"]], 
                  na.rm = TRUE)


mean_columns = mean(mean_columns, na.rm = TRUE)
mean_columns



complete = function(directory, id = 1:332){
        data_location = paste(WD, directory, sep="/")
        nobs = numeric(length(id))
        temp = list.files(path =data_location ,pattern="*.csv")
        
        for (monitor_id in 1:length(id)){
                print(monitor_id)
                monitordataCSV = read.csv(paste(data_location, temp[monitor_id], sep = "/"))
                Bothpollutants1 = monitordataCSV[[2]]
                Bothpollutants2 = monitordataCSV[[3]]
                
                nobs[monitor_id] = sum(Bothpollutants1, Bothpollutants2,
                                                na.rm = TRUE)
        } 
        df_cases = data.frame(id, nobs)
        df_cases
}

setwd("C:/Users/Peter/Music/Rprojects/DataoldTotest")

monitordataCSV11 =read.csv(paste("specdata", temp[289], sep = "/"))



setwd(data_locationTest)

temp = list.files(pattern="*.csv")
for (i in 1:length(temp)) assign(temp[i], read.csv(temp[i]))

temp = list.files(pattern="*.csv")
myfiles = lapply(temp, read.delim)


setwd(paste(WD, directory, sep = "/"))
monitordataCSV11 = read.csv(temp[289])

monitordataCSV11[["nitrate"]][!is.na(monitordataCSV11[["nitrate"]])]



monitordataCSVTest
mean_columnsTest


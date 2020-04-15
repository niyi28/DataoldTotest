corr = function(directory, threshold =0){
        data_location = paste(WD, directory, sep="/")
        corArray = numeric(332)
        temp = list.files(path =data_location ,pattern="*.csv")
        
        for (monitor_id in 1:332){
                #print(monitor_id)
                
                monitordataCSV = read.csv(paste(data_location, temp[monitor_id], sep = "/"))
                Bothpollutants1 = monitordataCSV[[2]]
                Bothpollutants2 = monitordataCSV[[3]]
                
                completeCases = complete.cases(Bothpollutants1, Bothpollutants2)
                
                        if (length(Bothpollutants2[completeCases]) > threshold){
                                corArray[monitor_id] = cor(Bothpollutants1[completeCases],
                                                           Bothpollutants2[completeCases])
                        } else { corArray[monitor_id] = 0}
                
        } 
        
        corID = corArray[corArray!=0]
        corID
}

cr = corr("specdata")

x <- 1:100
filter(x, rep(1, 3))

cr = corr("specdata")
cr = sort(cr)
RNGversion("3.5.1")
set.seed(868)
out = round(cr[sample(length(cr), 5)], 4)

cr = corr("specdata", 129)
cr = sort(cr)
n = length(cr)
RNGversion("3.5.1")
set.seed(197)
out = c(n, round(cr[sample(n, 5)], 4))

cr = corr("specdata", 2000)
n = length(cr)
cr = corr("specdata", 1000)
cr = sort(cr)
c(n, round(cr, 4))

library(readxl)
H_flamespeed111 <- read_excel("C:/Users/Peter/Desktop/wgpythonscript/H_flamespeed_results111Excel.xlsx", 
                              col_types = c("numeric", "numeric", "numeric", 
                                            "numeric", "numeric", "text", "text", 
                                            "numeric"))
H_flamespeed213 <- read_excel("C:/Users/Peter/Desktop/wgpythonscript/H_flamespeed_results213Excel.xlsx", 
                              col_types = c("numeric", "numeric", "numeric", 
                                            "numeric", "numeric", "text", "text", 
                                            "numeric"))
H_flamespeed132 <- read_excel("C:/Users/Peter/Desktop/wgpythonscript/H_flamespeed_results132Excel.xlsx", 
                              col_types = c("numeric", "numeric", "numeric", 
                                            "numeric", "numeric", "text", "text", 
                                            "numeric"))

H_flamespeed312 <- read_excel("C:/Users/Peter/Desktop/wgpythonscript/H_flamespeed_results312Excel.xlsx", 
                              col_types = c("numeric", "numeric", "numeric", 
                                            "numeric", "numeric", "text", "text", 
                                            "numeric"))
H_flamespeedcomplete <- read_excel("C:/Users/Peter/Desktop/wgpythonscript/H_flamespeed_resultscompleteExcel.xlsx", 
                                                col_types = c("numeric", "numeric", "numeric", 
                                                              "numeric", "numeric", "text", "text", 
                                                              "text", "numeric"))
H_flamespeedcomplete %>%
  ggplot(mapping = aes(x = PHIL, y = S0, colour = mixn)) +
  geom_point()

library(ggplot2)
library(tidyverse)

H_flamespeed213$p0 = H_flamespeed213$p0/1e5

H_flamespeed312%>%
  ggplot(mapping = aes(x = phi, y = S0, colour = T0)) +
  geom_point()

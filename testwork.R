rainfall = c(799,1174.8,865.1,1334.6,635.4,918.5,685.4,918.5,685.5,998.6,784.2,985,882.8,1071)
rainfall.timeseries = ts(rainfall, start= c(2012,1), frequency=12)
rainfall.timeseries

png(file = 'rainfall.png')

plot(rainfall.timeseries)

dev.off()

rainfall1 = c(799,1174.8,865.1,1334.6,635.4,918.5,685.4,998.6,784.2,985,882.8,1071)
rainfall2 = c(655, 1306.9, 1323.4, 1172.2, 562.2, 824, 822.4, 1265.5, 799.6, 1105.6, 1106.7, 1337.8)

combined.rainfall = matrix(c(rainfall1, rainfall2), nrow=12)
print(combined.rainfall)
rainfall_timeseries = ts(combined.rainfall, start=c(2012,1), frequency=12)
rainfall_timeseries

png(file = 'raining_combined.png')

plot(rainfall_timeseries, main= 'Multiple Time Series')

dev.off()

ts(combined.rainfall, frequency=7, start=c(2014, 6))


fcst <- c(3434.23, 3434.23, 3232.4, 1894.63, 1989.23,
          3827.71, 3827.71, 3827.71, 3434.23, 1984.42, 
          1894.63, 1989.23, 3827.71, 3827.71, 3827.71, 
          3827.71, 3625.88, 2288.11, 1989.23, 3434.23, 
          3434.23, 3434.23, 3434.23, 3232.4, 2288.11, 
          2382.71, 3827.71, 3827.71)

act <- c(3194.62, 3109.93, 2991.44, 1741.49, 1935.07,
         3100.84, 3169.39, 3170.24, 2613.81, 1947.35,
         1820.63, 1765.62, 3397.48, 3501.14, 3444.14, 
         3589.24, 3263.55, 2153.49, 2159.85, 3237.94, 
         345.7, 3246.66, 3195.58, 3001.53, 2073.76, 
         2419.29, 3530.62, 3455.71)



fn <- function(fcst, act, par) {
  sum(abs(act - (fcst * par)))}

xmin1 <- optimize(fn, c(0.5, 1.5), fcst = fcst, act = act)


BDE = c(439, 420, 413, 400, 474, 375, 369, 377, 465, 547)

Hatom = c(3,5,7,9,5,7,5,3,3,1)

plot(BDE, Hatom, type = 'l')

emp_array = list()
for (i in 1:30){
  matrix_head = head(Matrixx1, n=30)
  new_mati = matrix_head[[i]]
  new_mat_df =  data.frame(new_mati[i])
  emp_array = append(emp_array, new_mat_df)
}

emp_array = append(emp_array, new_mati)

install.packages("tidyverse")

library(tidyverse)

data()

attach(starwars)


starwars %>% 
  select(gender, mass, height, species) %>%
  filter(species=="Human") %>%
  na.omit()%>%
  mutate(height = height/100)%>%
  mutate(BMI = mass/height^2) %>%
  mutate(inverseBMI = 1/BMI) %>%
  group_by(gender) %>%
  summarise(Average_BMI = mean(BMI))

starwars %>%
  na.omit() %>%
  if (height<=mean(height)){
    heightcond = 'Short'
  } else{heightcond = 'Tall'} %>%
  mutate(heightcond = heightcond)
filter(starwars, is.na(height))
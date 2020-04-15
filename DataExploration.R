install.packages("ggstance")
library(ggstance)

diamonds%>%
  ggplot(mapping = aes(x=cut)) + 
  geom_bar() +
  geom_point(mapping = aes(y = carat))


diamonds %>%
  group_by(cut)%>%
  summarise(counted = n())


diamonds%>%
  count(cut)

diamonds%>%
  ggplot(mapping = aes(x=carat)) + 
  geom_histogram(binwidth = 0.5)


diamonds%>%
  count(cut_width(carat, 0.5))

smaller = diamonds%>%
  filter(carat<3 )

smaller%>%
  ggplot(mapping = aes(x=carat))+
  geom_histogram(binwidth = 0.1)

smaller%>%
  ggplot(mapping = aes(x =carat, colour = cut)) +
  geom_freqpoly(binwidth = 0.1)
  

smaller%>%
  ggplot(mapping = aes(x =carat)) +
  geom_histogram(binwidth = 0.01)


##### Old faithful Geyser
faithful %>%
  ggplot(mapping = aes(x = eruptions)) + 
  geom_histogram(binwidth = 0.25)

diamonds%>%
  ggplot(mapping = aes(x=y)) +
  geom_histogram(binwidth = 0.5) +
  coord_cartesian(ylim = c(0,50))

unusual = diamonds %>%
  filter(y < 3 | y >20) %>%
  select(price, x, y, z) %>%
  arrange(y)

unusual %>%
  ggplot(mapping = aes(x=y))+
  geom_histogram()

diamonds%>%
 
  ggplot(mapping = aes(x=z)) +
  geom_histogram(binwidth = 0.5)

diamonds%>%
 
  ggplot(mapping = aes(x=y)) +
  geom_histogram(binwidth = 0.5)

diamonds%>%
 
  ggplot(mapping = aes(x=x)) +
  geom_histogram(binwidth = 0.5)

diamonds%>%
  ggplot(mapping = aes(x=price)) +
  geom_histogram(binwidth = 1000) + 
  coord_cartesian(xlim = c(0, 2500))

diamonds%>%
  count(cut_width(price, 1000))

#diamonds%>%
  length(which(diamonds$carat==0.99))

#### Dealing with missing values
diamonds2 = diamonds%>%
  filter(between(y, 3,20))

diamonds3 = diamonds %>%
  mutate(y = ifelse(y<3|y>20, NA, y))

diamonds3%>%
  ggplot(mapping = aes(x=x, y =y))+
  geom_point(na.rm = TRUE) +
  coord_cartesian(xlim = c(3,9.5))


flights %>%
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time%/%100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min/60
  ) %>%
  ggplot(mapping = aes(sched_dep_time, colour = cancelled)) +
  geom_freqpoly(binwidth = 1/4)

diamonds3%>%
  ggplot(mapping = aes(y)) + 
  geom_histogram(binwidth = 0.5)

diamonds%>%
  mutate(color  = ifelse(color  =="E", NA, as.character(color)))%>%
  ggplot(mapping = aes(color)) + 
  geom_bar()

diamonds%>%
  ggplot(mapping = aes(x=price, y = ..density..)) +
  geom_freqpoly(mapping = aes(colour= cut), binwidth = 500)

diamonds%>%
  ggplot(mapping = aes(x=price, y = ..density..)) +
  geom_freqpoly()


diamonds%>%
  ggplot(mapping = aes(x=price)) +
  geom_freqpoly(mapping = aes(colour= cut), binwidth = 500)

diamonds %>%
  ggplot(mapping = aes(x=cut, y=price))+
  geom_boxplot()


diamonds %>%
  group_by(cut)%>%
  summarise(mean_price = mean(price))


#### To reorder categorical variables
mpg %>%
  ggplot() +
  geom_boxplot(mapping = aes(x=reorder(class, hwy, FUN = median), y = hwy)) +
  coord_flip()

flights %>%
  head(n=2) %>%
  select()

diamonds %>%
  group_by(cut)%>%
  summarise(mean_price = mean(carat))

diamonds %>%
  ggplot(mapping = aes(x =cut, y = price))+
  geom_violin() +
  ggstance::geom_boxploth()

####Correlation between continous variables
install.packages("modelr")
library(modelr)


mod = lm(log(price)~log(carat), data = diamonds)

shine_likediamonds = diamonds %>%
  mutate(loggin_price = log(price))%>%
  add_predictions(mod)%>%
  add_residuals(mod)%>%
  mutate(resid_orRasheed = exp(resid))

shine_likediamonds%>%
  ggplot(mapping = aes(x = carat, y = resid)) +
  geom_point() +
  geom_abline()

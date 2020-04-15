install.packages("Rtools")
install.packages("workflow")
install.packages("parsnip")
install.packages("recipes")
install.packages("yardstick")
install.packages("gimnet")
install.packages("tidyverse")
install.packages("tidyquant")


remotes::install_github("business-science/timetk")

library("workflow")
library("parsnip")
library("recipes")
library("yardstick")
library("gimnet")
library("tidyverse")
library("tidyquant")
library("timetk")

install.packages("installr")

library(installr)

updateR()

bikes = read_csv("Data/day.csv")

bikes_tbl = bikes%>%
  select(dteday, cnt)%>%
  rename(date = dteday,
         value = cnt)

bikes_tbl %>% 
  ggplot(aes(x = date, y = value))+
  geom_rect(xmin=as.numeric(ymd("2012-07-01")),
            xmax = as.numeric(ymd("2013-01-01")),
            ymin=0, ymax = 9000, 
            fill = palette_light()[[4]], alpha = 0.01)+
  annotate("text", x= ymd("2011-10-01"), y = 7000,
           color = palette_light()[[1]], label = "Train_Region")+
  annotate("text", x=ymd("2012-10-01"), y = 1550,
           color= palette_light()[[1]], label = "Test_Region") +
  geom_point(alpha= 0.5, color = palette_light()[[1]]) + 
  labs(title = "Bikes Sharing Dataset: Daily Scale", x = "") +
  theme_tq()


##### Splitting into traning and test sets
test_tbl = bikes_tbl %>% filter(date < ymd("2012-07-01"))
train_tbl = bikes_tbl %>% filter(date >= ymd("2012-07-01"))

#####Modelling
recipe_spec_timeseries = recipe(value ~ ., data = train_tbl) %>%
  step_timeseries_signature(date)

baked_data = bake(prep(recipe_spec_timeseries), new_data = train_tbl)

recipe_spec_final = recipe_spec_timeseries %>%
  step_rm(date)%>%
  step_rm(contains("iso"), 
          contains("second"), contains("minute"), contains("hour"),
          contains("am.pm"), contains("xts")) %>%
  step_normalize(contains("index.num"), date_year)%>%
  step_interact(~ date_month.lbl * date_day) %>%
  step_interact(~ date_month.lbl * date_mweek) %>%
  step_interact(~ date_month.lbl * date_wday.lbl * date_yday)%>%
  step_dummy(contains("lbl"), one_hot = TRUE)

bake(prep(recipe_spec_final), new_data = train_tbl)


####  Model specification
model_spec_gimnet = linear_reg(mode = "regression", penalty = 10, mixture = 0.7)%>%
  set_engine("glmnet")


workflow()
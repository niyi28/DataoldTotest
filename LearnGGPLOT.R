install.packages(c('nycflights13', 'gapminder', 'Lahman'))

library(nycflights13)

library(gapminder)

library(Lahman)

library(tidyverse)

#### Using ggplot2

ggplot(data=mpg) + geom_point(mapping=aes(x =displ, y = hwy))

### Reusable ggplot model
#ggplot(data=<DATA>) + <GEOM_FUNCTION>(mapping=aes(<MAPPINGS>))

ggplot(data=mpg) + geom_point(mapping=aes(x =displ, y = hwy, color = class))

ggplot(data=mpg) + geom_point(mapping=aes(x =displ, y = hwy, size = class))

ggplot(data=mpg) + geom_point(mapping=aes(x =displ, y = hwy, alpha = class))

ggplot(data=mpg) + geom_point(mapping=aes(x =displ, y = hwy, shape = class))

### Manual colouring ggplot 
ggplot(data=mpg) + geom_point(mapping=aes(x =displ, y = hwy), color = 'blue')

ggplot(data=mpg) + geom_point(mapping=aes(x =displ, y = displ))

ggplot(data=mpg) + geom_point(mapping=aes(x =displ, y = hwy, stroke = 3))

ggplot(data=mpg) + geom_point(mapping=aes(x =displ, y = hwy, colour = displ<5))

ggplot(data=mpg) + geom_point(mapping=aes(x =displ, y = hwy, colour = year==1999))

ggplot(data = mpg) + geom_point(mapping = aes( x= displ, y = hwy)) + facet_wrap(~ class, nrow=3)

ggplot(data = mpg) + geom_point(mapping = aes( x= displ, y = hwy)) + facet_wrap(~ cty, nrow=4)

ggplot(data = mpg) + geom_point(mapping = aes( x= displ, y = hwy)) + facet_grid(drv ~ class)

ggplot(data = mpg) + geom_point(mapping = aes( x= displ, y = hwy)) + facet_grid(drv ~ year)

ggplot(data = mpg) + geom_point(mapping = aes( x= displ, y = hwy)) + facet_grid(. ~ drv)

ggplot(data = mpg) + geom_point(mapping = aes( x= displ, y = hwy)) + facet_grid(. ~ cyl)

ggplot(data = mpg) + geom_point(mapping = aes( x= displ, y = hwy)) + facet_grid(. ~ cty)

ggplot(data = mpg) + geom_point(mapping = aes( x= displ, y = hwy)) + facet_grid(. ~ hwy)

ggplot(data = mpg) + geom_point(mapping = aes(x = drv, y = cyl))

ggplot(data = mpg) + geom_point(mapping = aes( x= displ, y = hwy)) + facet_grid(hwy ~.)

ggplot(data = mpg) + geom_point(mapping = aes( x= displ, y = hwy)) + facet_grid(cty~ .)

##### Geometric objects

ggplot(data=mpg) + geom_point(mapping=aes(x =displ, y = hwy))

ggplot(data=mpg) + geom_point(mapping=aes(x =displ, y = hwy, linetype = drv))

ggplot(data=mpg) + geom_smooth(mapping=aes(x =displ, y = hwy))

ggplot(data=mpg) + geom_smooth(mapping=aes(x =displ, y = hwy, linetype = drv))

ggplot(data=mpg) + geom_smooth(mapping=aes(x =displ, y = hwy, group = drv))

ggplot(data=mpg) + geom_smooth(mapping=aes(x =displ, y = hwy, color = drv))

ggplot(data=mpg) + geom_smooth(mapping=aes(x =displ, y = hwy, color = drv), show.legend = FALSE)


ggplot(data=mpg) + geom_smooth(mapping=aes(x =displ, y = hwy, linetype = class))

#### Multiple geoms on a plot
ggplot(data=mpg) + geom_point(mapping=aes(x =displ, y = hwy)) + 
  geom_smooth(mapping=aes(x =displ, y = hwy))

ggplot(data=mpg) + geom_point(mapping=aes(x =displ, y = hwy, color= class)) + 
  geom_smooth(mapping=aes(x =displ, y = hwy))

ggplot(data=mpg, mapping=aes(x =displ, y = hwy)) + geom_point() + 
  geom_smooth()

ggplot(data=mpg, mapping=aes(x =displ, y = hwy)) + geom_point(mapping=aes(color = class), show.legend = FALSE) + 
  geom_smooth()

ggplot(data=mpg, mapping=aes(x =displ, y = hwy)) + geom_point(mapping=aes(color = class), show.legend = FALSE) + 
  geom_smooth(data=filter(mpg, class == 'subcompact'))


ggplot(data=mpg, mapping=aes(x =displ, y = hwy)) + geom_point(mapping=aes(color = class), show.legend = FALSE) + 
  geom_smooth(data=filter(mpg, class == 'subcompact'), se =FALSE)

ggplot(data=mpg, mapping=aes(x =displ, y = hwy)) + geom_point(mapping=aes(color = drv), show.legend = FALSE) + 
  geom_smooth( se = FALSE)

ggplot(data=mpg, mapping=aes(x =displ, y = hwy, color = drv)) + geom_point() + 
  geom_smooth( se = FALSE)

ggplot(data=mpg, mapping=aes(x =displ, y = hwy)) + geom_point(mapping=aes(stroke = 2.5)) +
  geom_smooth( se = FALSE)

ggplot(data=mpg, mapping=aes(x =displ, y = hwy)) + geom_point(mapping=aes(stroke = 2.5)) +
  geom_smooth(mapping=aes(group = drv), se = FALSE)

ggplot(data=mpg, mapping=aes(x =displ, y = hwy, color = drv)) + geom_point(mapping=aes(stroke = 2.5)) +
  geom_smooth(se = FALSE, size = 1.5)

ggplot(data=mpg, mapping=aes(x =displ, y = hwy)) + geom_point(mapping=aes(stroke = 2.5,  color = drv)) +
  geom_smooth(se = FALSE, size = 1.5)

ggplot(data=mpg, mapping=aes(x =displ, y = hwy)) + geom_point(mapping=aes(stroke = 5), color = 'white') +
  geom_point(mapping=aes(stroke = 2.5,  color = drv))
 
ggplot(data = diamonds) + geom_bar(mapping = aes(x=cut))

ggplot(data=diamonds) + stat_count(mapping = aes(x = cut))

demo_table = tribble(
  ~cut,             ~freq,
  'Fair',           1610, 
  'Good',           4906,
  'Very Good',      12082,  
  'Premium',        13791,
  'Ideal',          21551
  )

cut = c('Fair','Good', 'Very Good',  'Premium', 'Ideal')
freq = c(1610, 4906, 12082, 13791, 21551)
 
demo_df = data.frame(cut, freq)  

ggplot(data = demo_table) + geom_bar(mapping = aes(x=cut, y=freq), stat = 'identity')

ggplot(data = demo_df) + geom_bar(mapping = aes(cut, freq), stat = 'identity')

ggplot(data = demo_table) + geom_bar(mapping = aes(x=cut))
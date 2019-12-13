
library(ggplot2)
library(daa.table)
library(dplyr)


my_seed <- runif(1:1000)
my_seed2 <- runif(1:1000)


x <- my_seed
y <- my_seed2
z <- sin(abs(log(x*y)))



data.table::data.table(x = x, y = y, z = z) %>%
  ggplot(aes(x = x, y = y)) +
  geom_point(aes(color = z), size = 6) +
  theme_void() +
  theme(legend.position = "none") +
  scale_color_viridis_c(na.value = "#440154FF") +
  coord_equal()


data.table::data.table(x = floor(150 * x),
                       y = floor(150 * y),
                       z = 2 * z) %>%
  ggplot(aes(x = x, y = y, fill = z)) +
  geom_tile() +
  theme_void() +
  theme(legend.position = "none") +
  scale_fill_viridis_c() +
  coord_equal() +
  theme(plot.background = element_rect(fill = '#440154FF'))

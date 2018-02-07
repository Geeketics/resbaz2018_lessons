library(tidyverse)

data("starwars")
View(starwars)
starwars %>% head()
class(starwars)

starwars %>% select(name, height)

starwars %>% select(1,2)

starwars %>% select(2, 1)

starwars %>% select(height, hair_color, everything())

starwars %>% select(contains("color"))

starwars %>% select(ends_with("color"))


col <- "color"
starwars %>% select(contains(col))

starwars  %>% filter(height > 150)
starwars %>% slice(1)
starwars[1,]

starwars  %>% select(name)
starwars %>% pull(name)

# name + height
star_height <- starwars %>% select(name, height)

# name + all colors cols
star_color <- starwars %>% select(name, contains('color'))

full_join(star_height, star_color, by = "name")

inner_join(star_height, star_color %>% slice(1), by = "name")

left_join(star_height, star_color %>% slice(1), by = "name")

right_join(star_height, star_color %>% slice(1), by = "name")

star_color %>% slice(1) %>% select(name2 = name)

left_join(star_height, star_color %>% slice(1) %>% rename(name2 = name), by = c("name" = "name2", "height" = "hair_color"))

starwars %>% select(eye_color, skin_color) %>% distinct() %>% arrange(eye_color, desc(skin_color))

starwars %>% mutate(height_m = height / 100) %>% select(height_m, everything())

starwars %>% summarise(mean_height  = mean(height, na.rm = TRUE))

starwars %>% select(height, mass) %>% summarise_all(., funs(mean(., na.rm = TRUE)))

starwars %>% select(height, mass) %>% mutate_all(., funs( . / 2))

div_two <- function(x){
  x /2
}

starwars %>% select(height, mass) %>% mutate_all(., funs( div_two))

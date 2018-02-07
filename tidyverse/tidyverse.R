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

starwars %>% select(height, mass) %>% mutate_all(.,  funs(2 / . * 100)) %>%  summarise(height_mean = mean(height, na.rm = TRUE))

starwars %>% pull(height) %>% mean(na.rm = TRUE, x = .)

div_two <- function(x){
  x / 2
}

starwars %>% select(height, mass) %>% mutate_all(.,  funs(div_two))

starwars %>% mutate_if(., is.numeric, funs(div_two))

starwars %>% mutate_at(., vars("height","mass"), funs(div_two))


starwars %>% mutate_if(., is.numeric, funs(div_two)) %>% select(height, mass)

starwar %>% mutate(height = div_two(height), mass = div_two(mass))

starwars %>% mutate_at(., vars("height","mass"), funs(div_two)) %>% select(height, mass)

starwars %>% # my data set
#  mutate_at(., vars(contains("height")), funs(div_two)) %>% # dividing height by 2
  select(height, mass) %>%
  #head() # for debugging
 mutate(height = height * 3)

star_height %>% mutate(height_bin = ifelse(height > 100, ifelse(height > 150, TRUE, 0.5), FALSE))

star_height %>% mutate(height_bin =
                         case_when(height > 150 ~ 1,
                                   height > 100 ~ 0.5,
                                   TRUE ~ 0))

# tidyr

starwars %>%
  select(name, eye_color) %>%
  filter(eye_color %in% c("blue", "yellow","pink")) %>%
  # spread(key = eye_color, value = eye_color) %>%
  # gather(key = name, "name", 2:NCOL(.))


starwars %>%
  select(name, eye_color) %>%
  filter(eye_color == "pink")

starwars %>% unite("height_mass", c("height", "mass"), sep = "_") %>% separate(height_mass, c("height2", "mass2"), sep = "_")

## purrr

class(starwars$films)

map(starwars$films, ~ length(.x))

map_dbl(starwars$films, ~ length(.x))

starwars %>% mutate(n_films = map_dbl(films, ~ length(.x))) %>% select(1, n_films, everything())


map_chr(starwars$films, ~ paste(.x, collapse = ','))
starwars %>% mutate(csv_films = map_chr(films, ~ paste(.x, collapse = ',')) ) %>% select(name, csv_films)

# examples from peeps

#running total

starwars %>% mutate(cumulative_sum_height = cumsum(height)) %>% select(NCOL(.), everything())



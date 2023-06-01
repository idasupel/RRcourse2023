library(readxl)
library(meta)
library(metafor)
library(dplyr)
data <- read_excel("C:\\Users\\is411939\\Desktop\\metaanalysis_data.xlsx")

## BOYS
boys  <-  metacont(n.e = N_boys,
                  mean.e = Mean_boys_play_female,
                  sd.e = SD_boys_play_female,
                  n.c = N_boys,
                  mean.c = Mean_boys_play_male,
                  sd.c = SD_boys_play_male,
                  data = data
)
boys
boys %>% forest(sortvar = TE)
boys %>% funnel()
contour_levels <- c(0.90, 0.95, 0.99)
contour_colors <- c("darkblue", "blue", "lightblue")
funnel(boys, contour = contour_levels, col.contour = contour_colors)
legend("topright", c("p < 0.10", "p < 0.05", "p < 0.01"), bty = "n", fill = contour_colors)

boys %>% metareg(~ `Age (months)`)


#GIRLS
girls <- metacont(n.e = N_girls,
                   mean.e = Mean_girls_play_female,
                   sd.e = SD_girls_play_female,
                   n.c = N_girls,
                   mean.c = Mean_girls_play_male,
                   sd.c = SD_girls_play_male,
                   data = data
)
girls
girls %>% forest(sortvar=TE)
m.girls %>% funnel()
contour_levels <- c(0.90, 0.95, 0.99)
contour_colors <- c("darkblue", "blue", "lightblue")
funnel(m.girls, contour = contour_levels, col.contour = contour_colors)
legend("topright", c("p < 0.10", "p < 0.05", "p < 0.01"), bty = "n", fill = contour_colors)

m.girls %>% metareg(~ `Age (months)`)


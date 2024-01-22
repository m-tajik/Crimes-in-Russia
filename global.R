library(plotly)
library(dplyr)
data <- read.csv("/Users/mtajik/Desktop/Shiny/crime.csv")

data %>%
  str()

data %>%
  summary()



c1 <- data %>%
  select(-month, Total_crimes, Serious, Huge_damage, Ecological) %>%
  names()


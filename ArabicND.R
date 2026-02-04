install.packages("tidyverse")
install.packages("psych")
install.packages("ggplot2")
install.packages("afex")

library(tidyverse)
library(psych) 
library(ggplot2)
library(afex)
library(dplyr)


data <- read.csv("ArabicND.csv", header = TRUE)

str(data)
head(data)


data3 <- data %>%
  select(X3.letter, X3.Classic.OND, X3.Broad.OND) %>%
  rename(Word = X3.letter,
         Classic.OND = X3.Classic.OND,
         Broad.OND = X3.Broad.OND) %>%
  mutate(Length = 3)
  
  data4 <- data %>%
  select(X4.Letter, X4.Classic.OND, X4.Broad.OND) %>%
  rename(Word = X4.Letter,
         Classic.OND = X4.Classic.OND,
         Broad.OND = X4.Broad.OND) %>%
  mutate(Length = 4)
  
  data5 <- data %>%
  select(X5.Letter, X5.Classic.OND, X5.Broad.OND) %>%
  rename(Word = X5.Letter,
         Classic.OND = X5.Classic.OND,
         Broad.OND = X5.Broad.OND) %>%
  mutate(Length = 5)
  
  data_long <- bind_rows(data3, data4, data5)

  
str(data_long)
head(data_long)
  
cor_summary <- data_long %>%
  group_by(Length) %>%
  summarise(r = cor(Classic.OND, Broad.OND, use = "complete.obs"))  
  
  
  print(cor_summary)
  
  
  length_summary <- data_long %>%
  group_by(Length) %>%
  summarise(
    mean_classic = mean(Classic.OND, na.rm = TRUE),
    mean_broad = mean(Broad.OND, na.rm = TRUE),
    sd_classic = sd(Classic.OND, na.rm = TRUE),
    sd_broad = sd(Broad.OND, na.rm = TRUE)
  )
  
  print(length_summary)
  
ggplot(length_summary, aes(x = Length)) +
  geom_line(aes(y = mean_classic, color = "Classic OND"), linewidth = 1.1) +
  geom_point(aes(y = mean_classic, color = "Classic OND"), size = 3) +
  geom_line(aes(y = mean_broad, color = "Broad OND"), linewidth = 1.1, linetype = "dashed") +
  geom_point(aes(y = mean_broad, color = "Broad OND"), size = 3) +
  labs(
    x = "Word Length (letters)",
    y = "Mean Neighbourhood Density",
    color = "Measure",
    title = "Mean Classic vs Broad OND across Word Lengths"
  ) +
  theme_minimal()

  
  
  for (L in unique(data_long$Length)) {
  cat("\nWord length:", L, "\n")
  group_data <- filter(data_long, Length == L)
  print(t.test(group_data$Classic.OND, group_data$Broad.OND, paired = TRUE))
}





data_long2 <- data_long %>%
  pivot_longer(cols = c(Classic.OND, Broad.OND),
               names_to = "Measure",
               values_to = "OND")

# Make sure factors are properly set
data_long2$Measure <- factor(data_long2$Measure, levels = c("Classic.OND", "Broad.OND"))
data_long2$Length <- factor(data_long2$Length)


anova_result <- aov_ez(
  id = "Word",
  dv = "OND",
  data = data_long2,
  within = "Measure",
  between = "Length",
  fun_aggregate = mean
)

anova_result

library(effectsize)

eta_squared(anova_result, partial = TRUE)
  
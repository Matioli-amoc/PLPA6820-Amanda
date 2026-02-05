# If you dont have ggplot installed:
install.packages("tidyverse")

#To load it:
library(tidyverse)

# To access ggplot:
ggplot()
# This will generate a plot, once we didnt set which plot wue want, this would be a blank spaca

# Data available in R
mtcars
ggplot(mtcars, aes(x = wt, y = mpg))
#aes= aesthetics 

#Now we need to add some layers and points
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  #geom_smooth()# Add a trend line ( If we want to see if its a linear, we can force geom_smooth to say it e.g. in the code bellow)
  geom_smooth(method = lm, se = FALSE)
  
# If i switch de layers, the points will be on top or behind the line
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_smooth(method = lm, colour = "black", se = FALSE) +
  geom_point(aes(size = hp, colour = hp)) + # You can control the colors and the shape of the points
  xlab("Weight (tons)") + # To add label into the x and y portions
  ylab("Miles per gallon") +
  scale_color_gradient(low = "purple", high = "grey") 


# Upload the .CSV file:
bull.richness <- read.csv("Bull_richness.csv")

ggplot(bull.richness, aes(x = GrowthStage, y = richness, fill = Fungicide, colour = Fungicide)) +
  geom_boxplot() +
  geom_point(position = position_jitterdodge()) +
  scale_fill_manual(values = c("#E87722", "#0C2340")) +
  scale_color_manual(values = c("#0C2340", "#E87722"))
# Fill and colour are two different things.  
  
# Bars with SE error bars
ggplot(bull.richness, aes(x = GrowthStage, y = richness, fill = Fungicide)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  scale_fill_manual(values = c("#0C2340", "#E87722")) 
  # geom_jitter()
  
# Bars with SE error bars
ggplot(bull.richness, aes(x = GrowthStage, y = richness, group = Fungicide, colour = Fungicide)) +
  stat_summary(fun = mean, geom = "line") +
  stat_summary(fun.data = mean_se, geom = "errorbar") +
  scale_color_manual(values = c("#0C2340", "#E87722")) 

# Facetting
ggplot(bull.richness, aes(x = GrowthStage, y = richness, group = Fungicide, colour = Fungicide)) +
  stat_summary(fun = mean, geom = "line") +
  stat_summary(fun.data = mean_se, geom = "errorbar") +
  scale_color_manual(values = c("#0C2340", "#E87722")) +
  facet_wrap(~Treatment*Crop, scales = "free") # scales makes the graph more "arranged" and fitting in the plot

# Coding notes: Data Visualization II
# Amanda Matioli O. Chaves

library(tidyverse)
library(ggpubr)
install.packages("ggpubr")
install.packages("ggrepel")
library(ggpubr)
library(ggrepel)

cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# Read in the data:
sample.data.bac <- read.csv("BacterialAlpha.csv", na.strings = 'na')
sample.data.bac$Time_Point <- as.factor(sample.data.bac$Time_Point)
sample.data.bac$Crop <- as.factor(sample.data.bac$Crop)
sample.data.bac$Crop <- factor(sample.data.bac$Crop, levels = c("Soil", "Cotton", "Soybean"))

#Plot one - B
bac.even <- ggplot(sample.data.bac, aes(x = Time_Point, y = even, colour = Crop))+
  geom_boxplot(position = position_dodge()) +
  geom_point(position = position_jitterdodge(0.05)) +
  xlab("Time")+
  ylab("Pielou`s eveness") +
  scale_color_manual(values = cbbPalette)+
  theme_classic()
bac.even

#Plot two - A
sample.data.bac.nosoil <- subset(sample.data.bac, Crop != "Soil")

water.imbibed <- ggplot(sample.data.bac.nosoil, aes(Time_Point, 1000 * Water_Imbibed, color = Crop)) +  # Define aesthetics: x-axis as Time.Point, y-axis as Water_Imbibed (converted to mg), and color by Crop
  geom_jitter(width = 0.5, alpha = 0.5) +  # Add jittered points to show individual data points with some transparency
  stat_summary(fun = mean, geom = "line", aes(group = Crop)) +  # Add lines representing the mean value for each Crop group
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) +  # Add error bars representing the standard error of the mean
  xlab("Hours post sowing") +  # Label the x-axis
  ylab("Water Imbibed (mg)") +  # Label the y-axis
  scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[3]]), name = "", labels = c("", "")) +  # Manually set colors for the Crop variable
  theme_classic() +  # Use a classic theme for the plot
  theme(strip.background = element_blank(), legend.position = "none") +  # Customize theme: remove strip background and position legend to the right
  facet_wrap(~Crop, scales = "free")  # Create separate panels for each Crop, allowing free scales
water.imbibed
# Notes: I think i can understand more when we write together all the steps. I got a little bit lost in this portion.

#Plot three - C
# Correlation
water.imbibed.cor <- ggplot(sample.data.bac.nosoil, aes(y = even, x = 1000 * Water_Imbibed, color = Crop)) +  # Define aesthetics: y-axis as even, x-axis as Water_Imbibed (converted to mg), and color by Crop
  geom_point(aes(shape = Time_Point)) +  # Add points with different shapes based on Time.Point
  geom_smooth(se = FALSE, method = lm) +  # Add a linear model smooth line without confidence interval shading
  xlab("Water Imbibed (mg)") +  # Label the x-axis
  ylab("Pielou's evenness") +  # Label the y-axis
  scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[3]]), name = "", labels = c("Cotton", "Soybean")) +  # Manually set colors for the Crop variable
  scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("0 hrs", "6 hrs", "12 hrs", "18 hrs")) +  # Manually set shapes for the Time.Point variable
  theme_classic() +  # Use a classic theme for the plot
  theme(strip.background = element_blank(), legend.position = "none") +
  facet_wrap(~Crop, scales = "free")  # Create separate panels for each Crop, allowing free scales

water.imbibed.cor

# Plot them together
Figure2 <- ggarrange(
  water.imbibed,
  bac.even,
  water.imbibed.cor,
  labels = "auto",
  nrow = 3,
  ncol = 1,
  legend = FALSE
)
Figure2

# Basic statistics intergration in to plots for exploratory analysis
bac.even+
  stat_compare_means(method = "anova")

bac.even+
 # geom_pwc(aes(group = Crop), method = "t.test", label = "p.adj.format")
 # geom_pwc(method = "t.test", label = "p.adj.format")
 # geom_pwc(aes(group = Time_Point), method = "t.test", label = "p.adj.format")
 # geom_pwc(aes(group = Crop), method = "t.test", label = "p.adj.signif")
  geom_pwc(aes(group = Crop), method = "t.test", label = "{p.adj.format}{p.adj.signif}")

water.imbibed.cor+
 # stat_cor()
  stat_regline_equation()
  
# 
diff.abund <- read.csv("diff_abund.csv")

str(diff.abund)

diff.abund$log10_pvalue <- -log10(diff.abund$p_CropSoybean)
diff.abund.label <- diff.abund[diff.abund$log10_pvalue > 25,]


ggplot()+
  geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean))+
  geom_point(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean), shape = 17, color = "purple", size = 4)+
  theme_classic()+
  geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, colour = diff_CropSoybean, label = Label)) +
  scale_color_manual(values = cbbPalette, name = "Significant")+
  xlab("Log fold change Soil vs Soybean")+
  ylab("-log10 p-value")

#Think about what you want to emphasize 
# Extra portion
# Look through it whit data analysis.

# Repository
# https://github.com/Matioli-amoc/PLPA6820-Amanda.git
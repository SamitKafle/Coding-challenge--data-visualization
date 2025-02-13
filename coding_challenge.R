##load the required package
library(ggplot2)
library(ggpubr)

## read the data
datum= read.csv("MycotoxinData.csv")
head(datum)
datum$Treatment=as.factor(datum$Treatment)
datum$Cultivar=as.factor(datum$Cultivar)
class(datum$DON)
datum$DON=as.numeric(datum$DON,na.strings="NA")

## Question 2: Create boxplot
ggplot(datum, aes(x = Treatment, y = DON, color = Cultivar)) +
  geom_boxplot() +
  labs(y = "DON (ppm)", x = "") +
  theme_classic()

## Question 3: converting this data into a bar chart with standard-error error

ggplot(datum, aes(x = Treatment, y = DON, fill = Cultivar)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = position_dodge(0.9), width = 0.2) +
  labs(y = "DON (ppm)", x = "") +
  theme_classic()



## Question 4: Add points to the foreground of the boxplot and bar chart
## you made in question 3 that show the distribution of points over the boxplots. 
## Set the shape = 21 and the outline color black

ggplot(datum, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(0.75), alpha = 0.7) +
  geom_point(shape = 21, color = "black", position = position_jitterdodge(jitter.width = 0.1, dodge.width = 0.75)) +
  labs(y = "DON (ppm)", x = "") +
  theme_classic()

ggplot(datum, aes(x = Treatment, y = DON, fill = Cultivar)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = position_dodge(0.9), width = 0.2) +
  labs(y = "DON (ppm)", x = "") +
  geom_point(shape = 21, color = "black", position = position_jitterdodge(jitter.width = 0.1, dodge.width = 0.75)) +
  theme_classic()




## Question 5: Changing the fill color of the points and boxplots to match some colors in the following colorblind pallet.

cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

ggplot(datum, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(0.75), alpha = 0.7) +
  scale_fill_manual(values = cbbPalette) +
  labs(y = "DON (ppm)", x = "") +
  theme_classic()



## Question 6: Add a facet to the plots based on cultivar.

ggplot(datum, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(0.75), alpha = 0.7) +
  scale_fill_manual(values = cbbPalette) +
  labs(y = "DON (ppm)", x = "") +
  facet_wrap(~Cultivar)+
  theme_classic()

## Question 7: Add transparency to the points so you can still see the boxplot or bar in the background. 


ggplot(datum, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(0.75), alpha = 0.7) +
  geom_point(shape = 21, color = "blue", alpha = 0.5, position = position_jitterdodge(jitter.width = 0.1, dodge.width = 0.75)) +
  scale_fill_manual(values = cbbPalette)+
  labs(y = "DON (ppm)", x = "") +
  facet_wrap(~Cultivar)+
  theme_classic()




## Question 8: 

ggplot(datum, aes(x = Treatment, y = DON, group = Cultivar, color = Cultivar)) +
  stat_summary(fun = mean, geom = "line", size = 1) +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) +
  labs(y = "DON (ppm)", x = "") +
  theme_minimal()














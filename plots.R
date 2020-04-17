## test code for plots

library(tidyverse)
library(knitr)
library(ggplot2)
library(dplyr)

mungbeans_df<-read.csv("mungbean.csv")
length_df<-mungbeans_df %>% 
  select(temp, duration, length) %>%
  pivot_wider(names_from=temp, values_from=length)

scaled_df <- length_df %>% mutate_at(c("Ambient", "25", "30"), ~(scale(.) %>% as.vector))
print("length of sprouts")
print(length_df)
print("scaled")
print(scaled_df)

ggplot(data=scaled_df, aes(x=duration, y=c(Ambient,'25','30')) )+
  geom_line()+
  labs(title="Plot Scaled Ambient",x="Time (hours)", y = "Sprout Length (cm)")

## try stuff with weight

weight_df<-mungbeans_df %>% 
  select(temp, duration, sproutwt) %>%
  pivot_wider(names_from=temp, values_from=sproutwt)

print(weight_df)

#kable(mungbeans_df, caption="measured length & weight")
#kable(df, caption="wider data for normalization")


ggplot(data=mungbeans_df, aes(x=duration, y=length, group=temp)) +
  geom_line(aes(color=temp, linetype=temp))+
  geom_point(aes(color=temp)) +
  labs(title="Plot of Length by Time",x="Time (hours)", y = "Sprout Length (cm)")


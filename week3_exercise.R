library(readr)
library(dplyr)
library(ggplot2)
big_mac_raw_index <- read_csv("https://raw.githubusercontent.com/TheEconomist/big-mac-data/master/output-data/big-mac-raw-index.csv")


filter(big_mac_raw_index,USD>=0)|>mutate(valuation="overvalued")->overvalued
filter(big_mac_raw_index,USD<0)|>mutate(valuation="undervalued")->undervalued

rbind(overvalued,undervalued)->big_mac_index
filter(big_mac_index,name=="Taiwan")->Taiwan

ggplot()+
  geom_point(data=big_mac_index,
             mapping = aes(x=date,y=USD,colour=valuation),
             alpha=0.3)+
  scale_colour_manual(values = c("#86C8BC","#3A98B9","#CD0404"))+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.y=element_line(color="grey"),
        panel.background = element_rect(fill="white"),
        legend.position="none",
        axis.title.x = element_blank(),
        axis.title.y = element_blank())+
  geom_line(data=Taiwan,
            mapping = aes(x=date,y=USD,color=name),
            size=1)->geom
geom

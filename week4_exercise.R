big_mac_raw_index <- read_csv("https://raw.githubusercontent.com/TheEconomist/big-mac-data/master/output-data/big-mac-raw-index.csv")


#用ggplot轉為plotly
ggplot(data=big_mac_raw_index,mapping = aes(x=date,y=USD,colour=name))+
  geom_line(size=1,alpha=0.1)+
  theme(legend.position = "None")->plot1
plot1

plot1|>plotly::ggplotly()->gplty1
gplty1


#highlighted

big_mac_raw_index|>
  plotly::highlight_key(~name)->highlighted_bigMac

plot_ly(
  data=highlighted_bigMac,
  x=~date,
  y=~USD,
  text=~name,
  color=~name,
  alpha=0.3
  )|>
  plotly::layout(yaxis=list(range=c(-0.8,1.8)))|>
  add_trace(
    orientation=trace1$orientation,
    width=trace1$width,
    type=trace1$type,
    mode="lines",
    textposition=trace1$textposition,
    marker=trace1$marker,
    showlegend=trace1$showlegend,
    xaxis=trace1$xaxis,
    yaxis=trace1$yaxis,
    hoverinfo=trace1$hoverinfo,
    name=trace1$name
  )|>
  highlight(
    on ="plotly_click",
    off = "plotly_doubleclick")|>
  hide_legend()









big_mac_raw_index|>
  dplyr::filter(name=="Norway")->Norway
Norway

big_mac_raw_index <- read_csv("https://raw.githubusercontent.com/TheEconomist/big-mac-data/master/output-data/big-mac-raw-index.csv")

big_mac_raw_index$date|>range()->dateRange
ddfull<-data.frame(
  data=seq(dataRange[[1]],dataRange[[2]],by)
)


#資料處理
dd3$name |> unique() -> validCountries
dd3$date |> unique() -> validDates
big_mac_raw_index$name|>unique()->country
big_mac_raw_index$date|>unique()->dates
full <- expand.grid(country,dates)
names(full) <- c("name", "date")
full|>
  dplyr::left_join(big_mac_raw_index,
                   by=c("name","date"))->BigMacIndex



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
  plotly::layout(yaxis=list(range=c(-0.8,1.8),autorange=FALSE))|>
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
############更正

BigMacIndex|>
  plotly::highlight_key(~name)->highlighted_BigMac


plot_ly(
  data=highlighted_BigMac,
  x=~date,
  y=~USD,
  text=~name,
  color=~name,
  alpha=0.3
)|>
  plotly::layout(yaxis=list(range=c(-0.8,1.8),autorange=FALSE))|>
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






############
pt=econIDV::PlotlyTools()
pt$query_trace$Scatter()->qq
qq("line")


big_mac_raw_index|>
  dplyr::filter(name=="Norway")->Norway
Norway

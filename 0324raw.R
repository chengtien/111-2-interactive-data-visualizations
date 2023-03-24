bigMac2 = list()
big_mac_raw_index |>
  split(big_mac_raw_index$date) -> bigMac2$split$byDate
targetDF = bigMac2$split$byDate$`2022-07-01`
targetDF |>
  dplyr::arrange(USD) |>
  dplyr::pull("name") -> levelsCountryNames
targetDF$name = factor(targetDF$name, levels=levelsCountryNames)
targetDF |>
  plotly::highlight_key(~name) -> targetDF_highlighted

gg0 = econDV2::Plot()
plotly::ggplotly(gg0$make()) -> prototype
trace1 = prototype$x$data[[1]]

plot_ly(
  data = targetDF_highlighted,
  x=~name, y=~USD
) |>
  add_trace()

plot_ly(
  data = targetDF_highlighted, # using highlighted shareData, which is not used in ggplot. Hence it is not used in ggplotly.
  x=~name, y=~USD
) |>
  add_trace(
    # visual effect on theme that we got in ggplot.
    # remove those aesethic mapping that are specifed to be mapped from the sharedData.
    orientation=trace1$orientation,
    width=trace1$width,
    text=trace1$text,
    type=trace1$type,
    textposition=trace1$textposition,
    marker=trace1$marker,
    showlegend=trace1$showlegend,
    xaxis=trace1$xaxis,
    yaxis=trace1$yaxis,
    hoverinfo=trace1$hoverinfo,
    name=trace1$name
  ) -> p1
p1

bigMac$build
x = bigMac$build$`2022-07-01`$x

# save three components in a list
graphInfo = list(
  traces=x$data,
  layout=x$layout,
  config=x$config
)

library(plotly)
plot_ly() |>
  econIDV::do_add_trace(graphInfo$traces[[1]]) |>
  econIDV::do_add_trace(graphInfo$traces[[2]]) |>
  econIDV::do_add_trace(graphInfo$traces[[3]]) -> plt0
plt0

trace1attributes=graphInfo$traces[[1]]
trace1 |>
  econIDV::getAttributeListPairs(trace1attributes)


# trace1
dd = bigMac$split$byDate$`2022-07-01`
dd |>
  dplyr::arrange(USD) |>
  dplyr::pull(name) -> nameLevels
dd$name |> factor(levels=nameLevels) -> dd$name

plot_ly() |>
  add_trace(
    data = dd,
    x = ~name, y = ~USD, text = ~name, width = 0.2,
    orientation = graphInfo$traces[[1]]$orientation,
    # width = graphInfo$traces[[1]]$width,
    # base = graphInfo$traces[[1]]$base,
    # x = graphInfo$traces[[1]]$x,
    # y = graphInfo$traces[[1]]$y,
    # text = graphInfo$traces[[1]]$text,
    type = graphInfo$traces[[1]]$type,
    textposition = graphInfo$traces[[1]]$textposition,
    marker = graphInfo$traces[[1]]$marker,
    showlegend = graphInfo$traces[[1]]$showlegend,
    xaxis = graphInfo$traces[[1]]$xaxis,
    yaxis = graphInfo$traces[[1]]$yaxis,
    hoverinfo = graphInfo$traces[[1]]$hoverinfo,
    frame = graphInfo$traces[[1]]$frame
  )

dd |>
  highlight_key(~name) -> dd_highlight

plot_ly() |>
  add_trace(
    data = dd_highlight, # sharedData
    x = ~name, y = ~USD, text = ~name, width = 0.2,
    orientation = graphInfo$traces[[1]]$orientation,
    # width = graphInfo$traces[[1]]$width,
    # base = graphInfo$traces[[1]]$base,
    # x = graphInfo$traces[[1]]$x,
    # y = graphInfo$traces[[1]]$y,
    # text = graphInfo$traces[[1]]$text,
    type = graphInfo$traces[[1]]$type,
    textposition = graphInfo$traces[[1]]$textposition,
    marker = graphInfo$traces[[1]]$marker,
    showlegend = graphInfo$traces[[1]]$showlegend,
    xaxis = graphInfo$traces[[1]]$xaxis,
    yaxis = graphInfo$traces[[1]]$yaxis,
    hoverinfo = graphInfo$traces[[1]]$hoverinfo,
    frame = graphInfo$traces[[1]]$frame
  ) |>
  plotly::layout(barmode="overlay")->bigMac$Highlight




dd |> split(~USD > 0) -> ddSplit
ddSplit$`FALSE`

plot_ly() |>
  add_trace(
    data = dd,
    x = ~name, y = ~USD, text = ~name, width = 0.2,
    orientation = graphInfo$traces[[1]]$orientation,
    # width = graphInfo$traces[[1]]$width,
    # base = graphInfo$traces[[1]]$base,
    # x = graphInfo$traces[[1]]$x,
    # y = graphInfo$traces[[1]]$y,
    # text = graphInfo$traces[[1]]$text,
    type = graphInfo$traces[[1]]$type,
    textposition = graphInfo$traces[[1]]$textposition,
    marker = graphInfo$traces[[1]]$marker,
    showlegend = graphInfo$traces[[1]]$showlegend,
    xaxis = graphInfo$traces[[1]]$xaxis,
    yaxis = graphInfo$traces[[1]]$yaxis,
    hoverinfo = graphInfo$traces[[1]]$hoverinfo,
    frame = graphInfo$traces[[1]]$frame
  ) |>
  add_trace(
    data = ddSplit$`FALSE`,
    x = ~name, y = ~USD, text = ~name,
    # x = graphInfo$traces[[2]]$x,
    # y = graphInfo$traces[[2]]$y,
    # text = graphInfo$traces[[2]]$text,
    type = graphInfo$traces[[2]]$type,
    mode = graphInfo$traces[[2]]$mode,
    marker = graphInfo$traces[[2]]$marker,
    hoveron = graphInfo$traces[[2]]$hoveron,
    name = graphInfo$traces[[2]]$name,
    legendgroup = graphInfo$traces[[2]]$legendgroup,
    showlegend = graphInfo$traces[[2]]$showlegend,
    xaxis = graphInfo$traces[[2]]$xaxis,
    yaxis = graphInfo$traces[[2]]$yaxis,
    hoverinfo = graphInfo$traces[[2]]$hoverinfo,
    frame = graphInfo$traces[[2]]$frame
  )  |>
  add_trace(
    data = ddSplit$`TRUE`,
    x = ~name, y = ~USD, text = ~name,
    # x = graphInfo$traces[[3]]$x,
    # y = graphInfo$traces[[3]]$y,
    # text = graphInfo$traces[[3]]$text,
    type = graphInfo$traces[[3]]$type,
    mode = graphInfo$traces[[3]]$mode,
    marker = graphInfo$traces[[3]]$marker,
    hoveron = graphInfo$traces[[3]]$hoveron,
    name = graphInfo$traces[[3]]$name,
    legendgroup = graphInfo$traces[[3]]$legendgroup,
    showlegend = graphInfo$traces[[3]]$showlegend,
    xaxis = graphInfo$traces[[3]]$xaxis,
    yaxis = graphInfo$traces[[3]]$yaxis,
    hoverinfo = graphInfo$traces[[3]]$hoverinfo,
    frame = graphInfo$traces[[3]]$frame
  )



dd |>
  highlight_key(~name) -> dd_highlight
ddSplit$`FALSE` |> highlight_key(~name) -> ddpt1_highlight
ddSplit$`TRUE` |> highlight_key(~name) -> ddpt2_hightlight



dd |>
  highlight_key(~name, group="bigmac") -> dd_highlight
ddSplit$`FALSE` |> highlight_key(~name, group="bigmac") -> ddpt1_highlight
ddSplit$`TRUE` |> highlight_key(~name, group="bigmac") -> ddpt2_hightlight


plot_ly() |>
  add_trace(
    data = dd_highlight,
    x = ~name, y = ~USD, text = ~name, width = 0.2,
    orientation = graphInfo$traces[[1]]$orientation,
    # width = graphInfo$traces[[1]]$width,
    # base = graphInfo$traces[[1]]$base,
    # x = graphInfo$traces[[1]]$x,
    # y = graphInfo$traces[[1]]$y,
    # text = graphInfo$traces[[1]]$text,
    type = graphInfo$traces[[1]]$type,
    textposition = graphInfo$traces[[1]]$textposition,
    marker = graphInfo$traces[[1]]$marker,
    showlegend = graphInfo$traces[[1]]$showlegend,
    xaxis = graphInfo$traces[[1]]$xaxis,
    yaxis = graphInfo$traces[[1]]$yaxis,
    hoverinfo = graphInfo$traces[[1]]$hoverinfo,
    frame = graphInfo$traces[[1]]$frame
  ) |>
  plotly::layout(
    barmode="overlay"
  ) |>
  add_trace(
    data = ddpt1_highlight,
    x = ~name, y = ~USD, text = ~name,
    # x = graphInfo$traces[[2]]$x,
    # y = graphInfo$traces[[2]]$y,
    # text = graphInfo$traces[[2]]$text,
    type = graphInfo$traces[[2]]$type,
    mode = graphInfo$traces[[2]]$mode,
    marker = graphInfo$traces[[2]]$marker,
    hoveron = graphInfo$traces[[2]]$hoveron,
    name = graphInfo$traces[[2]]$name,
    legendgroup = graphInfo$traces[[2]]$legendgroup,
    showlegend = graphInfo$traces[[2]]$showlegend,
    xaxis = graphInfo$traces[[2]]$xaxis,
    yaxis = graphInfo$traces[[2]]$yaxis,
    hoverinfo = graphInfo$traces[[2]]$hoverinfo,
    frame = graphInfo$traces[[2]]$frame
  )  |>
  add_trace(
    data = ddpt2_hightlight,
    x = ~name, y = ~USD, text = ~name,
    # x = graphInfo$traces[[3]]$x,
    # y = graphInfo$traces[[3]]$y,
    # text = graphInfo$traces[[3]]$text,
    type = graphInfo$traces[[3]]$type,
    mode = graphInfo$traces[[3]]$mode,
    marker = graphInfo$traces[[3]]$marker,
    hoveron = graphInfo$traces[[3]]$hoveron,
    name = graphInfo$traces[[3]]$name,
    legendgroup = graphInfo$traces[[3]]$legendgroup,
    showlegend = graphInfo$traces[[3]]$showlegend,
    xaxis = graphInfo$traces[[3]]$xaxis,
    yaxis = graphInfo$traces[[3]]$yaxis,
    hoverinfo = graphInfo$traces[[3]]$hoverinfo,
    frame = graphInfo$traces[[3]]$frame
  )


###########

bigMac$Highlight

bigMac = readRDS("bigMac.Rds")
gploty0 = bigMac$ggplotly$`2022-07-01`
gploty0$x$data |> length()
gploty0
gploty0|>plotly::plotly_build()->pltBuild

gploty0$x$data
traces = gploty0$x$data
traces[[1]]
library(plotly)
plot_ly() |>
  econIDV::do_add_trace(traces[[1]]) |>
  econIDV::do_add_trace(traces[[2]]) |>
  econIDV::do_add_trace(traces[[3]])

# save in trace1 (keep traces intact for futur usage)
trace1 = traces[[1]]

# Two ways to change current trace1$text context
## method 1: assigned from data source
trace1$text = targetDF$name

## method 2: Use REGEX
trace1$text |>
  stringr::str_extract(
    "(?<=(^name:\\s))[^<]+"
  ) -> trace1$text

bigMac$split$byDate$`2022-07-01` -> targetDF


trace1 = traces[[1]]

trace1$text = targetDF$name

## change text
trace1$text |>
  stringr::str_extract(
    "(?<=(^name:\\s))[^<]+"
  ) -> trace1$text


trace1 = traces[[1]]

## change text
trace1$text |>
  stringr::str_extract(
    "(?<=(^name:\\s))[^<]+"
  ) -> trace1$text

plot_ly() |>
  econIDV::do_add_trace(
    trace1
  ) -> p1
p1

# trace 2
trace2 = traces[[2]]
trace2$text = trace2$text |>
  stringr::str_extract(
    "(?<=(^name:\\s))[^<]+"
  ) -> trace2$text
p1 |>
  econIDV::do_add_trace(
    trace2
  ) -> p2
p2

# trace 3
trace3 = traces[[3]]
trace3$text = trace3$text |>
  stringr::str_extract(
    "(?<=(^name:\\s))[^<]+"
  ) -> trace3$text
trace3$showlegend <- FALSE

p2 |>
  econIDV::do_add_trace(
    trace3
  ) -> p3
p3

plot_ly() |>
  econIDV::do_add_trace(
    trace1
  )

# is equivalent to
plot_ly() |>
  add_trace(
    orientation=trace1$orientation,
    width=trace1$width,
    base=trace1$base,
    x=trace1$x,
    y=trace1$y,
    text=trace1$text,
    type=trace1$type,
    textposition=trace1$textposition,
    marker=trace1$marker,
    showlegend=trace1$showlegend,
    xaxis=trace1$xaxis,
    yaxis=trace1$yaxis,
    hoverinfo=trace1$hoverinfo,
    name=trace1$name
  )
## specify highlight key
targetDF$name |> head()
## create sharedData
targetDF |>
  plotly::highlight_key(~name) -> targetDF_highlighted
class(targetDF_highlighted)


# plotly with possible highlight feature but wrong design (relative to the Economist design)
plot_ly(
  data = targetDF_highlighted,
  x=~name, y=~USD
) |>
  add_trace()

# Borrow ggplot (which mimick Economist design)'s setting.
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
  )->p1

p1 |>
  add_trace(
    #x=trace2$x,
    #y=trace2$y,
    #text=trace2$text,
    type=trace2$type,
    mode=trace2$mode,
    marker=trace2$marker,
    hoveron=trace2$hoveron,
    name=trace2$name,
    legendgroup=trace2$legendgroup,
    showlegend=trace2$showlegend,
    xaxis=trace2$xaxis,
    yaxis=trace2$yaxis,
    hoverinfo=trace2$hoverinfo
  )



library(plotly)
library(tidyverse)

df <- read_csv("https://www.bankofcanada.ca/valet/observations/group/SAN_LYOJ20210218/csv?end_date=2021-02-17",
                                   skip = 21)
df %>%
  rename(OxCGRT = SAN_LYOJ20210218_C1_S1 ) %>%
  rename(BOC_stringency_index = SAN_LYOJ20210218_C1_S2) %>%
  rename(Canada = SAN_LYOJ20210218_C2_S1 ) %>%
  rename(Atlantic = SAN_LYOJ20210218_C2_S2) %>%
  rename(Quebec = SAN_LYOJ20210218_C2_S3) %>%
  rename(Ontario = SAN_LYOJ20210218_C2_S4) %>%
  rename(Prairies = SAN_LYOJ20210218_C2_S5) %>%
  rename(Biritish_Columbia = SAN_LYOJ20210218_C2_S6 ) -> df


df %>%
  pivot_longer(
    cols = 2:9,
    names_to = "geo",
    values_to = "index",
    values_drop_na = TRUE
  ) -> df

 viz <- ggplot(df) +
  aes(x = date, y = index, colour = geo) +
  geom_line(size = 1L) +
  scale_color_hue() +
  theme_minimal()

b <- plotly::ggplotly(viz, dynamicTicks = TRUE) %>%
   rangeslider() %>%
   layout(hovermode = "x")

  htmlwidgets::saveWidget(b,file = "docs/BoC_indicator_graph.html",selfcontained = TRUE)

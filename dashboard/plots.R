Edu_data |>
  #filter(province == "Western Cape") |>
  group_by(CurrentLivingArea, province) |>
  summarise(n = n(), .groups = 'drop') |>
  mutate(percentage_of_area = round(n/sum(n),4) * 100) |>
  mutate(Label = paste0(percentage_of_area, "% (", n, ")")) |>
  arrange(desc(n)) |>
  hchart("bar", hcaes(x=CurrentLivingArea, y = n, group =province, label = Label
  ),
  dataLabels = list(format = "<b>{point.label}</b>", enabled = TRUE)) |>
  hc_title(text = "Number of Responses per Living Settlements") |>
  hc_subtitle(text = "South African Public Schools survey") |>
  hc_yAxis(title =list(text="Number of Respondents")) |>
  hc_xAxis(title = list(text = "Living Settlements")) |>
  hc_exporting(enabled = TRUE) |>
  hc_chart(backgroundColor = "white")

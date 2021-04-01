library(workflowr
        )
wflow_publish(c("analysis/index.Rmd", "analysis/about.Rmd", "analysis/license.Rmd","analysis/supp_files.Rmd","analysis/prov_analysis.rmd","analysis/supp_files.Rmd","analysis/google_mobility_data.Rmd"),
              "Publish the initial files for myproject")
wflow_open("analysis/google_mobility_data.Rmd")
wflow_build()
wflow_open("analysis//graphing_heierachies.rmd")

wflow_status(
)

wflow_publish(c("analysis/Provincial_view.rmd","analysis/index.Rmd","analysis/google_mobility_data.Rmd"))


wflow_publish(c("analysis/index.Rmd","analysis/google_mobility_data.Rmd"))


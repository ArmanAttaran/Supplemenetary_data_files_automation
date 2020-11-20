library(workflowr
        )
wflow_publish(c("analysis/index.Rmd", "analysis/about.Rmd", "analysis/license.Rmd","analysis/supp_files.Rmd"),
              "Publish the initial files for myproject")
wflow_open("analysis/suppfiles.Rmd")
wflow_build()
wflow_open("analysis/index.Rmd")

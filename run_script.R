# Run code in this pkg

devtools::load_all(".")
library(dplyr)
library(tidyr)

# 1 area model -----

# add data to template
dat_seas_as_yrs <- add_data()

# convert from seasons as years to annual model
fore <- r4ss::SS_readforecast("inst/extdata/TemplateIO/forecast.ss")
ctl <- r4ss::SS_readctl("inst/extdata/TemplateIO/control_1Area.ss", use_datlist = T,
                        datlist = dat_seas_as_yrs)
dat_annual_list <- create_yr_structure_data(dat = dat_seas_as_yrs,fore = fore, ctl = ctl)

# need to convert anything in the control file?

# write out

dir.create("output")

r4ss::SS_writedat(dat_seas_as_yrs, file.path("output", "dat_1_area_seas_as_yrs.ss"),
                  overwrite = TRUE, verbose = TRUE)
r4ss::SS_writedat(dat_annual_list$datnew, file.path("output", "dat_1_area_annual.ss"), overwrite = TRUE)
r4ss::SS_writectl(dat_annual_list$ctlnew, file.path("output", "ctl_1_area_annual.ss"), overwrite = TRUE)
r4ss::SS_writeforecast(dat_annual_list$forecastnew, dir = "output", file = "forecast_1_area_annual.ss", overwrite = T)
# check: check that 1 area mod runs ----

#copy seasonal
r4ss::copy_SS_inputs(dir.old = file.path("inst", "extdata", "templateIO"),
                     dir.new = file.path("output", "test_1_area_seas_as_yrs"))
file.copy(file.path("inst/extdata/templateIO", "control_1Area.ss"),
          file.path("output", "test_1_area_seas_as_yrs", "ctl_1_area_seas_as_yrs.ss"))
file.copy(file.path("output", "dat_1_area_seas_as_yrs.ss"),
          file.path("output", "test_1_area_seas_as_yrs", "dat_1_area_seas_as_yrs.ss"))
start <- r4ss::SS_readstarter(
  file.path("output", "test_1_area_seas_as_yrs", "starter.ss"))
start$datfile <- "dat_1_area_seas_as_yrs.ss"
start$ctlfile <- "ctl_1_area_seas_as_yrs.ss"
r4ss::SS_writestarter(start, dir = file.path("output", "test_1_area_seas_as_yrs"), overwrite = TRUE)

#  copy annual
r4ss::copy_SS_inputs(dir.old = file.path("inst", "extdata", "templateIO"),
                     dir.new = file.path("output", "test_1_area_annual"))
file.copy(file.path("output", "dat_1_area_annual.ss"),
          file.path("output", "test_1_area_annual", "dat_1_area_annual.ss"))
file.copy(file.path("output", "forecast_1_area_annual.ss"),
          file.path("output", "test_1_area_annual", "forecast.ss"), overwrite = TRUE)
file.copy(file.path("output", "ctl_1_area_annual.ss"),
          file.path("output", "test_1_area_annual", "ctl_1_area_annual.ss"), overwrite = TRUE)
start <- r4ss::SS_readstarter(
  file.path("output", "test_1_area_annual", "starter.ss"))

start$datfile <- "dat_1_area_annual.ss"
start$ctlfile <- "ctl_1_area_annual.ss"
r4ss::SS_writestarter(start, dir = file.path("output", "test_1_area_annual"), overwrite = TRUE)

# run both models to test
r4ss::run_SS_models(dirvec = c(file.path("output", "test_1_area_seas_as_yrs"),
                               file.path("output", "test_1_area_annual")),
                    model = "ss_3.30.18", exe_in_path = TRUE, extras = "-stopph 0 -nohess")


# 4 area model ----
# add data to template
dat_seas_as_yrs_4 <- add_dat_4area()
# convert from seasons as years to annual model
ctl_4area <- r4ss::SS_readctl(
  file.path("inst", "extdata", "TemplateIO", "control_4area.ss"),
  datlist = dat_seas_as_yrs_4)
dat_annual_4_list <- create_yr_structure_data(dat = dat_seas_as_yrs_4, fore = fore, ctl = ctl_4area)
r4ss::SS_writedat(dat_seas_as_yrs_4, file.path("output", "dat_4_area_seas_as_yrs.ss"),
                  overwrite = TRUE, verbose = TRUE)
r4ss::SS_writedat(dat_annual_4_list$datnew, file.path("output", "dat_4_area_annual.ss"), overwrite = TRUE)
r4ss::SS_writectl(dat_annual_4_list$ctlnew, file.path("output", "ctl_4_area_annual.ss"), overwrite = TRUE)
r4ss::SS_writeforecast(dat_annual_4_list$forecastnew, dir = "output", file = "forecast_4_area_annual.ss", overwrite = T)

# check: 4 area model runs ----

#copy seasonal
dir.create(file.path("output", "test_4_area_seas_as_yrs"))
file.copy(file.path("inst", "extdata", "templateIO", "starter.ss"),
          file.path("output", "test_4_area_seas_as_yrs", "starter.ss"))
file.copy(file.path("inst", "extdata", "templateIO", "forecast.ss"),
          file.path("output", "test_4_area_seas_as_yrs", "forecast.ss"))
file.copy(file.path("inst", "extdata", "templateIO", "control_4area.ss"),
          file.path("output", "test_4_area_seas_as_yrs", "control_4_area_seas_as_yrs.ss"))
file.copy(file.path("output", "dat_4_area_seas_as_yrs.ss"),
          file.path("output", "test_4_area_seas_as_yrs", "dat_4_area_seas_as_yrs.ss"))
start <- r4ss::SS_readstarter(
  file.path("output", "test_4_area_seas_as_yrs", "starter.ss"))
start$datfile <- "dat_4_area_seas_as_yrs.ss"
start$ctlfile <- "control_4_area_seas_as_yrs.ss"
r4ss::SS_writestarter(start, dir = file.path("output", "test_4_area_seas_as_yrs"), overwrite = TRUE)

#  copy annual
dir.create(file.path("output", "test_4_area_annual"))
file.copy(file.path("inst", "extdata", "templateIO", "starter.ss"),
                file.path("output", "test_4_area_annual", "starter.ss"))
file.copy(file.path("output", "forecast_4_area_annual.ss"),
                file.path("output", "test_4_area_annual", "forecast.ss"))
file.copy(file.path("output", "dat_4_area_annual.ss"),
          file.path("output", "test_4_area_annual", "dat_4_area_annual.ss"))
file.copy(file.path("output", "ctl_4_area_annual.ss"),
          file.path("output", "test_4_area_annual", "ctl_4_area_annual.ss"))
start <- r4ss::SS_readstarter(
  file.path("output", "test_4_area_annual", "starter.ss"))
start$datfile <- "dat_4_area_annual.ss"
start$ctlfile <- "ctl_4_area_annual.ss"
r4ss::SS_writestarter(start, dir = file.path("output", "test_4_area_annual"), overwrite = TRUE)

# run both models to test
r4ss::run_SS_models(dirvec = c(file.path("output", "test_4_area_seas_as_yrs"),
                               file.path("output", "test_4_area_annual")),
                    model = "ss_3.30.18", exe_in_path = TRUE, extras = "-stopph 0 -nohess")



# Run code in this pkg

devtools::load_all(".")
library(dplyr)
library(tidyr)

# 1 area model -----

# add data to template
dat_seas_as_yrs <- add_data()

# convert from seasons as years to annual model
dat_annual <- create_yr_structure_data(dat = dat_seas_as_yrs)

# need to convert anything in the control file?

# write out

dir.create("output")

r4ss::SS_writedat(dat_seas_as_yrs, file.path("output", "dat_1_area_seas_as_yrs.ss"),
                  overwrite = TRUE, verbose = TRUE)
r4ss::SS_writedat(dat_annual, file.path("output", "dat_1_area_annual.ss"))
# check: check that runs ----

#copy seasonal
r4ss::copy_SS_inputs(dir.old = file.path("inst", "extdata", "templateIO"),
                     dir.new = file.path("output", "test_1_area_seas_as_yrs"))
file.copy(file.path("output", "dat_1_area_seas_as_yrs.ss"),
          file.path("output", "test_1_area_seas_as_yrs", "dat_1_area_seas_as_yrs.ss"))
start <- r4ss::SS_readstarter(
  file.path("output", "test_1_area_seas_as_yrs", "starter.ss"))
start$datfile <- "dat_1_area_seas_as_yrs.ss"
r4ss::SS_writestarter(start, dir = file.path("output", "test_1_area_seas_as_yrs"), overwrite = TRUE)

#  copy annual
r4ss::copy_SS_inputs(dir.old = file.path("inst", "extdata", "templateIO"),
                     dir.new = file.path("output", "test_1_area_annual"))
file.copy(file.path("output", "dat_1_area_annual.ss"),
          file.path("output", "test_1_area_annual", "dat_1_area_annual.ss"))
start <- r4ss::SS_readstarter(
  file.path("output", "test_1_area_annual", "starter.ss"))
start$datfile <- "dat_1_area_annual.ss"
r4ss::SS_writestarter(start, dir = file.path("output", "test_1_area_annual"), overwrite = TRUE)

# run both models to test
r4ss::run_SS_models(dirvec = c(file.path("output", "test_1_area_seas_as_yrs"),
                               file.path("output", "test_1_area_annual")),
                    model = "ss_3.30.18", exe_in_path = TRUE, extras = "-stopph 0 -nohess")


# 4 area model ----

#TODO: need a template file for this.

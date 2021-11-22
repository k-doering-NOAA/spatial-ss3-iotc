# Run code in this pkg

devtools::load_all(".")

# 1 area model -----

# add data to template
dat_seas_as_yrs <- add_data()

# convert from seasons as years to annual model
dat_annual <- create_yr_structure_data(dat = dat_seas_as_yrs)

# need to convert anything in the control file?

# write out

dir.create("output")

r4ss::SS_writedat(dat_seas_as_yrs, file.path("output", "dat_1_area_seas_as_yrs.ss"))
r4ss::SS_writedat(dat_annual, file.path("output", "dat_1_area_annual.ss"))

# 4 area model ----

#TODO: need a template file for this.

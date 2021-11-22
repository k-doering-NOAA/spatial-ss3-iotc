add_data <- function() {
   # read in the template using r4ss
   #TODO: change to using system.file, if possible.
   dat_filepath <- file.path("inst", "extdata", "TemplateIO", "data.ss")
   # ctl_filepath <- system.file(file.path("TemplateIO", "control.ss"))
   # fore_filepath <- system.file(file.path("TemplateIO", "forecast.ss"))
   # start_filepath <- system.file(file.path("TemplateIO", "starter.ss"))
   dat_template <- r4ss::SS_readdat(dat_filepath, version = "3.30")
   # ctl <- r4ss::SS_readctl(ctl_filepath, datlist = dat, version = "3.30")
   # fore <- r4ss::SS_readfore(fore_filepath, version = "3.30")
   # start <- r4ss::SS_readstarter(start_filepath, version = "3.30")

   # get the data file, 1 area
   # get data() working; for now just use a relative path.
   load(file.path("data", "YFT_SRD_1A_4_v2.Rdata"))
   # add the data to the template
   dat_out <- dat_template
   # catch
   dat_out$catch <- dat_1A_4$catch
   # CPUE
   dat_out$CPUE <- dat_1A_4$CPUE
   # length comps
   dat_out$lencomp <- dat_1A_4$lencomp
   # tag data
   dat_out$tag_recaps <- dat_1A_4$tag_recaps
   dat_out$tag_releases <- dat_1A_4$tag_releases
   dat_out$N_tag_groups <- dat_1A_4$N_tag_groups
   dat_out
}

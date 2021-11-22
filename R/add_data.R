
#' add data to the 1 area template files
#' @param dat_template_filepath Filepath to the 1 area template datafile
#' @param dat_sim_filepath Filepath to the rdata file containing 1 iteration of the
#'  1 area datafile
add_data <- function(
  dat_template_filepath = file.path("inst", "extdata", "TemplateIO", "data.ss"),
  dat_sim_filepath = file.path("data", "YFT_SRD_1A_4_v2.Rdata")) {

   dat_template <- r4ss::SS_readdat(dat_template_filepath, version = "3.30")
   # get the data file, 1 area
   # TODO: get data() working; for now just use load
   load(dat_sim_filepath)
   # add the data to the template ----
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

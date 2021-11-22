#' Add data to the 1 area template files
#' @param dat_template_filepath Filepath to the 1 area template datafile. Note
#'  this is in 3.30 formatting.
#' @param dat_sim_filepath Filepath to the rdata file containing 1 iteration of the
#'  1 area datafile. Note this is in 3.24 file formatting.
#' @return An 3.30 SS3 datafile (as read in using `SS_readdat()`) containing the data
#'  from `dat_sim_filepath`.
add_data <- function(
  dat_template_filepath = file.path("inst", "extdata", "TemplateIO", "data.ss"),
  dat_sim_filepath = file.path("data", "YFT_SRD_1A_4_v2.Rdata")) {

   dat_template <- r4ss::SS_readdat(dat_template_filepath, version = "3.30")
   # get the data file, 1 area
   # TODO: get data() working; for now just use load
   load(dat_sim_filepath)
   # add the data to the template ----
   dat_out <- dat_template
   # catch - need to change formatting for 3.24 to 3.30
   fleet_key <- data.frame(fleet = seq_len(nrow(dat_template$fleetinfo)),
                           fleetname = dat_template$fleetinfo$fleetname)
   tmp_catch <- tidyr::pivot_longer(dat_1A_4$catch, cols = seq_len(dat_1A_4$Nfleet),
                                    names_to = "fleetname")
   tmp_catch <- merge(x = tmp_catch, y = fleet_key)
   tmp_catch <- tmp_catch[, c("year", "seas", "fleet", "value")]
   colnames(tmp_catch)[4] <- "catch"
   tmp_catch$catch_se <- 0.01 # is this correct? I think this info is missing from SS 3.24.
   tmp_catch <- dplyr::arrange(tmp_catch, fleet, seas, year)
   dat_out$catch <- tmp_catch
   # CPUE
   tmp_CPUE <- type.convert(dat_1A_4$CPUE[, 1:4], as.is = TRUE)
   tmp_CPUE$index <- 8 # because I think fleet 8 is the CPUE??
   tmp_CPUE <- tmp_CPUE %>%
     rename(obs = cpu) %>%
     rename(catch_se = cv) %>%
    select(year, seas, index, obs, catch_se)
   dat_out$CPUE <- tmp_CPUE
   # length comps
   dat_out$lencomp <- dat_1A_4$lencomp
   # tag data
   dat_out$tag_recaps <- dat_1A_4$tag_recaps
   dat_out$tag_recaps$fleet <- 6  # Because it was labeled ps before
   dat_out$tag_releases <- dat_1A_4$tag_releases
   dat_out$N_tag_groups <- dat_1A_4$N_tag_groups
   dat_out$N_recap_events <- nrow(dat_1A_4$tag_recaps)
   dat_out
}

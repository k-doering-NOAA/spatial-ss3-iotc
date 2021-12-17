#' read data file with seasons as continuous years and convert into an annual
#' model
#' @param dat The data file with seasons as continuous years
#' @param fore The forecast file with seasons as continuous years
#' @param ctl The control file with seasons as continuous years
#' @param helper_key Filepath to the key for converting between seasons and
#'  years
#' @author Agurtzane Urtizberea, Kathryn Doering
create_yr_structure_data <- function(dat,
  helper_key = file.path("inst","extdata", "helper.csv"), fore, ctl) {
  # datnew will be the dat file as an annual model
  datnew <- dat
  help <- read.csv(helper_key)

  # change model years
  datnew$styr <- help[help$ssyr == dat$styr, "year"]
  datnew$endyr <- help[help$ssyr == dat$endyr, "year"]
  datnew$nseas <- 4
  datnew$months_per_seas <- c(3,3,3,3)

  # MODIFY CATCHES ----
  #Find the match between the years on the file (season as years)  and
  # the real years.
  pos <- match(datnew$catch$year,help$ssyr)
  datnew$catch$seas <- help$ss[pos]
  datnew$catch$year <- help$year[pos]

  # MODIFY CPUE ----
  pos <- match(datnew$CPUE$year,help$ssyr)
  datnew$CPUE$seas <- (help$ss[pos]-1)*3+1 #month
  datnew$CPUE$year <- help$year[pos]

  # MODIFY lencomp ----
  pos <- match(dat$lencomp$Yr,help$ssyr)
  datnew$lencomp$Seas <- (help$ss[pos]-1)*3+1 # month
  datnew$lencomp$Yr <- help$year[pos]

  # MODIFY tagging data ----

  #tag_release
  pos <- match(dat$tag_releases$yr,help$ssyr)
  datnew$tag_releases$season <- help$ss[pos]
  datnew$tag_releases$yr <- help$year[pos]
  datnew$tag_releases$age <- floor(dat$tag_releases$age/4)
  pos <- match(dat$tag_releases$tfill,help$ssyr)
  datnew$tag_releases$tfill <- help$year[pos]

  #tag_recaps
  pos <- match(dat$tag_recaps$yr,help$ssyr)

  datnew$tag_recaps$season <- help$ss[pos]
  datnew$tag_recaps$yr <- help$year[pos]

  # make changes to forecast ----
  forenew <- fore
  forenew$Bmark_years <- help$year[match(fore$Bmark_years, table = help$ssyr)]
  forenew$Fcast_years <- help$year[match(fore$Fcast_years, table = help$ssyr)]
  forenew$FirstYear_for_caps_and_allocations <-
    help$year[match(fore$FirstYear_for_caps_and_allocations, table = help$ssyr)]
  # modify control
  ctlnew <- ctl
  ctlnew$MainRdevYrFirst <-
    help$year[match(ctl$MainRdevYrFirst, table = help$ssyr)]
  ctlnew$MainRdevYrLast <-
    help$year[match(ctl$MainRdevYrLast, table = help$ssyr)]
  ctlnew$F_ballpark_year <-
    help$year[match(ctl$F_ballpark_year, table = help$ssyr)]
  # note: if there are any parm devs, then will need to be modified to the
  # annual year values. This for now is only done for MG parms, but should be
  # done for other sections if there are additional dev values in other parm
  # sections.
  dev_rows <- which(ctl$MG_parms$dev_link != 0)
  for(r in dev_rows) {
    tmp_min <- ctl$MG_parms[r, "dev_minyr"]
    tmp_max <- ctl$MG_parms[r, "dev_maxyr"]
    tmp_ann_min <- help$year[match(tmp_min, table = help$ssyr)]
    tmp_ann_max <- help$year[match(tmp_max, table = help$ssyr)]
    ctlnew$MG_parms[r, "dev_minyr"] <- tmp_ann_min
    ctlnew$MG_parms[r, "dev_maxyr"] <- tmp_ann_max
  }
  # output ----
  output_list <- list(datnew = datnew, forecastnew = forenew, ctlnew = ctlnew)
  output_list

}

#' read data file with seasons as continuous years and convert into an annual
#' model
#' @param dat The data file with seasons as continuous years
#' @author Agurtzane Urtizberea, Kathryn Doering
create_yr_structure_data <- function(dat) {
  # datnew will be the dat file as an annual model
  datnew <- dat

  # MODIFY CATCHES ----

  help <- read.csv(file.path("inst","extdata", "helper.csv"))

  #Find the match between the years on the file (season as years)  and
  # the real years.
  pos <- match(datnew$catch$year[-1],help$ssyr)
  summary(pos)
  pos.na <- which(is.na(pos))

  datnew$catch[pos.na+1,]

  #careful the first line is removed (999)
  datnew$catch$seas[-1] <- help$ss[pos]
  datnew$catch$year[-1] <- help$year[pos]
  datnew$catch[pos.na+1,] <- dat$catch[pos.na+1,]

  # MODIFY CPUE ----
  pos <- match(datnew$CPUE$year,help$ssyr)
  #summary(pos)

  datnew$CPUE$seas <- (help$ss[pos]-1)*3+1
  datnew$CPUE$year <- help$year[pos]

  # MODIFY lencomp ----
  pos <- match(dat$lencomp$Yr,help$ssyr)

  datnew$lencomp$Seas <- (help$ss[pos]-1)*3+1
  datnew$lencomp$Yr <- help$year[pos]

  # MODIFY tagging data ----

  #tag_release
  pos <- match(dat$tag_releases$Yr,help$ssyr)

  datnew$tag_releases$Season <- help$ss[pos]#(help$ss[pos]-1)*3+1
  datnew$tag_releases$Yr <- help$year[pos]
  datnew$tag_releases$Age <- floor(dat$tag_releases$Age/4)
  pos <- match(dat$tag_releases$tfill,help$ssyr)
  datnew$tag_releases$tfill <- help$year[pos]

  #tag_recaps
  pos <- match(dat$tag_recaps$Yr,help$ssyr)

  datnew$tag_recaps$Season <- help$ss[pos]#(help$ss[pos]-1)*3+1
  datnew$tag_recaps$Yr <- help$year[pos]

  # may want to write this to a file
  #SS_writedat_3.30(datnew,outfile="update3_annual.dat")
  datnew
}

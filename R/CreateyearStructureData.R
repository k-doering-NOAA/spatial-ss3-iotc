#............................................................
#
#     READ DATA FILE WITH SEASONS AS CONTINUOUS YEARS
#     AND CONVERT INTO AN ANNUAL MODEL  
#
#AGURTZANE URTIZBEREA
#............................................................

library(r4ss)
library(xlsx)

wd <- "~/Max files for backup/Documents/Commitees/Global program/IOTC/WP Tropical tunas/2021/Reference_annual_modified_3areas_SEL_DW_updated/Data conversion"

setwd(wd)

dat <- SS_readdat("data.ss")
datnew <- dat

#.............................................
#
#         MODIFY CATCHES
#
#...........................................

help <- read.csv("~/Max files for backup/Documents/Commitees/Global program/IOTC/WP Tropical tunas/2021/Reference_annual_modified_3areas_SEL_DW_updated/Data conversion/helper.csv")

head(help)

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
write.table(datnew$catch,file="catch_annual.txt",row.names = FALSE,sep="\t")

#.............................................
#
#         MODIFY CPUE
#
#...........................................

pos <- match(datnew$CPUE$year,help$ssyr)
summary(pos)

datnew$CPUE$seas <- (help$ss[pos]-1)*3+1
datnew$CPUE$year <- help$year[pos]

write.table(datnew$CPUE,file="CPUE_annual.txt",row.names = FALSE,sep="\t")


#.............................................
#
#         MODIFY lencomp
#
#...........................................

head(datnew$lencomp)
summary(datnew$lencomp$Yr)

pos <- match(dat$lencomp$Yr,help$ssyr)
summary(pos)

datnew$lencomp$Seas <- (help$ss[pos]-1)*3+1
datnew$lencomp$Yr <- help$year[pos]
write.table(datnew$lencomp,file="lencomp_annual.txt",row.names = FALSE,sep="\t")


#.............................................
#
#         MODIFY taggind data
#
#...........................................

#tag_release
head(datnew$tag_releases)
pos <- match(dat$tag_releases$Yr,help$ssyr)
summary(pos)

datnew$tag_releases$Season <- help$ss[pos]#(help$ss[pos]-1)*3+1
datnew$tag_releases$Yr <- help$year[pos]
datnew$tag_releases$Age <- floor(dat$tag_releases$Age/4)
pos <- match(dat$tag_releases$tfill,help$ssyr)
datnew$tag_releases$tfill <- help$year[pos]
write.table(datnew$tag_releases ,file="tag_release_annual.txt",row.names = FALSE,sep="\t")

#tag_recaps
head(datnew$tag_recaps)
pos <- match(dat$tag_recaps$Yr,help$ssyr)
summary(pos)

datnew$tag_recaps$Season <- help$ss[pos]#(help$ss[pos]-1)*3+1
datnew$tag_recaps$Yr <- help$year[pos]
write.table(datnew$tag_recaps,file="tag_recaps_annual.txt",row.names = FALSE,sep="\t")

SS_writedat_3.30(datnew,outfile="update3_annual.dat")

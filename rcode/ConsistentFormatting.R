#GOAL: fix the inconsistent formatting in the AVA files as needed.


#Libraries

#Set Working Directory
setwd("D:/AVA_Inconsistencies")

#Load Data
avas_path<-"/avas"

#Inconsistencies to fix:
#   1. ava_id, name - trailing spaces
#   2. aka - replace "" with NA
#   3. created - date format
#   4. removed - replace "" with NA
#   5. counties, contains, within, state
#       - replace ", " with |
#       - replace "" with NA
#       - missing counties - are these unfinished AVAs?
#   6. petitioner - replace "" with NA
#   7. cfr_author - trailing spaces
#   8. valid_start & valid_end
#       - replace "" with NA
#       - replace / with - for dates
#       - check date format
#   9. lcsh - replace "" with NA
#   10. sameas - replace "" with NA







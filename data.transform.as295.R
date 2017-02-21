################################################################################
# TODO: Transform the data into the correct shape or map it onto new values.  
#       Create calculated colums and flags.  Normally, the data is not converted
#       into tidy format at this stadge.  That is done in the tidy stage of the 
#       cleaning process. 
# 
# Example:
#
# data.file = paste0(path.data.raw, "/slot_lifespan_window.csv")
#
# # read in a mapping of all days the slots were active,
# # including the start and end range of 90 days. We will need to 
# # unfactor the slot id and convert the date back into a string
#
# slot.days <- fread(data.file, header=TRUE, colClasses=c('integer', 'character', 'character'))
# setnames(slot.days, c("slot_id", "start_date", "end_date"), c('slot.id', 'start.date', 'end.date'))
# setkey(slot.days, slot.id, start.date)
#
# # now create a data table from the remediation window, and also key it on the 
# # slot id (converted back to integer, but to character first so we don't get the factor value) and the date.
# # start.date should not be a date so that data.table can do the right keying
#
# rem.days <- data.frame(remediation.window)
# rem.days$slot.id <- as.integer(as.character(rem.days$slot.id))
# rem.days <- data.table(rem.days, key=c("slot.id", "start.date"))
# 
# # merge our two data sets (left join slot days with remediation days, because we have in slot.days the
# # complete set of days.
# 
# j <- merge(slot.days, rem.days, all=TRUE)
# # head(subset(j, is.na(end.date.x)))
# # head(j)
#
# # now, replace our original data frame with the combined set of columns.
# # If we have a value for end.date.y (from remediation), then use the orignal remediation values.
# # Otherwise, it was an unmatched entry and we will insert the default values for empty days.
#
# remediation.window <- data.frame(
#   slot.id    =as.factor(j$slot.id),
#   start.date =j$start.date,
#   end.date   = ifelse(is.na(j$end.date.y), j$end.date.x, j$end.date.y),
#   closed.sum =ifelse( is.na(j$end.date.y), 0L, as.integer(j$closed.sum )),
#   open.sum  =ifelse( is.na(j$end.date.y),  0L,  as.integer(j$open.sum)),
#   remediation=ifelse( is.na(j$end.date.y), NA, j$remediation )
# )
# 
# rm(slot.days, data.file, j, rem.days)
#
#################################################################################

# Make the wavelength a factor and trim some of the extra digits

# Clean the data

# The following steps are perform in cleaning.  All steps are optional.  
# Converting of the data types may be done during the loading process
# For each varible, make sure that you comment on any steps that are skipped.
# 1) Convert the data types
# 2) Transform the data into the correct shape or map it onto new values.  Create calculated colums and flags
# 3) Filter out bad data or columns that are not needed
# 4) Tidy the data, that is put it in a tidy format

# Note: "constant.R" must be run first.

################################################################################
# TODO: List of scripts that are to be called to clean each input variable
#       There are four sections, not all have to be used.
#       It is best to keep the variables in alphabetical order.
#
# Example: 
# #############
# # scan.length
# #############
# if (!data.log$read.from.cache[data.log$label == 'scan.length']) {
#  
#  # Convert:
#  # Transform:
#  source(paste(path.R.final, 'data.transform.scan.length.R', sep='/'))
#  # Filter:
#  source(paste(path.R.final, 'data.filter.scan.length.R', sep='/'))
#  # Tidy:
# 
#  # Write it to a cache if requested
#  if (data.log$save.cache[data.log$label == 'scan.length']) {
#    data.write.cache(data.log$cache.file[data.log$label == 'scan.length'], 
#                     data.log$cache.info.file[data.log$label == 'scan.length'],
#                     data.log$data.file[data.log$label == 'scan.length'], scan.length)
#    data.update.log(label = 'scan.length', save.cache = FALSE)
#  }
# }
#
#################################################################################

#############
# as295
#############
if (!data.log$read.from.cache[data.log$label == 'as295']) {
  
  # Convert:
  # Transform:
  source(paste(path.R.final, 'data.transform.as295.R', sep='/'))
  # Filter:
  # source(paste(path.R.final, 'data.filter.as295.R', sep='/'))
  # Tidy:
  
  # Write it to a cache if requested
  if (data.log$save.cache[data.log$label == 'as295']) {
    data.write.cache(data.log$cache.file[data.log$label == 'as295'], 
                     data.log$cache.info.file[data.log$label == 'as295'],
                     data.log$data.file[data.log$label == 'as295'], as295)
    data.update.log(label = 'as295', save.cache = FALSE)
  }
}
# Check all the data and structures.  This should be run after all data cleaning has been completed
# It calls a series of scripts that each check a single variable

# The global var, check.error, will be created if it does not exist.  Any error messages will be stored here.

# Note: "constant.R" must be run first.

# Create the check.error varible if it does not exist
if (!exists("check.error")) {
  check.error <- data.frame(var=character(), comment=character(), value=character())  
}

################################################################################
# TODO: List of scripts that are to be called to validate all data
# 
# Example:
#
### pci.compliance
# source(paste(path.R.final, 'data.check.pci.compliance.R', sep='/'))
# 
### PRL omitted slots
# source(paste(path.R.final, 'data.check.prl.omitted.slots.R', sep='/'))
#
#################################################################################

rm(check.error)

### as295
source(paste(path.R.final, 'data.check.as295.R', sep='/'))

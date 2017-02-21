

# Check the as133 var for problems with the data and structure.  This should be run after all data cleaning has been completed
# The global var, check.error, will be created if it does not exist.  Any error messages will be stored here.

# Create the check.error varible if it does not exist
if (!exists("check.error")) {
  check.error <- data.frame(var=character(), comment=character(), value=character())  
}

# local function to make the storage easier and the code cleaner
update.check.error <- function(store, var="", comment="", value=vector()) {
  if (store) {
    assign("check.error", rbind(check.error, data.frame(var=as.character(var), comment=as.character(comment), value=as.character(value) )), globalenv())
  }
}

################################################################################
# TODO: Check to make sure that the data is valid.  This includes things such as
#       - columns are the correct data type
#       - values are in range or the correct factors are present
#       - A list of expected colums are present
#
#       The variable check.error records all the errors and information about the error.
#
#       This can often be a long file.  Divide the script up by the columns in the dataframe.
#       At the start of each column section, use a variable to track what columns have been
#       checked with code such as:
#          remediation.window.test.col.names <- c("slot.id")  # first time the var is updated
#          remediation.window.test.col.names <- c(remediation.window.test.col.names, "start.date")
#
# Example:
#
#################################################################################

######################
### as295
######################

# Make sure that it is a data.frame
update.check.error(
  !is.data.frame(as295), 
  var="as295", 
  comment="var must be a data.frame", 
  value=class(as295)
)

# Make sure the required columns are present
update.check.error(
  !all(TEST.COL.NAMES %in% names(as295)), 
  var="as295", 
  comment="missing required column(s)", 
  value=paste(TEST.COL.NAMES[!TEST.COL.NAMES %in% names(as295)], collapse=", ")
)

##################################################################################

##############################
### as133$name
##############################

as295.test.col.names <- c("name")

# as295$name must be a factor
update.check.error(
  !is.factor(as295$name), 
  var="as295$name", 
  comment="var must be a factor", 
  value=class(as295$name)
)

# check for NA
update.check.error(any(is.na(as295$name)),
                   var="as295$name",
                   comment="NA values detected",
                   value=paste0(sum(is.na(as295$name)), " NA values detected")
)

# make sure that there is only one level
update.check.error(nlevels(as295$name) != NAME.NUM.FACTOR,
                   var="as295$name",
                   comment="Incorrect number of levels",
                   value=paste(levels(as295$name), collapse=",")
)


##############################
### as295$wavelength
##############################

as295.test.col.names <- c(as295.test.col.names, "wavelength")

# as295$observation must be a factor
update.check.error(
  !is.factor(as295$wavelength), 
  var="as295$wavelength", 
  comment="var must be a factor", 
  value=class(as295$wavelength)
)

# check for NA
update.check.error(any(is.na(as295$wavelength)),
                   var="as295$wavelength",
                   comment="NA values detected",
                   value=paste0(sum(is.na(as295$wavelength)), " NA values detected")
)

# make sure that there are the correct number of factors
update.check.error(nlevels(as295$wavelength) > WAVE.LENGTH.NUM.FACTOR,
                   var="as295$wavelength",
                   comment="Too many levels",
                   value=paste(nlevels(as295$wavelength), " levels detected, expecting <= ",  WAVE.LENGTH.NUM.FACTOR, sep="")
)

# make sure the wave.lengths are numerics
update.check.error(any(is.na(as.numeric(levels(as295$wavelength)))),
                   var="as295$wavelength",
                   comment="Not all factors have numeric labels",
                   value=paste(levels(as295$wavelength)[is.na(as.numeric(levels(as295$wavelength)))], collapse=",")
)


##################################################################################

##############################
### as133$reading
##############################

as295.test.col.names <- c(as295.test.col.names, "reading")

# as295$reading must be numeric
update.check.error(class(as295$reading) != "numeric", 
                   var="as295$reading", 
                   comment="Must be numeric", 
                   value=class(as295$reading)
)

# check for NA
update.check.error(any(is.na(as295$reading)),
                   var="as295$reading",
                   comment="NA values detected",
                   value=paste0(sum(is.na(as295$reading)), " NA values detected")
)

# values must be positive
update.check.error(length(as295$reading[as295$reading < 0]) > 0,
                   var="as295$reading",
                   comment="Negative values",
                   value=paste0(length(as295$reading[as295$reading < 0]), " values are negative")
)

##################################################################################


##############################
### as133$white
##############################

as295.test.col.names <- c(as295.test.col.names, "white")

# as295$reading must be numeric
update.check.error(class(as295$white) != "numeric", 
                   var="as295$white", 
                   comment="Must be numeric", 
                   value=class(as295$white)
)

# check for NA
update.check.error(any(is.na(as295$white)),
                   var="as295$white",
                   comment="NA values detected",
                   value=paste0(sum(is.na(as295$white)), " NA values detected")
)

# values must be positive
update.check.error(length(as295$white[as295$white < 0]) > 0,
                   var="as295$white",
                   comment="Negative values",
                   value=paste0(length(as295$white[as295$white < 0]), " values are negative")
)

##################################################################################


##############################
### as133$dark
##############################

as295.test.col.names <- c(as295.test.col.names, "dark")

# as295$reading must be numeric
update.check.error(class(as295$dark) != "numeric", 
                   var="as295$dark", 
                   comment="Must be numeric", 
                   value=class(as295$dark)
)

# check for NA
update.check.error(any(is.na(as295$dark)),
                   var="as295$dark",
                   comment="NA values detected",
                   value=paste0(sum(is.na(as295$dark)), " NA values detected")
)

# values must be positive
update.check.error(length(as295$dark[as295$dark < 0]) > 0,
                   var="as295$dark",
                   comment="Negative values",
                   value=paste0(length(as295$dark[as295$dark < 0]), " values are negative")
)

##################################################################################



##############################
### as295$integration.time
##############################

as295.test.col.names <- c(as295.test.col.names, "integration.time")

# must be a numeric
update.check.error( !is.numeric(as295$integration.time), 
                    var="as295$integration.time", 
                    comment="var must be of class numeric",
                    value=class(as295$integration.time)
)

# check for NA
update.check.error(any(is.na(as295$integration.time)),
                   var="as295$integration.time",
                   comment="NA values detected",
                   value=paste0(sum(is.na(as295$integration.time)), " NA values detected")
)

# values all be the same
update.check.error(length(unique(as295$integration.time)) != 1,
                   var="as295$integration.time",
                   comment="More then one value detected",
                   value=paste(unique(as295$integration.time), collapse=",")
)

# values must be greater than zero
update.check.error(min(as295$integration.time) <= 0,
                   var="as295$integration.time",
                   comment="Values must be positive",
                   value=paste("minimum value is: ", min(as295$integration.time), collapse=" ")
)

##################################################################################

#####################################
### Check column names are all tested
#####################################

update.check.error(!all(names(as295) %in% as295.test.col.names ),
                   var="as295",
                   comment="There are columns that do not have tests",
                   value=paste(names(as295)[!names(as295) %in% as295.test.col.names], collapse=', ')
)

rm(list=c("as295.test.col.names", "update.check.error", "tmp")) # clean up after ourselves

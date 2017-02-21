# Constants

# Set up file paths
host.name <- system("hostname", intern=TRUE)
if (identical(host.name, "mab")) {
  path.base      <- "~/git/algorithms/analysis"
} else {
  # Use the working directory
  path.base      <- "/Users/ehson/Documents/git/algorithms/analysis"
}

path.data        	       <- paste(path.base,           'data', sep='/')
path.data.raw    	       <- paste(path.data,           'raw', sep='/')
path.data.processed      <- paste(path.data,           'processed', sep="/")
path.data.cache  	       <- paste(path.data.processed, 'cache', sep='/')
path.R           	       <- paste(path.base,           'R', sep='/')
path.R.final     	       <- paste(path.R,              'final', sep='/')
path.figures     	       <- paste(path.base,           'figures', sep='/')
path.figures.exploratory <- paste(path.figures,        'exploratory', sep='/')
path.figures.final       <- paste(path.figures,        'final', sep='/')

################################################################################
# TODO: Define analysis specific constants.  This includes constants such as
#       ranges, factor values, columns that must exist in a data.frame, etc..
#       Us ALL CAPS for constant names
#
# Example:
# 
# # The start time
# WINSTART      <- as.Date("2008-01-01")             # The start of the analysis period
#
# ### Valid factor values
# # service.level
# SERVICE.TYPE  <- c("BE", "PE", "SE")               # Valid service types.  Currently these are DAST service levels
#
# ### Required column names in the final data frame
# service.level
# SERVICE.LEVEL.COL.NAMES <- c("client.id", "product.type", "slot.id", "service.type", "create.date", "end.date")
#
#################################################################################


# ### Valid factor values
# 
NAME.NUM.FACTOR <- 1                                      # the number of factors in name
OPERATOR.NUM.FACTOR <- 1                                  # Number of operators
OPERATOR.SPLIT <- NAME.NUM.FACTOR / OPERATOR.NUM.FACTOR   # What sample number to split the two operators by
SAMPLE.NUM.FACTOR <- NAME.NUM.FACTOR                      # total number of measurement samples across all machines and operators
TOOL.NUM.LEVEL <- 1                                       # the number of factors in the tool column 
WAVELENGTH.SPECTROMETER <- 2036                           # number of wavelengths on a spectrometer
WAVE.LENGTH.NUM.FACTOR <- WAVELENGTH.SPECTROMETER  * TOOL.NUM.LEVEL          # the number of factors in wavelength
     
# Data for filtering 
FILTER.MAX.REFLECTANCE <- 58890                           # Actual max reflectance is 58897, adding a buffer
FILTER.WAVELENGTH.WIDTH <- 1                              # width in nm to filter beside values that are clipping

### Required column names in the final data frame
# operator
TEST.COL.NAMES <- c("name", "observation", "wavelength", "reading", "white","dark","integration.time")


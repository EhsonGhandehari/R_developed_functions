################################################################################
# TODO: Add the libraries that you want to load
################################################################################

require(reshape2, quietly=TRUE, warn.conflicts=FALSE)
require(plyr, quietly=TRUE, warn.conflicts=FALSE)
require(foreach, quietly=TRUE, warn.conflicts=FALSE)
require(ggplot2, quietly=TRUE, warn.conflicts=FALSE)
require(stats, quietly=TRUE, warn.conflicts=FALSE)
require(psych, quietly=TRUE, warn.conflicts=FALSE)
require(tools, quietly=TRUE, warn.conflicts=FALSE)
require(gridExtra, quietly=TRUE, warn.conflicts=FALSE)
require(testthat, quietly=TRUE, warn.conflicts=FALSE)

################################################################################
# TODO: Add the libraries that you want to load
################################################################################
source(paste(path.R.final, 'data.read.cache.R', sep='/'))
source(paste(path.R.final, 'data.write.cache.R', sep='/'))
source(paste(path.R.final, 'data.update.log.R', sep='/'))
source(paste(path.R.final, 'multiplot.R', sep='/'))


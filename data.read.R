# Note: "constant.R" must be run first.

# create a var that keeps track of the data

################################################################################
# TODO: Read each data file.  Also use the data.update.log function to track
#       what has been done to the file.  Items can be read and saved to the 
#       cache if desired.
#
# Example:
#
# ################
# # pci.compliance
# ################
# # When a slot was PCI complient or not.
# data.update.log(label = 'pci.compliance', 
#                 data.file = paste(path.data.raw, "pci.compliance.csv", sep="/"), 
#                 cache.file = paste(path.data.cache, 'pci.compliance.rds', sep="/"), 
#                 cache.info.file = paste(path.data.cache, 'pci.compliance.info.RData', sep="/"),
#                 read.from.cache = TRUE,
#                 save.cache = FALSE)
# pci.compliance <- suppressWarnings(data.read.cache(data.log$cache.file[data.log$label == 'pci.compliance'], data.log$cache.info.file[data.log$label == 'pci.compliance']))
# if (is.null(pci.compliance)){
#   data.update.log(label = 'pci.compliance', read.from.cache = FALSE)
#   pci.compliance <- read.table(data.log$data.file[data.log$label == 'pci.compliance'], 
#                                header=TRUE, sep=',', colClass=c('factor', 'factor', 'Date', 'character'),
#                                col.names=c('client.id', 'slot.id', 'date', 'compliant')
#  )
#  data.update.log(label='pci.compliance', save.cache=TRUE)
# }
#
################################################################################

################
# as295
################
# data from as295 
data.update.log(label = 'as295', 
                data.file = paste(path.data.processed, "as-295.gz", sep="/"), 
                cache.file = paste(path.data.cache, 'as295.rds', sep="/"), 
                cache.info.file = paste(path.data.cache, 'as295.info.RData', sep="/"),
                read.from.cache = TRUE,
                save.cache = FALSE)
as295 <- suppressWarnings(data.read.cache(data.log$cache.file[data.log$label == 'as295'], data.log$cache.info.file[data.log$label == 'as295']))
if (is.null(as295)){
  data.update.log(label = 'as295', read.from.cache = FALSE)
  as295 <- read.table(data.log$data.file[data.log$label == 'as295'], 
                     header=TRUE, sep=',', 
                     colClass=c('factor', 'numeric', 'numeric', 'numeric', 'numeric','numeric','numeric'),
                     col.names=c('name','observation','wavelength', 'reading', 'white','dark','integration.time')
  )
  as295$row.names<-NULL
  data.update.log(label='as295', save.cache=TRUE)
}

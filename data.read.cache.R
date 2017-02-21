data.read.cache <- function(cache.file, cache.info.file) {
  
  # Read a cached file instead of reading and converting a raw data file.
  # This file may have been changed from the last time that the cache.file was written.  
  # To deal with this the cache.file stores the file.info in information (cache.info.file)
  # This information will be checked against the current raw file, if they
  # are the same then the cached data is returned, otherwise, it returns NULL.
  #
  # The raw.file is optional.  If it is not given then the cached value is 
  # returned without checking to see if it is out of date.
  
  # Make sure the cache.file is defined and exists
  if (!exists("cache.file")) { stop("cache.file was not specified") }
  if (!file.exists(cache.file)) {
    warning(paste0( "cache.file: ", cache.file, "is does not exist"))
    return(NULL)
  }
          
  # User requested that the cache file be checked
  if (exists("cache.info.file") ) {
            
    # Make sure the file exists and read it.
    if (!file.exists(cache.info.file)) { stop(paste0( "cache.info.file: ", cache.info.file, " does not exist")) }
    cache.info <- dget(cache.info.file)	

    # Replace the [PATH.BASE] with the global var 
    cache.info$raw.file <- sub("[PATH.BASE]", path.base, cache.info$raw.file, fixed=TRUE)
    
    # Check for the raw file to see if it exists and to see if it matches the cache
    if (!file.exists(cache.info$raw.file)) { stop(paste0( "raw file: ", cache.info$raw.file, " does not exist")) }
    
    # The cache is consider to match if the md5 hash is the some.  However, this is expensive to test so we
    # want to check the file size first.  If it does not match we do not need to calculate it.
    # We cannot us mtime for file comparison because git messes with it.
    raw.file.info = file.info(cache.info$raw.file)
    if (cache.info$info$size != raw.file.info$size & md5sum(cache.info$raw.file) != cache.info$md5) {
      
      # The cache.file is out of date
      warning("The cache file is out of date.  Update it")
      return(NULL)
    } 
  }
  
  # Return the cached data
  return(readRDS(cache.file))
}	
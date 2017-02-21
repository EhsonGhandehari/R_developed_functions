data.write.cache <- function(cache.file, cache.info.file, data.file, data) {
  
  # write a cache file for the processed data and the cache.info.file
  
  # Make sure the cache.file is defined and exists
  if (!exists("cache.file"))      { stop("cache.file was not specified") }
  if (!exists("cache.info.file")) { stop("cache.info.file was not specified") }
  if (!exists("data.file"))       { stop("data.file was not specified") }
  if (!exists("data"))            { stop("data.file was not specified") }

  if (!file.exists(data.file)) { stop(paste0( "data.file: ", data.file, "is does not exist")) }
  
  # Write the cache file
  saveRDS(data, cache.file)
  
  # Write the cache.info and cache file
  
  dput(list(raw.file = sub(path.base, "[PATH.BASE]", data.file),  # Swap file paths with the [PATH.BASE] marker
            info=file.info(data.file),                            # Store some info about the datafile
            md5=md5sum(cache.file)                                # Store md5 hash for comparison
            ), cache.info.file)
  
}	
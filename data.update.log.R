data.update.log <- function(label, data.file=NA, cache.file=NA, cache.info.file=NA, read.from.cache=NA, clean.convert=NA, clean.transform=NA, 
                    clean.filter=NA, clean.tidy=NA, save.cache=NA){
  
  # Update the data.log variable to store new information in it.  The label must be provided
  if(!exists("data.log", envir = .GlobalEnv)) {
    # data.log does not exist, create it.
    assign("data.log", data.frame( label = label, data.file = data.file, cache.file = cache.file, cache.info.file = cache.info.file, 
                                   read.from.cache = read.from.cache, clean.convert = clean.convert, clean.transform = clean.transform, 
                                   clean.filter = clean.filter, clean.tidy = clean.tidy, save.cache = save.cache, stringsAsFactors = FALSE), 
           envir = .GlobalEnv)
  } else {
    # data.log exists
    data.log <- get("data.log", envir = .GlobalEnv)
    # check to see if the label exists
    if (any(data.log$label == label)) {
        # label exists
        if (!is.na(data.file))       { data.log$data.file[data.log$label == label] <- data.file }
        if (!is.na(cache.file))      { data.log$cache.file[data.log$label == label] <- cache.file }
        if (!is.na(cache.info.file)) { data.log$cache.info.file[data.log$label == label] <- cache.info.file }
        if (!is.na(read.from.cache)) { data.log$read.from.cache[data.log$label == label] <- read.from.cache }
        if (!is.na(clean.convert))   { data.log$clean.convert[data.log$label == label] <- clean.convert }
        if (!is.na(clean.transform)) { data.log$clean.transform[data.log$label == label] <- clean.transform }
        if (!is.na(clean.filter))    { data.log$clean.filter[data.log$label == label] <- clean.filter }
        if (!is.na(clean.tidy))      { data.log$clean.tidy[data.log$label == label] <- clean.tidy }
        if (!is.na(save.cache))      { data.log$save.cache[data.log$label == label] <- save.cache }
        
        assign("data.log", data.log, envir = .GlobalEnv)
    } else {
      # label does not exist, create it.
      assign("data.log", rbind(data.log, data.frame( label = label, data.file = data.file, cache.file = cache.file, cache.info.file = cache.info.file, 
                                                    read.from.cache = read.from.cache, clean.convert = clean.convert, clean.transform = clean.transform, 
                                                    clean.filter = clean.filter, clean.tidy = clean.tidy, save.cache = save.cache)),
             envir = .GlobalEnv)
    }
    
  }
}

  
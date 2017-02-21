# determine what wavelengths clipped
clipped <- unique(as295$wavelength[as295$reading > FILTER.MAX.REFLECTANCE])

# determine which wavelengths to remove.  It is a window around the clipped window.
lambda <- data.frame(clipped = clipped, min = clipped - FILTER.WAVELENGTH.WIDTH, max = clipped + FILTER.WAVELENGTH.WIDTH)

# Filter wavelengths that are affected by clipping
for (i in 1:nrow(lambda)){
  as295 <- as295[!(as295$wavelength >= lambda$min[i] & as295$wavelength <= lambda$max[i]), ]
}

rm(list=c("clipped", "lambda"))
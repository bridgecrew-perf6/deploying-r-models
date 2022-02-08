if (!require("plumber")) install.packages("plumber")
if (!require("jsonlite")) install.packages("jsonlite")
library(plumber)
library(jsonlite)

pr <- plumb("01-plumber-api.R")

swaggerFile <- pr$getApiSpec()
swaggerFile$info$title <- "plumberCarsService"
swaggerFile$info$description <- "Returns the probability of a vehicle being fitted with a manual transmission"
swaggerFile$info$version <- "1.0.0"
swagger <- toJSON(swaggerFile, pretty = TRUE, auto_unbox = TRUE)
cat(swagger, file = "plumber-swagger.json", append = FALSE)

pr$run(port=3005)
# http://localhost:3005/swagger.json

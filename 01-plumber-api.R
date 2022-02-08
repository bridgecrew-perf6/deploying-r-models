model = readRDS("cars-model.rds")

#* Plot a histogram of the gross horsepower
#* @serializer png list(width = 1500, height = 1600)
#* @get /plothp
function(){
  hist(mtcars$hp)
}

#* Plot a histogram of the manual transmission
#* @serializer png list(width = 1500, height = 1600)
#* @get /plotam
function(){
  hist(mtcars$am)
}

#* Plot a histogram of the weight (1000 lbs)
#* @serializer png list(width = 1500, height = 1600)
#* @get /plotwt
function(){
  hist(mtcars$wt)
}

#* Returns the probability whether the car has a manual transmission
#* @param hp Gross horsepower
#* @param wt Weight (1000 lbs)
#* @post /manualtransmission
function(hp, wt){
  newdata <- data.frame(hp = as.numeric(hp), wt = as.numeric(wt))
  predict(model, newdata, type = "response")
}
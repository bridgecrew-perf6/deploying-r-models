FROM rstudio/plumber

COPY cars-model.rds /cars-model.rds
COPY 01-plumber-api.R /plumber.R

CMD ["/plumber.R"]
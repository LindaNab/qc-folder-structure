# perform the T5 step [input: D5_UMCU, output: D6_UMCU]
data_d5 <- readr::read_rds(here::here("data", "D5_UMCU.rds"))
data_d5 <- 
  dplyr::mutate(data_d5, some_covariate = TRUE, some_other_covariate = FALSE)
readr::write_rds(data_d5, here::here("data", "D6_UMCU.rds"))
# write a log file
# additional information to be added is e.g. version of GH repo when objects are
# transformed
log_file <- 
  paste0("D6_UMCU_transformation", 
         format(lubridate::now(), "_%Y%m%d_%H%M%S"), ".log")
logr::log_open(here::here("log", log_file), show_notes = FALSE)
logr::put("D6_UMCU.rds succesfully saved after being transformed!",
          console = FALSE)
logr::log_close()

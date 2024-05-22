# perform the T4 step [input: synthetic D4, output: D5_UMCU]
data_d4 <- readr::read_rds(here::here("data", "D4.rds"))
data_d4 <- dplyr::mutate(data_d4, some_covariate = TRUE)
readr::write_rds(data_d4, here::here("data", "D5_UMCU.rds"))
# write a log file
# additional information to be added is e.g. version of GH repo when objects are
# transformed
log_file <- 
  paste0("D5_UMCU_transformation", 
         format(lubridate::now(), "_%Y%m%d_%H%M%S"), ".log")
logr::log_open(here::here("log", log_file), show_notes = FALSE)
logr::put("D5_UMCU.rds succesfully saved after being transformed!",
          console = FALSE)
logr::log_close()

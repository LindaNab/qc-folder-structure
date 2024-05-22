# pulling the synthetic D4 from the QC repo in a secure (automated!) way
readr::write_rds(tibble::tibble(person_id = 1), here::here("data", "D4.rds"))
# write a log file to time stamp when this has happened
log_file <- 
  paste0("D4_pull", format(lubridate::now(), "_%Y%m%d_%H%M%S"), ".log")
logr::log_open(here::here("log", log_file), show_notes = FALSE)
logr::put("D4.rds succesfully downloaded!", console = FALSE)
logr::log_close()

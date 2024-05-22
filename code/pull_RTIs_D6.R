# pulling the output D6 by RTI from the main repo in a secure (automated!) way
readr::write_rds(
  tibble::tibble(person_id = 1,
                 some_covariate = TRUE,
                 some_other_covariate = FALSE),
  here::here("data", "D6_RTI.rds"))
# write a log file to time stamp when this has happened
# additional information to be added is e.g. version of GH repo when objects are
# pulled
log_file <- 
  paste0("D6_RTI_pull", format(lubridate::now(), "_%Y%m%d_%H%M%S"), ".log")
logr::log_open(here::here("log", log_file), show_notes = FALSE)
logr::put("D6_RTI.rds succesfully downloaded!", console = FALSE)
logr::log_close()

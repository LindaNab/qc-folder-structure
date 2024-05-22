# script comparing UMCUs D5 with RTIs D5
data_d5_umcu <- readr::read_rds(here::here("data", "D5_UMCU.rds"))
data_d5_rti <- readr::read_rds(here::here("data", "D5_RTI.rds"))
# comparison
same <- all(data_d5_umcu == data_d5_rti)
# write a log file
log_file <- 
  paste0("D5_comparison", format(lubridate::now(), "_%Y%m%d_%H%M%S"), ".log")
logr::log_open(here::here("log", log_file), show_notes = FALSE)
if (same) {
  logr::put("The D5 objects are the same.", console = FALSE)
} else logr::put("The D5 objects are different.", console = FALSE)
logr::log_close()

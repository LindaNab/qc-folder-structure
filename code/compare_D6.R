# script comparing UMCUs D6 with RTIs D6
data_d6_umcu <- readr::read_rds(here::here("data", "D6_UMCU.rds"))
data_d6_rti <- readr::read_rds(here::here("data", "D6_RTI.rds"))
# comparison
same <- all(data_d6_umcu == data_d6_rti)
# write a log file
log_file <- 
  paste0("D6_comparison", format(lubridate::now(), "_%Y%m%d_%H%M%S"), ".log")
logr::log_open(here::here("log", log_file), show_notes = FALSE)
if (same) {
  logr::put("The D6 objects are the same.", console = FALSE)
} else logr::put("The D6 objects are different.", console = FALSE)
logr::log_close()


if (!requireNamespace("dplyr", quietly = TRUE)) {
  stop("Package dplyr is not installed.")
}
cat("dplyr version:", as.character(packageVersion("dplyr")), "\n\n")

library(dplyr)

data_dir <- "data"

sample_metadata_file <- file.path(data_dir, "sample_metadata.csv")
mass_spec_results_file <- file.path(data_dir, "mass_spec_results.csv")

if (!file.exists(sample_metadata_file) || !file.exists(mass_spec_results_file)) {
  stop("Input CSV files not found in mounted 'data' directory.")
}

sample_metadata <- read.csv(sample_metadata_file)
mass_spec_results <- read.csv(mass_spec_results_file)

# anti left join
anti_left <- anti_join(sample_metadata, mass_spec_results, by = "sample_id")

# anti right join
anti_right <- anti_join(mass_spec_results, sample_metadata, by = "sample_id")

# anti outer join 
anti_outer <- bind_rows(
  anti_left %>% mutate(source = "left_only"),
  anti_right %>% mutate(source = "right_only")
)


write.csv(anti_left, file.path(data_dir, "anti_left.csv"), row.names = FALSE)
write.csv(anti_right, file.path(data_dir, "anti_right.csv"), row.names = FALSE)
write.csv(anti_outer, file.path(data_dir, "anti_outer.csv"), row.names = FALSE)


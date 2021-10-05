library(tidyverse)
library(reticulate)

python_path <- system("which python", intern=TRUE)
use_python(python_path)
orchest <- import("orchest")
pd <- import("pandas")

inputs <- orchest$transfer$get_inputs()

history <- py_to_r(inputs$history)

rm(inputs)

ppl_from_history <- history %>%
    # Start with 145490 observations
    distinct() %>%
    # No change
    select(
        person_id, cmrn_id, rin_cc, BIRTH_DT_TM, sex_cd, race, ethnicity
    ) %>%
    distinct() %>%
    # Now 4766 observations
    mutate(
        origin = "encounter_history.xlsx"
    )

orchest$transfer$output_to_disk(ppl_from_history, "ppl_from_history")




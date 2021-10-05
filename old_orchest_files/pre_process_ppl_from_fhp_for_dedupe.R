library(tidyverse)
library(reticulate)

python_path <- system("which python", intern=TRUE)
use_python(python_path)
orchest <- import("orchest")
pd <- import("pandas")

inputs <- orchest$transfer$get_inputs()

history <- py_to_r(inputs$fhp)

rm(inputs)

ppl_FHP_raw %>%
    # 86576 rows
    distinct() %>%
    # 44346 rows
    select(
        person_id, cmrn_id, rin_cc, NAME_FIRST, NAME_LAST, BIRTH_DT_TM, sex_cd, race, ethnicity
    ) %>%
    distinct() %>%
    # 4768 rows
    mutate(
        origin = "FHPMatchedtoEMRMatchedtoChante_reduced.xlsx"
    )

orchest$transfer$output_to_disk(ppl_from_history, "ppl_from_history")
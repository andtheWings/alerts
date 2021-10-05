install.packages("languageserver", dependencies = TRUE, repos="http://cran.rstudio.com/")
install.packages("reticulate", dependencies=TRUE, repos="http://cran.rstudio.com/")
library(reticulate)

# Dynamically find system Python
python_path <- system("which python", intern=TRUE)
use_python(python_path)

# Pre compile orchest deps
orchest <- import("orchest")

print(orchest)
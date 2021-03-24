library(tercen)
library(dplyr)
library(reticulate)

# renv::init()
# renv::use_python()
# 
# reticulate::py_install("pandas")

# http://127.0.0.1:5402/admin/w/99ca4c32889264fd1c01b57bde00c4cd/ds/8035a1c5-cd31-41b9-9ddb-e6babc5ebf9d
options("tercen.workflowId" = "99ca4c32889264fd1c01b57bde00c4cd")
options("tercen.stepId"     = "8035a1c5-cd31-41b9-9ddb-e6babc5ebf9d")

getOption("tercen.workflowId")
getOption("tercen.stepId")

reticulate::source_python("main.py")

df <- (ctx <- tercenCtx()) %>%
  select() %>% run_py_script()

df %>%
  ctx$addNamespace() %>%
  ctx$save()

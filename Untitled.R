library(DatabaseConnector)
absoluteFileName <- file.path(getwd(), "data", "synthetic.duckdb")

connection <- connect(dbms = "duckdb", server = absoluteFileName)
sql <- "SELECT COUNT(*) AS subjects FROM person;"

querySql(connection = connection,
         sql = sql)

library(dplyr)
connection <- connect(dbms = "duckdb", server = absoluteFileName)

person <- tbl(connection, "person")         # table reference (not in-memory)
concept <- tbl(connection, "concept")       # table reference
vocabulary <- tbl(connection, "vocabulary") # table reference

person %>% group_by(gender_concept_id) %>%  # execute query
  summarise(count = n())
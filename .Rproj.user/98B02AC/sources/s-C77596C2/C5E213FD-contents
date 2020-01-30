library(readxl)
library(dplyr)

# read the dataset
df = read_excel("Team4_NER_E2_APK_BAN_PAR_PEM.xlsx")

# select col 1:19 
nick_working_col = colnames(df)[1:19]
nick_df = select(df,nick_working_col)

# count NA value
col_na = colSums(is.na(nick_df))

# missing values greater than 1000
col_na[col_na > 1000]
# 100-1000
col_na[col_na < 1000 & col_na > 100]
# <100
col_na[col_na < 100]

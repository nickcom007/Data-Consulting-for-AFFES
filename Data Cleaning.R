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

# unexplained feature meaning
str(nick_df)
num_feature = nick_working_col[sapply(nick_df,class) == "numeric"] #get all numerical features
factor_feature = nick_working_col[sapply(nick_df,class) == 'character']

# check factor levels for all factor features
apply(select(nick_df,factor_feature),2,unique)



# REGION: What is "SOR"?
# CUR_DIST: OK
# PREV_DIST: OK
# FIRE_TYPE: what is "IFR" "PB"
## ACCURACY_CODE: either 10m accuracy or NA / 1297 MISSING
# DATUM_CODE: what's this? / 1297 MISSING
## COMPANY : NA not recorded or ?   factors OK / 2346 MISSING
## SUBDIVISION : NA not recorded or ?  what is "NOB"? / 2347 MISSING
# TOWNSHIP: 221 towns   NA not recorded or ?
length(unique(nick_df$TOWNSHIP))
## INDIAN_RESERVE: 06170? 06169? 6204? 6169? 6206? 06206? 06205? 06204? 06201? 06214?  / 2492 MISSING
# AGREEMENT: DND? FNA? NFP?  NA not recorded or ?
# OWNERSHIP: NA not recorded or ? 
## LICENSEE: mess....   /2487 MISSING

  
## Quick Modifiable script to import my EK oligo excel spreadsheet and convert specified primers into a multi. fastA

##install.packages("openxlsx")
library(openxlsx)
library(dplyr)

##PRE-STEP: DEFINE OLIGOS TO IMPORT:
OligoNamesToImport <- c("EK0500", "EK0501")

##STEP1: IMPORT EK_OLIGO SPREADSHEET
EK_Oligo_DB <- "./EK_DNA_Oligo_and_GBlocks.xlsx"
EK_Oligo_DF <- read.xlsx(EK_Oligo_DB, sheet = 1,  startRow = 4)
colnames(EK_Oligo_DF) <- c("EK_ID", "Name", "Seq", "Tm", "RC", "Pr", "Note") 
EK_Oligo_DF <- EK_Oligo_DF %>% select(1:7)
##STEP2: CONVERT EK_ID AND OLIGO SEQUENCE
test_df <- EK_Oligo_DF %>% filter (EK_ID %in% OligoNamesToImport)

# Write the contents of the EK_Oligo_DF data frame to a .txt file
con <- file("EK_Oligo_FA.txt", open = "w") ##could use "a" to append
for (Oligo in OligoNamesToImport) {
  writeLines(paste0(EK_Oligo_DF$EK_ID[EK_Oligo_DF$EK_ID==Oligo], "\n", EK_Oligo_DF$Seq[EK_Oligo_DF$EK_ID==Oligo]), con)
}
close(con)  # Close the file

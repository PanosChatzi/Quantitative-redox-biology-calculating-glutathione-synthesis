# Introduction ----
# Title: 10 cheat codes-like ways to measure oxidative stress in humans
# Description: Quantitative example of the 10th cheat code.
#
# Latest update: 13/3/2024

# Simple model ----
# Define the simple function based on Huang et al, 2021
gsh_simple <- function(k_synthesis,
                       cysteine,
                       glutamate) {
  
  res <- k_synthesis*cysteine*glutamate
  return(res)
}

# Parameters
k_syn <- 0.00018 # μmol/L/min
cys <- 6 # μmol/L of erythrocyte water
glut <- 450 # μmol/L of erythrocyte water

# Control
(gsh_con <- gsh_simple(k_synthesis = k_syn,
                       cysteine = cys,
                       glutamate = glut))

# Multiply the synthesis rate by 60 and 24 to convert the units from μM/min to μM/day
(gsh_con_perDay <- gsh_con*60*24)

# NAC
cys_nac <- cys*2 # Based on Burgunder et al, 1989

(gsh_nac <- gsh_simple(k_synthesis = k_syn,
                       cysteine = cys_nac,
                       glutamate = glut))

# Cysteine concentration was elevated for approximately 4 hours after NAC administration.
# Hence, we calculate the synthesis rate for 4 hours and add it to the 20 hours of normal synthesis.
(gsh_nac_perDay <- gsh_nac*60*4 + gsh_con*60*20)

# Calculate the percentage change
round((gsh_nac_perDay - gsh_con_perDay)/gsh_con_perDay*100, 2)

# Deficiency
cys_def <- cys*0.60 # Based on Lyons et al, 2000

gsh_def <- gsh_simple(k_synthesis = k_syn,
                      cysteine = cys_def,
                      glutamate = glut)

# Convert units to μM/day
(gsh_def_perDay <- gsh_def*60*24)

# Calculate the percentage change
(gsh_def_perDay - gsh_con_perDay)/gsh_con_perDay*100

# References
#
# 1. Burgunder, J. M., Varriale, A., & Lauterburg, B. H. (1989). Effect of N-acetylcysteine 
#     on plasma cysteine and glutathione following paracetamol administration. 
#     European journal of clinical pharmacology, 36(2), 127–131. https://doi.org/10.1007/BF00609183
#
# 2. Huang, J. H., Co, H. K., Lee, Y. C., Wu, C. C., & Chen, S. H. (2021). 
#     Multistability maintains redox homeostasis in human cells. Molecular systems biology, 
#     17(10), e10480. https://doi.org/10.15252/msb.202110480
#
# 3. Raftos, J. E., Whillier, S., & Kuchel, P. W. (2010). Glutathione synthesis and turnover
#     in the human erythrocyte: alignment of a model based on detailed enzyme kinetics with 
#     experimental data. The Journal of biological chemistry, 285(31), 23557–23567. 
#     https://doi.org/10.1074/jbc.M109.067017
#
# 4. Lyons, J., Rauh-Pfeiffer, A., Yu, Y. M., Lu, X. M., Zurakowski, D., Tompkins, R. G., Ajami, A. M., 
#     Young, V. R., & Castillo, L. (2000). Blood glutathione synthesis rates in healthy adults receiving 
#     a sulfur amino acid-free diet. Proceedings of the National Academy of Sciences of the United States of 
#     America, 97(10), 5071–5076. https://doi.org/10.1073/pnas.090083297
#----------Header-----------#
# date:         07.04.2021
# author:       Teun van Gils
# editor:       Koen de Reus (koen.dereus@mpi.nl)
# filename:     session4.R
# description:  Explores data and performs an analysis of variance (ANOVA)
# project:      Key Practices for a Language Scientist IMPRS course

#----------

#-------Change log---------#
# Modified on 07.04.2021
# Adapt script to ensure best R practices

#----------

#-------Library declaration------#
library(package)

#----------
#-------Set directory and load data-----#
setwd("directory")
data <- read.delim("data.csv", header = TRUE, sep = ",")

#-------Data preparation and exploration---------#
data <- data %>%
  select(ppID, condition, trial, RT) %>%
  mutate(condition = as.factor(condition), target = as.factor(target))

#Remove NAs
data <- na.omit(data)

#Explore data
summary(data)

#--------Data analysis--------#
anovaRTbycategory <- aov(RT ~category+error(ppID/category), data = analysis_anova)
summary(anovaRTbycategory)
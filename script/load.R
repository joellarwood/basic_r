# This script provides the installation of the required packages

#If prompted about compilation in the console type n as the response

install.packages(c
(
  "tidyverse", # tools for data cleaning and visualisation
  "apa", # package to provide apa formatted results of analyses
  "apaTables", # package to create apa formatted tables
  "afex", # package to analyse factorial designs
  "sjPlot", # package to aid the visualisation of linear models
  "laavan" # strucutrual equation modelling (incl. path analysis, mediation and CFA)
))

n

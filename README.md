# Inhalers-Carbon-Content

Prescription Inhalers Data

These files have been created for the purpose of identifying the number of inhalers prescribed by NHS primary care in a given geographical region and estimating the CO2 equivalent footprint produced by these prescriptions.

Files: Inhaler types.xlsx - This excel data is a list of non-salbutamol MDI and DPI inhalers extracted from OpenPrescribing.net

R Inhalers Data.Rmd - This is an R notebook which I've used to filter the monthly NHS prescribing data by both prescribed items and geographical area, aswell as combine them into a single dataset. This file also includes some visualisations of the data.

R Prescribing Exclusions.xlsx - This excel data contains some items from the OpenPrescrbing.net data that we do not want to include in our list of inhalers - including nebulisers and ampoules.

12 Months Prescribing Inhalers v2 - NoData.xlsx - This is the excel sheet where some additional data linkage and categorisation occurs. Prescription data has been removed so that it is small enough to be uploaded to github. In this spreadsheet, the inhaler models are matched to the data collated by Dr. A Wilkinson (https://greeninhaler.org/inhaler-comparison/) for the purposes of estimating the carbon footprint of inhalers in the region. Additional checks are applied to identify which records are 'powder cap' prescriptions (as these are counted differently to inalers), generic salbutamol prescriptions and whether the prescriber is a GP practice or other entity. This data can then be used by the R script to produce some visualisations.

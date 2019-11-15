# ACV-Plotter-V2

ACV Plotter using Excel VBA Macro and R-Language

ACV Stands for: Attribute- Consequence- Value

Necessary Libraries For you to install in R: <br/>
 > library(devtools)<br/>
 > library(DiagrammeR)<br/>
 > library(diagram)<br/>
 > library(igraph)<br/>
 > library(readxl)<br/>
 > library(tidyverse)<br/>
 > library(plot.matrix)<br/>
 > library(ggplot2)<br/>
 
 
Notice: All the packages in R should be UPDATED to their last version

Like the Following example code you can install the rest: <br/>
> install.packages("devtools")

Rtools is required to build R packages;<br/>
Please download and install Rtools custom from http://cran.r-project.org/bin/windows/Rtools/<br/>

In RStudio when you want to Install from GitHub use the following code: <br/>
> devtools::install_github("ingenious-brothers/ACV-Plotter-V2")


Use ACV_Table_Builder.xlsm to Create Your Appropriate and Standard ACV File

Usage Exapmle in R:<br/>
> library(RACV)<br/>
> ACV_Plotter("C:/Users/xyz/Desktop/ACV_Table_Builder_v2.xlsm","FinalResult")<br/>

Changes to this version: You can now filter the ACV in Excel file according to their relashionship or just the A, C and V <br/>

Created by: Dr. Sh. Azizi, Ali Nikseresht, Mohammad Hosein Raeisi<br/>
(All From Department of Management & Accounting, Shahid Beheshti University, Tehran, Iran)



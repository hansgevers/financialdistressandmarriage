/*
Stata code supporting the paper "The Impact of Marriage or Cohabitation on Financial Distress: Evidence from SHARE 2015 to 2022 for 15 European Union Countries plus Switzerland"
Author: Hans Gevers - Junior Research Fellow at the Estonian Business School
https://orcid.org/0009-0001-0249-4142 hans.gevers@ebs.ee
*/

clear all
import delimited "C:\Users\hansg\Documents\working\SHARE data 4\csv1.csv", stringcols(5) 
split age, generate(age) destring
tabulate age1
keep age1 sex geo time_period obs_value
rename age1 age
rename obs_value population
cd "C:\Users\hansg\Documents\working\SHARE data 4\"
rename geo country
rename time_period year

keep if country=="Austria" | country=="Germany" | country=="Sweden" | country=="Spain" | country=="Italy" | country=="France" | country=="Denmark" | country=="Switzerland" | country=="Belgium" | country=="Czechia"  | country=="Poland"  | country=="Luxembourg"  | country=="Portugal" | country=="Slovenia" | country=="Estonia" | country=="Croatia"

describe
recast int age
describe
egen id = concat(age sex country year), decode
save "pop.dta", replace

clear all
import delimited "C:\Users\hansg\Documents\working\SHARE data 4\csv2.csv"
drop if age=="Unknown"
drop if age=="Open-ended age class"
split age, generate(age) destring
drop age
rename age1 age
rename geo country
rename time_period year
rename obs_value deaths
keep if country=="Austria" | country=="Germany" | country=="Sweden" | country=="Spain" | country=="Italy" | country=="France" | country=="Denmark" | country=="Switzerland" | country=="Belgium" | country=="Czechia"  | country=="Poland"  | country=="Luxembourg"  | country=="Portugal" | country=="Slovenia" | country=="Estonia" | country=="Croatia"
cd "C:\Users\hansg\Documents\working\SHARE data 4\"
describe
recast str11 country
recast int age
describe
egen id = concat(age sex country year), decode
merge 1:1 id using "pop.dta"
keep age sex country year population deaths
encode sex, generate(sexL)
drop sex
rename sexL sex
save "nuts.dta", replace

setwd("C:/Users/Hilary/GitHub/GenerateCalendar")
## need to set to your own working directory ##


library(chron)
source("gen_cal.R")

set.seed(52085)

gen_cal(wd="C:/Users/Hilary/Desktop/cals",
		ta_names=c("Jiawei","Leonardo","Lillie","Mariana","David","Goro","Haochang",
				   "Lei","Rawan","Huitong","Yenny","Juemin","Jose","Sun Eun"
				   ),
		start_date="10/30/12",
		end_date="12/19/12",
		no_TA_dates=c("11/22/12","11/23/12"),
		lab=FALSE,
		ta_location="",
		lab_location=c(),
		double_days=c("11/05/12","11/07/12","11/14/12","11/19/12",
					  "12/05/12","12/10/12","12/17/12","12/19/12"
					  )
		)

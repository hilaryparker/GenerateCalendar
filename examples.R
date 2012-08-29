
setwd("C:/Users/Hilary/GitHub/GenerateCalendar")
## need to set to your own working directory ##


library(chron)
source("gen_cal.R")

set.seed(52085)

gen_cal(wd="C:/Users/Hilary/Desktop/cals",
		ta_names=c("Rawan", "Jiawei", "Leonardo", "Lillie", "Lei", "Huitong", "Haochang",
				   "Mariana", "David", "Goro", "Sunny", "Jose"),
		start_date="09/10/12",
		end_date="10/23/12",
		no_TA_dates=c("09/24/12"),
		lab=FALSE,
		ta_location="",
		lab_location=c(),
		double_days=c("09/12/12","09/17/12","09/19/12","09/24/12",
					  "10/08/12","10/10/12","10/22/12","10/24/12"
					  )
		)

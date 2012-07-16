
setwd("C:/Users/Hilary/GitHub/GenerateCalendar")
## need to set to your own working directory ##


library(chron)
source("gen_cal.R")

set.seed(12345)

gen_cal(wd="C:/Users/Hilary/Desktop",
		ta_names=c("Sun Eun", "Paige", "Tom", "Rinda", "Elizabeth", "Shu-Yi", "Yenny", "Sherlly", "Jingyan",
				   "Ah Young", "Johnny", "Katherine",  "Seung Hee", "Juemin", "Yifei"),
		start_date="01/25/12",
		end_date="03/14/12",
		no_TA_dates=c("02/21/12","02/22/12"),
		lab=FALSE,
		ta_location="TA Office Hour = W2021; STATA Office Hour = W3025",
		lab_location=c(),
		double_days=c("02/06/12","02/10/12","02/15/12","02/20/12","02/29/12",
					  "03/05/12","03/12/12","03/14/12"
					  )
		)

gen_cal(wd="C:/Users/Hilary/Desktop",
		ta_names=c("Hilary","Kirsten","Marie"),
		start_date="09/22/11",
		end_date="10/1/11",
		no_TA_dates=c("09/23/11","09/29/11"),
		ta_location<-"TA Office Hour = W2021; STATA Office Hour = W3025",
		double_days=c("09/22/11","09/30/11"),
		lab_location<-"W3031"
		)

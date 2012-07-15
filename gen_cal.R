## Function for generating the first draft of the Biostat 620s TA calendar ##
## Need to run once for TA calendar, once for lab calendar! ##

## wd = working directory where you want the .csv files
## ta_names = vector of TA names (first name only) as character vector!!
## start_date = first day of TAing.  MUST BE IN QUOTES, mm/dd/yy!
## end_date = last day of TAing.  MUST BE IN QUOTES, mm/dd/yy!
## no_TA_dates = dates when no TA is needed (exam dates, day after exam, holidays, etc.
##    must be as mm/dd/yy
## lab = TRUE/FALSE.  Is this a lab calendar or a TA calendar?
## double_days = days when two TAs are needed.  ONLY NEEDED FOR TA CALENDAR, NOT LAB CALENDAR!

# Once .csv files are created for each TA, go to biostat.620s.tas@gmail.com account,
# or biostat.620s.labs@gmail.com account.  Create one calendar for each TA/lab instructor.
# Then import each CVS file into each TA calendar.

# Example values:
#	ta_names<-c("Hilary","Kirsten","Marie")
#	start_date="09/22/11"
#	end_date="10/1/11"
#	no_TA_dates=c("09/23/11","09/29/11")
#	double_days=c("09/22/11","09/30/11")
#	ta_location<-"TA Office Hour = W2021; STATA Office Hour = W3025"
#	lab_location<-"W3031"




gen_cal<-function(wd, ta_names, start_date, end_date, no_TA_dates, lab=TRUE, ta_location=c(), lab_location=c(), double_days=c()){
	setwd(wd)
	library(chron)

	# Create dates vector #
	dts <- seq.dates(start_date,end_date)
	weekdts <- weekdays(dts)
	dates <- dts[weekdts!="Sat" & weekdts!="Sun" & !as.character(dts)%in%no_TA_dates]
	if(lab==FALSE){
		dates <- c(dates,double_days)
	}
	dates <- sort(c(dates,dates))
	len_dates <- length(dates)
	len_tas <- length(ta_names)
	mult <- floor(len_dates/len_tas)

	# Assign TAs to dates #
	temp <- rep(NA,len_tas)
	ta_sched <- 0
	for(i in 1:mult){
		temp<-sample(ta_names,len_tas,replace=FALSE)
		ta_sched<-c(ta_sched,temp)
	}
	ta_sched <- ta_sched[-1]
	rem <- length(dates)-length(ta_sched)
	temp <- sample(ta_names,rem,replace=FALSE)
	ta_sched<-c(ta_sched,temp)

	# Write schedule to dataframe and write to .csv file for import into google calendar #	
	nms<-c('Subject','Start Date','Start Time','End Date','End Time','All Day Event','Description','Location','Private')
	len_names <- length(nms)
	mat <- matrix(nrow=len_dates,ncol=len_names)
	mat <- data.frame(mat)
	colnames(mat)<-nms
	mat$Subject <- ta_sched
	mat$"Start Date" <- dates
	mat$"End Date" <- dates
	mat$"All Day Event" <- "False"
	mat$Description <- "Biostat 621 TA Schedule"
	mat$Private <- "False"
	
	if(lab==TRUE){
		
		start_times <- c("1:30:00 PM","3:00:00 PM")
		end_times <- c("3:30:00 PM","5:00:00 PM")
		mat$"Start Time" <- start_times
		mat$"End Time" <- end_times
		mat$Location <- lab_location
	
	}
	if(lab==FALSE){
		start_times <- c("12:15:00 PM","2:30:00 PM")
		end_times <- c("1:15:00 PM","3:20:00 PM")
		mat$"Start Time" <- start_times
		mat$"End Time" <- end_times
		mat$Location <- ta_location
	}

	for(i in 1:len_tas){
		filename<-paste(ta_names[i],".csv",sep="")	
		temp<-mat[mat$Subject==ta_names[i],]
		write.csv(temp,file=filename,quote=FALSE,row.names=FALSE)
	}

}

#gen_cal("/Users/hilaryp08/Desktop", c("finbarr","sarah","yi","yifei"), "09/01/11", "10/15/11", lab=FALSE, ta_location="W3031", double_days=c("09/10/11","09/11/11"))

   
	       

set.seed(12345)
nms<-c("Sun Eun", "Paige", "Tom", "Rinda", "Elizabeth", "Shu-Yi", "Yenny", "Sherlly", "Jingyan",
	   "Ah Young", "Johnny", "Katherine",  "Seung Hee", "Juemin", "Yifei")

gen_cal("C:/Users/Hilary/Desktop",
		ta_names=nms, 
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

		#	ta_names<-c("Hilary","Kirsten","Marie")
#	start_date="09/22/11"
#	end_date="10/1/11"
#	no_TA_dates=c("09/23/11","09/29/11")
#	double_days=c("09/22/11","09/30/11")
#	ta_location<-"TA Office Hour = W2021; STATA Office Hour = W3025"
#	lab_location<-"W3031"

	
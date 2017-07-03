HA$PBExportHeader$w_dateserv.srw
forward
global type w_dateserv from w_main
end type
type cb_close from u_cb within w_dateserv
end type
type em_1 from u_em within w_dateserv
end type
type p_1 from picture within w_dateserv
end type
type st_2 from statictext within w_dateserv
end type
type st_firstdayofmonth from statictext within w_dateserv
end type
type st_3 from statictext within w_dateserv
end type
type st_isleapyear from statictext within w_dateserv
end type
type st_4 from statictext within w_dateserv
end type
type st_isweekday from statictext within w_dateserv
end type
type st_isweekend from statictext within w_dateserv
end type
type st_5 from statictext within w_dateserv
end type
type st_6 from statictext within w_dateserv
end type
type st_julian from statictext within w_dateserv
end type
type st_2a from statictext within w_dateserv
end type
type st_lastdayofmonth from statictext within w_dateserv
end type
type em_2 from u_em within w_dateserv
end type
type p_2 from picture within w_dateserv
end type
type st_monthsafter from statictext within w_dateserv
end type
type cb_2 from commandbutton within w_dateserv
end type
type em_3 from editmask within w_dateserv
end type
type st_relativemonth from statictext within w_dateserv
end type
type cb_3 from commandbutton within w_dateserv
end type
type em_4 from editmask within w_dateserv
end type
type st_relativeyear from statictext within w_dateserv
end type
type cb_4 from commandbutton within w_dateserv
end type
type em_5 from editmask within w_dateserv
end type
type st_waitmessage from statictext within w_dateserv
end type
type st_6a from statictext within w_dateserv
end type
type st_weeknumber from statictext within w_dateserv
end type
type st_weeksafter from statictext within w_dateserv
end type
type st_yearsafter from statictext within w_dateserv
end type
type gb_2 from groupbox within w_dateserv
end type
type gb_1 from groupbox within w_dateserv
end type
type st_date from statictext within w_dateserv
end type
type st_1 from statictext within w_dateserv
end type
type st_7 from statictext within w_dateserv
end type
type st_8 from statictext within w_dateserv
end type
type st_9 from statictext within w_dateserv
end type
type st_10 from statictext within w_dateserv
end type
type st_11 from statictext within w_dateserv
end type
type st_12 from statictext within w_dateserv
end type
type st_christmas from statictext within w_dateserv
end type
end forward

global type w_dateserv from w_main
integer x = 471
integer y = 4
integer width = 2464
integer height = 2272
string title = "PFC Example - Date Services Example"
long backcolor = 79416533
cb_close cb_close
em_1 em_1
p_1 p_1
st_2 st_2
st_firstdayofmonth st_firstdayofmonth
st_3 st_3
st_isleapyear st_isleapyear
st_4 st_4
st_isweekday st_isweekday
st_isweekend st_isweekend
st_5 st_5
st_6 st_6
st_julian st_julian
st_2a st_2a
st_lastdayofmonth st_lastdayofmonth
em_2 em_2
p_2 p_2
st_monthsafter st_monthsafter
cb_2 cb_2
em_3 em_3
st_relativemonth st_relativemonth
cb_3 cb_3
em_4 em_4
st_relativeyear st_relativeyear
cb_4 cb_4
em_5 em_5
st_waitmessage st_waitmessage
st_6a st_6a
st_weeknumber st_weeknumber
st_weeksafter st_weeksafter
st_yearsafter st_yearsafter
gb_2 gb_2
gb_1 gb_1
st_date st_date
st_1 st_1
st_7 st_7
st_8 st_8
st_9 st_9
st_10 st_10
st_11 st_11
st_12 st_12
st_christmas st_christmas
end type
global w_dateserv w_dateserv

type variables
Protected:
n_cst_datetime inv_datetime
end variables

on w_dateserv.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.em_1=create em_1
this.p_1=create p_1
this.st_2=create st_2
this.st_firstdayofmonth=create st_firstdayofmonth
this.st_3=create st_3
this.st_isleapyear=create st_isleapyear
this.st_4=create st_4
this.st_isweekday=create st_isweekday
this.st_isweekend=create st_isweekend
this.st_5=create st_5
this.st_6=create st_6
this.st_julian=create st_julian
this.st_2a=create st_2a
this.st_lastdayofmonth=create st_lastdayofmonth
this.em_2=create em_2
this.p_2=create p_2
this.st_monthsafter=create st_monthsafter
this.cb_2=create cb_2
this.em_3=create em_3
this.st_relativemonth=create st_relativemonth
this.cb_3=create cb_3
this.em_4=create em_4
this.st_relativeyear=create st_relativeyear
this.cb_4=create cb_4
this.em_5=create em_5
this.st_waitmessage=create st_waitmessage
this.st_6a=create st_6a
this.st_weeknumber=create st_weeknumber
this.st_weeksafter=create st_weeksafter
this.st_yearsafter=create st_yearsafter
this.gb_2=create gb_2
this.gb_1=create gb_1
this.st_date=create st_date
this.st_1=create st_1
this.st_7=create st_7
this.st_8=create st_8
this.st_9=create st_9
this.st_10=create st_10
this.st_11=create st_11
this.st_12=create st_12
this.st_christmas=create st_christmas
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.p_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_firstdayofmonth
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.st_isleapyear
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.st_isweekday
this.Control[iCurrent+10]=this.st_isweekend
this.Control[iCurrent+11]=this.st_5
this.Control[iCurrent+12]=this.st_6
this.Control[iCurrent+13]=this.st_julian
this.Control[iCurrent+14]=this.st_2a
this.Control[iCurrent+15]=this.st_lastdayofmonth
this.Control[iCurrent+16]=this.em_2
this.Control[iCurrent+17]=this.p_2
this.Control[iCurrent+18]=this.st_monthsafter
this.Control[iCurrent+19]=this.cb_2
this.Control[iCurrent+20]=this.em_3
this.Control[iCurrent+21]=this.st_relativemonth
this.Control[iCurrent+22]=this.cb_3
this.Control[iCurrent+23]=this.em_4
this.Control[iCurrent+24]=this.st_relativeyear
this.Control[iCurrent+25]=this.cb_4
this.Control[iCurrent+26]=this.em_5
this.Control[iCurrent+27]=this.st_waitmessage
this.Control[iCurrent+28]=this.st_6a
this.Control[iCurrent+29]=this.st_weeknumber
this.Control[iCurrent+30]=this.st_weeksafter
this.Control[iCurrent+31]=this.st_yearsafter
this.Control[iCurrent+32]=this.gb_2
this.Control[iCurrent+33]=this.gb_1
this.Control[iCurrent+34]=this.st_date
this.Control[iCurrent+35]=this.st_1
this.Control[iCurrent+36]=this.st_7
this.Control[iCurrent+37]=this.st_8
this.Control[iCurrent+38]=this.st_9
this.Control[iCurrent+39]=this.st_10
this.Control[iCurrent+40]=this.st_11
this.Control[iCurrent+41]=this.st_12
this.Control[iCurrent+42]=this.st_christmas
end on

on w_dateserv.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.em_1)
destroy(this.p_1)
destroy(this.st_2)
destroy(this.st_firstdayofmonth)
destroy(this.st_3)
destroy(this.st_isleapyear)
destroy(this.st_4)
destroy(this.st_isweekday)
destroy(this.st_isweekend)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_julian)
destroy(this.st_2a)
destroy(this.st_lastdayofmonth)
destroy(this.em_2)
destroy(this.p_2)
destroy(this.st_monthsafter)
destroy(this.cb_2)
destroy(this.em_3)
destroy(this.st_relativemonth)
destroy(this.cb_3)
destroy(this.em_4)
destroy(this.st_relativeyear)
destroy(this.cb_4)
destroy(this.em_5)
destroy(this.st_waitmessage)
destroy(this.st_6a)
destroy(this.st_weeknumber)
destroy(this.st_weeksafter)
destroy(this.st_yearsafter)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.st_date)
destroy(this.st_1)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.st_10)
destroy(this.st_11)
destroy(this.st_12)
destroy(this.st_christmas)
end on

event open;call super::open;date ld_today

ld_today = Today ( )

em_1.Text = String ( ld_today, "mm/dd/yyyy" ) 
em_2.Text = String ( ld_today, "mm/dd/yyyy" ) 
em_1.TriggerEvent ( Modified! )
em_2.TriggerEvent ( Modified! )

Timer ( 1 )
end event

event timer;date ld_today, ld_christmas
time lt_now
long ll_days, ll_year, ll_seconds
long ll_minutes, ll_remainseconds, ll_hours
long ll_remainminutes, ll_remainhours

ld_today = Today ( )
lt_now = Now ( )

ll_year = Year ( ld_today ) 
ld_christmas = Date ( ll_year, 12, 25 ) 

ll_seconds = inv_datetime.of_SecondsAfter ( DateTime ( ld_today, lt_now ), DateTime ( ld_christmas, Time ( "12:00:00AM" ) ) )

If ll_seconds <= 0 Then
	ll_year++
	ld_christmas = Date ( ll_year, 12, 25 ) 
	ll_seconds = inv_datetime.of_SecondsAfter ( DateTime ( ld_today, lt_now ), DateTime ( ld_christmas, Time ( "12:00:00AM" ) ) )
End If

ll_minutes = ll_seconds / 60 
ll_remainseconds = Mod ( ll_seconds, 60 ) 
ll_hours = ll_minutes / 60
ll_remainminutes = Mod ( ll_minutes, 60 )
ll_days = ll_hours / 24
ll_remainhours = Mod ( ll_hours, 24 ) 
st_christmas.Text = "There are " + String ( ll_days ) + " days, " + &
	String ( ll_remainhours ) + " hours, " + String ( ll_remainminutes ) + &
	" minutes, and " + String ( ll_remainseconds ) + " seconds until Christmas." 


end event

type cb_close from u_cb within w_dateserv
integer x = 2002
integer y = 1928
integer width = 361
integer taborder = 110
boolean bringtotop = true
string text = "Close"
boolean default = true
end type

event clicked;call super::clicked;Parent.Event pfc_close()
end event

type em_1 from u_em within w_dateserv
event ue_changed ( )
integer x = 923
integer y = 156
integer width = 338
integer height = 84
integer taborder = 10
boolean bringtotop = true
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
double increment = 0
string minmax = ""
end type

event ue_changed;date ld_date, ld_calcdate, ld_date2
int li_day
long ll_julian, ll_week
string ls_day, ls_month, ls_daynum, ls_year

this.GetData ( ld_date ) 

li_day = inv_datetime.of_DayofWeek ( ld_date )
Choose Case li_day
		Case 1
			ls_day = "Sunday"
		Case 2
			ls_day = "Monday"
		Case 3
			ls_day = "Tuesday"
		Case 4
			ls_day = "Wednesday"
		Case 5
			ls_day = "Thursday"
		Case 6
			ls_day = "Friday"
		Case 7
			ls_day = "Saturday"
		Case Else
			ls_day = "Unknown"
End Choose

ls_month = inv_datetime.of_MonthName ( ld_date )

ls_daynum = String ( Day ( ld_Date ), " #0" )
ls_year = String ( Year ( ld_Date ), "0000" ) 

st_date.Text = "Date is " + ls_day + ", " + ls_month + ls_daynum + ", " + ls_year
ld_calcdate = inv_datetime.of_FirstDayofMonth ( ld_date ) 
st_firstdayofmonth.Text = String ( ld_calcdate, "mm/dd/yyyy" )

ld_calcdate = inv_datetime.of_LastDayofMonth ( ld_date ) 
st_lastdayofmonth.Text = String ( ld_calcdate, "mm/dd/yyyy" )

If inv_datetime.of_IsLeapYear ( ld_date ) Then
	st_isleapyear.Text = "YES"
Else
	st_isleapyear.Text = "NO"
End If

If inv_datetime.of_IsWeekDay ( ld_date ) Then
	st_isweekday.Text = "YES"
Else
	st_isweekday.Text = "NO"
End If

If inv_datetime.of_IsWeekEnd( ld_date ) Then
	st_isweekend.Text = "YES"
Else
	st_isweekend.Text = "NO"
End If

ll_julian = inv_datetime.of_JulianDayNumber ( ld_date )
st_julian.Text = string ( ll_julian )


ll_week = inv_datetime.of_WeekNumber ( ld_date )
st_weeknumber.Text = String ( ll_week ) //////////////
end event

event constructor;this.of_SetDropDownCalendar(TRUE)
end event

event modified;this.Event ue_changed ( )
end event

type p_1 from picture within w_dateserv
integer x = 1266
integer y = 156
integer width = 59
integer height = 84
boolean bringtotop = true
boolean originalsize = true
string picturename = "ddarrow.bmp"
boolean focusrectangle = false
end type

event clicked;em_1.Event pfc_ddcalendar ( )
end event

type st_2 from statictext within w_dateserv
integer x = 146
integer y = 440
integer width = 448
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "First Day of Month:"
boolean focusrectangle = false
end type

type st_firstdayofmonth from statictext within w_dateserv
integer x = 608
integer y = 440
integer width = 754
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type st_3 from statictext within w_dateserv
integer x = 1486
integer y = 440
integer width = 370
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Is Leap Year?:"
boolean focusrectangle = false
end type

type st_isleapyear from statictext within w_dateserv
integer x = 1897
integer y = 440
integer width = 402
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type st_4 from statictext within w_dateserv
integer x = 1486
integer y = 532
integer width = 370
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Is Week Day?:"
boolean focusrectangle = false
end type

type st_isweekday from statictext within w_dateserv
integer x = 1897
integer y = 532
integer width = 402
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type st_isweekend from statictext within w_dateserv
integer x = 1897
integer y = 624
integer width = 402
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type st_5 from statictext within w_dateserv
integer x = 1486
integer y = 624
integer width = 370
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Is Week End?:"
boolean focusrectangle = false
end type

type st_6 from statictext within w_dateserv
integer x = 146
integer y = 624
integer width = 448
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Julian Day:"
boolean focusrectangle = false
end type

type st_julian from statictext within w_dateserv
integer x = 608
integer y = 624
integer width = 754
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type st_2a from statictext within w_dateserv
integer x = 146
integer y = 532
integer width = 448
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Last Day of Month:"
boolean focusrectangle = false
end type

type st_lastdayofmonth from statictext within w_dateserv
integer x = 608
integer y = 532
integer width = 754
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type em_2 from u_em within w_dateserv
event ue_changed ( )
integer x = 923
integer y = 1028
integer width = 338
integer height = 84
integer taborder = 30
boolean bringtotop = true
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
double increment = 0
string minmax = ""
end type

event ue_changed;long ll_months, ll_weeks, ll_years
date ld_start, ld_end

em_1.GetData ( ld_start )
em_2.GetData ( ld_end )

ll_months = inv_datetime.of_MonthsAfter ( ld_start, ld_end )
st_monthsafter.Text = String ( ll_months ) 

ll_weeks = inv_datetime.of_WeeksAfter ( ld_start, ld_end )
st_weeksafter.Text = String ( ll_weeks )

ll_years = inv_datetime.of_YearsAfter ( ld_start, ld_end )
st_yearsafter.Text = String ( ll_years )




end event

event constructor;this.of_SetDropDownCalendar(TRUE)
end event

event modified;this.Event ue_changed ( )
end event

type p_2 from picture within w_dateserv
integer x = 1266
integer y = 1028
integer width = 59
integer height = 84
boolean bringtotop = true
boolean originalsize = true
string picturename = "ddarrow.bmp"
boolean focusrectangle = false
end type

event clicked;em_2.Event pfc_ddcalendar ( )
end event

type st_monthsafter from statictext within w_dateserv
integer x = 608
integer y = 1160
integer width = 494
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_dateserv
integer x = 133
integer y = 1496
integer width = 430
integer height = 108
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Relative Month"
end type

event clicked;date ld_date, ld_calcdate
double ll_months

em_1.GetData ( ld_date )
em_3.GetData ( ll_months )
ld_calcdate = inv_datetime.of_RelativeMonth ( ld_date, ll_months )
st_relativemonth.Text = String ( ld_calcdate, "mm/dd/yyyy" ) 
end event

type em_3 from editmask within w_dateserv
integer x = 594
integer y = 1496
integer width = 288
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "##,##0"
end type

type st_relativemonth from statictext within w_dateserv
integer x = 1115
integer y = 1504
integer width = 562
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_dateserv
integer x = 133
integer y = 1616
integer width = 430
integer height = 108
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Relative Year"
end type

event clicked;date ld_date, ld_calcdate
double ll_years

em_1.GetData ( ld_date )
em_4.GetData ( ll_years )
ld_calcdate = inv_datetime.of_RelativeYear ( ld_date, ll_years )
st_relativeyear.Text = String ( ld_calcdate, "mm/dd/yyyy" ) 
end event

type em_4 from editmask within w_dateserv
integer x = 590
integer y = 1616
integer width = 288
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "###0"
end type

type st_relativeyear from statictext within w_dateserv
integer x = 1115
integer y = 1624
integer width = 494
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_dateserv
integer x = 151
integer y = 1912
integer width = 393
integer height = 108
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Wait"
end type

event clicked;date ld_date, ld_calcdate
double ll_seconds

st_waitmessage.Text = "Waiting...."
em_5.GetData ( ll_seconds )
inv_datetime.of_Wait ( ll_seconds )

st_waitmessage.Text = "All Done!"
Beep(1)
end event

type em_5 from editmask within w_dateserv
integer x = 590
integer y = 1916
integer width = 288
integer height = 96
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "##0"
end type

type st_waitmessage from statictext within w_dateserv
integer x = 1271
integer y = 1980
integer width = 494
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type st_6a from statictext within w_dateserv
integer x = 146
integer y = 716
integer width = 448
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Week Number:"
boolean focusrectangle = false
end type

type st_weeknumber from statictext within w_dateserv
integer x = 608
integer y = 716
integer width = 754
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type st_weeksafter from statictext within w_dateserv
integer x = 608
integer y = 1252
integer width = 494
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type st_yearsafter from statictext within w_dateserv
integer x = 608
integer y = 1344
integer width = 494
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_dateserv
integer x = 50
integer y = 916
integer width = 2313
integer height = 880
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Choose an Ending Date for the Following Calculations"
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_dateserv
integer x = 50
integer y = 36
integer width = 2313
integer height = 816
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Choose a Date for the Following Calculations"
borderstyle borderstyle = stylelowered!
end type

type st_date from statictext within w_dateserv
integer x = 608
integer y = 292
integer width = 1591
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type st_1 from statictext within w_dateserv
integer x = 146
integer y = 304
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Date:"
boolean focusrectangle = false
end type

type st_7 from statictext within w_dateserv
integer x = 146
integer y = 1160
integer width = 297
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Months After:"
boolean focusrectangle = false
end type

type st_8 from statictext within w_dateserv
integer x = 146
integer y = 1252
integer width = 297
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Weeks After:"
boolean focusrectangle = false
end type

type st_9 from statictext within w_dateserv
integer x = 146
integer y = 1344
integer width = 297
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Years After:"
boolean focusrectangle = false
end type

type st_10 from statictext within w_dateserv
integer x = 901
integer y = 1504
integer width = 174
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Months"
boolean focusrectangle = false
end type

type st_11 from statictext within w_dateserv
integer x = 549
integer y = 1840
integer width = 608
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Number of Seconds to Wait"
boolean focusrectangle = false
end type

type st_12 from statictext within w_dateserv
integer x = 905
integer y = 1624
integer width = 174
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Years"
boolean focusrectangle = false
end type

type st_christmas from statictext within w_dateserv
integer x = 64
integer y = 2052
integer width = 2281
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type


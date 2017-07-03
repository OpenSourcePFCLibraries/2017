HA$PBExportHeader$pfc_n_cst_datetime.sru
$PBExportComments$PFC Date and/or Datetime service class
forward
global type pfc_n_cst_datetime from n_base
end type
end forward

global type pfc_n_cst_datetime from n_base autoinstantiate
end type

type variables
Protected:
// To support other languages, this array could be changed
// in the constructor event.
String 	is_month[12] = { &
	"January", "February", "March", "April", &
	 "May",  "June", "July", "August",  "September", &
	"October",  "November", "December" }
	

// Default number of days in each month.  
// Leap years are handled in each function.
Integer	ii_DaysInMonth[12] = {31,28,31,30,31,30,31,31,30,31,30,31}

end variables

forward prototypes
public function date of_gregorian (long al_julian)
public function long of_days (long al_seconds)
public function long of_hours (long al_seconds)
public function long of_yearsafter (date ad_start, date ad_end)
public function long of_millisecsafter (time atm_start, time atm_end)
public function integer of_wait (datetime adtm_target)
public function integer of_wait (unsignedlong al_seconds)
public function boolean of_isvalid (datetime adtm_source)
public function date of_firstdayofmonth (date ad_source)
public function boolean of_isleapyear (date ad_source)
public function boolean of_isweekday (date ad_source)
public function boolean of_isweekend (date ad_source)
public function datetime of_relativedatetime (datetime adtm_start, long al_offset)
public function long of_secondsafter (datetime adtm_start, datetime adtm_end)
public function long of_monthsafter (date ad_start, date ad_end)
public function string of_monthname (integer ai_monthnumber)
public function string of_monthname (date ad_source)
public function boolean of_isvalid (time atm_source)
public function boolean of_isvalid (date ad_source)
public function date of_relativemonth (date ad_source, long al_month)
public function date of_relativeyear (date ad_source, long al_years)
public function long of_weeksafter (date ad_start, date ad_end)
public function long of_juliandaynumber (date ad_source)
public function long of_julian (date ad_source)
public function integer of_dayofweek (date ad_source)
public function date of_lastdayofmonth (date ad_source)
public function long of_weeknumber (date ad_source)
end prototypes

public function date of_gregorian (long al_julian);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Gregorian
//
//	Access:  		public
//
//	Arguments:
//	al_julian 		Julian date
//
//	Returns:  		date
//						Converted from julian.
//						If al_julian is NULL, function returns NULL.
//
//	Description:	Converts a julian date to gregorian date.
//						Note: Julian zero day is Jan. 1, year 0000.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(al_julian) Then
	date ldt_null
	SetNull(ldt_null)
	Return ldt_null
End If

long ll_numqc
long ll_numq
long ll_numc
long ll_cent = 36524
long ll_quad = 1461
int li_year, li_month, li_day
int li_DaysInMonth[12] = {31,28,31,30,31,30,31,31,30,31,30,31}

ll_numqc = al_julian / 146097 // 4 centuries
li_year = int(ll_Numqc) * 400
al_julian -= (146097 * ll_numqc)

ll_numc = 0
If al_julian > (ll_cent + 1) Then
	al_julian -= (ll_cent + 1)
	li_year += 100
	ll_numc = al_julian / ll_cent
	li_year += int(ll_numc) * 100
	al_julian -= ll_numc * ll_cent
	ll_numc ++
End If

If (ll_numc > 0) and (al_julian > (ll_quad - 1)) Then
	al_julian -= (ll_quad - 1)
	li_year += 4
End If

ll_numq = al_julian / ll_quad
li_year += int(ll_numq) * 4
al_julian -= ll_numq* ll_quad

If (of_IsLeapYear(Date(li_year, 1, 1))) Then
	If al_julian >= 366 Then
		al_julian -=366
		li_year ++
	elseif (al_julian = 59) Then
		li_month = 2
		li_day = 29
		Return Date(li_year,li_month,li_day)
	elseif (al_julian > 59) Then
		al_julian --
	end if
end if

Do While al_julian >= 365
	al_julian -=365
	li_year ++
loop

li_month = 0

Do While (li_DaysinMonth[li_month+1] <= al_julian)
	al_julian -= li_DaysinMonth[li_month+1]
	li_month++
Loop

li_month ++
li_day = al_julian + 1

Return Date(li_year,li_month,li_day)

end function

public function long of_days (long al_seconds);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Days
//
//	Access:  		public
//
//	Arguments:
//	al_seconds 		Number of seconds to convert to days.
//
//	Returns:  		long 
//						Number of whole days.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns -1.
//
//	Description:  	Given the number of seconds, function will return the equivalient
//       			number of whole days
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

long ll_result

//Check parameters
If IsNull(al_seconds) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

If al_seconds < 0 Then
	Return -1
End If

//converts to hours and divide by 24
ll_result = (al_seconds / 3600) / 24

Return ll_result
end function

public function long of_hours (long al_seconds);//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_Hours
//
//	Access:  		public
//
//	Arguments:
//	al_seconds		Number of seconds to be converted.
//
//	Returns:  		long
//						Number of whole hours eqivalent to the seconds passed.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns -1.
//
//	Description:	Given a number of seconds, will return the equivalent
//						number of whole hours.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

long ll_result

//Check parameters
If IsNull(al_seconds) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

If al_seconds < 0 Then
	Return -1
End If

//converts to hours (divide by 3600)
ll_result = al_seconds / 3600

Return ll_result
end function

public function long of_yearsafter (date ad_start, date ad_end);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_YearsAfter
//
//	Access:  		public
//
//	Arguments:
//	ad_start			Starting date.
//	ad_end			Ending date.
//
//	Returns:  		Long
//						Number of years difference.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns NULL.
//
//	Description:	Given two dates will determine the number of whole 
//						years between the two dates.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

date ld_temp
int li_year, li_mult
double adb_start, adb_end

//Check paramemters
If IsNull(ad_start) or IsNull(ad_end) or &
	Not of_IsValid(ad_start) or Not of_IsValid(ad_end) Then
	long ll_null
	SetNull (ll_null)
	Return ll_null
End If

If ad_start > ad_end Then
	ld_temp = ad_start
	ad_start = ad_end
	ad_end = ld_temp
	li_mult = -1
else
	li_mult = 1
End If

li_year = year(ad_end) - year(ad_start)

adb_start = month(ad_start)
adb_start = adb_start + day(ad_start) / 100

adb_end = month(ad_end)
adb_end = adb_end + day(ad_end) / 100

If adb_start > adb_end Then
	li_year --
End If

Return li_year * li_mult

end function

public function long of_millisecsafter (time atm_start, time atm_end);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_MillisecsAfter
//
//	Access: 			public
//
//	Arguments:
//	atm_start 		The first time.
//	atm_end   		The second time.
//
//	Returns:  		long
//						The number of milliseconds between the two times.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Given two times will return the number of milliseconds
//						between the two. If the second time is less than the
//						first, the result will be negative.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Long ll_start, ll_end
Long ll_temp

//Check parameters
If IsNull(atm_start) or IsNull(atm_end) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

ll_start = Long (String (atm_start,"fff"))
ll_temp = Second(atm_start) * 1000
ll_start = ll_start + ll_temp
ll_temp = Minute(atm_start) * 60000
ll_start = ll_start + ll_temp
ll_temp = hour(atm_start) *  3600000
ll_start = ll_start + ll_temp

ll_end = Long (String (atm_end,"fff"))
ll_temp = Second(atm_end) * 1000
ll_end = ll_end + ll_temp
ll_temp = minute(atm_end) * 60000
ll_end = ll_end + ll_temp
ll_temp = hour(atm_end) * 3600000
ll_end = ll_end + ll_temp

return ll_end - ll_start
end function

public function integer of_wait (datetime adtm_target);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Wait
//
//	Access:  		public
//
//	Arguments:
//	adtm_Target 	Target DateTime.
//
//	Returns:  		integer
//						1 if function waited the expected time.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns -1.
//
//	Description:  	Given a datetime, will wait until datetime is reached.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

date 	ldt_value

//Check parameters
If IsNull(adtm_Target) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

//There is only need to test the Date portion of the DateTime.
ldt_value = Date(adtm_Target)

//Check for invalid date
If Not of_IsValid(ldt_value) Then
	Return -1
End If

//Wait until Target datetime
DO UNTIL DateTime(Today(),Now()) >= adtm_Target
	Yield() //Yields control to other graphic objects, including objects that are not PB.
LOOP

Return 1

end function

public function integer of_wait (unsignedlong al_seconds);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Wait
//
//	Access:  		public
//
//	Arguments:
//	al_seconds 		Wait this many Seconds.
//
//	Returns:  		integer
//						1 if function waited the expected time.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns -1.
//
//	Description:  	Given a datetime, will wait until datetime is reached.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

datetime ldtm_target
integer	li_ret

//Check parameters
If IsNull(al_seconds) Then
	Return al_seconds
End If

//Check invalid parameters
If al_seconds <= 0 Then
	Return -1
End If

//Get the Target DateTime
ldtm_target = of_RelativeDatetime(DateTime(Today(),Now()), al_seconds)

//Perform the actual wait.
li_ret = of_Wait(ldtm_target)

Return li_ret

end function

public function boolean of_isvalid (datetime adtm_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsValid
//
//	Access:  		public
//
//	Arguments:
//	adtm_source		DateTime to test.
//
//	Returns:  		boolean
//						True if argument is a valid datetime.
//						If any argument's value is NULL, function returns False.
//						If any argument's value is Invalid, function returns False.
//
//	Description:  	Given a datetime, will determine if the Datetime is valid.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

date 	ldt_value

//Check parameters
If IsNull(adtm_source) Then
	Return False
End If

//There is only need to test the Date portion of the DateTime.
//Can't tell if time is invalid because 12am is 00:00:00:000000
ldt_value = Date(adtm_source)

//Check for invalid date
If Not of_IsValid(ldt_value) Then
	Return False
End If

Return True

end function

public function date of_firstdayofmonth (date ad_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_FirstDayOfMonth
//
//	Access:  		public
//
//	Arguments:
//	date	ad_source		Date to test.
//
//	Returns:  		date
//						The first date of the month passed.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function 
//						returns 1900-01-01.
//
//	Description:  	Given a date, will determine the first day of the month.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ad_source) Then
	date ldt_null
	SetNull(ldt_null)
	Return ldt_null
End If

//Check for invalid date
If Not of_IsValid(ad_source) Then
	Return ad_source
End If

// Date (Year, Month, Day)
Return Date (Year(ad_source), Month(ad_source), 1)

end function

public function boolean of_isleapyear (date ad_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsLeapYear
//
//	Access:  		public
//
//	Arguments:
//	ad_source		Date which contains the year to be tested.
//
//	Returns:  		boolean
//						TRUE if year is a leap year.
//						FALSE if year is not a leap year.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns NULL.
//
//	Description:  	Based on the year in the passed date, determine if it is a 
//						leap year.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

int li_year
boolean lb_null
SetNull(lb_null)

//Check parameters
If IsNUll(ad_source) Then
	Return lb_null
End If

//Check for invalid date
If Not of_IsValid(ad_source) Then
	Return lb_null
End If

//Get the year using the string function instead of Year()
li_year = integer(string(ad_source,'yyyy'))

If ( (Mod(li_year,4) = 0 And Mod(li_year,100) <> 0) Or (Mod(li_year,400) = 0) ) Then
	Return True
End If

Return False


end function

public function boolean of_isweekday (date ad_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsWeekday
//
//	Access:  		public
//
//	Arguments:
//	ad_source		Date to test.
//
//	Returns:			boolean
//						True if the date is a weekday.
//						False if the date is not a weekday.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns NULL.
//
//	Description:  Given a date, will determine if the date is a weekday.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ad_source) or Not of_IsValid(ad_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

If (DayNumber(ad_source) > 1) and (DayNumber(ad_source) < 7) Then
	Return True
End If

Return False

end function

public function boolean of_isweekend (date ad_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsWeekend
//
//	Access:  		public
//
//	Arguments:
//	ad_source		Date to test.
//
//	Returns:  		boolean
//						True if the date is a weekend.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns NULL.
//
//	Description:  	Given a date, will determine if the date is a weekend.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ad_source) or Not of_IsValid(ad_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

Return Not of_IsWeekday(ad_source)
end function

public function datetime of_relativedatetime (datetime adtm_start, long al_offset);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RelativeDatetime
//
//	Access:  		public
//
//	Arguments:
//	adtm_start 		Starting datetime point of calculation.
//	al_offset     	Number of seconds before/after datetime to be returned.
//
//	Returns:		 	Datetime
//						Relative datetime.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns 1900-01-01.
//
//	Description:  	Given a datetime, find the relative datetime +/- n seconds
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.03	Fix to return time as 00:00:00:000000 on invalid date check
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

datetime ldt_null
date ld_sdate
time lt_stime
long ll_date_adjust
long ll_time_adjust, ll_time_test

//Check parameters
If IsNull(adtm_start) or IsNull(al_offset) Then
	SetNull(ldt_null)
	Return ldt_null
End If

//Check for invalid date
If Not of_IsValid(adtm_start) Then
	Return ldt_null
End If

//Initialize date and time portion
ld_sdate = date(adtm_start)
lt_stime = time(adtm_start)

//Find out how many days are contained
//Note: 86400 is # of seconds in a day
ll_date_adjust = al_offset /  86400
ll_time_adjust = mod(al_offset, 86400)

//Adjust date portion
ld_sdate = RelativeDate(ld_sdate, ll_date_adjust)

//Adjust time portion
//	Allow for time adjustments periods crossing over days
//	Check for time rolling forwards a day
If ll_time_adjust > 0 then
	ll_time_test = SecondsAfter(lt_stime,time('23:59:59'))
	If ll_time_test < ll_time_adjust Then
		ld_sdate = RelativeDate(ld_sdate,1)
		ll_time_adjust = ll_time_adjust - ll_time_test -1
		lt_stime = time('00:00:00')
	End If
	lt_stime = RelativeTime(lt_stime, ll_time_adjust)
//Check for time rolling backwards a day
ElseIf  ll_time_adjust < 0 then
	ll_time_test = SecondsAfter(lt_stime,time('00:00:00'))
	If   ll_time_test > ll_time_adjust Then
		ld_sdate = RelativeDate(ld_sdate,-1)
		ll_time_adjust = ll_time_adjust - ll_time_test +1
		lt_stime = time('23:59:59')
	End If
	lt_stime = RelativeTime(lt_stime, ll_time_adjust)
End If

return(datetime(ld_sdate,lt_stime))
end function

public function long of_secondsafter (datetime adtm_start, datetime adtm_end);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SecondsAfter
//
//	Access:  		public
//
//	Arguments:
//	adtm_start 		Beginning time.
//	adtm_end   		Ending time.
//
//	Returns:  		long
//						Number of whole seconds between two date times.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns NULL.
//
//	Description:  	Given two datetimes, return the number of seconds between 
//						the two.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

long ll_total_seconds, ll_day_adjust
date ld_sdate, ld_edate
time lt_stime, lt_etime

//Check parameters
If IsNull(adtm_start) or IsNull(adtm_end) or &
	Not of_IsValid(adtm_start) or Not of_IsValid(adtm_end) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

ld_sdate = date(adtm_start)
ld_edate = date(adtm_end)

lt_stime = time(adtm_start)
lt_etime = time(adtm_end)

//Note: 86400 is number of seconds in a day.
If ld_sdate = ld_edate then 
	ll_total_seconds = secondsafter(	lt_stime,lt_etime)
Elseif ld_sdate < ld_edate Then
	ll_total_seconds = SecondsAfter(lt_stime,Time('23:59:59'))
	ll_day_adjust = DaysAfter(ld_sdate,ld_edate) -1
	If ll_day_adjust > 0 Then ll_total_seconds = ll_total_seconds + 86400 * ll_day_adjust
	ll_total_seconds = ll_total_seconds + SecondsAfter(Time('00:00:00'),lt_etime) +1
Else //end date < start date
	ll_total_seconds = SecondsAfter(lt_stime,Time('00:00:00'))
	ll_day_adjust = DaysAfter(ld_sdate,ld_edate) +1
	If ll_day_adjust < 0 Then ll_total_seconds = ll_total_seconds + 86400 * ll_day_adjust
	ll_total_seconds = ll_total_seconds + SecondsAfter(Time('23:59:59'),lt_etime) -1
end If

return ll_total_seconds

end function

public function long of_monthsafter (date ad_start, date ad_end);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_MonthsAfter
//
//	Access:  		public
//
//	Arguments:
//	ad_start			Starting date.
//	ad_end			Ending date.
//
//	Returns:  		Long
//						Number of whole months between the two dates.
//						If the end date is prior the start date, function returns
//						a negative number of months.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns NULL.
//
//	Description:	Given two dates, returns the number of whole months 
// 					between the two.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

date 		ld_temp
integer 	li_month
integer	li_mult

//Check parameters
If IsNull(ad_start) or IsNull(ad_end) or &
	Not of_IsValid(ad_start) or Not of_IsValid(ad_end) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

If ad_start > ad_end Then
	ld_temp = ad_start
	ad_start = ad_end
	ad_end = ld_temp
	li_mult = -1
else
	li_mult = 1
End If

li_month = (year(ad_end) - year(ad_start) ) * 12
li_month = li_month + month(ad_end) - month(ad_start)

If day(ad_start) > day(ad_end) Then 
	li_month --
End If

Return li_month * li_mult
end function

public function string of_monthname (integer ai_monthnumber);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_MonthName
//
//	Access:  		public
//
//	Arguments:
//	ai_monthnumber		Based on the the passed month number, determines the Month name.
//
//	Returns:  		string
//		the month.
//
//	Description:  	
//		Based on the the passed date, determines the Month name.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////


//Check parameters
If IsNull(ai_monthnumber) or ai_monthnumber<0 or ai_monthnumber>12 Then
	Return '!'
End If

return is_month[ai_monthnumber]

end function

public function string of_monthname (date ad_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_MonthName
//
//	Access:  		public
//
//	Arguments:
//	ad_source		Date for which the Month name is desired
//
//	Returns:  		string
// 	The month.
//
//	Description:  	
//		Based on the the passed date, determines the Month name.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ad_source) Then
	Return '!'
End If

//Check for invalid date
If Not of_IsValid(ad_source) Then
	Return '!'
End If

Return of_MonthName( Month(ad_source) )

end function

public function boolean of_isvalid (time atm_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsValid
//
//	Access:  		public
//
//	Arguments:
//	adtm_source		DateTime to test.
//
//	Returns:  		boolean
//						True if argument is a valid time.
//						If any argument's value is NULL, function returns False.
//						If any argument's value is Invalid, function returns False.
//
//	Description:  	Given a time, will determine if the time is valid.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

integer 	li_hour
integer	li_minute
integer	li_second

// Initialize test values.
li_hour = Hour(atm_source)
li_minute = Minute(atm_source)
li_second = Second(atm_source)

// Check for nulls.
If IsNull(atm_source) Or IsNull(li_hour) or IsNull(li_minute) or IsNull(li_second) Then
	Return False
End If

// Check for invalid values.
If li_hour < 0 or li_minute < 0 or li_second < 0 Then
	Return False
End If

// Passed all testing.
Return True

end function

public function boolean of_isvalid (date ad_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsValid
//
//	Access:  		public
//
//	Arguments:
//	ad_source 			Date to test.
//
//	Returns:  		boolean
//						True if argument contains a valid date.
//						If any argument's value is NULL, function returns False.
//						If any argument's value is Invalid, function returns False.
//
//	Description:  	Given a date, will determine if the Date is valid.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.04 Enhanced for more complete checking.
//	6.0.01 Remove invalid date comparison
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

integer 	li_year
integer	li_month
integer	li_day

// Initialize test values.
li_year = Year(ad_source)
li_month = Month(ad_source)
li_day = Day(ad_source)

// Check for nulls.
If IsNull(ad_source) Or IsNull(li_year) or IsNull(li_month) or IsNull(li_day) Then
	Return False
End If

// Check for invalid values.
If	li_year <= 0 or li_month <= 0 or li_day <= 0 Then
	Return False
End If

// Passed all testing.
Return True

end function

public function date of_relativemonth (date ad_source, long al_month);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RelativeMonth
//
//	Access:			Public
//
//	Arguments:
//	ad_source		Base date (starting poing).
//	al_month	 		Number of months to increment or decrement the base date by.
//
//	Returns:  		date 
//						The adjusted date.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns 1900-01-01.
//
//	Description:  	Given a date, will return the date +/- the number of months passed
//						in the second parameter.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History	
//
//	Version
//	5.0   Initial version
//	5.0.03	Fixed - function would fail under some international date sets
// 7.0 	Removed a loop which determined the last day in month.  The loop was 
//			relying on the of_IsValid(date) function to find an invalid date.  
//			In PB 5.0.03+ a date variable can only contain a Null or a valid date
//			Used an ii_daysinmonth[] array instead.
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

integer li_adjust_months, li_adjust_years
integer li_month, li_year, li_day
integer li_temp_month

//Check parameters
If IsNull(ad_source) or IsNull(al_month) Then
	date ldt_null
	SetNull(ldt_null)
	Return ldt_null
End If

//Check for invalid date
If Not of_IsValid(ad_source) Then
	Return ad_source
End If
	
//Number 12 is for the Twelve months in a year.
li_adjust_months = mod(al_month, 12)
li_adjust_years = (al_month / 12)

li_temp_month = Month(ad_source) + li_adjust_months
If li_temp_month > 12 Then
	// Add one more year and adjust for the month
	li_month = li_temp_month - 12
	li_adjust_years ++
ElseIf li_temp_month <= 0 Then
	// Subtract one more year and adjust for the month
	li_month = li_temp_month + 12
	li_adjust_years --
Else
	// No need for any adjustments
	li_month = li_temp_month
End If

li_year = Year(ad_source) + li_adjust_years
li_day = Day(ad_source)

// If the date is > than last in month set it to the last day
If li_day > ii_daysinmonth[li_month] Then
	If li_month = 2 and of_isleapyear(date(li_year, 01, 01)) Then
		li_day = 29
	Else
		li_day = ii_daysinmonth[li_month]
	end If
End IF

Return( Date(li_year, li_month, li_day))

end function

public function date of_relativeyear (date ad_source, long al_years);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RelativeYear
//
//	Access:  		public
//
//	Arguments:
//	ad_source		Bbase date (starting point).
//	al_years			Number of years to increment or decrement the base date by.
//
//	Returns:  		date
//						The adjusted date
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns 1900-01-01.
//
//	Description:  	Given a date, will return the date +/- the number of years passed
//						in the second parameter.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.03	Fixed - function would fail under some international date sets
// 7.0	Fixed invalid date calculations
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

integer li_year, li_month, li_day

//Check parameters
If IsNull(ad_source) or IsNull(al_years) Then
	date ldt_null
	SetNull(ldt_null)
	Return ldt_null
End If

//Check for invalid date
If Not of_IsValid(ad_source) Then
	Return ad_source
End If

li_year = Year(ad_source) + al_years
li_month = Month(ad_source)
li_day = Day(ad_source)

//Check for a valid day (i.e., February 30th is never a valid date)
If li_day > ii_daysinmonth[li_month] Then
   If li_month = 2 and &
      of_isleapyear(date(li_year, 01, 01)) Then
         li_day = 29
   Else
         li_day = ii_daysinmonth[li_month]
   end If
End IF

Return( Date(li_year, li_month, li_day))
end function

public function long of_weeksafter (date ad_start, date ad_end);//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_WeeksAfter
//
//	Access:  		public
//
//	Arguments:
//	ad_start 		Starting date.
//	ad_end			Ending date.
//
//	Returns:  		Long
//						Number of whole weeks between the two dates.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns NULL.
//
//	Description:  	Given two dates, will determine the number of whole
//						weeks between the two.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ad_start) or IsNull(ad_end) or & 
	Not of_IsValid(ad_start) or Not of_IsValid(ad_end) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

Return Daysafter(ad_start,ad_end) / 7
end function

public function long of_juliandaynumber (date ad_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_JulianDayNumber
//
//	Access:  		public
//
//	Arguments:
//	ad_source 		Date to test
//
//	Returns:  		long
//						Number of the day (ex. 1/1/95=1 and 12/31/95=365)
//						If ad_source is NULL, function returns NULL.
//
//	Description:  	Given a date, will determine the day number within the same
//						year.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03	Add date validity check
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ad_source) Then
	long ll_null
	SetNull (ll_null)
	Return ll_null
End If

//Check for invalid date
If Not of_IsValid(ad_source) Then
	Return -1
End If

// Get the days after the last day of the Previous Year.
Return daysafter(Date((Year(ad_source) - 1),12,31), ad_source)
end function

public function long of_julian (date ad_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Julian	
//
//	Access:  		public
//
//	Arguments:
//	ad_source		Date to be converted
//
//	Returns:  		long 
//						Date as a julian
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns -1.
//
//	Description:  	Converts a date to Julian format.
//						Note: Julian zero day is Jan. 1, year 0000.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ad_source) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

//Check for invalid date
If Not of_IsValid(ad_source) Then
	Return -1
End If

Return DaysAfter(Date(0000,01,01),ad_source)

end function

public function integer of_dayofweek (date ad_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_DayOfWeek
//
//	Access:  		public
//
//	Arguments:
//	ad_source		Date which contains the day to be determined.
//
//	Returns:  		integer
//						1 - If the Day is Sunday.
//						2 - If the Day is Monday
//						3 - If the Day is Tuesday.
//						4 - If the Day is Wednesday.
//						5 - If the Day is Thursday.
//						6 - If the Day is Friday.
//						7 - If the Day is Saturday.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Based on the the passed date, determines the day of the week.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.02   Fixed - function would fail under some international date sets
//		Function duplicates PowerScript DayNumber function.
//	5.0.03	Add parameter and invalid date checking
// 6.0	 	Marked obsolete Replaced by DayNumber(...)
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ad_source) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

//Check for invalid date
If Not of_IsValid(ad_source) Then
	Return -1
End If

return DayNumber (ad_source)

end function

public function date of_lastdayofmonth (date ad_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_LastDayOfMonth
//
//	Access:  		public
//
//	Arguments: 
//	ad_source 		Date to test.
//
//	Returns:  		date
//						The last date of the month passed.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns 1900-01-01.
//
//	Description:  	Given a date, will determine the last day of the month.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.03	Fixed - function would fail under some international date sets
// 7.0	Removed a loop which relied on an invalid date.  
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

integer li_year, li_month, li_day

//Check parameters
If IsNull(ad_source) Then
	date ldt_null
	SetNull(ldt_null)
	Return ldt_null
End If

//Check for invalid date
If Not of_IsValid(ad_source) Then
	Return ad_source
End If

li_year = Year(ad_source)
li_month = Month(ad_source)

If li_month = 2 and of_isleapyear(date(li_year, 01, 01)) Then
	li_day = 29
Else
	li_day = ii_daysinmonth[li_month]
end If

Return (Date(li_year, li_month, li_day))

end function

public function long of_weeknumber (date ad_source);////////////////////////////////////////////////////////////////////////////////
//	Public Function:			of_WeekNumber
//	Arguments:				ad_source		Date to be determined.
//	Returns:  				long 
//								If any argument's value is NULL, function returns NULL.
//								If any argument's value is Invalid, function returns -1.
//	Description:  			Obtains the week number that corresponds to the date from 
//								the begining of the year.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History				Version
//								5.0			Initial version
//								8.0			Should return 1 for 1st week in January
//											(Note: Number of weeks in year may exceed 53 )
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//////////////////////////////////////////////////////////////////////////////
date		ld_first_ofyear
integer	li_weeknumber
integer	li_leftover_days

//Check parameters
If IsNull(ad_source) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

//Check for invalid date
If Not of_IsValid(ad_source) Then
	Return -1
End If

//Set to the first of the same year. 
ld_first_ofyear = Date(Year(ad_source), 01, 01)

//Get the number of weeks passed from the begining of the year.
li_weeknumber = of_WeeksAfter (ld_first_ofyear, ad_source) + 1

//Get the leftover days.
li_leftover_days = Mod(DaysAfter (ld_first_ofyear, ad_source), 7)

//If needed, increment the weeks count by one.
If (of_DayOfWeek(ld_first_ofyear) + li_leftover_days) >= 8 then
	li_weeknumber ++
End If

Return li_weeknumber

end function

on pfc_n_cst_datetime.create
call super::create
end on

on pfc_n_cst_datetime.destroy
call super::destroy
end on


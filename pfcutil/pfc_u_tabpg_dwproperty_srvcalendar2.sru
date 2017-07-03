HA$PBExportHeader$pfc_u_tabpg_dwproperty_srvcalendar2.sru
$PBExportComments$PFC DataWindow Property - The Calendar service tabpage 2
forward
global type pfc_u_tabpg_dwproperty_srvcalendar2 from u_tabpg_dwproperty_base
end type
type cbx_boldsaturdays from u_cbx within pfc_u_tabpg_dwproperty_srvcalendar2
end type
type cbx_boldsundays from u_cbx within pfc_u_tabpg_dwproperty_srvcalendar2
end type
type cbx_boldholidays from u_cbx within pfc_u_tabpg_dwproperty_srvcalendar2
end type
type cbx_boldmarkeddays from u_cbx within pfc_u_tabpg_dwproperty_srvcalendar2
end type
type dw_holidays from u_dw within pfc_u_tabpg_dwproperty_srvcalendar2
end type
type dw_markeddays from u_dw within pfc_u_tabpg_dwproperty_srvcalendar2
end type
type em_colorsaturday from u_em within pfc_u_tabpg_dwproperty_srvcalendar2
end type
type st_colorsaturdary from u_st within pfc_u_tabpg_dwproperty_srvcalendar2
end type
type em_colorsunday from u_em within pfc_u_tabpg_dwproperty_srvcalendar2
end type
type st_colorsunday from u_st within pfc_u_tabpg_dwproperty_srvcalendar2
end type
type em_colorholiday from u_em within pfc_u_tabpg_dwproperty_srvcalendar2
end type
type st_colorholiday from u_st within pfc_u_tabpg_dwproperty_srvcalendar2
end type
type em_colormarkedday from u_em within pfc_u_tabpg_dwproperty_srvcalendar2
end type
type st_colormarkedday from u_st within pfc_u_tabpg_dwproperty_srvcalendar2
end type
type gb_holiday from u_gb within pfc_u_tabpg_dwproperty_srvcalendar2
end type
type gb_markedday from u_gb within pfc_u_tabpg_dwproperty_srvcalendar2
end type
type gb_saturday from u_gb within pfc_u_tabpg_dwproperty_srvcalendar2
end type
type gb_sunday from u_gb within pfc_u_tabpg_dwproperty_srvcalendar2
end type
end forward

global type pfc_u_tabpg_dwproperty_srvcalendar2 from u_tabpg_dwproperty_base
event type integer pfc_propertypopulate ( )
cbx_boldsaturdays cbx_boldsaturdays
cbx_boldsundays cbx_boldsundays
cbx_boldholidays cbx_boldholidays
cbx_boldmarkeddays cbx_boldmarkeddays
dw_holidays dw_holidays
dw_markeddays dw_markeddays
em_colorsaturday em_colorsaturday
st_colorsaturdary st_colorsaturdary
em_colorsunday em_colorsunday
st_colorsunday st_colorsunday
em_colorholiday em_colorholiday
st_colorholiday st_colorholiday
em_colormarkedday em_colormarkedday
st_colormarkedday st_colormarkedday
gb_holiday gb_holiday
gb_markedday gb_markedday
gb_saturday gb_saturday
gb_sunday gb_sunday
end type
global pfc_u_tabpg_dwproperty_srvcalendar2 pfc_u_tabpg_dwproperty_srvcalendar2

type variables
Protected:
integer	ii_style = -1
end variables

forward prototypes
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
end prototypes

event pfc_propertypopulate;call super::pfc_propertypopulate;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		pfc_properypopulate
//
//	Access:    		Public
//
//	Arguments:  	None
//
//	Returns:   		Integer
//   1 if it succeeds.
//	 -1 if an error occurs.
//
//	Description:  	
//	Populate the screen edit controls with the current service values.
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

integer	li_upper
integer	li_cnt
integer 	li_rc
integer	li_row
date		ld_registered[]
date		ld_empty[]

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.iuo_calendar) or Not IsValid(idw_requestor.iuo_calendar) Then
	Return -1
End If

// Determine if Bold Saturday is enabled.
cbx_boldsaturdays.Checked = idw_requestor.iuo_calendar.of_IsSaturdayBold()

// Determine the Saturday color.
em_colorsaturday.Text = String(idw_requestor.iuo_calendar.of_GetSaturdayColor())

// Determine if Bold Sunday is enabled.
cbx_boldsundays.Checked = idw_requestor.iuo_calendar.of_IsSundayBold()

// Determine the Sunday color.
em_colorsunday.Text = String(idw_requestor.iuo_calendar.of_GetSundayColor())

// Determine if Bold Holiday is enabled.
cbx_boldholidays.Checked = idw_requestor.iuo_calendar.of_IsHolidayBold()

// Determine the Holiday color.
em_colorholiday.Text = String(idw_requestor.iuo_calendar.of_GetHolidayColor())

// Get the dates of the Holidays.
ld_registered = ld_empty
idw_requestor.iuo_calendar.of_GetHoliday(ld_registered)
li_upper = UpperBound(ld_registered)
For li_cnt = 1 to li_upper
	li_row = dw_holidays.InsertRow(0)
	If li_row > 0 Then	
		dw_holidays.object.date.primary[li_row] = ld_registered[li_cnt]
	End If
Next
If dw_holidays.RowCount() = 0 Then
	// Insert a blank row.
	li_row = dw_holidays.InsertRow(0)	
End If

// Determine if Bold MarkedDay is enabled.
cbx_boldmarkeddays.Checked = idw_requestor.iuo_calendar.of_IsMarkedDayBold()

// Determine the Markedday color.
em_colormarkedday.Text = String(idw_requestor.iuo_calendar.of_GetMarkeddayColor())

// Get the dates of the MarkedDays.
ld_registered = ld_empty
idw_requestor.iuo_calendar.of_GetMarkedDay(ld_registered)
li_upper = UpperBound(ld_registered)
For li_cnt = 1 to li_upper
	li_row = dw_markeddays.InsertRow(0)
	If li_row > 0 Then	
		dw_markeddays.object.date.primary[li_row] = ld_registered[li_cnt]
	End If
Next
If dw_markeddays.RowCount() = 0 Then
	// Insert a blank row.
	li_row = dw_markeddays.InsertRow(0)	
End If

Return 1

end event

public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetInfo
//
//	Access:   		Public
//
//	Arguments:		
//		anv_infoattrib	(By reference) The Information attributes.
//
//	Returns:  		Integer
//	 1 for success.
//	-1 for error.
//
//	Description:  
//	 Gets the Object Information.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0    Initial version
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

// Populate Information.
anv_infoattrib.is_name = 'DW Property Calendar Object'
anv_infoattrib.is_description = 'DW Property Calendar Object'

Return 1
end function

public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetPropertyInfo
//
//	Access:   		Public
//
//	Arguments:		
//		anv_attrib	(By ref.) The Property Information attributes.
//
//	Returns:  		Integer
//	 1 for success.
//	-1 for error.
//
//	Description:  
//	 Gets the Service Property Information.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0    Initial version
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

n_cst_infoattrib lnv_infoattrib

// Get the first two attributes from the Main Information attributes.
of_GetInfo(lnv_infoattrib)
anv_attrib.is_name = lnv_infoattrib.is_name
anv_attrib.is_description = lnv_infoattrib.is_description

// The Property Tab Text.
anv_attrib.is_propertytabtext ='Appearance'

Return 1
end function

on pfc_u_tabpg_dwproperty_srvcalendar2.create
int iCurrent
call super::create
this.cbx_boldsaturdays=create cbx_boldsaturdays
this.cbx_boldsundays=create cbx_boldsundays
this.cbx_boldholidays=create cbx_boldholidays
this.cbx_boldmarkeddays=create cbx_boldmarkeddays
this.dw_holidays=create dw_holidays
this.dw_markeddays=create dw_markeddays
this.em_colorsaturday=create em_colorsaturday
this.st_colorsaturdary=create st_colorsaturdary
this.em_colorsunday=create em_colorsunday
this.st_colorsunday=create st_colorsunday
this.em_colorholiday=create em_colorholiday
this.st_colorholiday=create st_colorholiday
this.em_colormarkedday=create em_colormarkedday
this.st_colormarkedday=create st_colormarkedday
this.gb_holiday=create gb_holiday
this.gb_markedday=create gb_markedday
this.gb_saturday=create gb_saturday
this.gb_sunday=create gb_sunday
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_boldsaturdays
this.Control[iCurrent+2]=this.cbx_boldsundays
this.Control[iCurrent+3]=this.cbx_boldholidays
this.Control[iCurrent+4]=this.cbx_boldmarkeddays
this.Control[iCurrent+5]=this.dw_holidays
this.Control[iCurrent+6]=this.dw_markeddays
this.Control[iCurrent+7]=this.em_colorsaturday
this.Control[iCurrent+8]=this.st_colorsaturdary
this.Control[iCurrent+9]=this.em_colorsunday
this.Control[iCurrent+10]=this.st_colorsunday
this.Control[iCurrent+11]=this.em_colorholiday
this.Control[iCurrent+12]=this.st_colorholiday
this.Control[iCurrent+13]=this.em_colormarkedday
this.Control[iCurrent+14]=this.st_colormarkedday
this.Control[iCurrent+15]=this.gb_holiday
this.Control[iCurrent+16]=this.gb_markedday
this.Control[iCurrent+17]=this.gb_saturday
this.Control[iCurrent+18]=this.gb_sunday
end on

on pfc_u_tabpg_dwproperty_srvcalendar2.destroy
call super::destroy
destroy(this.cbx_boldsaturdays)
destroy(this.cbx_boldsundays)
destroy(this.cbx_boldholidays)
destroy(this.cbx_boldmarkeddays)
destroy(this.dw_holidays)
destroy(this.dw_markeddays)
destroy(this.em_colorsaturday)
destroy(this.st_colorsaturdary)
destroy(this.em_colorsunday)
destroy(this.st_colorsunday)
destroy(this.em_colorholiday)
destroy(this.st_colorholiday)
destroy(this.em_colormarkedday)
destroy(this.st_colormarkedday)
destroy(this.gb_holiday)
destroy(this.gb_markedday)
destroy(this.gb_saturday)
destroy(this.gb_sunday)
end on

event pfc_propertyapply;call super::pfc_propertyapply;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		pfc_PropertyApply
//
//	Access:    		Public
//
//	Arguments:  	None
//
//	Returns:   		Integer
//   1 if it succeeds.
//	 -1 if an error occurs.
//
//	Description:  		
//	 Apply the requested changes.
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

integer	li_rowcount
integer	li_row
integer 	li_rc
boolean	lb_current, lb_desired
integer	li_datecount = 0
long		ll_desiredcolor, ll_currentcolor
date		ld_register[]
date		ld_empty[]
date		ld_date
n_cst_datetime lnv_datetime

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.iuo_calendar) or Not IsValid(idw_requestor.iuo_calendar) Then
	Return -1
End If

// -- Bold Saturdays. --
lb_current = idw_requestor.iuo_calendar.of_IsSaturdayBold()
lb_desired = cbx_boldsaturdays.Checked
// If the desired value differs from the current value.
If  lb_current<> lb_desired Then
	li_rc = idw_requestor.iuo_calendar.of_SetSaturdayBold(lb_desired)
End If

// -- Color Saturdays. --
ll_currentcolor = idw_requestor.iuo_calendar.of_GetSaturdayColor()
ll_desiredcolor = long(em_colorsaturday.Text)
// If the desired value differs from the current value.
If  ll_currentcolor<> ll_desiredcolor Then
	li_rc = idw_requestor.iuo_calendar.of_SetSaturdayColor(ll_desiredcolor)
End If

// -- Bold Sundays. --
lb_current = idw_requestor.iuo_calendar.of_IsSundayBold()
lb_desired = cbx_boldsundays.Checked
// If the desired value differs from the current value.
If  lb_current<> lb_desired Then
	li_rc = idw_requestor.iuo_calendar.of_SetSundayBold(lb_desired)
End If

// -- Color Sundays. --
ll_currentcolor = idw_requestor.iuo_calendar.of_GetSundayColor()
ll_desiredcolor = long(em_colorsunday.Text)
// If the desired value differs from the current value.
If  ll_currentcolor<> ll_desiredcolor Then
	li_rc = idw_requestor.iuo_calendar.of_SetSundayColor(ll_desiredcolor)
End If

// -- Bold Holidays. --
lb_current = idw_requestor.iuo_calendar.of_IsHolidayBold()
lb_desired = cbx_boldholidays.Checked
// If the desired value differs from the current value.
If  lb_current<> lb_desired Then
	li_rc = idw_requestor.iuo_calendar.of_SetHolidayBold(lb_desired)
End If

// -- Color Holidays. --
ll_currentcolor = idw_requestor.iuo_calendar.of_GetHolidayColor()
ll_desiredcolor = long(em_colorholiday.Text)
// If the desired value differs from the current value.
If  ll_currentcolor<> ll_desiredcolor Then
	li_rc = idw_requestor.iuo_calendar.of_SetHolidayColor(ll_desiredcolor)
End If

// -- Set the dates of the Holidays. --
ld_register = ld_empty
li_datecount = 0
li_rowcount = dw_holidays.RowCount()
For li_row = 1 to li_rowcount
	ld_date = dw_holidays.object.date.primary[li_row]
	If lnv_datetime.of_IsValid(ld_date) Then
		li_datecount ++
		ld_register[li_datecount] = ld_date
	End If
Next
li_rc = idw_requestor.iuo_calendar.of_SetHoliday(ld_register)

// -- Bold Marked days. --
lb_current = idw_requestor.iuo_calendar.of_IsMarkedDayBold()
lb_desired = cbx_boldmarkeddays.Checked
// If the desired value differs from the current value.
If  lb_current<> lb_desired Then
	li_rc = idw_requestor.iuo_calendar.of_SetMarkedDayBold(lb_desired)
End If

// -- Color Markedday. --
ll_currentcolor = idw_requestor.iuo_calendar.of_GetMarkeddayColor()
ll_desiredcolor = long(em_colormarkedday.Text)
// If the desired value differs from the current value.
If  ll_currentcolor<> ll_desiredcolor Then
	li_rc = idw_requestor.iuo_calendar.of_SetMarkeddayColor(ll_desiredcolor)
End If

// -- Set the dates of the Markeddays. --
ld_register = ld_empty
li_datecount = 0
li_rowcount = dw_markeddays.RowCount()
For li_row = 1 to li_rowcount
	ld_date = dw_markeddays.object.date.primary[li_row]
	If lnv_datetime.of_IsValid(ld_date) Then
		li_datecount ++
		ld_register[li_datecount] = ld_date
	End If
Next
li_rc = idw_requestor.iuo_calendar.of_SetMarkedday(ld_register)


Return 1

end event

event pfc_propertyvalidation;call super::pfc_propertyvalidation;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyValidation
//
//	Arguments:  None
//
//	Returns: Integer
//	 1 = successful
// -1 = Error
//
//	Description:
//	 Validate the object.
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

If dw_holidays.AcceptText() <= 0 Then 
	Return -1
End If

If dw_markeddays.AcceptText() <= 0 Then 
	Return -1
End If

Return 1
end event

event pfc_propertysyntax;call super::pfc_propertysyntax;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		pfc_propertysyntax
//
//	Access:    		Public
//
//	Arguments:  	None
//
//	Returns:   		String
//	  The syntax required to create the currently selections.
//   '!' in error
//
//	Description:  
//	Create the required syntax to match the current selections.
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

integer	li_rowcount
integer	li_row
string	ls_register
string	ld_registermarked
integer	li_registercount
integer	li_desired
integer	li_upper
integer	li_cnt
integer 	li_rc
integer	li_index
string	ls_syntax
boolean	lb_desired
string	ls_desired
date		ld_date
n_cst_conversion lnv_conversion
n_cst_datetime		lnv_datetime

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return '!'
End If
If IsNull(idw_requestor.iuo_calendar) or Not IsValid(idw_requestor.iuo_calendar) Then
	Return '!'
End If

// -- Bold Saturdays. --
lb_desired = cbx_boldsaturdays.Checked
ls_syntax += '~r~nThis.iuo_calendar.of_SetSaturdayBold('+lnv_conversion.of_String(lb_desired)+')'

// -- Color Saturdays. --
ls_desired = em_colorsaturday.Text
ls_syntax += '~r~nThis.iuo_calendar.of_SetSaturdayColor('+ls_desired+')'

// -- Bold Sundays. --
lb_desired = cbx_boldsundays.Checked
ls_syntax += '~r~nThis.iuo_calendar.of_SetSundayBold('+lnv_conversion.of_String(lb_desired)+')'

// -- Color Sundays. --
ls_desired = em_colorsunday.Text
ls_syntax += '~r~nThis.iuo_calendar.of_SetSundayColor('+ls_desired+')'

// -- Bold Holidays. --
lb_desired = cbx_boldholidays.Checked
ls_syntax += '~r~nThis.iuo_calendar.of_SetHolidayBold('+lnv_conversion.of_String(lb_desired)+')'

// -- Color Holidays. --
ls_desired = em_colorholiday.Text
ls_syntax += '~r~nThis.iuo_calendar.of_SetHolidayColor('+ls_desired+')'

// -- Set the dates of the Holidays. --
ls_register = ''
li_registercount = 0
li_rowcount = dw_holidays.RowCount()
For li_row = 1 to li_rowcount
	ld_date = dw_holidays.object.date.primary[li_row]
	If lnv_datetime.of_IsValid(ld_date) Then
		li_registercount ++
		ls_register += '~r~nld_registerholiday['+string(li_registercount)+'] = Date("'+ &
							String(ld_date)+'")'
	End If
Next
If li_registercount > 0 Then
	// -- Defined required variables.  -- 
	ls_syntax += '~r~nDate	ld_registerholiday[]'
	ls_syntax += ls_register
	ls_syntax += '~r~nThis.iuo_calendar.of_SetHoliday(ld_registerholiday)'
End If

//
// -- Bold Marked days. --
lb_desired = cbx_boldmarkeddays.Checked
ls_syntax += '~r~nThis.iuo_calendar.of_SetMarkedDayBold('+lnv_conversion.of_String(lb_desired)+')'

// -- Color Markedday. --
ls_desired = em_colormarkedday.Text
ls_syntax += '~r~nThis.iuo_calendar.of_SetMarkeddayColor('+ls_desired+')'

// -- Set the dates of the Markeddays. --
ls_register = ''
li_registercount = 0
li_rowcount = dw_markeddays.RowCount()
For li_row = 1 to li_rowcount
	ld_date = dw_markeddays.object.date.primary[li_row]
	If lnv_datetime.of_IsValid(ld_date) Then
		li_registercount ++
		ls_register += '~r~nld_registermarked['+string(li_registercount)+'] = Date("'+ &
							String(ld_date)+'")'
	End If
Next
If li_registercount > 0 Then
	// -- Defined required variables.  -- 
	ls_syntax += '~r~nDate	ld_registermarked[]'
	ls_syntax += ls_register
	ls_syntax += '~r~nThis.iuo_calendar.of_SetHoliday(ld_registermarked)'
End If

Return ls_syntax

end event

type cbx_boldsaturdays from u_cbx within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 1047
integer y = 116
integer width = 594
integer height = 68
integer taborder = 30
boolean bringtotop = true
string text = "Bold"
end type

type cbx_boldsundays from u_cbx within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 210
integer y = 120
integer width = 594
integer height = 68
integer taborder = 10
boolean bringtotop = true
string text = "Bold"
end type

type cbx_boldholidays from u_cbx within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 210
integer y = 520
integer width = 594
integer height = 68
integer taborder = 50
boolean bringtotop = true
string text = "Bold"
end type

type cbx_boldmarkeddays from u_cbx within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 1047
integer y = 520
integer width = 594
integer height = 68
integer taborder = 80
boolean bringtotop = true
string text = "Bold"
end type

type dw_holidays from u_dw within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 206
integer y = 728
integer width = 530
integer height = 572
integer taborder = 70
string dataobject = "d_dwproperty_dates"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Constructor
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	
//		Start any desired services.
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

// Want the rowmanager minus the Undelete capabilities.
of_SetRowManager ( True ) 
If IsValid(inv_rowmanager) Then
	inv_rowmanager.of_SetRestoreRow(False)
End If
end event

type dw_markeddays from u_dw within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 1047
integer y = 728
integer width = 530
integer height = 572
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_dwproperty_dates"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Constructor
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	
//		Start any desired services.
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

// Want the rowmanager minus the Undelete capabilities.
of_SetRowManager ( True ) 
If IsValid(inv_rowmanager) Then
	inv_rowmanager.of_SetRestoreRow(False)
End If
end event

type em_colorsaturday from u_em within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 1321
integer y = 212
integer width = 320
integer height = 76
integer taborder = 40
alignment alignment = right!
string mask = "########"
string displaydata = ""
double increment = 0
string minmax = ""
end type

type st_colorsaturdary from u_st within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 914
integer y = 220
integer width = 379
string text = "Color"
alignment alignment = center!
end type

type em_colorsunday from u_em within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 480
integer y = 212
integer width = 320
integer height = 76
integer taborder = 20
boolean bringtotop = true
alignment alignment = right!
string mask = "########"
string displaydata = ""
double increment = 0
string minmax = ""
end type

type st_colorsunday from u_st within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 78
integer y = 220
integer width = 379
boolean bringtotop = true
string text = "Color"
alignment alignment = center!
end type

type em_colorholiday from u_em within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 480
integer y = 612
integer width = 320
integer height = 76
integer taborder = 60
boolean bringtotop = true
alignment alignment = right!
string mask = "########"
string displaydata = ""
double increment = 0
string minmax = ""
end type

type st_colorholiday from u_st within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 73
integer y = 620
integer width = 379
boolean bringtotop = true
string text = "Color"
alignment alignment = center!
end type

type em_colormarkedday from u_em within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 1321
integer y = 604
integer width = 320
integer height = 76
integer taborder = 90
boolean bringtotop = true
alignment alignment = right!
string mask = "########"
string displaydata = ""
double increment = 0
string minmax = ""
end type

type st_colormarkedday from u_st within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 914
integer y = 624
integer width = 379
boolean bringtotop = true
string text = "Color"
alignment alignment = center!
end type

type gb_holiday from u_gb within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 27
integer y = 424
integer width = 814
integer height = 904
integer taborder = 0
string text = "Holiday"
end type

type gb_markedday from u_gb within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 887
integer y = 424
integer width = 814
integer height = 904
integer taborder = 0
string text = "Other"
end type

type gb_saturday from u_gb within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 887
integer y = 36
integer width = 814
integer height = 340
integer taborder = 0
string text = "Saturday"
end type

type gb_sunday from u_gb within pfc_u_tabpg_dwproperty_srvcalendar2
integer x = 27
integer y = 36
integer width = 814
integer height = 340
integer taborder = 0
string text = "Sunday"
end type


HA$PBExportHeader$pfc_u_calendar.sru
$PBExportComments$PFC Calendar class
forward
global type pfc_u_calendar from u_base
end type
type dw_cal from u_dw within pfc_u_calendar
end type
end forward

global type pfc_u_calendar from u_base
integer width = 695
integer height = 640
long backcolor = 80263328
long tabtextcolor = 0
long tabbackcolor = 67108864
long picturemaskcolor = 25166016
event type integer pfc_dropdown ( )
dw_cal dw_cal
end type
global pfc_u_calendar pfc_u_calendar

type variables
Public:
// Datawindow Register columnStyle.
constant integer NONE = 1
constant integer DDLB = 2
constant integer DDLB_WITHARROW = 3
n_cst_dropdown	inv_dropdown

integer ii_registry

Protected:
// Internal attibutes.
dragobject idrg_requestor
datawindow idw_requestor
editmask iem_requestor
Date	id_date
Date	id_prevdate
Date	id_resetdate
String	is_prevcell=''
Integer	ii_boldfontweight=700
Integer	ii_normalfontweight=400
n_cst_datetime inv_datetime
n_cst_calendarattrib inv_calendarattrib

// API accessible attributes
Long	il_fontcolor=0
String	is_dateformat=''
Date	id_holiday[]
Date	id_markedday[]
Boolean	ib_holidaybold=False
Boolean	ib_sundaybold=False
Boolean	ib_saturdaybold=False
Boolean	ib_markeddaybold=False
Long	il_sundaycolor=255	
Long	il_saturdaycolor=255
Long	il_holidaycolor=16711680
Long	il_markeddaycolor=65535
Boolean	ib_closeonclick = True
Boolean	ib_closeondclick = True
Boolean	ib_initialvalue= False
Boolean	ib_alwaysredraw = False

//API accessible attributes - DataWindow only attributes.
string	is_dwcolumns[]
string	is_dwcolumnsexp[]
integer	ii_dwcolumnstyle[]
end variables

forward prototypes
public function integer of_setrequestor (dragobject adrg_requestor)
public function integer of_setholiday (date ad_dates[])
public function integer of_setmarkedday (date ad_dates[])
public function integer of_setholidaycolor (long al_color)
public function integer of_SetMarkeddayBold (boolean ab_bold)
public function integer of_SetMarkedDayColor (long al_color)
public function integer of_SetSaturdayBold (boolean ab_bold)
public function integer of_SetSaturdayColor (long al_color)
public function integer of_SetSundayBold (boolean ab_bold)
public function integer of_SetSundayColor (long al_color)
public function integer of_setholidaybold (boolean ab_bold)
public function boolean of_IsHolidayBold ()
public function boolean of_IsMarkeddayBold ()
public function boolean of_IsSundayBold ()
public function boolean of_IsSaturdayBold ()
public function long of_GetHolidayColor ()
public function long of_GetMarkeddayColor ()
public function long of_GetSaturdayColor ()
public function long of_GetSundayColor ()
public function integer of_getholiday (ref date ad_dates[])
public function integer of_getmarkedday (ref date ad_dates[])
public function integer of_setcloseonclick (boolean ab_switch)
public function integer of_setcloseondclick (boolean ab_switch)
public function integer of_setdateformat (string as_format)
public function integer of_getregistered (ref string as_dwcolumns[])
public function boolean of_isregistered (string as_dwcolumn)
protected function integer of_setfocusonrequestor ()
public function integer of_register ()
public function integer of_register (string as_dwcolumn)
protected function boolean of_isdatetype (string as_type)
public function integer of_setdropdown (boolean ab_switch)
public function integer of_register (string as_dwcolumn, integer ai_style)
public function integer of_register (integer ai_style)
public function integer of_unregister (string as_dwcolumn)
public function boolean of_IsCloseOnClick ()
public function boolean of_IsCloseOnDClick ()
public function integer of_getregistered (ref string as_dwcolumns[], ref integer ai_dwcolumnstyle[])
public function integer of_getregisteredstyle (string as_dwcolumn)
protected function integer of_dropdown ()
public function integer of_unregister ()
protected function integer of_redirectfocus ()
public function integer of_setalwaysredraw (boolean ab_switch)
public function boolean of_isalwaysredraw ()
public function integer of_GetRegisterable (ref string as_allcolumns[])
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_SetInitialValue (boolean ab_switch)
public function boolean of_IsInitialValue ()
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
protected function integer of_reset ()
protected function integer of_drawmonth (date ad_date)
protected function integer of_setdate (date ad_date, boolean ab_setrequestor)
end prototypes

event pfc_dropdown;call super::pfc_dropdown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_dropdown
//
//	(Arguments:		None)
//
//	Returns:  Integer
//		1 if it succeeds
//		-1 if an error occurs.
//		0 if the current datawindow column has not been registered.
//
//	Description:  
//		Request the dropdown calendar.
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

Return of_DropDown()
end event

public function integer of_setrequestor (dragobject adrg_requestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetRequestor
//
//	Access:    Public
//
//	Arguments:
//   adrg_requestor   The object requesting the service.
//			Valid objects are DataWindow! and dropdownlistbox!.
//
//	Returns:  Integer
//		1 if it succeeds 
//		-1 if an error occurs.
//		-2 if attempting to associate object where only dropdowns are supported.
//		-3 MaskDataType is incorrect.
//
//	Description:  Associates an object control with this object 
//		by setting the requestor instance variable(s).
//		The valid objects which can be associated are of type datawindow and 
//		type editmask.  Editmask type should further have a mask of 
//		type DateMask!.
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

dragobject	ldrg_notvalid
editmask		lem_testonly
boolean		lb_dropdownbehavior

// Validate Reference.
If IsNull(adrg_requestor) or Not IsValid(adrg_requestor) Then
	Return -1
End If

// Invalidate references.
idrg_requestor = ldrg_notvalid
idw_requestor = ldrg_notvalid
iem_requestor = ldrg_notvalid

// Is this object behaving as a dropdown object.
If IsValid(inv_dropdown) Then
	lb_dropdownbehavior = True
End If

// Make sure it is one of the expected type and get the 
// parent window reference.
CHOOSE CASE TypeOf(adrg_requestor)
	CASE DataWindow!
		If Not lb_dropdownbehavior Then
			// Not supported for datawindow controls.
			Return -2
		End If		
		idw_requestor = adrg_requestor
	CASE EditMask!
		lem_testonly = adrg_requestor
		If lem_testonly.MaskDataType <> DateMask! Then
			Return -3
		End If
		iem_requestor = adrg_requestor
		If Not lb_dropdownbehavior Then
			// Field cannot be typed on.
			iem_requestor.DisplayOnly = True
			// Set initial value.
			of_Reset()
		End If						
	CASE ELSE
		Return -1
END CHOOSE

// Set the generic reference.
idrg_requestor = adrg_requestor

Return 1
end function

public function integer of_setholiday (date ad_dates[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetHoliday
//
//	Access:    	Public
//
//	Arguments:
//		ad_dates[]  The holidays.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1
//
//	Description:  	Sets the Holidays of the calendar.
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

// Check the argument.
If IsNull(ad_dates) Then
	Return -1
End If

id_holiday = ad_dates
Return 1
end function

public function integer of_setmarkedday (date ad_dates[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetMarkedDay
//
//	Access:    	Public
//
//	Arguments:
//		ad_dates[]	The Marked dates.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1
//
//	Description:  	Sets the Marked days for the calendar.
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


// Check the argument.
If IsNull(ad_dates) Then
	Return -1
End If

id_markedday = ad_dates
Return 1
end function

public function integer of_setholidaycolor (long al_color);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetHolidayColor
//
//	Access:    	Public
//
//	Arguments:
//		al_color Text Color for the holidays.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1
//
//	Description:  	Sets the Holiday text color for the calendar.
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

// Check the argument.
IF IsNull(al_color) THEN 
	Return -1
End If

il_holidaycolor = al_color

Return 1
end function

public function integer of_SetMarkeddayBold (boolean ab_bold);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetMarkeddayBold
//
//	Access:    	Public
//
//	Arguments:
//		ab_bold	True or False
//
//	Returns:   	Integer
//   				1 if successful, otherwise -1
//
//	Description:  	Sets the Bold attribute for the Marked dates.
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

// Check the argument.
IF IsNull(ab_bold) THEN 
	Return -1
End If

ib_markeddaybold = ab_bold

Return 1
end function

public function integer of_SetMarkedDayColor (long al_color);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetMarkedDayColor
//
//	Access:    	Public
//
//	Arguments:
//		al_color Text Color for the Marked dates.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1
//
//	Description:  	Sets the Marked date text color for the calendar.
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

// Check the argument.
IF IsNull(al_color) THEN 
	Return -1
End If

il_markeddaycolor = al_color

Return 1
end function

public function integer of_SetSaturdayBold (boolean ab_bold);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetSaturdayBold
//
//	Access:    	Public
//
//	Arguments:
//		ab_bold	True or False
//
//	Returns:   	Integer
//   				1 if successful, otherwise -1
//
//	Description:  	Sets the Bold attribute for the Saturday dates.
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

// Check the argument.
IF IsNull(ab_bold) THEN 
	Return -1
End If

ib_saturdaybold = ab_bold

Return 1
end function

public function integer of_SetSaturdayColor (long al_color);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetSaturdayColor
//
//	Access:    	Public
//
//	Arguments:
//		al_color Text Color for the Saturday dates.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1
//
//	Description:  	Sets the Saturday date text color for the calendar.
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

// Check the argument.
IF IsNull(al_color) THEN 
	Return -1
End If

il_saturdaycolor = al_color

Return 1
end function

public function integer of_SetSundayBold (boolean ab_bold);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetSundayBold
//
//	Access:    	Public
//
//	Arguments:
//		ab_bold	True or False
//
//	Returns:   	Integer
//   				1 if successful, otherwise -1
//
//	Description:  	Sets the Bold attribute for the Sunday dates.
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

// Check the argument.
IF IsNull(ab_bold) THEN 
	Return -1
End If

ib_sundaybold = ab_bold

Return 1
end function

public function integer of_SetSundayColor (long al_color);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetSundayColor
//
//	Access:    	Public
//
//	Arguments:
//		al_color Text Color for the Sunday dates.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1
//
//	Description:  	Sets the Sunday date text color for the calendar.
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

// Check the argument.
IF IsNull(al_color) THEN 
	Return -1
End If

il_sundaycolor = al_color

Return 1
end function

public function integer of_setholidaybold (boolean ab_bold);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetHolidayBold
//
//	Access:    	Public
//
//	Arguments:
//		ab_bold	True or False
//
//	Returns:   	Integer
//   				1 if successful, otherwise -1
//
//	Description:  	Sets the Bold attribute for the Holiday dates.
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

// Check the argument.
IF IsNull(ab_bold) THEN 
	Return -1
End If

ib_holidaybold = ab_bold

Return 1
end function

public function boolean of_IsHolidayBold ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_IsHolidayBold
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   	Bold
//					True if dates are bolded.
//
//	Description:  	Gets the Bold attribute for the Holiday dates.
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

Return ib_holidaybold
end function

public function boolean of_IsMarkeddayBold ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_IsMarkeddayBold
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   	Bold
//					True if dates are bolded.
//
//	Description:  	Gets the Bold attribute for the Marked dates.
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

Return ib_markeddaybold
end function

public function boolean of_IsSundayBold ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_IsSundayBold
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   	Bold
//					True if dates are bolded.
//
//	Description:  	Gets the Bold attribute for the Sunday dates.
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

Return ib_sundaybold
end function

public function boolean of_IsSaturdayBold ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_IsSaturdayBold
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   	Bold
//					True if dates are bolded.
//
//	Description:  	Gets the Bold attribute for the Saturday dates.
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

Return ib_saturdaybold
end function

public function long of_GetHolidayColor ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_GetHolidayColor
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   Long
//   	The text color.
//
//	Description:  Gets the Holiday text color for the calendar.
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

Return il_holidaycolor
end function

public function long of_GetMarkeddayColor ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_GetMarkeddayColor
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   Long
//   	The text color.
//
//	Description:  Gets the Marked dates text color for the calendar.
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

Return il_markeddaycolor
end function

public function long of_GetSaturdayColor ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_GetSaturdayColor
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   Long
//   	The text color.
//
//	Description:  Gets the Saturday dates text color for the calendar.
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

Return il_saturdaycolor
end function

public function long of_GetSundayColor ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_GetSundayColor
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   Long
//   	The text color.
//
//	Description:  Gets the Sunday dates text color for the calendar.
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

Return il_sundaycolor
end function

public function integer of_getholiday (ref date ad_dates[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_GetHoliday
//
//	Access:    	Public
//
//	Arguments:
//		ad_dates[]  The holidays by reference.
//
//	Returns:   		Integer
//   					The number of dates on the array.
//
//	Description:  	Gets the Holidays.
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

ad_dates = id_holiday

Return UpperBound(ad_dates)
end function

public function integer of_getmarkedday (ref date ad_dates[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_GetMarkedday
//
//	Access:    	Public
//
//	Arguments:
//		ad_dates[]  The Marked days by reference.
//
//	Returns:   		Integer
//   					The number of dates on the array.
//
//	Description:  	Gets the Marked days.
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

ad_dates = id_markedday

Return UpperBound(ad_dates)
end function

public function integer of_setcloseonclick (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetCloseOnClick
//
//	Access:    	Public
//
//	Arguments:
//   ab_switch  A switch that determines when to close the calendar object.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1
//
//	Description:  	Sets the switch that determines when to close the 
//						calendar object.
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

// Check to see if the passed style number is valid.
IF IsNull(ab_switch) THEN 
	Return -1
End If

ib_closeonclick = ab_switch
Return 1
end function

public function integer of_setcloseondclick (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SeCloseOnDClick
//
//	Access:    	Public
//
//	Arguments:
//   ab_switch  A switch that determines when to close the calendar object.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1
//
//	Description:  	Sets the switch that determines when to close the 
//						calendar object.   "DoubleClick"
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

// Check to see if the passed style number is valid.
IF IsNull(ab_switch) THEN 
	Return -1
End If

ib_closeondclick = ab_switch
Return 1
end function

public function integer of_setdateformat (string as_format);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetDateFormat
//
//	Access:    Public
//
//	Arguments:
//   as_format	The format to be used on dates being converted to strings..
//
//	Returns:  Integer
//		1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  Sets the date format.
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

// Validate argument.
If IsNull(as_format) or Len(Trim(as_format))=0 Then
	Return -1
End If

// Validate Reference.
If IsNull(idrg_requestor) or Not IsValid(idrg_requestor) Then
	Return -1
End If

is_dateformat = as_format
Return 1
end function

public function integer of_getregistered (ref string as_dwcolumns[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_GetRegistered
//
//	Access:  		public
//
//	Arguments:
//	as_dwcolumns[]	Columns names for which the service is providing a calendar 
//						(by reference)
//
//	Returns:  		integer
//						The number of entries in the returned array.
//
//	Description:  	This function returns the column names for which the service 
//						is providing calendar capabilities.
//
//		*Note:	Function is only valid when serving a DataWindow control.
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
integer	li_style[]

Return of_GetRegistered(as_dwcolumns, li_style)
end function

public function boolean of_isregistered (string as_dwcolumn);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsRegistered
//
//	Access:  		Public.
//
//	Arguments:
//	as_dwcolumn		The registered column to search for.
//
//	Returns:  		boolean
//						True or False depending if the column is already registered.
//
//	Description: 	This function is called to determine if the passed in 
//						column name has already been registered with the service.
//
//		*Note:	Function is only valid when serving a DataWindow control.
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
integer	li_count
integer	li_i

// Check arguments
If IsNull(as_dwcolumn) Or Len(Trim(as_dwcolumn))=0 Then 
	Return False
End If

// Validate the references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return False
End If

// Trim and Convert to lower case.
as_dwcolumn = Trim(Lower(as_dwcolumn))

// Find column name.
li_count = upperbound(is_dwcolumns)
For li_i=1 To li_count
	If is_dwcolumns[li_i] = as_dwcolumn THEN
		// Column name was found.
		Return True
	end if
Next

// Column name not found in array.
Return False
end function

protected function integer of_setfocusonrequestor ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetFocusOnRequestor
//
//	Access:    Protected
//
//	Arguments:	None
//
//	Returns:  Integer
//		1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  Sets the focus on the requestor.
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

// Validate Reference.
If IsNull(idrg_requestor) or Not IsValid(idrg_requestor) Then 
	Return -1
End If

Return idrg_requestor.SetFocus()
end function

public function integer of_register ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Register
//
//	Access: 			public
//
//	Arguments:		None.
//
//	Returns: 		integer
//						The number of columns registered.
//						-1 if an error is encountered.
//
//	Description:	
//	Register all the appropriate columns that are holding date fields.
// This version should only be called when "ALL" date columns are desired, 
// otherwise call the version which accepts a column name as an argument.
//	Columns need to be of editstyle 'ddlb', 'edit' or 'editmask'.
//
//		*Note:	For a column to be added it most have a field of type Date.
//		*Note:	Function is only valid when serving a DataWindow control.
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

// Use the NONE as a default.
Return of_Register(NONE)
end function

public function integer of_register (string as_dwcolumn);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Register
//
//	Access:  		public
//
//	Arguments:
//	 as_dwcolumn	Column to register.
//
//	Returns:  		Integer
//						1 if the column was added.
//						0 if the column was not added.
//						-1 if an error is encountered.
//
//	Description: 	
//	 Register the column which should be holding a date field.
//	 Columns need to be of editstyle 'ddlb', 'edit' or 'editmask'.
//
//		*Note:	For a column to be added it most have a field of type Date.
//		*Note:	Function is only valid when serving a DataWindow control.
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

// Use the NONE default.
Return of_Register(as_dwcolumn, NONE)
end function

protected function boolean of_isdatetype (string as_type);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsDateType
//
//	Access: 			Protected
//
//	Arguments:
//	 as_type			The type to test for.
//
//	Returns: 		Boolean
//						True if the parameter is of type 'date'.
//
//	Description:	Determines if the passed in type is of type date.
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
boolean lb_date

// Check the required argument.
If IsNull(as_type) Then
	Return False
End If

lb_date = ((as_type = 'date') or (as_type = 'datetime'))
Return lb_date

end function

public function integer of_setdropdown (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Event:  of_SetDropDown
//
//	Arguments:
//	ab_switch   starts/stops the UserObject DropDown service
//
//	Returns:  integer
//	 1 = Successful operation.
//	 0 = No action necessary
//	-1 = An error was encountered
//
//	Description:
//	Starts or stops the UserObject DropDown service
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

integer	li_rc

// Check arguments.
if IsNull (ab_switch) then return -1

if ab_Switch then
	if IsNull(inv_dropdown) Or not IsValid (inv_dropdown) then
		inv_dropdown = create n_cst_dropdown
		inv_dropdown.of_SetRequestor (this)
		li_rc = 1
	end if
else
	if IsValid (inv_dropdown) then

		destroy inv_dropdown
		li_rc = 1
	end if
end if

return li_rc
end function

public function integer of_register (string as_dwcolumn, integer ai_style);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Register
//
//	Access:  		public
//
//	Arguments:
//	 as_dwcolumn	Column to register.
//	 ai_style		The columnstyle.
//
//	Returns:  		Integer
//						1 if the column was added.
//						0 if the column was not added.
//						-1 if an error is encountered.
//
//	Description: 	
//	 Register the column which should be holding a date field.
//	 Columns need to be of editstyle 'ddlb', 'edit' or 'editmask'.
//
//		*Note:	For a column to be added it most have a field of type Date.
//		*Note:	Function is only valid when serving a DataWindow control.
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
integer 		li_cnt, li_rc
integer		li_availableentry
integer		li_upperbound
string		ls_coltype
string		ls_modexp
string		ls_descexp
string		ls_descret
string		ls_editstyle
string		ls_storemodify=''
string		ls_rc

// Check the required reference.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If

// Check arguments
If (IsNull(as_dwcolumn) Or Len(Trim(as_dwcolumn))=0) Or &
	(ai_style < NONE or ai_style >  DDLB_WITHARROW) Or &
	IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then 
	Return -1
End If

// Trim and Convert to lower case.
as_dwcolumn = Trim(Lower(as_dwcolumn))

// Check if the column is already registered.
If of_IsRegistered(as_dwcolumn) Then
	Return 0
End If

// Get the column type.
ls_coltype = idw_requestor.Describe(as_dwcolumn+".coltype")
If of_IsDateType(ls_coltype) Then

	// Get the upperbound of all registered columns.
	li_upperbound = upperbound(is_dwcolumns)
	
	// Determine if there is an open slot available other than a
	// new entry on the array
	For li_cnt = 1 to li_upperbound
		If IsNull(is_dwcolumns[li_cnt]) or Len(Trim(is_dwcolumns[li_cnt])) = 0 Then
			If li_availableentry = 0 Then
				//Get the first slot found
				li_availableentry = li_cnt
				Exit
			End If
		End If
	Next
	//If an available slot was not found then create a new entry
	If li_availableentry = 0 Then
		li_availableentry = li_upperbound + 1
	End If
		
	// Add/Initilize the new entry.				
	is_dwcolumns[li_availableentry] = as_dwcolumn
	ii_dwcolumnstyle[li_availableentry] = ai_style
	is_dwcolumnsexp[li_availableentry] = ''
	
	If ai_style = DDLB Or ai_style = DDLB_WITHARROW Then	

		// Store the Modify expression needed to unregister the column.
		ls_editstyle = idw_requestor.Describe (as_dwcolumn+".Edit.Style")
		CHOOSE CASE Lower(ls_editstyle)
			CASE 'edit'
				ls_descret = idw_requestor.Describe (as_dwcolumn+".Edit.Required")
				If ls_descret = 'yes' or ls_descret = 'no' Then
					ls_storemodify += as_dwcolumn+".Edit.Required=" + ls_descret + " "
					ls_modexp = as_dwcolumn+".DDLB.Required=" + ls_descret + " "
				End If			
				ls_descret = idw_requestor.Describe (as_dwcolumn+".Edit.NilIsNull")				
				If ls_descret = 'yes' or ls_descret = 'no' Then
					ls_storemodify += as_dwcolumn+".Edit.NilIsNull=" + ls_descret + " "				
					ls_modexp += as_dwcolumn+".DDLB.NilIsNull=" + ls_descret + " "
				End If					
			CASE 'editmask'
				ls_descret = idw_requestor.Describe (as_dwcolumn+".EditMask.Mask")
				If ls_descret = '!' or ls_descret = '?' Then
					ls_storemodify += as_dwcolumn+".EditMask.Mask='' "		
				Else
					ls_storemodify += as_dwcolumn+".EditMask.Mask='" + ls_descret + "' "				
				End If						
				ls_descret = idw_requestor.Describe (as_dwcolumn+".EditMask.Required")
				If ls_descret = 'yes' or ls_descret = 'no' Then
					ls_storemodify += as_dwcolumn+".EditMask.Required=" + ls_descret + " "				
					ls_modexp = as_dwcolumn+".DDLB.Required=" + ls_descret + " "
				End If			
				ls_descret = idw_requestor.Describe (as_dwcolumn+".EditMask.NilIsNull")				
				If ls_descret = 'yes' or ls_descret = 'no' Then
					ls_storemodify += as_dwcolumn+".EditMask.NilIsNull=" + ls_descret + " "				
					ls_modexp += as_dwcolumn+".DDLB.NilIsNull=" + ls_descret + " "
				End If					
			CASE 'ddlb'
				ls_descret = idw_requestor.Describe (as_dwcolumn+".DDLB.useasborder")	
				If ls_descret = 'yes' or ls_descret = 'no' Then
					ls_storemodify = as_dwcolumn+".DDLB.useasborder=" + ls_descret + " "	
				End If			
			CASE Else
				// Not a valid original edit style.
				Return -1
		END CHOOSE
			
		// Store the Modify statement that allows unregister.
		is_dwcolumnsexp[li_availableentry] = ls_storemodify		
		
		// Convert to DDLB.
		ls_modexp += as_dwcolumn+".DDLB.limit=0 " + &
						 as_dwcolumn+".DDLB.AllowEdit=Yes " 
		ls_rc = idw_requestor.Modify (ls_modexp)
		If Len(ls_rc) > 0 Then Return -1

		If ai_style = DDLB_WITHARROW Then		
			ls_modexp =	as_dwcolumn+".DDLB.useasborder=Yes " 
			ls_rc = idw_requestor.Modify (ls_modexp)	
			If Len(ls_rc) > 0 Then Return -1			
		End If
	End If	
	
	// The column was registered.
	Return 1
End If	

// The column was not registered.
Return 0
end function

public function integer of_register (integer ai_style);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Register
//
//	Access: 			public
//
//	Arguments:		
//	 ai_style		The style for all the columns.
//
//	Returns: 		integer
//						The number of columns registered.
//						-1 if an error is encountered.
//
//	Description:	
//	Register all the appropriate columns that are holding date fields.
// This version should only be called when "ALL" date columns are desired, 
// otherwise call the version which accepts a column name as an argument.
//	Columns need to be of editstyle 'ddlb', 'edit' or 'editmask'.
//
//		*Note:	For a column to be added it most have a field of type Date.
//		*Note:	Function is only valid when serving a DataWindow control.
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
integer		li_colcount, li_i, li_count, li_rc
string		ls_colname
string		ls_coltype
string		ls_editstyle

// Check the arguments.
If	(ai_style < NONE or ai_style >  DDLB_WITHARROW)  Then
	Return -1
End If

// Check the required reference.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If

// Get the number of columns in the datawindow object
li_colcount = integer(idw_requestor.object.datawindow.Column.Count)

// Loop around all columns looking for date columns.
For li_i=1 to li_colcount
	//Get-Validate the name and column type of the column.
	ls_colname = idw_requestor.Describe("#"+string(li_i)+".Name")
	ls_coltype = idw_requestor.Describe("#"+string(li_i)+".ColType")	
	ls_editstyle = idw_requestor.Describe ("#"+string(li_i)+".Edit.Style")
	If ls_coltype = '!' or ls_colname = '!' or ls_editstyle = '!' Then 
		Return -1	
	End If
	
	If ls_editstyle = 'ddlb' or ls_editstyle='edit' or ls_editstyle='editmask' Then
		If of_IsDateType(ls_coltype) Then
			// Add entry into array.
			li_rc = of_Register(ls_colname, ai_style)
		End If
	End If
Next

Return upperbound(is_dwcolumns)
end function

public function integer of_unregister (string as_dwcolumn);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UnRegister
//
//	Access:  		Public.
//
//	Arguments:
//	as_dwcolumn		The registered column to search for.
//
//	Returns:  		Integer
//	1 successful.
// 0 not previously registered.
//	-1 error.
//
//	Description: 	
//	 UnRegisters the object from the service by the column name.
//
//		*Note:	Function is only valid when serving a DataWindow control.
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

Integer	li_upper
Integer	li_cnt
String	ls_rc
Constant String EMPTY=''

// Check for a valid ID.
If IsNull(as_dwcolumn) or Len(Trim(as_dwcolumn))= 0  Then
	Return -1
End If

// Trim and Convert to lower case.
as_dwcolumn = Trim(Lower(as_dwcolumn))

// Find the Column.
li_upper = UpperBound(is_dwcolumns)
For li_cnt = 1 to li_upper
	If as_dwcolumn = is_dwcolumns[li_cnt] Then 
		// The entry has been found.  
		// Clear out any attribute changes.
		If Len(is_dwcolumnsexp[li_cnt]) > 0 Then
			ls_rc = idw_requestor.Modify (is_dwcolumnsexp[li_cnt])	
			If Len(ls_rc) > 0 Then 
				Return -1			
			End If
		End If

		// Perform the actual Unregister.
		is_dwcolumns[li_cnt] = EMPTY
		is_dwcolumnsexp[li_cnt]= EMPTY
		ii_dwcolumnstyle[li_cnt]= 0
		
		Return 1
	End If
Next

// The column was not found.
Return 0
end function

public function boolean of_IsCloseOnClick ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_IsCloseOnClick
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   	Boolean
//  True / False
//
//	Description:  	
//		Helps in determining when it is ok to close the object. "Single Click"
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

Return ib_closeonclick
end function

public function boolean of_IsCloseOnDClick ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_IsCloseOnDClick
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   	Boolean
//  True / False
//
//	Description:  	
//		Helps in determining when it is ok to close the object. "Double Click"
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

Return ib_closeondclick 
end function

public function integer of_getregistered (ref string as_dwcolumns[], ref integer ai_dwcolumnstyle[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_GetRegistered
//
//	Access:  		public
//
//	Arguments:
//	as_dwcolumns[]	Columns names for which the service is providing a calendar 
//						(by reference)
//	ai_dwcolumnstyle[] The style for the columns (by reference)
//
//	Returns:  		integer
//						The number of entries in the returned array(s).
//
//	Description:  	This function returns the column names for which the service 
//						is providing calendar capabilities.  It also returns the style.
//
//		*Note:	Function is only valid when serving a DataWindow control.
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
integer 	li_i
integer	li_loop
integer	li_upper
integer	li_cnt
string	ls_empty[]
integer	li_empty[]

// Initialize strings.
as_dwcolumns = ls_empty
ai_dwcolumnstyle = li_empty

// Validate the references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If

// Loop around all entries and populate arrays with columnnames and style.
li_upper = upperbound(is_dwcolumns)
For li_i=1 To li_upper
	If Len(is_dwcolumns[li_i]) > 0 Then
		li_cnt ++
		as_dwcolumns[li_cnt] = is_dwcolumns[li_i]
		ai_dwcolumnstyle[li_cnt] = ii_dwcolumnstyle[li_i]
	End If
Next

Return UpperBound(as_dwcolumns)
end function

public function integer of_getregisteredstyle (string as_dwcolumn);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetRegisteredStyle
//
//	Access:  		Public.
//
//	Arguments:
//	as_dwcolumn		The registered column to search for.
//
//	Returns:  		integer
//		The style for the column passed in.
//		0 if the column is not registered.
//		-1 if an error is encountered.
//
//	Description: 	
//	 This function is called to determine the style of the column name passed in.
//
//		*Note:	Function is only valid when serving a DataWindow control.
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
integer	li_count
integer	li_i

// Check arguments
If IsNull(as_dwcolumn) Or Len(Trim(as_dwcolumn))=0 Then 
	Return 0
End If

// Validate the references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If

// Trim and Convert to lower case.
as_dwcolumn = Trim(Lower(as_dwcolumn))

// Find column name.
li_count = upperbound(is_dwcolumns)
For li_i=1 To li_count
	If is_dwcolumns[li_i] = as_dwcolumn THEN
		// Column name was found.
		Return ii_dwcolumnstyle[li_i]
	end if
Next

// Column name not found in array.
Return 0
end function

protected function integer of_dropdown ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_DropDown
//
//	Access:    Protected
//
//	Arguments:	None
//
//	Returns:  Integer
//		1 if it succeeds
//		-1 if an error occurs.
//		0 if the current datawindow column has not been registered.
//
//	Description:  
//		Drop Down the Calendar after getting the appropriate location.
//		For datawindow columns check that the current column has 
//		been registered.
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
Integer 	li_rc
String	ls_colname
Integer	li_x
Integer	li_y

// Check the required references.
If IsNull(inv_dropdown) or Not IsValid(inv_dropdown) or &
	IsNull(idrg_requestor) or Not IsValid(idrg_requestor) Then
	Return -1
End If

// Datawindow control specific checks.
If IsValid(idw_requestor) Then
	// Get the current column name.
	ls_colname = idw_requestor.GetColumnName()

	// Check if column is in the search column array.
	If Not of_IsRegistered(ls_colname) Then
		Return 0
	End If

	// Validate that it is still a date column.
	If Not of_IsDateType(idw_requestor.Describe(ls_colname+".coltype")) Then
		Return -1
	End If
End If

// Set this object on its new Position.
li_rc = inv_dropdown.of_Position(idrg_requestor, False)
If li_rc < 0 Then Return -1

// Set the calendar to the appropriate date.
of_Reset()

// Show the object.
This.Visible = True	

Return 1

end function

public function integer of_unregister ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UnRegister
//
//	Access:  		Public.
//
//	Arguments:		None
//
//	Returns:  		Integer
//	1 successful.
// 0 nothing previously registered.
//
//	Description: 	
//	 UnRegisters all registerd columns from the service.
//
//		*Note:	Function is only valid when serving a DataWindow control.
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

Integer	li_upper
Integer	li_cnt
Integer	li_unregistered = 0

// Loop around all registered columns.
li_upper = UpperBound(is_dwcolumns)
For li_cnt = 1 to li_upper
	If Len(is_dwcolumns[li_cnt]) > 0 Then
		If of_Unregister(is_dwcolumns[li_cnt]) = 1 Then
			li_unregistered ++
		End If
	End If
Next

If li_unregistered > 0 Then
	Return 1
End If
	
Return 0
end function

protected function integer of_redirectfocus ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RedirectFocus
//
//	Access:    Protected
//
//	Arguments:	None
//
//	Returns:  Integer
//	1 if it succeeds.
//	-1 if an error occurs.
//
//	Description:  
//	Prevent this object from having focus while not visible.
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

// Prevent this object from having focus while not visible.
If this.Visible = False Then
	Return of_SetFocusOnRequestor()
End If

Return 1
end function

public function integer of_setalwaysredraw (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetAlwaysRedraw
//
//	Access:    	Public
//
//	Arguments:
//		ab_switch	True or False
//
//	Returns:   	Integer
//   				1 if successful, otherwise -1
//
//	Description:  	
//	Sets the attribute which can force a redraw of the calendar month at various
// times.
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

// Check the argument.
IF IsNull(ab_switch) THEN 
	Return -1
End If

ib_alwaysredraw = ab_switch
Return 1
end function

public function boolean of_isalwaysredraw ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_IsAlwaysRedraw
//
//	Access:    	Public
//
//	Arguments:
//		ab_switch	True or False
//
//	Returns:   	Boolean
//   True /False
//
//	Description:  	
//	Reports on the attribute which forces a redraw of the calendar month at various
// times.
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

Return ib_alwaysredraw
end function

public function integer of_GetRegisterable (ref string as_allcolumns[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetRegisterable
//
//	Access:  		public
//
//	Arguments:
//	as_allcolumns[] By Reference.  All columns belonging to the requestor which
//						could be registered.
//
//	Returns:  		Integer
//	 The column count.
//	-1 if an error is encountered.
//
//	Description:
//	 Determines all columns belonging to the requestor which could be registered.
//
//		*Note:	Function is only valid when serving a DataWindow control.
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

integer		li_colcount, li_i
integer		li_count
string		ls_coltype
string		ls_colname
string		ls_editstyle
string		ls_allcolumns[]

// Initialize.
as_allcolumns = ls_allcolumns

// Validate required reference.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If

// Get the number of columns in the datawindow object
li_colcount = integer(idw_requestor.object.datawindow.Column.Count)

// Loop around all columns looking for Date columns.
For li_i=1 to li_colcount
	ls_coltype = idw_requestor.Describe("#"+string(li_i)+".coltype")
	ls_editstyle = idw_requestor.Describe ("#"+string(li_i)+".Edit.Style")

	If ls_editstyle = 'ddlb' or ls_editstyle='edit' or ls_editstyle='editmask' Then
		If of_IsDateType(ls_coltype) Then	
			ls_colname = idw_requestor.Describe("#"+string(li_i)+".Name")

			// Add entry into array.
			li_count = upperbound(ls_allcolumns) +1
			ls_allcolumns[li_count] = ls_colname		
		End If
	End If
	
Next

as_allcolumns = ls_allcolumns
Return UpperBound(as_allcolumns)

end function

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
anv_infoattrib.is_name = 'Calendar'
anv_infoattrib.is_description = &
	'Provides Datawindows and EditMask date fields with Calendar functionality.'

Return 1
end function

public function integer of_SetInitialValue (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetInitialValue
//
//	Access:    	Public
//
//	Arguments:
//   ab_switch  A switch that determines if todays date should be set on the
//					requestor when an invalid date or no date is found on the requestor.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1
//
//	Description:  	
// Sets the switch that determines if an initial (todays date) value should be used 
// when an initial invalid value or no value is found on the requestor.
//
// *Note: The main behavior change through this attribute is in the row/column status.
//		For example,
//		A) The attribute is set to True.
//			1) The calendar is requested on a field that has no date.
//			2) The calendar dropsdown with todays date showing.
//			3) The field also displays todays date.  This means the column status may
//				be changed.  One possibility is from NotModified! to Modified!.
//		B) The attribute is set to False.
//			1) The calendar is requested on a field that has no date.
//			2) The calendar dropsdown with todays date showing.
//			3) The field continues to display empty.  This means the column status 
//				has not changed.
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

// Check to see if the passed style number is valid.
IF IsNull(ab_switch) THEN 
	Return -1
End If

ib_initialvalue = ab_switch
Return 1
end function

public function boolean of_IsInitialValue ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_IsInitialValue
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   	Boolean
//
//	Description: 
// Gets the switch that determines if an initial (todays date) value should be used 
// when an initial invalid value or no value is found on the requestor.
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

Return ib_initialvalue

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

// Set the rest of the attributes.
anv_attrib.is_propertypage = {'u_tabpg_dwproperty_srvcalendar', &
	'u_tabpg_dwproperty_srvcalendar2'}
anv_attrib.ib_switchbuttons = True

Return 1
end function

protected function integer of_reset ();//////////////////////////////////////////////////////////////////////////////
//	Protected Function:  	of_Reset
//	Arguments:				None.
//	Returns:  				Integer - 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//	Description: 			Resets the calendar visual date according to the requestor date.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							6.0		Initial version
// 						7.0 		On invalid date set the reset date to Null
//							8.0		Change to conversion service to convert date when datetype is datetime
//							12.5		RU: No ColType check (Issue #12132)
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
string				ls_date, ls_colname
Integer				li_FirstDayNum, li_Cell, li_DaysInMonth
String				ls_Year, ls_Return
Date					ld_FirstDay
Integer 				li_month
Integer 				li_year
Integer 				li_day
n_cst_conversion	lnv_conv

// Validate Reference.
If IsValid(idw_requestor) Or IsValid(iem_requestor) Then
	// Good reference.
Else
	Return -1
End If

// Get the current date from the requesting object.
If IsValid(idw_requestor) Then
	ls_date = idw_requestor.GetText()
ElseIf IsValid(iem_requestor) Then
	ls_date = iem_requestor.Text
Else
	Return -1
End If

// Bring focus on the calendar.
SetFocus(this)
SetFocus(dw_cal)

// Validate the date .
// Keep track if the date was valid or not.
if Len(Trim(ls_date)) = 0 or IsNull(ls_date) or NOT IsDate( String ( Date ( ls_date ) ) ) then
	SetNull(id_resetdate)
else
	id_resetdate = lnv_conv.of_date(ls_date)
end if


If inv_datetime.of_IsValid(id_resetdate) Then
	// Set the new date.  Do not Update the requestor.
	of_SetDate(id_resetdate, False)
Else
	// Set the new date.  The requestor is/is_not updated according to the 
	// attribute.
	of_SetDate(Today(), ib_initialvalue)
End If

Return 1
end function

protected function integer of_drawmonth (date ad_date);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_DrawMonth
//
//	Access:    Protected
//
//	Arguments:
// 	ad_date A Date containing the month to draw.
//
//	Returns:  Integer
//		1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  Draws the requested month.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//	7.0	Removed an invalid comparison to date($$HEX1$$1820$$ENDHEX$$50/50/1900$$HEX1$$1920$$ENDHEX$$)).  The comparison 
//			is no longer needed.  Post 5.0.03 PowerBuilder date type cannot contain 
//			an  invalid date with an exception of a null value.
//	12.5	Use the value for first week day from registry (#11004)
//			
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

Integer 	li_month
Integer 	li_year
Integer 	li_day
Integer	li_loop, li_daycount
Integer	li_upperbound
Integer  li_FirstDayNum, li_cell, li_daysinmonth
Integer	li_days[12]={31,28,31,30,31,30,31,31,30,31,30,31}
Date		ldt_special
String	ls_monthname
String	ls_cell
Integer	li_weight
String	ls_modifyexp
Date		ldt_holiday[], ldt_markedday[]
Boolean  lb_sundaybold, lb_saturdaybold, lb_holidaybold, lb_markeddaybold
Long		ll_sundaycolor, ll_saturdaycolor, ll_holidaycolor, ll_markeddaycolor
Integer	li_x, li_minx, li_firstweekdaynum
String	ls_weekdaytext[7] = {"t_sunday", "t_monday", "t_tuesday", "t_wednesday", &
										"t_thursday", "t_friday", "t_saturday"}

// read first day of week from registry (#11004)
IF RegistryGet ("HKEY_CURRENT_USER\Control Panel\International", "iFirstDayOfWeek", ls_cell) <> 1 THEN
	ls_cell = "0"
END IF
// and convert the value from registry (0 = monday) for powerbuilder (1 = sunday)
li_firstweekdaynum = Mod (Integer (ls_cell) + 1, 7) + 1


//Get appropriate information.
of_GetHoliday(ldt_holiday)
of_GetMarkedday(ldt_markedday)
lb_sundaybold = of_IsSundayBold()
lb_saturdaybold = of_IsSaturdayBold()
lb_holidaybold = of_IsHolidayBold()
lb_markeddaybold = of_IsMarkeddayBold()
ll_sundaycolor = of_GetSundayColor()
ll_saturdaycolor = of_GetSaturdayColor()
ll_holidaycolor = of_GetHolidayColor()
ll_markeddaycolor = of_GetMarkeddayColor()		


// change position of week days if necessary (#11004)
// get position and first week day in datawindow
li_minx = Integer (dw_cal.Describe (ls_weekdaytext[1] + ".X"))
li_day = 1
FOR li_loop = 2 TO 7
	li_x = Integer (dw_cal.Describe (ls_weekdaytext[li_loop] + ".X"))
	IF li_x < li_minx THEN
		li_minx = li_x
		li_day = li_loop
	END IF
NEXT
// if the first week day in datawindow is not the right one
IF li_day <> li_firstweekdaynum THEN
	// change position of week days
	FOR li_loop = 1 TO 7
		li_x = Integer (dw_cal.Describe ("cell" + String (Mod (7 + li_loop - li_firstweekdaynum, 7) + 1) + ".X"))
		ls_modifyexp += ls_weekdaytext[li_loop] + ".X=" + string (li_x) + " "
	NEXT
	dw_cal.Modify (ls_modifyexp)
	ls_modifyexp = ""
END IF


// Check the argument(s).
If IsNull(ad_date) Then
	Return -1
End If			 
							 
//Set Pointer to an Hourglass and turn off redrawing of Calendar
SetPointer(Hourglass!)
SetRedraw(dw_cal,FALSE)

//Initialize local values.
li_year = Year(ad_date)
li_month = Month(ad_date)
li_day = Day(ad_date)

//If appropriate, insert a row into the script datawindow
If dw_cal.RowCount()=0 Then
	dw_cal.InsertRow(0)
ElseIf dw_cal.RowCount()> 0 Then
	dw_cal.Reset()
	dw_cal.InsertRow(0)
End If

//Set the Title.
ls_monthname = inv_datetime.of_MonthName(li_month)
dw_cal.Object.st_month.text = ls_monthname + " " + string(li_year)

//--Determine the number of days in the month.--
// Get the number of days per month for a non leap year.
li_daysinmonth = li_days[li_month]
// Check for a leap year.
If li_month=2 Then
	If ( (Mod(li_year,4) = 0 And Mod(li_year,100) <> 0) Or (Mod(li_year,400) = 0) ) Then
		li_daysinmonth = 29
	End If
End If

//-- Update the DataWindow object to display the desired month --.
//Find the weekday for the first day in the month.
li_FirstDayNum = Mod (7 + DayNumber(Date(li_year, li_month, 1)) - li_firstweekdaynum, 7) + 1
//Blank cells prior to the first day of the month.
For li_loop = 1 to li_FirstDayNum
	dw_cal.SetItem(1,li_loop,"")
Next
//Set the day number on the the appropriate cells.
For li_loop = 1 to li_daysinmonth
	li_daycount = li_FirstDayNum + li_loop - 1
	dw_cal.SetItem(1,li_daycount,String(li_loop))
Next
//Blank cells after the last day of the month.
For li_loop = li_daycount +1 to 42 
	dw_cal.SetItem(1,li_loop,"") 
Next

// Restore all cells back to default color and fontweight.
ls_modifyexp = ''
For li_loop = 1 to 42
	ls_modifyexp += "cell"+string(li_loop)+".Color='"+string(il_fontcolor)+"' " + &
						 "cell"+string(li_loop)+".Font.Weight='"+string(ii_normalfontweight)+"' "
Next
dw_cal.Modify(ls_modifyexp)

// Mark Sundays.
ls_modifyexp = ''
If lb_sundaybold Then li_weight = ii_boldfontweight &
						Else li_weight = ii_normalfontweight
For li_loop = 1 to 36 step 7
	ls_modifyexp += "cell"+string(Mod (7 + li_loop - li_firstweekdaynum, 7) + li_loop)+".Color='"+string(ll_sundaycolor)+"' " + &
						 "cell"+string(Mod (7 + li_loop - li_firstweekdaynum, 7) + li_loop)+".Font.Weight='"+string(li_weight)+"' "
Next
dw_cal.Modify(ls_modifyexp)

// Mark Saturdays.
ls_modifyexp = ''
If lb_saturdaybold Then li_weight = ii_boldfontweight &
						Else li_weight = ii_normalfontweight
For li_loop = 7 to 42 step 7
	ls_modifyexp += "cell"+string(Mod (7 + li_loop - li_firstweekdaynum, 7) + li_loop - 6)+".Color='"+string(ll_saturdaycolor)+"' " + &
						 "cell"+string(Mod (7 + li_loop - li_firstweekdaynum, 7) + li_loop - 6)+".Font.Weight='"+string(li_weight)+"' "
Next
dw_cal.Modify(ls_modifyexp)

// Mark holidays for this month.
ls_modifyexp = ''
li_upperbound = UpperBound(ldt_holiday)
If li_upperbound > 0 Then
	If lb_holidaybold Then li_weight = ii_boldfontweight &
							Else li_weight = ii_normalfontweight
	For li_loop = 1 to li_upperbound
		ldt_special = ldt_holiday[li_loop]
		If Year(ldt_special)=Year(ad_date) And Month(ldt_special)=Month(ad_date) Then
			li_FirstDayNum = Mod (7 + DayNumber(Date(Year(ldt_special), Month(ldt_special), 1)) - li_firstweekdaynum, 7) + 1
			ls_cell = 'cell'+string(li_FirstDayNum + Day(ldt_special) - 1)
			ls_modifyexp += ls_cell+".Color='"+string(ll_holidaycolor)+"' " + &
								 ls_cell+".Font.Weight='"+string(li_weight)+"' "
		End If
	Next
	If Len(Trim(ls_modifyexp)) > 0 Then
		dw_cal.Modify(ls_modifyexp)
	End If
End If

// Mark special days for this month.
ls_modifyexp = ''
li_upperbound = UpperBound(ldt_markedday)
If li_upperbound > 0 Then
	If lb_markeddaybold Then li_weight = ii_boldfontweight &
								Else li_weight = ii_normalfontweight
	For li_loop = 1 to li_upperbound
		ldt_special = ldt_markedday[li_loop]
		If Year(ldt_special)=Year(ad_date) And Month(ldt_special)=Month(ad_date) Then
			li_FirstDayNum = Mod (7 + DayNumber(Date(Year(ldt_special), Month(ldt_special), 1)) - li_firstweekdaynum, 7) + 1
			ls_cell = 'cell'+string(li_FirstDayNum + Day(ldt_special) - 1)
			ls_modifyexp += ls_cell+".Color='"+string(ll_markeddaycolor)+"' " + &
								 ls_cell+".Font.Weight='"+string(li_weight)+"' "
		End If
	Next
	If Len(Trim(ls_modifyexp)) > 0 Then
		dw_cal.Modify(ls_modifyexp)
	End If
End If

//Turn back redraw.
dw_cal.SetRedraw(TRUE)

Return 1

end function

protected function integer of_setdate (date ad_date, boolean ab_setrequestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetDate
//
//	Access:    Protected
//
//	Arguments:
//  ad_date		The date to set.
//	 ab_setrequestor	Switch stating if the requestor object should get this date.
//
//	Returns:  Integer
//		1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description: Sets a new date on the Visual calendar date.  If appropriate, it
//		will also set the requestor to get this new date.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//	7.0	Add code to always redraw for date matching 1/1/1900 to allow date 
//			display for January 1900.  Previously the calendar did not redraw since 
//			the initial value of the previous date was also 1/1/1900.
//	12.5	Use the value for first week day from registry (#11004)
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

Integer			li_rc = 1
Integer 			li_month
Integer 			li_year
Integer 			li_day
Integer  		li_FirstDayNum
Integer			li_firstweekdaynum
String			ls_newcell
String			ls_date

// Check the argument(s).
If Not inv_datetime.of_IsValid(ad_date) Then
	Return -1
End If

// Set the new date.
id_date = ad_date

// If appropriate, set the requestor with the new date.
If ab_setrequestor Then
	// Convert the date into a string.
	ls_date = string(ad_date, is_dateformat)

	// Set the requestor with the new date.
	If IsValid(idw_requestor) Then
		idw_requestor.SetText(ls_date)
	ElseIf IsValid(iem_requestor) Then
		iem_requestor.Text = ls_date	
	Else 
		Return -1
	End If
End If
						 
//If appropriate, draw a new month.
If (Year(ad_date) <> Year(id_prevdate) Or Month(ad_date) <> Month(id_prevdate)) Or &
	ib_alwaysredraw Or (ad_date = date(1900, 1, 1)) Then
	of_DrawMonth(ad_date)
End If
						 
//Initialize local values.
li_year = Year(ad_date)
li_month = Month(ad_date)
li_day = Day(ad_date)

// Unhighlight any previous cell.
If Len(Trim(is_prevcell)) > 0 Then
	If dw_cal.Modify(is_prevcell + ".border=0") <> "" Then
		li_rc = -1
	End If
End If

// read first day of week from registry (#11004)
IF RegistryGet ("HKEY_CURRENT_USER\Control Panel\International", "iFirstDayOfWeek", ls_newcell) <> 1 THEN
	ls_newcell = "0"
END IF
// and convert the value from registry (0 = monday) for powerbuilder (1 = sunday)
li_firstweekdaynum = Mod (Integer (ls_newcell) + 1, 7) + 1

//Highlight the current date.
li_FirstDayNum = Mod (7 + DayNumber(Date(li_year, li_month, 1)) - li_firstweekdaynum, 7) + 1
ls_newcell = 'cell'+string(li_FirstDayNum + li_day - 1)
If dw_cal.Modify(ls_newcell + ".border=5") <> "" Then
	li_rc = -1
End if

// Store the new previous infomration.
is_prevcell = ls_newcell
id_prevdate = ad_date

Return li_rc




end function

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Constructor
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Intialize values for the Calendar object.
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

If IsValid(Message.PowerObjectParm) Then
	If inv_calendarattrib.ClassName() = Message.PowerObjectParm.ClassName() Then
		inv_calendarattrib = Message.PowerObjectParm
		
		// Is the object to behave as a dropdown object?
		If inv_calendarattrib.ib_dropdown Then
			// Yes, it is a dropdown object.  
			// Immediately hide the object and Create the dropdown service.
			this.Visible = False	
			of_SetDropDown(True)
		End If
	End IF
End If

// Make sure the object is not updateable.
of_SetUpdateable(False)
end event

on pfc_u_calendar.create
int iCurrent
call super::create
this.dw_cal=create dw_cal
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_cal
end on

on pfc_u_calendar.destroy
call super::destroy
destroy(this.dw_cal)
end on

event destructor;call super::destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Destructor
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Destroy the instantiated services attached.
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

// Unregister all columns.
of_Unregister()

of_SetDropDown(False)
end event

type dw_cal from u_dw within pfc_u_calendar
event type integer pfc_nextmonth ( )
event type integer pfc_prevmonth ( )
event type integer pfc_nextday ( )
event type integer pfc_prevday ( )
event type integer pfc_prevweek ( )
event type integer pfc_nextweek ( )
event key pbm_dwnkey
integer width = 695
integer height = 640
integer taborder = 10
string dataobject = "d_calendar"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = styleraised!
end type

event pfc_nextmonth;call super::pfc_nextmonth;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_nextmonth
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Goto to the next month.
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

Integer li_month
Integer li_year
Integer li_day

//Initialize local values.
li_year = Year(id_date)
li_month = Month(id_date)
li_day = Day(id_date)

//Increment the month number.
li_month ++
If li_month = 13 then
	li_month = 1
	li_year = li_year + 1
End If

//Validate day number for the new month.
If not(isdate(string(li_month) + "/" + string(li_day) + "/"+ string(li_year))) Then 
	li_day = 1
End If

//Set the new date.
of_SetDate (date(li_year, li_month, li_Day), True)

Return 1
end event

event pfc_prevmonth;call super::pfc_prevmonth;Integer li_month
Integer li_year
Integer li_day

//Initialize local values.
li_year = Year(id_date)
li_month = Month(id_date)
li_day = Day(id_date)

//Decrement the month.
li_month --
If li_month = 0 then
	li_month = 12
	li_year = li_year - 1
End If

//Validate day number for the new month.
If not(IsDate(string(li_month) + "/" + string(li_day) + "/"+ string(li_year))) Then
	li_day = 1
End If

//Set the new date.
of_SetDate (date(li_year, li_month, li_Day), True)

Return 1
end event

event pfc_nextday;call super::pfc_nextday;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_nexday
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Goto to the following day.
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

// Set the new date.
of_SetDate (RelativeDate (id_date, 1 ), True)

Return 1
end event

event pfc_prevday;call super::pfc_prevday;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_prevday
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Goto the previous day.
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

// Set the new date.
of_SetDate (RelativeDate (id_date, -1), True)

Return 1
end event

event pfc_prevweek;call super::pfc_prevweek;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_prevweek
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Goto to the previous week.
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

// Set the new date.
of_SetDate (RelativeDate (id_date, -7), True)

Return 1
end event

event pfc_nextweek;call super::pfc_nextweek;// Set the new date.
of_SetDate (RelativeDate (id_date, 7), True)

Return 1
end event

event key;call super::key;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			key
//
//	(Arguments:		
//	key
//	keyflags
//
//	(Returns:  		None)
//
//	Description:
//	Support keyboard to be used to change the date on the calendar.
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

Choose Case key
	Case KeyEscape! 
		//If appropriate, hide the Calendar.
		If IsValid(inv_dropdown) Then
			If ib_closeonclick or ib_closeondclick Then
				// Set focus on the Requestor object which in turns hides the calendar.
				of_SetFocusOnRequestor()
			End If
		End If
	Case KeyTab!
		If IsValid(inv_dropdown) Then
			Post of_SetFocusOnRequestor()
		End If
	Case KeyEnter!
		If Not inv_datetime.of_IsValid(id_resetdate) Then
			of_SetDate(id_date, True)
		End If
		//If appropriate, hide the Calendar.
		If IsValid(inv_dropdown) Then
			If ib_closeonclick or ib_closeondclick Then
				// Set focus on the Requestor object which in turns hides the calendar.
				of_SetFocusOnRequestor()
			End If
		End If
	Case KeyLeftArrow!
		this.Event pfc_PrevDay()	
	Case KeyUpArrow!
		this.Event pfc_PrevWeek()		
	Case KeyPageUp!
		this.Event pfc_PrevMonth()	
	Case KeyRightArrow!
		this.Event pfc_NextDay()	
	Case KeyDownArrow!
		this.Event pfc_NextWeek()		
	Case KeyPageDown!
		this.Event pfc_NextMonth()
End Choose
end event

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			clicked
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	
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

Integer 	li_month
Integer 	li_year
Integer 	li_day
String 	ls_clickedcolumn, ls_clickedcolumnID
String 	ls_day, ls_return

//Return if click was not on a valid dwobject, depending on what was
//clicked, dwo will be null or dwo.name will be "datawindow"
If IsNull(dwo) Then Return
If Pos(dwo.name, "cell") = 0 Then Return

//Initialize local values.
li_year = Year(id_date)
li_month = Month(id_date)
li_day = Day(id_date)

//Find which column was clicked on and return if it is not valid
ls_clickedcolumn = dwo.name
ls_clickedcolumnID = dwo.id
If ls_clickedcolumn = '' Then Return

//Set Day to the text of the clicked column. Return if it is an empty column
ls_day = dwo.primary[1]
If ls_day = "" then Return

//Convert to a number.
li_day = Integer(ls_day)

//Set the new date. 
of_SetDate (date(li_year, li_month, li_Day), True)

//If appropriate, hide the Calendar.
If IsValid(inv_dropdown) Then
	If ib_closeonclick Then
		// Set focus on the Requestor object which in turns hides the calendar.
		of_SetFocusOnRequestor()
	End If
End If

end event

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			doubleclicked
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	
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

//Return if click was not on a valid dwobject, depending on what was
//clicked, dwo will be null or dwo.name will be "datawindow"
If IsNull(dwo) Then Return
If Pos(dwo.name, "cell") = 0 Then Return

//If appropriate, hide the Calendar.
If IsValid(inv_dropdown) Then
	If ib_closeondclick Then
		// Set focus on the Requestor object which in turns hides the calendar.
		of_SetFocusOnRequestor()
	End If
End If
end event

event losefocus;call super::losefocus;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			losefocus
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	
//	If this object is being used as a DropDown object, hide it when focus
// is lost.
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

//Determine if the object is being used as a dropdown object.
If IsValid(inv_dropdown) Then
	// Hide object.
	Parent.Visible = False
End If

Return
end event

event getfocus;call super::getfocus;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			getfocus
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	The object may need to redirect focus when not visible.
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

// Prevent this object from having focus while not visible.
Post of_RedirectFocus() 

end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Constructor
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	
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

// Prevent Updates from this datawindow.
of_SetUpdateable (False)

// Prevent Right Mouse Menu.
ib_rmbmenu = False
end event

event buttonclicked;call super::buttonclicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			buttonclicked
//
//	Arguments:		
//	row
//	actionreturncode
//	dwo
//
//	Returns:  		None
//
//	Description:	Perform the Action desired.
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

string ls_buttonname

If IsNull(dwo) Then Return

ls_buttonname = dwo.Name

Choose Case ls_buttonname
	Case 'prevmonth'
		// Request the previous month.
		this.Event pfc_PrevMonth()
		
	Case 'nextmonth'
		// Request the next month.
		this.Event pfc_NextMonth()
End Choose

this.SetFocus()
end event


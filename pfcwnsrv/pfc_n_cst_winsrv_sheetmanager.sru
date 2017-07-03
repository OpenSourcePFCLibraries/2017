HA$PBExportHeader$pfc_n_cst_winsrv_sheetmanager.sru
$PBExportComments$PFC Window  Sheet Manager service
forward
global type pfc_n_cst_winsrv_sheetmanager from n_cst_winsrv
end type
end forward

global type pfc_n_cst_winsrv_sheetmanager from n_cst_winsrv
event type integer pfc_cascade ( )
event type integer pfc_tilehorizontal ( )
event type integer pfc_tilevertical ( )
event type integer pfc_layer ( )
event type integer pfc_minimizeall ( )
event type integer pfc_undoarrange ( )
end type
global pfc_n_cst_winsrv_sheetmanager pfc_n_cst_winsrv_sheetmanager

type variables
Protected:
arrangetypes	ie_arrange
//	7.0   Instance variable datatype changed from os_sheet to n_cst_winsrv_sheetmanagerattrib type
//	7.0   Instance variable name changed from istr_sheet to inv_sheet
n_cst_winsrv_sheetmanagerattrib		inv_sheet[]

// 7.0	This variable is obsolete.  Left in for migration purposes.
//			DO NOT USE THIS VARIABLE
n_cst_winsrv_sheetmanagerattrib		istr_sheet[]
end variables

forward prototypes
public function integer of_getsheetcount ()
public function integer of_getsheets (ref window aw_sheet[])
public function integer of_getsheetsbyclass (ref window aw_sheet[], string as_classname)
public function integer of_getsheetsbytitle (ref window aw_sheet[], string as_title, boolean ab_partialmatch)
public function integer of_getsheetsbytitle (ref window aw_sheet[], string as_title)
public function integer of_setrequestor (w_master aw_requestor)
public function arrangetypes of_getcurrentstate ()
protected function integer of_setcurrentstate (arrangetypes ae_arrange)
end prototypes

event pfc_cascade;call super::pfc_cascade;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_cascade
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Cascades sheets
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

integer	li_rc

// Validate window requestor
if IsNull(iw_requestor) Or not IsValid (iw_requestor) then
	return -1
end if

// Set current state for undo
of_SetCurrentState (cascade!)
li_rc = iw_requestor.ArrangeSheets (cascade!)

return li_rc
end event

event pfc_tilehorizontal;call super::pfc_tilehorizontal;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_tilehorizontal
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Tiles sheets horizontally
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

integer	li_rc

// Validate window requestor
if IsNull(iw_requestor) Or not IsValid (iw_requestor) then
	return -1
end if

// Set current state for undo
of_SetCurrentState (tilehorizontal!)
li_rc = iw_requestor.ArrangeSheets (tilehorizontal!)

return li_rc
end event

event pfc_tilevertical;call super::pfc_tilevertical;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_tilevertical
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Tiles sheets vertically
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

integer	li_rc

// Validate window requestor
if IsNull(iw_requestor) Or not IsValid (iw_requestor) then
	return -1
end if

// Set current state for undo
of_SetCurrentState (tile!)
li_rc = iw_requestor.ArrangeSheets (tile!)

return li_rc
end event

event pfc_layer;call super::pfc_layer;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_layer
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Layers sheets
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

integer	li_rc

// Validate window requestor
if IsNull(iw_requestor) Or not IsValid (iw_requestor) then
	return -1
end if

of_SetCurrentState (layer!)
li_rc = iw_requestor.ArrangeSheets (layer!)

return li_rc
end event

event pfc_minimizeall;call super::pfc_minimizeall;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_minimizeall
//
//	Arguments:  none
//
//	Returns:  integer
//	 number of sheets minimized
//	-1 = error
//
//	Description:
//	Minimizes all open sheets
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

integer	li_sheetcount
integer	li_cnt
window	lw_sheet[]

// Validate window requestor
if IsNull(iw_requestor) Or not IsValid (iw_requestor) then
	return -1
end if

// Get all sheets
li_sheetcount = of_GetSheets (lw_sheet)
if li_sheetcount > 0 then
	// Save current state
	of_SetCurrentState (icons!)
	
	for li_cnt = 1 to li_sheetcount
		lw_sheet[li_cnt].windowstate = minimized!
	next
end if

return li_sheetcount

end event

event pfc_undoarrange;call n_cst_winsrv::pfc_undoarrange;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_undoarrange
//
//	Arguments:  none
//
//	Returns:  integer
//	number of sheets affected by undo
//	-1 = error
//
//	Description:	Undo last window arrange
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
integer	li_cnt
integer	li_count

li_count = UpperBound (inv_sheet)
for li_cnt = li_count to 1 step -1
		if IsValid (inv_sheet[li_cnt].w_obj) then
			inv_sheet[li_cnt].w_obj.windowstate = inv_sheet[li_cnt].e_state
			inv_sheet[li_cnt].w_obj.width = inv_sheet[li_cnt].i_width
			inv_sheet[li_cnt].w_obj.height = inv_sheet[li_cnt].i_height
			inv_sheet[li_cnt].w_obj.x = inv_sheet[li_cnt].i_x
			inv_sheet[li_cnt].w_obj.y = inv_sheet[li_cnt].i_y
		end if
next

SetNull (ie_arrange)

return li_count
end event

public function integer of_getsheetcount ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Getsheetcount
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  integer
//	number of open sheets
//	-1 = error
//
//	Description:  Returns sheet count for frame requestor
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
integer	li_counter
window	lw_sheet

// Validate window requestor
if IsNull(iw_requestor) Or not IsValid (iw_requestor) then
	return -1
end if

// Get number of sheets
lw_sheet = iw_requestor.GetFirstSheet ()
if IsValid (lw_sheet) then
	do
		li_counter++
		lw_sheet = iw_requestor.GetNextSheet (lw_sheet)
	loop until IsNull(lw_sheet) Or not IsValid (lw_sheet)
end if

return li_counter


end function

public function integer of_getsheets (ref window aw_sheet[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Getsheets
//
//	Access:  public
//
//	Arguments:  aw_sheet[] by ref
//
//	Returns:  integer
//	number of open sheets
//	-1 = error
//
//	Description:  Get reference to all open sheets
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
integer	li_counter
window	lw_sheet

// Validate window requestor
if IsNull(iw_requestor) Or not IsValid (iw_requestor) then
	return -1
end if

// Get all sheets
lw_sheet = iw_requestor.GetFirstSheet ()
if IsValid (lw_sheet) then
	do
		li_counter++
		aw_sheet[li_counter] = lw_sheet
		lw_sheet = iw_requestor.GetNextSheet (lw_sheet)
	loop until IsNull(lw_sheet) Or not IsValid (lw_sheet)
end if

return li_counter



end function

public function integer of_getsheetsbyclass (ref window aw_sheet[], string as_classname);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetSheetsbyClass
//
//	Access:  public
//
//	Arguments:
//	aw_sheet[] by ref
//	as_classname:  classname of the sheets to get
//
//	Returns:  integer
//	number of sheets of classname specified
//	-1 = error
//
//	Description:  Get reference to all open sheets with classname specified
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
integer	li_counter
window	lw_sheet

// Validate window requestor
if IsNull(iw_requestor) Or not IsValid (iw_requestor) then
	return -1
end if

// Get all sheets of classname
lw_sheet = iw_requestor.GetFirstSheet ()
if IsValid (lw_sheet) then
	do
		if ClassName (lw_sheet) = as_classname then
			li_counter++
			aw_sheet[li_counter] = lw_sheet
		end if
		lw_sheet = iw_requestor.GetNextSheet (lw_sheet)
	loop until IsNull(lw_sheet) Or not IsValid (lw_sheet)
end if

return li_counter

end function

public function integer of_getsheetsbytitle (ref window aw_sheet[], string as_title, boolean ab_partialmatch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetSheetsbyTitle
//
//	Access:  public
//
//	Arguments:
//	aw_sheet[] by ref
//	as_title:  title of the sheets to get
//	ab_partialmatch:  partially match window titles (default is false)
//
//	Returns:  integer
//	number of sheets open with title specified
//	-1 = error
//
//	Description:  Get reference to all open sheets with title specified
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
integer	li_counter
window	lw_sheet

// Validate window requestor
if IsNull(iw_requestor) Or not IsValid (iw_requestor) then
	return -1
end if

// Get all sheets of title specified
lw_sheet = iw_requestor.GetFirstSheet ()
if IsValid (lw_sheet) then
	do
		if ab_partialmatch = false then
			if lw_sheet.title = as_title then
				li_counter++
				aw_sheet[li_counter] = lw_sheet
			end if
		else
			if Pos (lw_sheet.title, as_title) > 0 then
				li_counter++
				aw_sheet[li_counter] = lw_sheet
			end if
		end if
	
		lw_sheet = iw_requestor.GetNextSheet (lw_sheet)
	loop until IsNull(lw_sheet) Or not IsValid (lw_sheet)
end if

return li_counter


end function

public function integer of_getsheetsbytitle (ref window aw_sheet[], string as_title);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetSheetsbyTitle
//
//	Access:  public
//
//	Arguments:
//	aw_sheet[] by ref
//	as_title:  title of the sheets to get
//
//	Returns:  integer
//	number of sheets open with title specified
//	-1 = error
//
//	Description:  Get reference to all open sheets with title specified
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

return of_GetSheetsByTitle (aw_sheet, as_title, false)


end function

public function integer of_setrequestor (w_master aw_requestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetRequestor
//
//	Access:  public
//
//	Arguments:
//	aw_requestor	The frame window requesting this service
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:  associates a frame window with this service.
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

// Validate arguments
if IsNull(aw_requestor) Or not IsValid (aw_requestor) then
	return -1
end if

// Only frame windows can use this service
if aw_requestor.windowtype <> mdi! and aw_requestor.windowtype <> mdihelp! then
	return -1
end if

iw_requestor = aw_requestor
return 1
end function

public function arrangetypes of_getcurrentstate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetCurrentState
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  arrangetypes
//	Current arrange state of open windows
//	NULL if undo was the last arrange performed	
//
//	Description:
//	Gets the current arrange state of open windows
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

return ie_arrange
end function

protected function integer of_setcurrentstate (arrangetypes ae_arrange);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetCurrentState
//
//	Access:  protected
//
//	Arguments:
//	ae_arrange:  window arrange type that was performed
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets the current arrange type of the sheets to allow for undo
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	7.0   Local variable datatype changed from os_sheet to n_cst_winsrv_sheetmanagerattrib type
//	7.0   Local variable name changed from lstr_sheet to lnv_sheet
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
integer	li_rc = 1
integer	li_cnt
integer	li_count
window	lw_sheets[]
n_cst_winsrv_sheetmanagerattrib	lnv_sheet[]

ie_arrange = ae_arrange

// Get sheets
li_count = of_GetSheets (lw_sheets)

// Store window dimensions for each sheet
inv_sheet = lnv_sheet
for li_cnt=1 to li_count
	inv_sheet[li_cnt].w_obj = lw_sheets[li_cnt]
	inv_sheet[li_cnt].e_state = lw_sheets[li_cnt].windowstate
	inv_sheet[li_cnt].i_width = lw_sheets[li_cnt].width
	inv_sheet[li_cnt].i_height = lw_sheets[li_cnt].height
	inv_sheet[li_cnt].i_x = lw_sheets[li_cnt].x
	inv_sheet[li_cnt].i_y = lw_sheets[li_cnt].y
next

return li_rc
end function

on pfc_n_cst_winsrv_sheetmanager.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_winsrv_sheetmanager.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;call super::constructor;SetNull (ie_arrange)
end event


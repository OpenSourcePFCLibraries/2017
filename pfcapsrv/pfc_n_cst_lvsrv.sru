HA$PBExportHeader$pfc_n_cst_lvsrv.sru
$PBExportComments$PFC ListView Base service
forward
global type pfc_n_cst_lvsrv from n_base
end type
end forward

global type pfc_n_cst_lvsrv from n_base
end type
global pfc_n_cst_lvsrv pfc_n_cst_lvsrv

type variables
protected:
string	is_delimiter = ";"
string	is_displayitem = "this item"
string	is_displayunits = "items"

u_lvs	ilv_requestor

end variables

forward prototypes
public function integer of_setrequestor (u_lvs alv_requestor)
public function integer of_setdisplayitem (string as_displayitem)
public function string of_getdisplayitem ()
public function string of_getdisplayunits ()
public function integer of_setdisplayunits (string as_displayunits)
public function integer of_findnext (integer ai_index, direction ad_direction)
public function integer of_findselected (integer ai_index, direction ad_direction)
public function string of_getdelimiter ()
public function integer of_setdelimiter (string as_delimiter)
end prototypes

public function integer of_setrequestor (u_lvs alv_requestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetRequestor
//
//	Access:  		public
//
//	Arguments:		
//	alv_requestor	The listview requesting this service
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Associates a listview with this service.
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

If IsNull(alv_requestor) Or Not IsValid(alv_requestor) Then
	Return -1
End If

ilv_requestor = alv_requestor

Return 1
end function

public function integer of_setdisplayitem (string as_displayitem);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetDisplayItem
//
//	Access:		public
//
//	Arguments:
//	as_displayitem:  display name of the item (row)
//
//	Returns:		integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets the display name of the item (row) of the listview
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

// Validate argument
if IsNull (as_displayitem) then
	return -1
end if

is_displayitem = as_displayitem

return 1
end function

public function string of_getdisplayitem ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetDisplayItem
//
//	Access:		public
//
//	Arguments:	none
//
//	Returns:		string
//
//	Description:
//	Gets the display name of the item (row) of the listview
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

return is_displayitem
end function

public function string of_getdisplayunits ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetDisplayUnits
//
//	Access:		public
//
//	Arguments:	none
//
//	Returns:		string
//
//	Description:
//	Gets the display name of the units (rows) of the Listview.
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

return is_displayunits
end function

public function integer of_setdisplayunits (string as_displayunits);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetDisplayUnits
//
//	Access:		public
//
//	Arguments:
//	as_displayunits:  display name of the units (rows)
//
//	Returns:		integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets the display name of the units (rows) of the listview.
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

// Validate argument
if IsNull (as_displayunits) then
	return -1
end if

is_displayunits = as_displayunits

return 1
end function

public function integer of_findnext (integer ai_index, direction ad_direction);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_FindNext
//
//	Access:		public
//
//	Arguments:
//	ai_index			The index of the ListView item to start from.
//							FindItem uses (index + 1) to start the search
//	ad_direction	Direction in which to search the listview
//							DirectionUp!, DirectionDown!, DirectionAll!, DirectionLeft!, DirectionRight!
//
//	Returns:		Integer
//					the index of the next item found if successful
//					-1	- an error occurred
//
//	Description:	Find the next item in the direction specified in the ListView
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

// check the arguments
If Not IsValid(ilv_requestor) Then Return -1
If IsNull(ai_index) or (ai_index < 0) then return -1

// Find the next item
Return ilv_requestor.FindItem(ai_index, ad_direction, False, False, False, False)
end function

public function integer of_findselected (integer ai_index, direction ad_direction);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_FindSelected
//
//	Access:		public
//
//	Arguments:
//	ai_index			The index of the ListView item to start from.
//							FindItem uses (index + 1) to start the search
//	ad_direction	Direction in which to search the listview
//							DirectionUp!, DirectionDown!, DirectionAll!, DirectionLeft!, DirectionRight!
//
//	Returns:		Integer
//					the index of the next selected item found if successful
//					-1	- an error occurred
//
//	Description:	Find the next selected item in the direction specified in the ListView
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

// check the arguments
If Not IsValid(ilv_requestor) Then Return -1
If isnull(ai_index) or (ai_index < 0) then return -1

// Find the selected item
Return ilv_requestor.FindItem(ai_index, ad_direction, False, True, False, False)
end function

public function string of_getdelimiter ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetDelimiter
//
//	Access:		public
//
//	Arguments:	none
//
//	Returns:		string
//
//	Description:
//	Gets the delimiter character used to separate items in the data attribute
//	of the listview item
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

return is_delimiter
end function

public function integer of_setdelimiter (string as_delimiter);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetDelimiter
//
//	Access:		public
//
//	Arguments:
//	as_delimiter   The delimiter used to differentiate the keys of the compound key
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Sets delimiter used to differentiate the keys placed in the data attribute of
//	the listview item
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

If IsNull(as_delimiter) or as_delimiter = "" Then
	Return -1
End If

is_delimiter = as_delimiter

return 1
end function

on pfc_n_cst_lvsrv.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_lvsrv.destroy
TriggerEvent( this, "destructor" )
end on


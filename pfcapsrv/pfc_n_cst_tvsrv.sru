HA$PBExportHeader$pfc_n_cst_tvsrv.sru
$PBExportComments$PFC TreView Base service
forward
global type pfc_n_cst_tvsrv from n_base
end type
end forward

global type pfc_n_cst_tvsrv from n_base
end type
global pfc_n_cst_tvsrv pfc_n_cst_tvsrv

type variables
Protected:
long	il_queue[]
string	is_delimiter = ";"
string	is_displayitem = "this item"
string	is_displayunits = "items"
u_tvs	itv_requestor

end variables

forward prototypes
public function any of_getdataany (long al_handle)
public function string of_getdatastring (long al_handle)
public function long of_finditem (string as_attribute, any aa_target, long al_begin, integer ai_level, boolean ab_respectcase, boolean ab_fullcompare)
public function long of_finditem (string as_attribute, any aa_target, long al_begin, integer ai_level, boolean ab_respectcase)
public function long of_finditem (string as_attribute, any aa_target, long al_begin, integer ai_level)
public function long of_finditem (string as_attribute, any aa_target, long al_begin)
public function long of_finditem (string as_attribute, any aa_target)
public function integer of_setrequestor (u_tvs atv_requestor)
public function integer of_setdisplayitem (string as_displayitem)
public function string of_getdisplayitem ()
public function string of_getdisplayunits ()
public function integer of_setdisplayunits (string as_displayunits)
public function long of_getdatanumeric (long al_handle)
public function integer of_setdelimiter (string as_delimiter)
public function string of_getdelimiter ()
public function long of_findfirstitemlevel (integer ai_level, long al_handle)
protected function long of_searchchild (string as_attribute, any aa_target, long al_begin, integer ai_level, boolean ab_respectcase, boolean ab_fullcompare)
end prototypes

public function any of_getdataany (long al_handle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetDataAny
//
//	Access:  		public
//
//	Arguments:		
//	al_handle		The handle for the item for which you want to retrieve information
//
//	Returns:  		Any
//						data value if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Return the 'Data' element in any format
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

treeviewitem ltvi_item

If IsNull(al_handle) Or (al_handle < 0) Then
	Return -1
End If

if itv_requestor.GetItem ( al_handle, ltvi_item ) <> 1 then
	return -1
else
	return ltvi_item.Data
end if
end function

public function string of_getdatastring (long al_handle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetDataString
//
//	Access:  		public
//
//	Arguments:		
//	al_handle		The handle for the item for which you want to retrieve information
//
//	Returns:  		string
//						string value if it succeeds and$$HEX1$$a000$$ENDHEX$$"" if an error occurs.
//
//	Description:  	Return the 'Data' element in string format
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

treeviewitem ltvi_item

If IsNull(al_handle) Or (al_handle < 0) Then
	Return ""
End If

if itv_requestor.GetItem ( al_handle, ltvi_item ) <> 1 then
	return ""
else
	return String ( ltvi_item.Data )
end if
end function

public function long of_finditem (string as_attribute, any aa_target, long al_begin, integer ai_level, boolean ab_respectcase, boolean ab_fullcompare);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_FindItem
//
//	Access:		public
//
//	Arguments:
//	as_Attribute	The attribute of the TreeView item to search ("Label", 
//						or "Data")
//	aa_Target		A variable of type Any containg the search target.
//	al_Begin			The handle of the TreeView item to begin searching, if
//						0 entire tree will be searched.
//	ai_Level			The level to search, if 0 entire tree will be searched.
//	ab_RespectCase	True - search is case sensitive,
//						False - search is not case sensitive.  Only used if the target
//						is a string.
//	ab_FullCompare	True - Label or Data and Target must be equal,
//						False - Label or Data can contain Target (uses POS() function).
//						Only used if the target is a string.
//
//	Returns:		Long
//					The handle of the item whose Label matches the target.  Returns 0
//					if not found, -1 if an error occurrs.
//
//	Description:	Search for an item in the TreeView.  This function calls of_SearchChild
//						to search for the target in either the Label or Data attribute
//						of the TreeView items.  It will use the pfc_searchcompare event to actually
//						perform the comparison.  Override this event if another comparison is desired.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//	6.0.01	Rewrite to be non-recursive to avoid stack overflow errors.  Use a queue 
//				to simulate recursion in a level centered traversal
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

Integer			li_next
Long				ll_handle, ll_parent, ll_queue[]
Treeviewitem	ltvi_item

If IsNull(as_attribute) or IsNull(al_begin) or IsNull(ai_level) or &
	IsNull(ab_respectcase) or IsNull(ab_fullcompare) Then Return -1
If (al_begin < 0) or (ai_level < 0) or (as_attribute = "") Then Return -1

// this could be a potentially long operation
SetPointer(hourglass!)

// reset the queue
il_queue = ll_queue

// Initialize the tree queue
If al_begin = 0 Then
	// search the whole tree, look for multiple nodes on level 1
	ll_handle = itv_requestor.FindItem(RootTreeItem!, 0)
Else
	// start at the beginning position and search the children from that point down
	// add handle to queue
	li_next = upperbound(il_queue) + 1
	il_queue[li_next] = al_begin
	// search for siblings
	ll_handle = itv_requestor.FindItem(NextTreeItem!, al_begin)
End IF

// add siblings to the queue
Do While ll_handle > 0
	// add handle to queue
	li_next = upperbound(il_queue) + 1
	il_queue[li_next] = ll_handle
	ll_handle = itv_requestor.FindItem(NextTreeItem!, ll_handle)
Loop

Return of_SearchChild(as_Attribute, aa_Target, al_begin, ai_Level, ab_RespectCase, ab_FullCompare)

end function

public function long of_finditem (string as_attribute, any aa_target, long al_begin, integer ai_level, boolean ab_respectcase);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_FindItem
//
//	Access:		public
//
//	Arguments:
//	as_Attribute	The attribute of the TreeView item to search ("Label", 
//						or "Data")
//	aa_Target		A variable of type Any containg the search target.
//	al_Begin			The handle of the TreeView item to begin searching, if
//						0 entire tree will be searched.
//	ai_Level			The level to search, if 0 entire tree will be searched.
//	ab_RespectCase	True - search is case sensitive,
//						False - search is not case sensitive.  Only used if the target
//						is a string.
//
//	Returns:		Long
//					The handle of the item whose Label matches the target.  Returns 0
//					if not found, -1 if an error occurrs.
//
//	Description:	Search for an item in the TreeView.  This function calls of_SearchChild
//						which is recursive to search for the target in either the Label or Data attribute
//						of the TreeView items.  It will use the pfc_searchcompare event to actually
//						perform the comparison.  Override this event if another comparison is desired.
//
//		This function overloads the real of_FindItem function to allow the last
//		retrieval argument to be optional.
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

Return of_FindItem(as_Attribute, aa_Target, al_Begin, ai_Level, ab_RespectCase, False)

end function

public function long of_finditem (string as_attribute, any aa_target, long al_begin, integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_FindItem
//
//	Access:		public
//
//	Arguments:
//	as_Attribute	The attribute of the TreeView item to search ("Label", 
//						or "Data")
//	aa_Target		A variable of type Any containg the search target.
//	al_Begin			The handle of the TreeView item to begin searching, if
//						0 entire tree will be searched.
//	ai_Level			The level to search, if 0 entire tree will be searched.
//
//	Returns:		Long
//					The handle of the item whose Label matches the target.  Returns 0
//					if not found, -1 if an error occurrs.
//
//	Description:	Search for an item in the TreeView.  This function calls of_SearchChild
//						which is recursive to search for the target in either the Label or Data attribute
//						of the TreeView items.  It will use the pfc_searchcompare event to actually
//						perform the comparison.  Override this event if another comparison is desired.
//
//		This function overloads the real of_FindItem function to allow the last 2
//		retrieval argument to be optional.
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

Return of_FindItem(as_Attribute, aa_Target, al_Begin, ai_Level, False, False)

end function

public function long of_finditem (string as_attribute, any aa_target, long al_begin);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_FindItem
//
//	Access:		public
//
//	Arguments:
//	as_Attribute	The attribute of the TreeView item to search ("Label", 
//						or "Data")
//	aa_Target		A variable of type Any containg the search target.
//	al_Begin			The handle of the TreeView item to begin searching, if
//						0 entire tree will be searched.
//
//	Returns:		Long
//					The handle of the item whose Label matches the target.  Returns 0
//					if not found, -1 if an error occurrs.
//
//	Description:	Search for an item in the TreeView.  This function calls of_SearchChild
//						which is recursive to search for the target in either the Label or Data attribute
//						of the TreeView items.  It will use the pfc_searchcompare event to actually
//						perform the comparison.  Override this event if another comparison is desired.
//
//		This function overloads the real of_FindItem function to allow the last 3
//		retrieval argument to be optional.
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

Return of_FindItem(as_Attribute, aa_Target, al_Begin, 0, False, False)

end function

public function long of_finditem (string as_attribute, any aa_target);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_FindItem
//
//	Access:		public
//
//	Arguments:
//	as_Attribute	The attribute of the TreeView item to search ("Label", 
//						or "Data")
//	aa_Target		A variable of type Any containg the search target.
//						0 entire tree will be searched.
//
//	Returns:		Long
//					The handle of the item whose Label matches the target.  Returns 0
//					if not found, -1 if an error occurrs.
//
//	Description:	Search for an item in the TreeView.  This function calls of_SearchChild
//						which is recursive to search for the target in either the Label or Data attribute
//						of the TreeView items.  It will use the pfc_searchcompare event to actually
//						perform the comparison.  Override this event if another comparison is desired.
//
//		This function overloads the real of_FindItem function to allow the last 4
//		retrieval argument to be optional.
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

Return of_FindItem(as_Attribute, aa_Target, 0, 0, False, False)

end function

public function integer of_setrequestor (u_tvs atv_requestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetRequestor
//
//	Access:  		public
//
//	Arguments:		
//	atv_requestor	The treeview requesting this service
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Associates a treeview with this service.
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

If IsNull(atv_requestor) Or Not IsValid(atv_requestor) Then
	Return -1
End If

itv_requestor = atv_requestor

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

public function long of_getdatanumeric (long al_handle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetDataNumeric
//
//	Access:  		public
//
//	Arguments:		
//	al_handle		The handle for the item for which you want to retrieve information
//
//	Returns:  		Long
//						data value if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Return the 'Data' element in number format
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
string			ls_data
treeviewitem	ltvi_item

If IsNull(al_handle) Or (al_handle < 0) Then
	Return -1
End If

if itv_requestor.GetItem ( al_handle, ltvi_item ) <> 1 then
	return -1
else
	ls_data = string (ltvi_item.data)
	If isnumber(ls_data) then
		return long(ls_data)
	Else
		Return -1
	End If
end if
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
//	Sets delimiter used to differentiate the keys placed in the data property of
//	the treeview item
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
//	of the treeview item
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

public function long of_findfirstitemlevel (integer ai_level, long al_handle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_FindFirstItemLevel
//
//	Access:		public
//
//	Arguments:
//	ai_Level		The Level of the TreeView for which the first item is
//						being sought.
//	al_Handle	The handle of the TreeView item to begin searching
//
//	Returns:		Long
//					The handle of the first item on the given level.  Returns 0 if not found,
//					-1 if an error occurrs.
//
//	Description:	Find the first item on a level.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//	6.0.01	Rewrite to be non-recursive to avoid stack overflow errors.  Use a queue 
//				to simulate recursion in a level centered traversal
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

Long					ll_Handle, ll_Found
Integer				li_items, li_idx
TreeViewItem		ltvi_Item
any					la_find

// do not have this string as your label
la_find = "0987654321FIRSTitemonlevel1234567890)(*&^%$#@!~~"

// populate the queue - very restrictive search
this.of_finditem("label", la_find, al_handle, ai_level, True, True)

li_items = upperbound(il_queue)
For li_idx = 1 to li_items
	If itv_requestor.GetItem(il_queue[li_idx], ltvi_item) = -1 Then Return -1
	// the queue is in level order.  The first item we match level with is the first
	// item for the level
	If ai_level = ltvi_item.level Then
		Return il_queue[li_idx]
	End If
Next

Return 0

end function

protected function long of_searchchild (string as_attribute, any aa_target, long al_begin, integer ai_level, boolean ab_respectcase, boolean ab_fullcompare);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SearchChild
//
//	Access:		Protected
//
//	Arguments:
//	as_Attribute	The attribute of the TreeView item to search ("Label", 
//						or "Data")
//	aa_Target		A variable of type Any containg the search target.
//	al_Begin			The handle of the TreeView item to begin searching, if
//						0 entire tree will be searched.
//	ai_Level			The level to search, if 0 entire tree will be searched.
//	ab_RespectCase	True - search is case sensitive,
//						False - search is not case sensitive.  Only used if the target
//						is a string.
//	ab_FullCompare	True - Label or Data and Target must be equal,
//						False - Label or Data can contain Target (uses POS() function).
//						Only used if the target is a string.
//
//	Returns:		Long
//					The handle of the item whose Label or Data matches the target.  Returns 0
//					if not found, -1 if an error occurrs.
//
//	Description:	Search for the target in either the Label or Data attribute of the TreeView 
//						items..  This function is called by of_FindItem.  It will use the 
//						pfc_searchcompare event to actually perform the comparison.  Override 
//						this event if another comparison is desired.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//	6.0.01	Rewrite to be non-recursive to avoid stack overflow errors.  Use a queue 
//				to simulate recursion in a level centered traversal
// 7.0    Fix to work when tree is empty
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

Integer				li_Level, li_next
Long					ll_Handle, ll_child, ll_qposition
TreeViewItem		ltvi_Item

ll_qposition = 1

If ll_qposition > Upperbound(il_queue) Then Return -1

DO
	ll_handle = il_queue[ll_qposition]
	
	// should not put invalid items in the queue, but check it anyway and also get the level info
	If itv_requestor.GetItem(ll_handle, ltvi_Item) = -1 Then Return -1
	li_level = ltvi_Item.Level

	// make the comparison
	If ai_Level = 0 Or ai_Level = li_Level Then
		If itv_requestor.Trigger Event pfc_searchcompare(ll_handle, as_Attribute, aa_Target, ab_RespectCase, &
															ab_FullCompare) Then Return ll_handle
	Else
		// queue is populated in level order, so when the current level is greater than the level
		// to search in, we did not find the item.
		If li_level > ai_level then Return 0
	End If

	// match was not found, so add this item children to the end of the queue
	ll_child = itv_requestor.FindItem(ChildTreeItem!, ll_handle)
	Do While ll_child > 0
		// add handle to queue
		li_next = upperbound(il_queue) + 1
		il_queue[li_next] = ll_child
		ll_child = itv_requestor.FindItem(NextTreeItem!, ll_child)
	Loop

	ll_qposition++

Loop until ll_qposition > upperbound(il_queue)

Return 0

end function

on pfc_n_cst_tvsrv.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_tvsrv.destroy
TriggerEvent( this, "destructor" )
end on


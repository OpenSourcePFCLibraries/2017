HA$PBExportHeader$pfc_n_cst_security.sru
$PBExportComments$PFC Security service
forward
global type pfc_n_cst_security from n_base
end type
type str_menu from structure within pfc_n_cst_security
end type
end forward

type str_menu from structure
	menu		mnu
	boolean		override
end type

global type pfc_n_cst_security from n_base
end type
global pfc_n_cst_security pfc_n_cst_security

type variables
Public:
Constant String INVISIBLE = 'I'
Constant String ENABLE = 'E'
Constant String DISABLE = 'D'
Constant String NOTSET = ''

Protected:
n_ds	ids_items
n_ds 	ids_apps
n_ds	ids_groups
long	il_numberofrows
string 	is_app
string 	is_userID
string 	is_defaultgroup
integer	ii_numgroups
string 	is_disabledborder = '0'
boolean	ib_initsecurity = false
n_tr	itr_trans
boolean	ib_precache = false
string	is_currfilter

// unused
string 	is_enabledborder = '1'

// removed variables
boolean	ib_initscanning = false
integer	ii_libcnt
string	is_keyword = 'microhelp'
string	is_separator = ';'
string	is_liblist[]
n_ds 	ids_updates
n_ds	ids_info
n_cst_string 	inv_string

end variables

forward prototypes
protected function integer of_setmenustatus (ref menu am_item, string as_window, boolean ab_override)
protected function integer of_setmenu (string as_objname, menu am_menu)
public function integer of_initsecurity (n_tr atr_trans, string as_appname, string as_userid, string as_defaultgroup)
protected function integer of_loadsecurity (string as_object)
public function boolean of_setsecurity (datawindow adw_obj)
protected function integer of_setdatawindowcolumns (datawindow adw_obj)
protected function boolean of_findentry (string as_win, string as_object)
protected function string of_gettag (string as_tag)
protected function integer of_scandatawindow (string as_win_name, datawindow adw_scan, string as_object)
public function integer of_initscanprocess (n_tr a_trans, string as_app, string as_lib_list[])
public function integer of_scanwindow (window aw_win)
protected function integer of_scancontrolarray (string as_win_name, windowobject ao_objects[], string as_object_name)
public function integer of_initsecurity (n_tr atr_trans, string as_appname, string as_userid, string as_defaultgroup, boolean ab_precache)
public function string of_getpermissions (string as_object, string as_control)
public function boolean of_setsecurity (graphicobject ago_obj)
public function boolean of_setsecurity (window aw_obj)
protected function integer of_setcontrolarray (string as_window, graphicobject ao_objects[], string as_objectname)
protected function integer of_setstate (string as_win, string as_itemname, ref boolean ab_enabled, ref boolean ab_visible)
protected function integer of_addobject (string as_app, string as_winname, string as_object, string as_objecttype, string as_desc)
protected function integer of_setcontrolstatus (graphicobject ago_item, string as_window, string as_object)
protected function integer of_setcontrolstatus (graphicobject ago_item, string as_window, string as_object, string as_itemname)
public function string of_gettype (windowobject a_object, ref string as_desc)
end prototypes

protected function integer of_setmenustatus (ref menu am_item, string as_window, boolean ab_override);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetMenuStatus
//
//	Access:  protected
//
//	Arguments : a_item : menu; menu_item to be set
//					as_window : name of window that the menu is on
//					ab_override :  menu item is to be disabled and it's toolbar item 
//					(if any) is to be made invisible. This is because it's parent menu 
//					item has been set to either invisible or disabled
//
//	Returns:  Integer
//					1 = Success
//
//	Description:  Set the passed menu item,set it's status as needed and pass 
//					  back how it was set if the override flag is set then do not 
//					  even lookup the settings, but use the passed settings.
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

string	ls_itemname
integer	li_numset

ls_itemname = lower(classname(am_item))

// override means that the menu item is to be disabled and it's 
// toolbar item (if any) is to be made invisible
If ab_override Then 
	If am_item.enabled Then am_item.enabled = False
	If am_item.toolbaritemvisible Then am_item.toolbaritemvisible = False
Else
	li_numset = of_SetState(as_window,ls_itemname,am_item.enabled,am_item.visible)
	If li_numset > 0 Then 
		// OK, we set something so lets do some other checks
		If Not am_item.visible Then 
			// OK, lets see if it has a toolbar and make it invisible as well
			am_item.toolbaritemvisible = False
		End If
	End If
End If

Return li_numset

end function

protected function integer of_setmenu (string as_objname, menu am_menu);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_SetMenu
//
//	Access:
//	protected
//
//	Arguments:
//	as_objname : string ; Name of object that the menu is part of. This could be a window or a menu.
//	am_menu : menu ; Menu that is to be set.
//
//	Returns:
//	integer
//	The number of items set on the menu
//
//	Description:
//	Sets the menu items on the passed menu based on the current 
//	contents of the ids_items datastore. 
//	Note: The ids_items datastore must have already been filtered appropriately
//	before calling this function.
//	
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
integer	li_idx, li_num_menus, li_count, li_numset
menu		lm_menu
str_menu	lstr_menu_list[]
boolean	lb_override
	
li_num_menus = 1
lstr_menu_list[li_num_menus].mnu = am_menu
lstr_menu_list[li_num_menus].override = False
Do While li_num_menus > 0
	lm_menu = lstr_menu_list[li_num_menus].mnu
	li_numset += of_SetMenuStatus(lm_menu, as_objname, lstr_menu_list[li_num_menus].override)
//		If a menu item is disabled or invisible then make sure that its' child items are disabled as well
//		This is done to make sure that any toolbar items that are on child menu items are not visible
	lb_override =  Not lm_menu.visible Or Not lm_menu.enabled
	li_num_menus = li_num_menus - 1
	li_count = upperbound(lm_menu.item) 
	For li_idx = 1 To li_count
		li_num_menus = li_num_menus + 1
		lstr_menu_list[li_num_menus].mnu = lm_menu.item[li_idx]		
		lstr_menu_list[li_num_menus].override = lb_override
	Next
Loop

Return li_numset

end function

public function integer of_initsecurity (n_tr atr_trans, string as_appname, string as_userid, string as_defaultgroup);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_InitSecurity
//
//	Access:  public
//
//	Arguments : 
//	atr_trans 			used to connect to the database
//	as_appname			application id
//	as_userid			user id
//	as_defaultgroup	group to be used if the user does not belong to one
//
//	Returns:  Integer. 1 = OK
//							-1 = Transaction not connected
//							-2 = Application not in dataabse
//							-3 = User not in database
//							-4 = User is not a member of any groups and default group does not exist
//							-5 = Default group not supplied
//							-6 = Error retrieving information
//
//
//	Description:	Initialize the database connection, application and user id's. 
//						Used when setting security.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0	Added ab_precache parameter
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

return of_initsecurity(atr_trans, as_appname, as_userid, as_defaultgroup, False)


end function

protected function integer of_loadsecurity (string as_object);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_LoadSecurity
//
//	Access:  protected
//
//	Arguments : 
//	as_object	name of object to load security for
//
//	Returns:  Integer
//				 1 if there is security on the object
//				 0 if there is not security
//				-1 for error
//
//	Description:  Reads in the security inrofmatino about the window for the current user
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   	Initial version
// 5.0.03	force sorting after retrieve
//	6.0 		Add precache code.  Changed return type from boolean to integer
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

integer  li_rc, li_idx
string 	ls_object

// check arguments
If len(as_object) < 0 or isnull(as_object) then Return -1

ls_object = lower(as_object)

// filter the datastore for rows matching this object name
is_currfilter = "window='" + ls_object + "'"
If ids_items.SetFilter(is_currfilter) <> 1 Then Return -1
If ids_items.Filter() <> 1 Then Return -1

// if we have rows then we have loaded security for this object before
il_numberofrows = ids_items.RowCount()
If il_numberofrows = -1 Then
	Return -1
End If

// Check if items are already cached or is object has been retrieved before.  
//	If so, no need to re-retrieve them
If Not ib_precache Then 
	// first time for this object
	If (il_numberofrows = 0) Then  
		il_numberofrows = ids_items.Retrieve(is_app, ls_object, is_userID )
		If il_numberofrows = -1 Then
			Return -1
		End If
		
		// read in the setting for all the groups the the user belongs to - appending to the datastore
		For li_idx = 1 To ii_numgroups 
			li_rc = ids_items.Retrieve(is_app, ls_object, ids_groups.object.group_name[li_idx] )
			If li_rc = -1 Then
				Return -1
			Else
				// Resort to force ordering
				ids_items.sort() 
				il_numberofrows += li_rc
			End If
		Next
	End If
End If

If il_numberofrows > 0 Then
	Return 1
Else
	Return 0
End If

end function

public function boolean of_setsecurity (datawindow adw_obj);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetSecurity
//
//	Access:		public
//
//	Arguments: 
//	aw_dw 		Datawindow to the security set for
//
//	Returns:		Boolean
//					True if security was set otherwise false
//
//	Description:  Sets the security for the passed datawindow. 
//					It only uses the security that has been specified 
//					for the dataobject as a seperate object in the security tables
//
//	Note:  This function can be used to secure dynamically created datawindows objects
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

string		ls_dwname
integer     li_rc

// check arguments
If IsNull(adw_obj) or Not IsValid(adw_obj) Then Return False

// check if security was set
if not ib_initsecurity then return false

ls_dwname = adw_obj.dataobject
if len(ls_dwname) = 0 then return false

IF of_LoadSecurity(ls_dwname) < 1 then return false

of_SetDatawindowColumns ( adw_obj )

return true


end function

protected function integer of_setdatawindowcolumns (datawindow adw_obj);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetDataWindowColumns
//
//	Access:		protected
//
//	Arguments:
//	adw_obj		datawindow
//
//	Returns:		integer
//				the number of columns set
//				-1 = error occured
//
//	Description:	Sets the columns on the passed datawindow control based on the current 
//		contents of the ids_items datastore. 
//
//	Note: The ids_items datastore must have already been filtered appropriately
//	before calling this function.
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
integer	li_idx, li_posi, li_rc, li_count
string	ls_currentstatus, ls_column, ls_modstring, ls_result

// resort in case the filter reordered things
ids_items.sort() 

il_numberofrows = ids_items.RowCount() 
If il_numberofrows > 0 Then 
	For li_idx = 1 To il_numberofrows
		ls_modstring = ""
		ls_currentstatus  = ids_items.GetItemString (li_idx, "status")
		ls_column = ids_items.GetItemString (li_idx, "control")
		// get the column name. There may be control names before it.
		li_posi = pos(ls_column,".")
		Do While li_posi > 0
			ls_column = mid(ls_column, li_posi + 1)
			li_posi = pos(ls_column,".")
		Loop  
		// column/object to secure must be in the datawindow
		ls_result = adw_obj.Describe(ls_column+'.name') 
		If ls_result = "!" Then Continue

		// If column becomes disabled or invisible, disable the column by protecting it
		If ls_currentstatus = "D" or ls_currentstatus = "I" Then
			ls_modstring = ls_column + ".border=~""+is_disabledborder+"~" " + &
								 ls_column + ".protect=~"1~" "
		end if
		// if column becomes enabled then enable by unprotecting the column and make it visible
		If ls_currentstatus = "E" Then
			ls_modstring = ls_column + ".protect=~"0~" "+ ls_column + ".visible=~"1~" "
		end if
		// If column becomes invisible then make it invisible
		If ls_currentstatus = "I" Then 
			ls_modstring += ls_column + ".visible=~"0~" "
		End If
		
		ls_result = adw_obj.Modify(ls_modstring)
		If ls_result <> "" Then
			of_messagebox('pfcsecurity_setdatawindowcolumns', 'Modify failed '+ls_result, ls_modstring, &
					Information!, OK!, 1)
			Return -1
		End If
		li_count++
	Next
End If

return li_count
end function

protected function boolean of_findentry (string as_win, string as_object);// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_FindEntry
//
//	Access:  protected
//
//	Arguments : as_win : string; window to be found
//					as_object : string; object to be found
//
//	Returns:  boolean (true if found otherwise false)
//
//	Description:  Used by the scanning process, if the entry is found then it is discarded 
//     from the datastore. We discard it so that it will not deleted or updated in the database
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//		5.0	Initial version
// 		6.0	Marked obsolete
// 	   12.5	Added Metaclass Service Obsolete Tag
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
long ll_row

ll_row = ids_updates.find("window = '"+as_win+"' and control = '"+as_object+"'",1,ids_updates.rowcount())
if ll_row = 0 then return false
ids_updates.rowsdiscard(ll_row,ll_row,primary!)
return true
end function

protected function string of_gettag (string as_tag);// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetTag
//
//	Access:  protected
//
//	Arguments : as_tag : string; Tag value
//
//	Returns:  string; 
//
//	Description:  parses the passed string. If the string is empty it returns an empty string
//		if the string contains a keyword that matches what is in ics_keyword 
//			(default is 'microhelp', default seperator is ';') then the value for the keyword is returned
//		if none of the aboove is true then the original string is returned
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Marked obsolete
//	12.5	Added Metaclass Service Obsolete Tag
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
string ls_value
if as_tag = '' then return ''
ls_value = inv_string.of_GetKeyValue(as_tag,is_keyword,is_separator)
if ls_value = '' then ls_value = as_tag

return ls_value
end function

protected function integer of_scandatawindow (string as_win_name, datawindow adw_scan, string as_object);// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function: of_ScanDatawindow
//
//	Access:  protected
//
//	Arguments : as_win_name : string; name of window
//					adw_scan : datawindow ; DW to be scanned
//					as_object : string; Object that owns the datawindow control; if the 
//						object and the wondow are the same then this parameter is blank
//
//	Returns:  integer : (-1: unable to open datawindow object; -2 error on object create
//						otherwise the number of columns that were found
//
//	Description:  Scans the datawindow object and captures the information about each column
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Marked obsolete
//	12.5	Added Metaclass Service Obsolete Tag
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
string ls_dw_name,ls_query,ls_token,ls_ans,ls_name
int li_posi,li_col_cnt = 0

ls_dw_name = as_object + lower(classname(adw_scan))

ids_info.dataobject = adw_scan.dataobject
ls_query = ids_info.describe("datawindow.objects")
ls_query = lower(ls_query)
do while len(ls_query) > 0  // strip apart the tab seperated string
	li_posi = pos(ls_query,"~t")
	if li_posi = 0 then // no more tabs so take what's left of the string
		li_posi = len(ls_query)
	else
		li_posi = li_posi - 1
	end if
	ls_token = left(ls_query,li_posi) // grab off the token
	ls_query = mid(ls_query,li_posi+2) // skip past the tab 
	if len(ls_token) > 0 then 
		ls_ans =ids_info.describe(ls_token+".type ")
		ls_ans = lower(ls_ans)
		if pos(ls_ans,"column") > 0 then // is it a column?
			ls_name = ls_dw_name + "."+ls_token
			if not isnull(ls_name) and len(trim(ls_name)) > 0 then 
				ls_ans =ids_info.describe(ls_token+".dbname ") + ' : ' + ids_info.describe(ls_token+".coltype") // get the descriptive info
				if not of_FindEntry(as_win_name,ls_name) then of_addobject(is_app,as_win_name,ls_name,'Column',ls_ans )  
				li_col_cnt++
			end if
		end if
	end if
loop


return li_col_cnt
end function

public function integer of_initscanprocess (n_tr a_trans, string as_app, string as_lib_list[]);// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_InitScanProcess
//
//	Access:  public
//
//	Arguments : a_trans : n_tr ; used to connect to the database
//					as_app : string; application id
//					as_lib_list[] : string; applications library search path
//
//	Returns:  Integer; 1 for success.
//							-1 = transaction not connected
//
//	Description:  Initialize the database connection, application and library 
//               search path. Used when scanning applications
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Marked obsolete
//	12.5	Added Metaclass Service Obsolete Tag
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
if a_trans.dbhandle() = 0 then return -1
ids_updates.dataobject = 'd_pfcsecurity_templateupdate'
ids_apps.dataobject = 'd_pfcsecurity_applookup'
ids_updates.settransobject(a_trans)
ids_apps.settransobject(a_trans)
ids_items.settransobject(a_trans)
is_app = lower(as_app)
is_liblist = as_lib_list
ii_libcnt = upperbound(as_lib_list)
if ids_apps.retrieve(is_app) = 0 then // if the application does not exist in the database, add it
	ids_apps.importstring(is_app+'~t'+is_app)
end if
ib_initscanning = true
itr_trans = a_trans
return 1

end function

public function integer of_scanwindow (window aw_win);// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ScanWindow
//
//	Access:  public
//
//	Arguments 
//				aw_win : window to be scanned
//
//	Returns:  Integer 
//				 1 = Success
//				-1 = error of some sort
//				-2 = database error
//
//	Description:  Scans the passed window and captures the relevant information about 
//                      all of the controls and datawindow columns on the window
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Marked obsolete
//	12.5	Added Metaclass Service Obsolete Tag
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
string ls_win_name,ls_name
int li_cnt,li_menu_cnt,li_menu_idx,li_rc
menu lm_win_menu
menu lm_menu_list[]
window aw_window
aw_window = aw_win
long ll_row_cnt


lm_win_menu = aw_window.menuID
ls_win_name = lower(classname(aw_window))
li_rc = ids_updates.retrieve(is_app,ls_win_name)
// check for menu items
if len(aw_window.menuname) > 0 then
	li_menu_idx = 1
	if aw_window.menuid.text = '' then aw_window.menuid.text = 'Top Level Menu Object'
	lm_menu_list[li_menu_idx] = aw_window.menuid
	do while li_menu_idx > 0
		lm_win_menu = lm_menu_list[li_menu_idx]
		ls_name = lower(classname(lm_win_menu))
		if (not isnull(ls_name)) and (len(trim(ls_name)) > 0) then 
			if not of_FindEntry(ls_win_name,ls_name) then of_addobject(is_app,ls_win_name,ls_name,'MenuItem',lm_win_menu.text )  
		end if
		li_menu_idx --
		li_menu_cnt = upperbound(lm_win_menu.item)
		for li_cnt = 1 to li_menu_cnt
			li_menu_idx ++
			lm_menu_list[li_menu_idx] = lm_win_menu.item[li_cnt]		
		next
	loop
end if
// check for controls and datawindows
this.of_ScanControlArray(ls_win_name,aw_win.control,'')

ids_updates.setfilter("not isrownew()")
ids_updates.filter()

ll_row_cnt = ids_updates.rowcount()
if ll_row_cnt > 0 then ids_updates.rowsmove(1,ll_row_cnt,primary!,ids_updates,1,delete!)
		
ids_updates.setfilter("")
ids_updates.filter()

li_rc = ids_apps.update(true,false)
if li_rc >= 0 then li_rc = ids_updates.update(true,false)
if li_rc < 1 then
	rollback using itr_trans;
	if itr_trans.sqlcode <> 0 then return -2
	return -1
else
	commit using itr_trans;
	if itr_trans.sqlcode <> 0 then return -2
	ids_apps.resetupdate()
	ids_updates.resetupdate()
	return 1
end if
	
end function

protected function integer of_scancontrolarray (string as_win_name, windowobject ao_objects[], string as_object_name);// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ScanControlArray
//
//	Access:  protected
//
//	Arguments : as_win_name : string ; window name
//					ao_objects[] : array of window objects; control array to scan
//					as_object_name : name of object that owns the control array. If the 
//						control array is owned by the window then this parameter is blank
//
//	Returns:  Integer
//					1 = success
//
//	Description:  Scans the passed control array. It matchs up the controls with their 
//		corresponding entries in the database and sets them accordingly
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Marked obsolete
//	12.5	Added Metaclass Service Obsolete Tag
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

int li_idx,li_obj_cnt,li_tab_cnt,li_tab_idx
string ls_name,ls_tab_name,ls_object_type,ls_desc
datawindow ldw_scan
userobject lu_uo
tab l_tab


// check for controls and datawindows
li_obj_cnt = upperbound(ao_objects)
for li_idx = 1 to li_obj_cnt
	choose case typeof(ao_objects[li_idx]) 
		case datawindow!
			ls_name = as_object_name+lower(classname(ao_objects[li_idx]))
			ls_object_type = of_GetType(ao_objects[li_idx],ls_desc)
			if not of_FindEntry(as_win_name,ls_name) then of_addobject(is_app,as_win_name,ls_name,'DataWindow',ls_desc )  

			ldw_scan = ao_objects[li_idx]
			of_ScanDatawindow(as_win_name,ldw_scan,as_object_name)
		case userobject!
			ls_name = as_object_name+lower(classname(ao_objects[li_idx]))
			ls_object_type = of_GetType(ao_objects[li_idx],ls_desc)
			if not of_FindEntry(as_win_name,ls_name) then of_addobject(is_app,as_win_name,ls_name,'UserObject',ls_desc )  

			lu_uo = ao_objects[li_idx]
			if as_object_name <> '' then 
				ls_name = as_object_name + '.'+ lower(classname(lu_uo))+ '.'
			else
				ls_name = lower(classname(lu_uo))+ '.'
			end if
			of_ScanControlArray(as_win_name,lu_uo.control,ls_name)
		case tab!
			ls_name = as_object_name+lower(classname(ao_objects[li_idx]))
			ls_object_type = of_GetType(ao_objects[li_idx],ls_desc)
			if not of_FindEntry(as_win_name,ls_name) then of_addobject(is_app,as_win_name,ls_name,'Tab',ls_desc )  
			
			ls_tab_name = ls_name
			l_tab = ao_objects[li_idx]
			li_tab_cnt = upperbound(l_tab.control)
			for li_tab_idx = 1 to li_tab_cnt
				lu_uo = l_tab.control[li_tab_idx]
				ls_name = ls_tab_name + '.'+ lower(classname(lu_uo))
				ls_object_type = of_GetType(lu_uo,ls_desc)

				if not of_FindEntry(as_win_name,ls_name) then of_addobject(is_app,as_win_name,ls_name,'TabPage',ls_desc )  
				ls_name = ls_name + '.'
				of_ScanControlArray(as_win_name,lu_uo.control,ls_name)
			next
		case mdiclient!
			// do nothing as the mdiclient is not something that we would want to set security on anyway
		case else 
			ls_name = as_object_name+lower(classname(ao_objects[li_idx]))
			if not isnull(ls_name) and len(trim(ls_name)) > 0 then 
				ls_object_type = of_GetType(ao_objects[li_idx],ls_desc)
				if not of_FindEntry(as_win_name,ls_name) then of_addobject(is_app,as_win_name,ls_name,ls_object_type,ls_desc )  
			end if
	end choose
next
return 1
end function

public function integer of_initsecurity (n_tr atr_trans, string as_appname, string as_userid, string as_defaultgroup, boolean ab_precache);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_InitSecurity
//
//	Access:  public
//
//	Arguments : 
//	atr_trans 			used to connect to the database
//	as_appname			application id
//	as_userid			user id
//	as_defaultgroup	group to be used if the user does not belong to one
//	ab_precache			preload all settings for the user - Default is false
//
//	Returns:  Integer. 1 = OK
//							-1 = Transaction not connected
//							-2 = Application not in dataabse
//							-3 = User not in database
//							-4 = User is not a member of any groups and default group does not exist
//							-5 = Default group not supplied
//							-6 = Error retrieving information
//
//
//	Description:	Initialize the database connection, application and user id's. 
//						Used when setting security.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.03 Added additional error checking for retrieve statements
//	5.0.03 Fixed problem where is_defaultgroup was used instead of as_defaultgroup
//	6.0 Added ab_precache option
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

integer	li_rc, li_idx

// transaction not connected
if NOT atr_trans.of_isconnected() then return -1

as_defaultgroup = lower(as_defaultgroup)
as_appname = lower(as_appname)
as_userid = lower(as_userid)

 // Is this a valid application?
ids_groups.dataobject = 'd_pfcsecurity_applookup'
ids_groups.of_settransobject(atr_trans)
li_rc = ids_groups.retrieve(as_appname)
if li_rc = 0 then return -2
if li_rc < 0 then return -6

 // Is this a valid user ?
ids_groups.dataobject = 'd_pfcsecurity_userlookup'
ids_groups.of_settransobject(atr_trans)
li_rc= ids_groups.retrieve(as_userid)
if li_rc = 0 then return -3
if li_rc < 0 then return -6

 // how many groups does this user belong to ?
ids_groups.dataobject = 'd_pfcsecurity_grouplookup'
ids_groups.of_settransobject(atr_trans)
ii_numgroups = ids_groups.retrieve(as_userid)
if ii_numgroups = 0  then 
	 // Is default group valid ?
	if len(as_defaultgroup) > 0 then
		ids_groups.dataobject = 'd_pfcsecurity_groupverify'
		ids_groups.of_settransobject(atr_trans)
		ii_numgroups = ids_groups.retrieve(as_defaultgroup)
		if ii_numgroups = 0 then return -4
	else
		return -5
	end if
elseif ii_numgroups < 0 then
	return -6
end if 

// set up item list
ids_items.dataobject = 'd_pfcsecurity_controllist'
ids_items.of_settransobject(atr_trans)
ids_items.of_setappend(true)

// set the values
ib_initsecurity = true
is_defaultgroup = as_defaultgroup
is_app = as_appname
is_userID = as_userid
ib_precache = ab_precache
itr_trans = atr_trans

If ab_precache Then
	// go and retrieve ALL settings for this user
	ids_items.dataobject = 'd_pfcsecurity_allcontrollist'
	ids_items.of_settransobject(atr_trans)
	li_rc = ids_items.retrieve(as_appname, as_userid)
	// read in the setting for all the groups the the user belongs to
	For li_idx = 1 To ii_numgroups 
		li_rc = ids_items.Retrieve(is_app, ids_groups.object.group_name[li_idx] )
		If li_rc = -1 Then
			Return -1
		Else 
			// Resort to force ordering
			ids_items.sort() 
			il_numberofrows += li_rc
		End If
	Next
End If

Return 1

end function

public function string of_getpermissions (string as_object, string as_control);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetPermissions
//
//	Access:		public
//
//	Arguments:
//	as_object		object to check security on
//	as_control		Name of object/control to check security for. 
//
//	Returns:		string
//					ENABLED, DISABLED, NOTSET, INVISIBLE
//					'!' = Error
//
//	Description:
//		Checks the security table to get the objects permission
//	
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

long		ll_rowcount
string	ls_status = NOTSET, ls_origfilter

if IsNull(as_control) or Isnull(as_object) Then Return '!'
If (as_control = '') or (as_object = '') Then Return '!'

// remember what we were looking at before
ls_origfilter = ids_items.Describe("DataWindow.Table.Filter")

is_currfilter = "window=~""+as_object+"~" AND control=~""+as_control+"~""
IF ids_items.SetFilter(is_currfilter) <> 1 then return '!'
IF ids_items.Filter() <> 1 then return '!'

ll_rowcount = ids_items.RowCount()
If ll_rowcount > 0 Then
	// resort in case the filter reordered things
	ids_items.sort() 
	// the first item is the one the security service uses
	ls_status = ids_items.GetItemString(1, 'status')
End If

// set the filter back to what it was
is_currfilter = ls_origfilter
IF ids_items.SetFilter(ls_origfilter) <> 1 Then Return '!'
IF ids_items.Filter() <> 1 Then Return '!'

il_numberofrows = ids_items.RowCount()
// resort in case the filter reordered things
ids_items.sort() 

Return ls_status
end function

public function boolean of_setsecurity (graphicobject ago_obj);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetSecurity
//
//	Access:  public
//
//	Arguments : 
//	ago_obj		object to have security set for
//
//	Returns:  Boolean; (True if security was set otherwise false)
//
//	Description:  Sets the security for the passed object. For this function to work properly
// 		the of_init function MUST have been called first.
//
//	Note:  This function can be used to secure dynamically created objects
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

string		ls_objname
integer		li_rc
classdefinition	l_class, l_aww
menu 			lm_menu
userobject	luo_object
tab			ltab_tab

// check arguments
If IsNull(ago_obj) or Not IsValid(ago_obj) Then Return False

// check if security was set
if not ib_initsecurity then return false

// 6.0 metaclass information feature
l_class = ago_obj.classdefinition
l_aww =  l_class.parentclass
if not isnull(l_class.parentclass) then l_class = l_class.ancestor
ls_objname = l_class.name

IF of_LoadSecurity(ls_objname) < 1 then return false
	
il_numberofrows = ids_items.RowCount()

choose case l_class.datatypeof
	case 'menu'
		lm_menu = ago_obj
		of_setmenu(ls_objname, lm_menu)
	case 'userobject'
		luo_object = ago_obj
		of_SetControlArray(ls_objname, luo_object.control, '')
	case 'tab'
		ltab_tab = ago_obj
		of_SetControlArray(ls_objname, ltab_tab.control, '')
	case 'datawindow'
		of_setcontrolstatus ( ago_obj, ls_objname, '', '' )
	case else
		of_setcontrolstatus ( ago_obj, ls_objname, '', ls_objname )
end choose

return true


end function

public function boolean of_setsecurity (window aw_obj);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetSecurity
//
//	Access:  public
//
//	Arguments : 
//	aw_obj 	window to have security set for
//
//	Returns:  Boolean; (True if security was set otherwise false)
//
//	Description:  Sets the security for the passed window. For this function to work properly
// 		the of_init function MUST have been called first.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0	Cleanup code
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

string	ls_winname
integer	li_rc

// check arguments
If IsNull(aw_obj) or Not IsValid(aw_obj) Then Return False

// check if security was set
If Not ib_initsecurity Then Return False

ls_winname = lower( aw_obj.classname() )
If of_LoadSecurity(ls_winname) < 1 Then Return False

il_numberofrows = ids_items.RowCount()

li_rc = of_SetControlArray(ls_winname, aw_obj.control, '')

// check for menu items
If len(aw_obj.menuname) > 0 Then
	if of_setmenu(ls_winname, aw_obj.menuid) = 0 then 
		// no security on the menu when associated with the window
		of_LoadSecurity(aw_obj.menuname)
		of_setmenu(aw_obj.menuname, aw_obj.menuid)  // so let's check the menu by it's self
	end if
End If

Return True


end function

protected function integer of_setcontrolarray (string as_window, graphicobject ao_objects[], string as_objectname);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetControlArray
//
//	Access:  protected
//
//	Arguments : 
//	as_window	 Name of window
//	ao_objects[]	control array
//	as_objectname 	name of object that owns the control array.
//								blank if the window if the owner of the array
//
//	Returns:  Integer
//				The number of controls set
//				0 = Nothing set
//
//	Description:  Scans the passed control array and set the security as needed on the
//					controls. If the control is a tab or User object then it is exploded into it's controls.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0   Updated to look for object specific settings if no window specific settings used
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

integer	li_count, li_idx, li_tab_cnt, li_tab_idx, li_rc, li_numset, li_numsettemp
string	ls_name, ls_tab_name, ls_page_name
userobject	lu_uo
tab 			l_tab

// check for controls
li_count =  upperbound(ao_objects[])
For li_idx = 1 To li_count
	Choose Case typeof(ao_objects[li_idx])
		Case userobject!
			 // set security for just the user object
			lu_uo = ao_objects[li_idx]
			li_numset = of_SetControlStatus(lu_uo, as_window, as_objectname, '')
			
			If as_objectname = '' Then
				ls_name = lower( classname(lu_uo))
			Else
				ls_name = as_objectname + '.' + lower( classname(lu_uo) )
			End If		
			li_numset += of_SetControlArray(as_window, lu_uo.control, ls_name)
			// check the user object for object level security if no window security
			If li_numset = 0 Then 
				of_setsecurity(ao_objects[li_idx])
			End If

		Case tab!
			// set security for just the tab
			l_tab = ao_objects[li_idx]
			li_numset = of_SetControlStatus(l_tab, as_window, as_objectname, '') 
			If as_objectname = '' Then 
				ls_tab_name = lower( classname(l_tab) ) 
			Else
				ls_tab_name = as_objectname + '.'+ lower( classname(l_tab) ) 
			End If				
			
			li_tab_cnt = upperbound(l_tab.control)
			For li_tab_idx = 1 To li_tab_cnt
				// scan the tabpages
				lu_uo = l_tab.control[li_tab_idx]
				li_numset += of_SetControlStatus(lu_uo, as_window, ls_tab_name, '') 
				// check the tabpage for object level security if no window security
				If li_numset = 0 Then 
					// do not keep track of the number of items set here
					of_setsecurity(lu_uo) 
				End If
				// now set security for the controls on the tabpage
				ls_page_name = ls_tab_name +  '.' + lower( classname(lu_uo) )
				li_numsettemp = of_SetControlArray(as_window, lu_uo.control, ls_page_name)
				// check the tabpage for object level security if no window security
				If li_numsettemp = 0 Then 
					// do not keep track of the number of items set here
					of_setsecurity(lu_uo) 
				End If
				li_numset += li_numsettemp
			Next
			// check the tab for object level security if no window security
			If li_numset = 0 Then 
				of_setsecurity(ao_objects[li_idx])
			End If
		Case mdiclient!
			// do nothing as the mdiclient is not something that we would want 
			// to set security on anyway
		Case Else
			li_numset = of_SetControlStatus(ao_objects[li_idx], as_window, as_objectname, '')
			// check the graphic object for object level security if no window security
			If li_numset = 0 Then
				of_setsecurity(ao_objects[li_idx])
			End If
	End Choose
Next

// reset the filter
of_loadsecurity(as_window) 

Return li_numset

end function

protected function integer of_setstate (string as_win, string as_itemname, ref boolean ab_enabled, ref boolean ab_visible);//////////////////////////////////////////////////////////////////////////////
//
//	Function: of_SetState
//
//	Access:  protected
//
//	Arguments : as_win : string; window name
//					as_itemname : string control name
//					ab_enabled : boolean; enabled attribute of the control
//					ab_visible : boolean; visible attribute of the control
//
//	Returns:  Integer
//				0 = Control not found
//				1 = Success
//
//	Description:  Gets the status of the passed window control pair and then sets the
//					passed attributes appropriately. If the attribute is already set to what
//					we want it to be then DO NOT set it again.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.03  Added test for isnull(ab_enabled). This allows using this function for setting the visible 
//			attribute for drawobjects which do not have an enabled attribute
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
string	ls_status
long		ll_rownbr
string	ls_findexp
string 	ls_orig_filter
integer	li_idx, li_count
string	ls_control, ls_win
string	ls_desiredfilter

ls_orig_filter = ids_items.Describe("DataWindow.Table.Filter")

ls_desiredfilter = "window='"+as_win+"'"
If is_currfilter <> ls_desiredfilter Then
	is_currfilter = ls_desiredfilter
	ids_items.SetFilter(is_currfilter)
	ids_items.Filter()
	// resort in case the filter reordered things
	ids_items.sort() 
	il_numberofrows = ids_items.RowCount()
End If

ls_findexp = "window=~""+as_win+"~" AND control=~""+as_itemname+"~""
ll_rownbr = ids_items.Find(ls_findexp, 0, il_numberofrows)

IF ll_rownbr = 0 THEN 
	return 0
End If	

ls_status = ids_items.GetItemString(ll_rownbr, "status")

IF len(ls_status) = 1 THEN
	//   do not reset the enabled attribute if it is already what we want
	if not isnull(ab_enabled) then // if ab_enabled is null then do not change the attribute
		IF ab_enabled AND ((ls_status = DISABLE) OR (ls_status = INVISIBLE)) THEN
			ab_enabled = false
		ELSEIF NOT ab_enabled AND (ls_status = ENABLE) THEN
			ab_enabled = true
		END IF
	end if
	//  If invisible and not already invisible then make invisible
	//  otherwise if enabled and invisible then make visible
	IF ls_status = INVISIBLE AND ab_visible THEN 
		ab_visible = false
	ELSEIF ((ls_status = ENABLE) or (ls_status = DISABLE)) AND NOT ab_visible THEN 
		ab_visible = true
	END IF
	
end if

return 1

end function

protected function integer of_addobject (string as_app, string as_winname, string as_object, string as_objecttype, string as_desc);// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_addobject
//
//	Access:  protected
//
//	Arguments : as_app : application
//					as_winname : window name
//					as_object : object name
//					as_objecttype : object type
//					as_desc : description of object
//
//	Returns:  integer; Return code from import string
//	
//
//	Description:  Add an objects information to the template Datastore
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Remove Non Printing chars from description
// 6.0 	Marked obsolete 
//	12.5	Added Metaclass Service Obsolete Tag
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
integer li_rc
as_desc = inv_string.of_removenonprint(as_desc) // remove potential CRLF pairs
li_rc = ids_updates.importstring(as_app+'~t'+as_winname+'~t'+as_object+'~t'+as_objecttype+'~t'+as_desc )  
if li_rc < 0 then
	messagebox('Security Scanner','Error on importstring. Error code = '+string(li_rc)+'. Attempted to import the following string ~r~n'+as_app+'~t'+as_winname+'~t'+as_object+'~t'+as_objecttype+'~t'+as_desc)
end if
return li_rc

end function

protected function integer of_setcontrolstatus (graphicobject ago_item, string as_window, string as_object);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetControlStatus
//
//	Access:  protected
//
//	Arguments : 
//	ago_item		control to be set
//	as_window : name of window that the control is on
//	as_object : object that the control is on within the window
//
//	Returns:  Integer
//				The number of controls set
//				 0 = Nothing was set
//				-1 = an error occurred
//
//	Description:  Figure out the kind of control that was passed and then 
//	set it's status as needed
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0 	Added new parameter (as_itemname) to support standalone objects
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

// call overloaded function
Return of_SetControlStatus(ago_item, as_window, as_object, '')

end function

protected function integer of_setcontrolstatus (graphicobject ago_item, string as_window, string as_object, string as_itemname);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetControlStatus
//
//	Access:  protected
//
//	Arguments : 
//	ago_item		control to be set
//	as_window	name of window that the control is on
//	as_object	object that the control is on within the window
//	as_itemname	name to use instead of the derived name.
//
//	Returns:  Integer
//				The number of controls set
//				 0 = Nothing was set
//				-1 = an error occurred
//
//	Description:  Figure out the kind of control that was passed and then 
//						set it's status as needed
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.03 Added support for drawobjects. These only have a visible attribute
//	6.0 Added new parameter (as_itemname) to support standalone objects
// 7.0 Added support for new controls: vprogressbar, vtrackbar, hprogressbar, 
//		 htrackbar, picturehyperlink, statictexthyperlink
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

string 	ls_itemname,  ls_result, ls_mod_string
integer	li_rc, li_idx, li_posi, li_numset
string	ls_current_status, ls_column
string	ls_datawindow, ls_orig_filter
boolean	lb_dummy, lb_null

menu				l_menu
commandbutton	l_cb
checkbox			l_cbx
radiobutton		l_rb
datawindow		l_dw
userobject		l_uo 
tab				l_tab 
listbox			l_lb
DROPDOWNLISTBOX			l_ddlb
dropdownpicturelistbox	l_ddplb
singlelineedit	l_sle
multilineedit	l_mle
editmask			l_em
picturelistbox	l_plb 
richtextedit	l_rte 
Statictext		l_st 
groupbox			l_gb 
treeview			l_tv 
listview			l_lv 
olecustomcontrol			l_ocx 
picturebutton	l_pb 
graph				l_graph
vscrollbar		l_vsb 
hscrollbar		l_hsb 
picture			l_pic 
line				l_line
rectangle		l_rectangle
roundrectangle l_roundrectangle
oval				l_oval
olecontrol		l_oc
vprogressbar	l_vpb
vtrackbar		l_vtb
hprogressbar	l_hpb
htrackbar		l_htb
picturehyperlink l_phl
statichyperlink l_sth
			
If as_itemname = '' Then
	If as_object = '' Then
		ls_itemname = lower(classname(ago_item))
	Else
		ls_itemname = as_object + '.' + lower(classname(ago_item))
	End If
else
	ls_itemname = as_itemname
End If

Choose Case typeof(ago_item) 
	Case menu!
		l_menu = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_menu.enabled, l_menu.visible)
		If Not l_menu.visible Then 
			// OK, lets see if it has a toolbar and make it invisible as well
			l_menu.toolbaritemvisible = False
		End If
	Case commandbutton!
		l_cb = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_cb.enabled, l_cb.visible)
	Case checkbox!
		l_cbx = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_cbx.enabled, l_cbx.visible)
	Case radiobutton!
		l_rb = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_rb.enabled, l_rb.visible)
	Case datawindow!
		l_dw = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_dw.enabled, l_dw.visible)
		ls_datawindow = trim(ls_itemname)
		ls_orig_filter = ids_items.Describe("DataWindow.Table.Filter")
		// this filter will keep any columns that have a datawindow reference in it
		is_currfilter = "window=~""+as_window+"~" AND pos(control, ~""+ls_datawindow+"~")"
		IF ids_items.SetFilter("window=~""+as_window+"~" AND pos(control, ~""+ls_datawindow+"~") > 0") <> 1 then return -1
		IF ids_items.Filter() <> 1 then return -1
		il_numberofrows = ids_items.RowCount()
		If il_numberofrows < 0 Then
			Return -1
		ElseIf 	il_numberofrows > 0 Then
			// resort in case the filter reordered things
			ids_items.sort() 
			li_numset += of_setdatawindowcolumns(l_dw)
		End If

		is_currfilter = ls_orig_filter
		IF ids_items.SetFilter(ls_orig_filter) <> 1 Then Return -1
		IF ids_items.Filter() <> 1 Then Return -1
		il_numberofrows = ids_items.RowCount()
		// resort in case the filter reordered things
		ids_items.sort() 
	Case userobject!
		l_uo = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_uo.enabled, l_uo.visible)
	Case tab!
		l_tab = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_tab.enabled, l_tab.visible)
	Case listbox!
		l_lb = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_lb.enabled, l_lb.visible)
	Case dropdownlistbox!
		l_ddlb = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_ddlb.enabled, l_ddlb.visible)
	Case dropdownpicturelistbox!
		l_ddplb = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_ddplb.enabled, l_ddplb.visible)
	Case singlelineedit!
		l_sle = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_sle.enabled, l_sle.visible)
	Case multilineedit!
		l_mle = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_mle.enabled, l_mle.visible)
	Case editmask!
		l_em = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_em.enabled, l_em.visible)
	Case picturelistbox! 
		l_plb = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_plb.enabled, l_plb.visible)
	Case richtextedit!
		l_rte = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_rte.enabled, l_rte.visible)
	Case statictext!
		l_st = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_st.enabled, l_st.visible)
	Case groupbox!
		l_gb = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_gb.enabled, l_gb.visible)
	Case treeview!
		l_tv = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_tv.enabled, l_tv.visible)
	Case listview!
		l_lv = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_lv.enabled, l_lv.visible)
	Case olecustomcontrol!
		l_ocx = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_ocx.enabled, l_ocx.visible)
	Case picturebutton! 
		l_pb = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_pb.enabled, l_pb.visible)
	Case graph!
		l_graph = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_graph.enabled, l_graph.visible)
	Case vscrollbar! // scroll bars can only be visible or invisible not enabled
		l_vsb = ago_item
		li_numset = of_SetState(as_window, ls_itemname, lb_dummy, l_vsb.visible)
	Case hscrollbar!
		l_hsb = ago_item
		li_numset = of_SetState(as_window, ls_itemname, lb_dummy, l_hsb.visible)
	Case picture!
		l_pic = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_pic.enabled, l_pic.visible)
	Case line! 
		l_line = ago_item
		setnull(lb_null)
		li_numset = of_SetState(as_window, ls_itemname, lb_null, l_line.visible)
	Case oval!
		l_oval = ago_item
		setnull(lb_null)
		li_numset = of_SetState(as_window, ls_itemname, lb_null, l_oval.visible)
	Case rectangle!
		l_rectangle = ago_item
		setnull(lb_null)
		li_numset = of_SetState(as_window, ls_itemname, lb_null, l_rectangle.visible)
	Case roundrectangle!
		l_roundrectangle = ago_item
		setnull(lb_null)
		li_numset = of_SetState(as_window, ls_itemname, lb_null, l_roundrectangle.visible)
	Case olecontrol!
		l_oc = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_oc.enabled, l_oc.visible)
	Case vprogressbar!
		l_vpb = ago_item
		li_numset = of_SetState(as_window, ls_itemname, lb_dummy, l_vpb.visible)
	Case vtrackbar!
		l_vtb = ago_item
		li_numset = of_SetState(as_window, ls_itemname, lb_dummy, l_vtb.visible)
	Case hprogressbar!
		l_hpb = ago_item
		li_numset = of_SetState(as_window, ls_itemname, lb_dummy, l_hpb.visible)
	Case htrackbar! 
		l_htb = ago_item
		li_numset = of_SetState(as_window, ls_itemname, lb_dummy, l_htb.visible)
	Case picturehyperlink!
		l_phl = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_phl.enabled, l_phl.visible)
	Case statichyperlink!
		l_sth = ago_item
		li_numset = of_SetState(as_window, ls_itemname, l_sth.enabled, l_sth.visible)
		
	Case Else 
		// Big time error here.
		of_Messagebox('pfc_securitystatuserror', 'of_setcontrolstatus', &
					'Unknown control '+ls_itemname+'. Please contact your system administrator.', &
					stopsign!, OK!, 1)
		Halt Close

End Choose

Return li_numset

end function

public function string of_gettype (windowobject a_object, ref string as_desc);// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetType
//
//	Access:  public
//
//	Arguments:
//	a_object : windowobject ; Object that we want to determine the type of
//
//	Returns:  String
//	Name of the object type
//
//	Description:  Provide ASCII format of typeof() function return
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Marked obsolete
//	12.5	Added Metaclass Service Obsolete Tag
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


choose case typeof(a_object) 
	case commandbutton!
		commandbutton l_cb
		l_cb = a_object
		as_desc = l_cb.text
		if as_desc = '' then as_desc = of_GetTag(l_cb.tag)
		return 'CommandButton'
	case checkbox!
		checkbox l_cbx
		l_cbx = a_object
		as_desc = l_cbx.text
		if as_desc = '' then as_desc = of_GetTag(l_cbx.tag)
		return 'CheckBox'
	case radiobutton!
		radiobutton l_rb
		l_rb = a_object
		as_desc = l_rb.text
		if as_desc = '' then as_desc = of_GetTag(l_rb.tag)
		return 'RadioButton'
	case datawindow!
		datawindow l_dw
		l_dw = a_object
		as_desc = l_dw.title
		if as_desc = '' then as_desc = of_GetTag(l_dw.tag)
		return 'DataWindow'
	case userobject!
		userobject l_uo
		l_uo = a_object
		as_desc = l_uo.text
		if as_desc = '' then as_desc = of_GetTag(l_uo.tag)
		return 'UserObject'
	case tab!
		as_desc = of_GetTag(a_object.tag)
		return 'Tab'
	case listbox!
		as_desc = of_GetTag(a_object.tag)
		return 'ListBox'
	case dropdownlistbox!
		dropdownlistbox l_ddlb
		l_ddlb = a_object
		as_desc = l_ddlb.text
		if as_desc = '' then as_desc = of_GetTag(l_ddlb.tag)
		return 'DropDownListBox'
	case dropdownpicturelistbox!
		dropdownpicturelistbox l_ddplb
		l_ddplb = a_object
		as_desc = l_ddplb.text
		if as_desc = '' then as_desc = of_GetTag(l_ddplb.tag)
		return 'DropDownPictureListBox'
	case singlelineedit!
		singlelineedit l_sle
		l_sle = a_object
		as_desc = l_sle.text
		if as_desc = '' then as_desc = of_GetTag(l_sle.tag)
		return 'SingleLineEdit'
	case multilineedit!
		multilineedit l_mle
		l_mle = a_object
		as_desc = l_mle.text
		if as_desc = '' then as_desc = of_GetTag(l_mle.tag)
		return 'MultiLineEdit'
	case  editmask!
		editmask l_em
		l_em = a_object
		as_desc = l_em.text
		if as_desc = '' then as_desc = of_GetTag(l_em.tag)
		return 'EditMask'
	case picturelistbox!
		as_desc = of_GetTag(a_object.tag)
		return 'PictureListBox'
	case richtextedit!
		as_desc = of_GetTag(a_object.tag)
		return 'RichTextEdit'
	case statictext!
		statictext l_st
		l_st = a_object
		as_desc = l_st.text
		if as_desc = '' then as_desc = of_GetTag(l_st.tag)
		return 'StaticText'
	case groupbox!
		groupbox l_gb
		l_gb = a_object
		as_desc = l_gb.text
		if as_desc = '' then as_desc = of_GetTag(l_gb.tag)
		return 'GroupBox'
	case treeview!
		as_desc = of_GetTag(a_object.tag)
		return 'TreeView'
	case listview!
		as_desc = of_GetTag(a_object.tag)
		return 'ListView'
	case olecontrol!
		as_desc = of_GetTag(a_object.tag)
		if as_desc = '' then
			olecontrol l_ole
			l_ole = a_object
//			as_desc = l_ole.classshortname
		end if
		return 'OLE Control'
	case olecustomcontrol!
		as_desc = of_GetTag(a_object.tag)
		if as_desc = '' then
			olecustomcontrol l_ocx
			l_ocx = a_object
//			as_desc = l_ocx.classshortname
		end if
		return 'OCX'
	case picturebutton!
		picturebutton l_pb
		l_pb = a_object
		as_desc = l_pb.text
		if as_desc = '' then as_desc = of_GetTag(l_pb.tag)
		return 'PictureButton'
	case graph!
		graph l_graph
		l_graph = a_object
		as_desc = l_graph.title
		if as_desc = '' then as_desc = of_GetTag(l_graph.tag)
		return 'Graph'
	case vscrollbar!
		as_desc = of_GetTag(a_object.tag)
		return 'VScrollBar'
	case hscrollbar!
		as_desc = of_GetTag(a_object.tag)
		return 'HScrollBar'
	case picture!
		picture l_pic
		l_pic = a_object
		as_desc = l_pic.picturename
		if as_desc = '' then as_desc = of_GetTag(l_pic.tag)
		return 'Picture'
	case line!
		as_desc = of_GetTag(a_object.tag)
		return 'Line'
	case rectangle!
		as_desc = of_GetTag(a_object.tag)
		return 'Rectangle'
	case oval!
		as_desc = of_GetTag(a_object.tag)
		return 'Oval'
	case Roundrectangle!
		as_desc = of_GetTag(a_object.tag)
		return 'RoundRectangle'
	case else
		as_desc = 'Unknown: ' + classname(a_object)
		return 'Unknown'
end choose


end function

on pfc_n_cst_security.create
call super::create
end on

on pfc_n_cst_security.destroy
call super::destroy
end on

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Constructor
//
//	Arguments: None
//
//	Returns:  None
//
//	Description:  Create all needed datastore objects
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0	Remove ids_info, ids_updates
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

ids_items = create n_ds
ids_apps = create n_ds
ids_groups = create n_ds

end event

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Destructor
//
//	(Arguments: None
//
//	(Returns:  None
//
//	Description:  Destroy all created datastore objects
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0	Remove ids_info, ids_updates
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

If isvalid(ids_apps) Then destroy ids_apps
If isvalid(ids_groups) Then destroy ids_groups
If isvalid(ids_items) Then destroy ids_items

end event


HA$PBExportHeader$pfc_n_cst_mru.sru
$PBExportComments$PFC Most Recently Used service
forward
global type pfc_n_cst_mru from n_base
end type
end forward

global type pfc_n_cst_mru from n_base
event pfc_open ( string as_commandline )
event type integer pfc_encode ( integer ai_rowindex,  ref string as_itemkey )
event type integer pfc_decode ( string as_itemkey,  ref n_cst_mruattrib anv_mruattrib )
event pfc_close ( )
end type
global pfc_n_cst_mru pfc_n_cst_mru

type variables
Protected:
boolean		ib_useregistry = False
Integer		ii_mruitemcount = 5
Integer		ii_currentmrucount = 0

string		is_mrusection = "MRU"
string		is_mrucountkey =  "ItemCount"
string		is_mruitemkey = "Item"
string		is_mruregisteredsection = "MRU Registered Id"
string		is_menuitemstring = "M_PfcMRU"
string		is_menubarline = "M_pfcmrudash1"
string		is_delimiter = ";"
string		is_userinifile
string		is_userkey

n_cst_mruattrib	inv_register[]
n_ds		ids_mrukeys

end variables

forward prototypes
protected function integer of_addmenubarline (window aw_window)
public function integer of_setdelimiter (string as_delimiter)
public function integer of_Setuseregistry (boolean ab_useregistry)
protected function integer of_writekeys (string as_inisection, string as_subkey, string as_value)
protected function integer of_readkeys (string as_inisection, string as_subkey, ref string as_value, string as_default)
public function integer of_setuserinifile (string as_userinifile)
public function string of_getuserinifile ()
public function integer of_setuserkey (string as_userkey)
public function string of_getuserkey ()
protected function integer of_filter (string as_filter)
public function integer of_reset ()
public function integer of_reset (string as_id)
public function integer of_getregistered (string as_id)
public function boolean of_isregistered (string as_id)
protected function integer of_load ()
protected function integer of_save ()
protected function integer of_write (string as_section, integer ai_itemcount)
protected function integer of_sort (string as_sort)
public function integer of_additem (n_cst_mruattrib anv_mruattrib)
public function integer of_setitemcount (integer ai_count)
public function integer of_register (string as_id, integer ai_itemcount)
public function integer of_register (string as_id)
protected function integer of_read (string as_section, string as_id)
public function integer of_restore (string as_id, window aw_window)
public function integer of_getitem (long al_row, ref n_cst_mruattrib anv_mruattrib)
public function long of_finditem (string as_menuitemtext, long al_start)
protected function integer of_updatevisuals (window aw_window, string as_menuitemtext, integer ai_menuitemindex)
public function integer of_unregister (string as_id, integer ai_itemcount)
end prototypes

event pfc_open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_open
//
//	Arguments:	
//	as_commandline:  command line parameter to the application
//
//	Returns:		None
//
//	Description:
//	Initialize the service settings (item count, load datastore)
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

// load the mru items from the ini file/registry to the service
If of_Load() < 1 Then
	If IsValid(gnv_app.inv_debug) Then
		of_MessageBox ("pfc_mru_opendebug", "PowerBuilder Class Library", &
			"The PFC MRU service" +&
			" has been requested but the REQUIRED User registry/INI File attributes" +&
			" have not been set.  Use of_SetUserKey/of_SetUserIniFile on the PFC" +&
			" MRU object to set the attribute.", &
			Exclamation!, Ok!, 1)
	End If
End If

end event

event pfc_encode;//////////////////////////////////////////////////////////////////////////////
//
//	Event:	pfc_encode
//
//	Arguments:
//	ai_rowindex		row in datastore to operate on
//	as_itemkey		key string which will be stored in registry/ini file
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Triggered when MRU items are being saved to registry/ini
// Developer can override event to place other encode logic if desired
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
string	ls_classname, ls_menuitemname, ls_menuitemkey, ls_menuitemmhelp
n_cst_string	lnv_string

ls_classname = "classname="
ls_menuitemname = "menuitemname="
ls_menuitemkey = "menuitemkey="
ls_menuitemmhelp = "menuitemmhelp="
lnv_string.of_SetKeyValue (ls_classname, "classname", &
									ids_mrukeys.Object.s_classname [ai_rowindex], "=")
lnv_string.of_SetKeyValue (ls_menuitemname, "menuitemname", &
									ids_mrukeys.Object.s_menuitemname [ai_rowindex], "=")
lnv_string.of_SetKeyValue (ls_menuitemkey, "menuitemkey", &
									ids_mrukeys.Object.s_menuitemkey [ai_rowindex], "=")
lnv_string.of_SetKeyValue (ls_menuitemmhelp, "menuitemmhelp", &
									ids_mrukeys.Object.s_menuitemmhelp [ai_rowindex], "=")

as_itemkey = ls_classname + is_delimiter + &
				ls_menuitemname + is_delimiter + &
				ls_menuitemkey + is_delimiter + &
				ls_menuitemmhelp + is_delimiter


return 1
end event

event pfc_decode;//////////////////////////////////////////////////////////////////////////////
//
//	Event:	pfc_decode
//
//	Arguments:
//	as_itemkey		key string from registry/ini to decode/parse
//	anv_mruattrib	MRU atribute structure passed by reference
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Triggered when MRU items are being restored from registry/ini
// Developer can override event to place other decode logic if desired
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
n_cst_string	lnv_string
	
anv_mruattrib.is_classname = lnv_string.of_GetKeyValue (as_itemkey, "classname", is_delimiter)
anv_mruattrib.is_menuitemname = lnv_string.of_GetKeyValue (as_itemkey, "menuitemname", is_delimiter)
anv_mruattrib.is_menuitemkey = lnv_string.of_GetKeyValue (as_itemkey, "menuitemkey", is_delimiter)
anv_mruattrib.is_menuitemmhelp = lnv_string.of_GetKeyValue (as_itemkey, "menuitemmhelp", is_delimiter)

return 1
end event

event pfc_close;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_close
//
//	Arguments:	None
//
//	Returns:		None
//
//	Description:
//	Save the service settings (item count, datastore info)
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

// write mru information to ini/registry
If of_Save() < 1 Then
	If IsValid(gnv_app.inv_debug) Then
		of_MessageBox ("pfc_mru_closedebug", "PowerBuilder Class Library", &
			"An Error occured when saving the MRU service" +&
			" information to the Registry/Ini File. ", &
			Exclamation!, Ok!, 1)
	End If
End If



end event

protected function integer of_addmenubarline (window aw_window);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_AddMenuBarLine
//
//	Access:		protected
//
//	Arguments:
//	aw_window   window which contains the menu item to modify
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	turn on the divider bar on the file menu
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
integer		li_rc
menu			lm_menu
n_cst_menu	lnv_menu

// check the arguments
if isnull(aw_window) or not isvalid(aw_window) then return -1

// get the menu info for what we want to compare
li_rc = lnv_menu.of_GetMenuReference(aw_window.menuid, is_menubarline, lm_menu)
if li_rc < 1 then return -1

// turn on the divider bar
lm_menu.visible = True

return 1

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
//	Sets delimiter used to differentiate the keys of the compound key for the
//	pfc_encode and pfc_decode process
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

public function integer of_Setuseregistry (boolean ab_useregistry);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetUseRegistry
//
//	Access:		public
//
//	Arguments:
//	ab_useregistry   boolean - true = retrieve stored MRU info from registry
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Tell the service to use the registry or an INI file
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
if isnull(ab_useregistry) then 
	return -1
end if

ib_useregistry = ab_useregistry

return 1
end function

protected function integer of_writekeys (string as_inisection, string as_subkey, string as_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_WriteKeys
//
//	Access:  		protected
//
//	Arguments:
//	as_IniSection	The name of the Registry or .Ini or section. 
//	as_SubKey		The key value to be used on either the Registry or .Ini file.
//	as_value			The value to be stored on either the Registry or .Ini file.
//
//	Returns:  		integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Perform the actual put into the Registry or the .Ini file.
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
string	ls_registrykey

// add section information to the registry key
if right(is_userkey, 1) = "\" then
	ls_registrykey = is_userkey + as_IniSection
else
	ls_registrykey = is_userkey + "\" + as_IniSection
end if

If ib_UseRegistry Then
	If RegistrySet (ls_registrykey, as_SubKey, as_Value) =1 Then
		Return 1
	End If
	Return -1
End If	

If SetProfileString (is_userinifile, as_IniSection, as_SubKey, as_Value) =1 Then
	Return 1
End If
Return -1

end function

protected function integer of_readkeys (string as_inisection, string as_subkey, ref string as_value, string as_default);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_ReadKeys
//
//	Access:  		protected
//
//	Arguments:
//	as_IniSection	The name of the Registry or .Ini section. 
//	as_SubKey		The key value to be used on either the Registry or .Ini file.
//	as_value			The value to be restored from either the Registry or .Ini file.
//							Passed by reference.
// as_default		Used also as a default value, if the desired value is not found.
//
//	Returns:  		integer
//						1 if it succeeds.
//						0 if the default value was used.
//
//	Description:  	Perform the actual Get from the Registry or the .Ini file.
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

constant string DEFAULT='$%^'
string	ls_registrykey

// add section information to the registry key
if right(is_userkey, 1) = "\" then
	ls_registrykey = is_userkey + as_IniSection
else
	ls_registrykey = is_userkey + "\" + as_IniSection
end if


If ib_UseRegistry Then
	If RegistryGet (ls_registrykey, as_SubKey, as_Value) =1 Then
		Return 1
	End If
	as_Value = as_default
	Return 0
End If	

as_value = ProfileString (is_userinifile, as_IniSection, as_SubKey, DEFAULT)
If as_value=DEFAULT Then
	as_Value = as_default
	Return 0
End If

Return 1


end function

public function integer of_setuserinifile (string as_userinifile);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetUserIniFile
//
//	Access:		public
//
//	Arguments:		
//	as_userinifile		Full pathname of the user's INI file.
//
//	Returns:		integer
//	 1 = success
//	-1 = error
//
//	Description:	Sets the filename for the user INI file
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

If IsNull(as_userinifile) Then
	Return -1
End If

is_userinifile = as_userinifile

// should not be using registry in this situation
ib_useregistry = False

Return 1
end function

public function string of_getuserinifile ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetUserIniFile
//
//	Access:		public
//
//	Arguments:	none
//
//	Returns:		string 
//
//	Description:	Returns the name of the user INI file.
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

return is_userinifile

end function

public function integer of_setuserkey (string as_userkey);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetUserKey
//
//	Access:		public
//
//	Arguments:		
//	as_userkey	full registry key for the user.
//
//	Returns:		Integer
//	 1 = success
//	-1 = error 
//
//	Description:	Sets the value of the registy key for the user
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

If IsNull(as_userkey) Then
	Return -1
End If

is_userkey = as_userkey

// should not be using Inifile in this situation
ib_useregistry = True

Return 1
end function

public function string of_getuserkey ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetUserKey
//
//	Access:		public
//
//	Arguments:	none
//
//	Returns:		string
//
//	Description:	Returns the user key for the registry
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

return is_userkey
end function

protected function integer of_filter (string as_filter);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_Filter
//
//	Access:		Protected
//
//	Arguments:
//	as_filter   String to filter the MRU datastore with.  Use "" to reset filter
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Filter MRU datastore.  Use "" to reset filter
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

// check arguments
if isnull(as_filter) then return -1

// set the filter
ids_mrukeys.setfilter(as_filter)

// filter the datastore
return ids_mrukeys.filter()
end function

public function integer of_reset ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_Reset
//
//	Access:  	public
//
//	Arguments:	None
//
//	Returns:  	Integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:  Clears all the data from a MRU datastore.
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

Return ids_mrukeys.Reset()
end function

public function integer of_reset (string as_id);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_Reset
//
//	Access:  	public
//
//	Arguments:	
//	as_id			id to remove from the MRU datastore
//
//	Returns:  	Integer
//	SUCCESS = # of items removed
//	ERROR = -1
//
//	Description:  Remove data matching the id from a MRU datastore.
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
long		ll_row, ll_rowcount, ll_count=0
string	ls_findstring

//check arguments
If IsNull(as_id) or (as_id = "") Then
	Return -1
End If

// Trim and Convert the ID to lower case.
as_id = Trim(Lower(as_id))

ll_rowcount = ids_mrukeys.Rowcount() + 1
ls_findstring = "s_id='" + as_id + "'"

// see if the id is in the datastore
ll_row = ids_mrukeys.Find(ls_findstring, 0, ll_rowcount)
Do While ll_row > 0
	ids_mrukeys.DeleteRow(ll_row)
	ll_count++
	ll_rowcount = ids_mrukeys.Rowcount() + 1
	ll_row = ids_mrukeys.Find(ls_findstring, 0, ll_rowcount)
Loop

Return ll_count
end function

public function integer of_getregistered (string as_id);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetRegistered
//
//	Access:		public
//
//	Arguments:
//	as_id			id to be checked for registration
//
//	Returns:		Integer
//	> 0 = index of id in the registered array (it's been registered)
//	<=0 = Not registered.  
//
//	Description:
//	Returns the index of the id in the register array
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
Integer	li_count, li_index, li_rc

if IsNull(as_id) or (as_id = "") then
	return -1
end if

// Trim and Convert the ID to lower case.
as_id = Trim(Lower(as_id))

li_count = upperbound(inv_register)

// loop through register array  
For li_index = 1 to li_count
	if as_id = inv_register[li_index].is_id then
		li_rc = li_index
		exit
	end if
end for

return li_rc
end function

public function boolean of_isregistered (string as_id);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_IsRegistered
//
//	Access:		public
//
//	Arguments:
//	as_id			id to be checked for registration
//
//	Returns:		Boolean
//	True = id is registered
//	False = Not registered.  
//
//	Description:
//	Determine if the id has been registered with the service
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

// check arguments
if IsNull(as_id) or (as_id = "") then
	return False
end if

if of_GetRegistered(as_id) < 1 then
	return false
else
	return true
end if

end function

protected function integer of_load ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_Load
//
//	Access:		protected
//
//	Arguments:	None
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Load the key data to the mrukeys datastore from the ini file or registry
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
integer	li_rc, li_itemcount, li_index
string	ls_id, ls_MRUKeyName, ls_value, ls_defaultcount, ls_iditemcount
n_cst_string	lnv_string

// cannot restore mru info without this information
if (is_userinifile = "") and (is_userkey = "") then
	return -1
end if

// get # of default items for entire MRU process
// [MRU]
// itemcount=
ls_defaultcount = string(ii_mruitemcount)
of_ReadKeys(is_mrusection, is_mrucountkey, ls_value, ls_defaultcount)
if isnumber(ls_value) then
	// use new value over default one
	ii_mruitemcount = integer(ls_value)
end if

//read registered id list
// [MRU Registered Id]
// itemcount=
// itemX=id=Employee Window;iditemcount=5
of_ReadKeys(is_mruregisteredsection, is_mrucountkey, ls_value, ls_defaultcount)
li_itemcount = integer(ls_value)
for li_index = 1 to li_itemcount
	ls_MRUKeyName = is_mruitemkey + string(li_index)
	of_ReadKeys(is_mruregisteredsection, ls_MRUKeyName, ls_value, "")
	if ls_value <> "" then
		ls_id = lnv_string.of_GetKeyValue (ls_value, "id", is_delimiter)
		ls_iditemcount = lnv_string.of_GetKeyValue (ls_value, "iditemcount", is_delimiter)
		ls_id = Trim(Lower(ls_id))
		if IsNumber(ls_iditemcount) then
			li_rc = of_Register(ls_id, integer(ls_iditemcount))
		else
			li_rc = of_Register(ls_id)
		end if
		if li_rc < 0 then exit
	end if
end for

//read registered id data
// [MRU id]
// itemcount=
// itemX=xxx
li_itemcount = upperbound(inv_register)
for li_index = 1 to li_itemcount
	ls_id = inv_register[li_index].is_id
	li_rc = of_Read(is_mrusection, ls_id)
	if li_rc < 0 then exit
end for

//read general info
// [MRU]
//li_rc = of_Read(is_mrusection)

return li_rc
end function

protected function integer of_save ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_Save
//
//	Access:		protected
//
//	Arguments:	None
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	store the key data from the mrukeys datastore to ini file or registry
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
integer	li_index, li_rc
long		ll_objectcount, ll_registeredcount
string	ls_id, ls_iditemcount, ls_defaultcount, ls_key, ls_MRUKeyName
n_cst_string	lnv_string

// cannot save mru info without this information
if (is_userinifile = "") and (is_userkey = "") then
	return -1
end if

if isnull(ii_mruitemcount) then 
	Return -1
end if

//write general MRU information
// [MRU]
// itemcount=
// item1=xxx
//of_Filter("")
//of_Sort("n_identity D")
//li_rc = of_Write(is_mrusection, ii_mruitemcount)
//if li_rc < 0 then return -1

// write registered id data
// [MRU id]
// itemcount=
// item1=xxx
ll_objectcount = upperbound(inv_register)
for li_index = 1 to ll_objectcount
	ls_id = inv_register[li_index].is_id
	of_Filter("s_id = '" + ls_id + "'")
	of_Sort("n_identity D")
	li_rc = of_Write(is_mrusection + " " + ls_id, inv_register[li_index].ii_itemcount)
	if li_rc < 0 then 
		//	restore datastore	(unfilter and sort)
		of_Filter("")
		of_Sort("n_identity D")
		return -1
	end if
end for

//	restore datastore	(unfilter and sort)
of_Filter("")
of_Sort("n_identity D")

// write out registered id
// [MRU Registered Id]
// itemcount=
// item1=id=Employee Window;iditemcount=x
ll_objectcount = upperbound(inv_register)
for li_index = 1 to ll_objectcount
	ll_registeredcount ++

	ls_id = "id="
	ls_iditemcount = "iditemcount="
	lnv_string.of_SetKeyValue (ls_id, "id", inv_register[li_index].is_id, "=")
	lnv_string.of_SetKeyValue (ls_iditemcount, "iditemcount", string(inv_register[li_index].ii_itemcount), "=")
	ls_key = ls_id + is_delimiter + ls_iditemcount + is_delimiter
		
	ls_MRUKeyName = is_mruitemkey + string(ll_registeredcount)
	li_rc = of_WriteKeys(is_mruregisteredsection, ls_MRUKeyName, ls_key)
	if li_rc < 0 then exit
end for
ls_key = string(ll_registeredcount)
li_rc = of_WriteKeys(is_mruregisteredsection, is_mrucountkey, ls_key)

// Write # of default items for entire MRU process 
// [MRU]
// itemcount=
ls_defaultcount = string(ii_mruitemcount)
li_rc = of_WriteKeys(is_mrusection, is_mrucountkey, ls_defaultcount)

return li_rc
end function

protected function integer of_write (string as_section, integer ai_itemcount);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_Write
//
//	Access:		protected
//
//	Arguments:	
//	as_section		section to write key information
//	ai_itemcount	number of items to write out
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	store the key data from the mrukeys datastore to ini file or registry
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
integer	li_index, li_rc
long		ll_rowcount
string	ls_mrukeyname, ls_key

If IsNull(as_section) or as_section = "" Then
	Return -1
End If

If IsNull(ai_itemcount) or ai_itemcount < 1 Then
	Return -1
End If

ll_rowcount = ids_mrukeys.RowCount()
if ll_rowcount <= 0 then
	Return ll_rowcount
end if

// calculate # of rows to save to ini file.  1 is the lowest rownumber to go to
if ll_rowcount > ai_itemcount then
	ll_rowcount = ai_itemcount
end if

for li_index = 1 to ll_rowcount

	// set up compound keys
	ls_MRUKeyName = is_mruitemkey + string(li_index)

	// can override encode logic in event script
	li_rc = this.event pfc_encode(li_index, ls_key)
	If li_rc < 0 Then exit

	li_rc = of_writekeys(as_section, ls_MRUKeyName, ls_key)
	if li_rc < 0 then exit
	
end for

// write the number of items for the MRU
ls_key = string(ai_itemcount)
li_rc = of_writekeys(as_section, is_mrucountkey, ls_key)

return li_rc
end function

protected function integer of_sort (string as_sort);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_Sort
//
//	Access:		protected
//
//	Arguments:
//	as_sort		String to sort the MRU datastore with.  
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Sort MRU datastore
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

// check arguments
if isnull(as_sort) then return -1

// set the sort order
ids_mrukeys.setsort(as_sort)

// sort the datastore
return ids_mrukeys.sort()

end function

public function integer of_additem (n_cst_mruattrib anv_mruattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_additem
//
//	Access:		public
//
//	Arguments:
//	anv_mruattrib	populated MRU atribute structure
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Save parameters to the datastore for later retreival.
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

boolean	lb_existingrow = false
Long		ll_row, ll_currentrow

if isnull(anv_mruattrib.is_classname) or isnull(anv_mruattrib.is_menuitemname) &
	or isnull(anv_mruattrib.is_menuitemkey) or isnull(anv_mruattrib.is_menuitemmhelp) &
	or isnull(anv_mruattrib.is_id) then
	return -1
end if

if (anv_mruattrib.is_classname = "") or (anv_mruattrib.is_menuitemname = "") or &
	(anv_mruattrib.is_id = "") then
	return -1
end if

// see if this item exists to prevent duplicates
ll_currentrow = of_finditem("  " + anv_mruattrib.is_menuitemname, 0)
Do While ll_currentrow > 0
	if (ids_mrukeys.Object.s_id [ll_currentrow] = anv_mruattrib.is_id) AND &
	   (ids_mrukeys.Object.s_classname [ll_currentrow] = anv_mruattrib.is_classname) AND &
		(ids_mrukeys.Object.s_menuitemkey [ll_currentrow] = anv_mruattrib.is_menuitemkey) Then
		// found the row so exit
		ll_row = ll_currentrow
		lb_existingrow = true
		exit
	end if
	ll_currentrow = of_finditem("  " + anv_mruattrib.is_menuitemname, ll_currentrow)
Loop

if NOT lb_existingrow then
	// insert row at front of datastore (most recently used)
	ll_row = ids_mrukeys.InsertRow(1)
end if

//  add row to datastore.  
If ll_row > 0 Then
	ii_currentmrucount ++
	ids_mrukeys.Object.s_id [ll_row] = anv_mruattrib.is_id
	ids_mrukeys.Object.s_classname [ll_row] = anv_mruattrib.is_classname
	ids_mrukeys.Object.s_menuitemname [ll_row] = anv_mruattrib.is_menuitemname
	ids_mrukeys.Object.s_menuitemkey [ll_row] = anv_mruattrib.is_menuitemkey
	ids_mrukeys.Object.s_menuitemmhelp [ll_row] = anv_mruattrib.is_menuitemmhelp
	ids_mrukeys.Object.n_identity [ll_row] = ii_currentmrucount
else
	return -1
End if

// make sure currently saved item is most recent
of_Sort("n_identity D")

return 1
end function

public function integer of_setitemcount (integer ai_count);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetItemCount
//
//	Access:		public
//
//	Arguments:
//	ai_count   The count of items to maintain for the mru service
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Sets the # of menu items the MRU service will use
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

If IsNull(ai_count) or (ai_count <= 0) Then
	Return -1
End If

ii_mruitemcount = ai_count

return 1
end function

public function integer of_register (string as_id, integer ai_itemcount);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_Register
//
//	Access:		public
//
//	Arguments:
//	as_id			   name of the id to register with the service
//	ab_itemcount	number of mru items to remember for this object
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
// Already registered = 0
//
//	Description:	register an id with the service to store mru information 
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
Integer	li_cnt, li_upper, li_openslot, li_newentry
Integer	li_position

// check for valid values
if IsNull(as_id) or (as_id = "") or &
	IsNull(ai_itemcount) or (ai_itemcount < 1) Then 
	Return -1
end if

// Trim and Convert the ID to lower case.
as_id = Trim(Lower(as_id))

// do not register if already registered and no information changed
li_position = of_GetRegistered(as_id)
if li_position > 0 then
	If inv_register[li_position].is_id = as_id AND &
		inv_register[li_position].ii_itemcount = ai_itemcount Then
		Return 0
	end if
	// registered but info is changing 
	inv_register[li_position].is_id = as_id
	inv_register[li_position].ii_itemcount = ai_itemcount
Else
	// not registered so find place to add it to
	li_upper = upperbound(inv_register)
	// Find an open slot (if any).
	For li_cnt = 1 to li_upper
		If inv_register[li_cnt].is_id = "" Then 
			// Open slot has been found.
			li_openslot = li_cnt
			Exit
		End If
	Next
	// Determine the new entry slot.
	If li_openslot > 0 Then
		li_newentry = li_openslot
	Else
		li_newentry = li_upper + 1
	End If
	// add the entry to the location
	inv_register[li_newentry].is_id = as_id
	inv_register[li_newentry].ii_itemcount = ai_itemcount
end if

Return 1
end function

public function integer of_register (string as_id);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_Register
//
//	Access:		public
//
//	Arguments:
//	as_id		   name of the id to register with the service
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
// Already registered = 0
//
//	Description:	register an id with the service to store mru information for
//
//		This function overloads the normal of_register function to allow the # of
//		items to remember for this id to be optional
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

Return of_register(as_id, ii_mruitemcount)
end function

protected function integer of_read (string as_section, string as_id);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Read
//
//	Access:  		protected
//
//	Arguments:		
//	as_section		section to retrieve data from ini or registry
//	as_id				registered id to read in
//
//	Returns:  		Integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:  	Get the key data from the ini file
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

Integer			li_index, li_rc, li_itemcount
String			ls_mrukeyname, ls_value, ls_section
n_cst_mruattrib	lnv_mruattrib

// check arguments
If IsNull(as_section) or as_section = "" or &
	IsNull(as_id) or (as_id = "") Then
	Return -1
End If

// Trim and Convert the ID to lower case.
as_id = Trim(Lower(as_id))

ls_section = as_section + " " + as_id

// get # of items to remember
of_ReadKeys(ls_section, is_mrucountkey, ls_value, string(ii_mruitemcount))
if isnumber(ls_value) then
	li_itemcount = integer(ls_value)
else
	li_itemcount = ii_mruitemcount
end if

// loop through mru item count and get information from storage location
for li_index = li_itemcount to 1 Step -1
	ls_value = ""
	ls_MRUKeyName = is_mruitemkey + string(li_index)
	of_ReadKeys(ls_section, ls_MRUKeyName, ls_value, "")

	// No data probably means first time through application, so don't generate an error
	if ls_value = "" then
		continue
	end if

	// can override decode logic in event script
	li_rc = this.event pfc_decode(ls_value, lnv_mruattrib)
	If li_rc < 0 Then exit

	//Add the new row	to the datastore
	lnv_mruattrib.is_id = as_id
	li_rc = of_additem(lnv_mruattrib)
	If li_rc < 0 Then exit
end for

return li_rc
end function

public function integer of_restore (string as_id, window aw_window);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_Restore
//
//	Access:		public
//
//	Arguments:
//	as_id			id to restore MRU information for
//	aw_window   Window to restore MRU information to
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Restore MRU information to the menu on the window
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
Integer		li_index, li_rc, li_rowcount, li_itemnumber
Integer		li_menuitemnumber, li_registerindex, li_itemcount
String		ls_menuitemtext, ls_menuitem
menu			lm_menu
n_cst_menu			lnv_menu
n_cst_mruattrib	lnv_mruattrib

// check arguments
if isnull(aw_window) or not isvalid(aw_window) or &
	isnull(as_id) or (as_id = "") then
	return -1
end if

// Must have a menu on the window (response and child should not have menu)
If aw_window.MenuName = "" Then
	return -1
end if
	
// Trim and Convert the ID to lower case.
as_id = Trim(Lower(as_id))

// ID must be registered to restore info
li_registerindex = of_GetRegistered( as_id )
if li_registerindex > 0 then
	li_itemcount = inv_register[li_registerindex].ii_itemcount
else
	return -1
end if

// filter out non id data
of_Filter("s_id='" + as_id + "'")
of_Sort("n_identity D")

// get the menu info for what we want to compare
ls_menuitem = is_menuitemstring + "1"
li_rc = lnv_menu.of_GetMenuReference(aw_window.menuid, ls_menuitem, lm_menu)
if li_rc < 1 then return -1

// check for changed items.  if row 1 in datastore and first mru item don't match (rc <> 1) 
// then restore the mru items
li_rc = of_FindItem(lm_menu.text, 0)
if li_rc = 1 then
	//	restore datastore	(unfilter and sort)
	of_Filter("")
	of_Sort("n_identity D")
	return li_rc
end if

// add items to menu -- setredraw function does not work on a menu
// loop until out of ds rows or all item spaces have been added to menu
li_rc = 0
li_index = 0
li_itemnumber = 0
li_rowcount = ids_mrukeys.rowcount()
Do Until (li_index >= li_rowcount) or (li_itemnumber >= li_itemcount)
	li_index++
	of_GetItem(li_index, lnv_mruattrib)

	li_itemnumber++
	ls_menuitemtext = "&" + String(li_itemnumber) + "  " + lnv_mruattrib.is_menuitemname
	li_rc = of_UpdateVisuals(aw_window, ls_menuitemtext, li_itemnumber)
	if li_rc < 1 then exit
Loop

// add the menu divider bar if we have items on the menu
if (li_rc > 0) and (li_itemnumber > 0) then
	of_AddMenubarLine(aw_window)
end if

//	restore datastore	(unfilter and sort)
of_Filter("")
of_Sort("n_identity D")

return li_rc

end function

public function integer of_getitem (long al_row, ref n_cst_mruattrib anv_mruattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetItem
//
//	Access:		public
//
//	Arguments:
//	al_row			row to return from datastore
//	anv_mruattrib	MRU atribute structure - passed by reference
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1 
//
//	Description:
//	Return MRU information in the datastore to calling function
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

// check arguments
if IsNull(al_row) or (al_row < 1) then
	return -1
end if

// populate attribute object
anv_mruattrib.is_id = ids_mrukeys.object.s_id[al_row]
anv_mruattrib.is_classname = ids_mrukeys.object.s_classname[al_row]
anv_mruattrib.is_menuitemname = ids_mrukeys.object.s_menuitemname[al_row]
anv_mruattrib.is_menuitemkey = ids_mrukeys.object.s_menuitemkey[al_row]
anv_mruattrib.is_menuitemmhelp = ids_mrukeys.object.s_menuitemmhelp[al_row]

return 1
end function

public function long of_finditem (string as_menuitemtext, long al_start);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_FindItem
//
//	Access:		public
//
//	Arguments:
//	as_menuitemtext   text from selected Mru Menu item
//	al_start				row to start search from
//
//	Returns:		long
//	SUCCESS = 1 ; row number found
//	ERROR = -1  ; row not found
//
//	Description:
//	Find menuitemtext in the datastore
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
long			ll_rowcount
string		ls_menuitemtext, ls_findstring
n_cst_string	lnv_string

// check the arguments
if IsNull(as_menuitemtext) or (as_menuitemtext = "") or &
	IsNull(al_start) or (al_start < 0) Then
	return -1
end if

// parse out first space.
ls_menuitemtext = lnv_string.of_gettoken(as_menuitemtext, "  ")

// find row that matches menu item id and pass to user defined process
ls_findstring = "s_menuitemname='" + as_menuitemtext + "'" 
ll_rowcount = ids_mrukeys.rowcount()

// return the row of the item.  negative # if error, zero if not found
return ids_mrukeys.Find(ls_findstring, al_start, ll_rowcount )

end function

protected function integer of_updatevisuals (window aw_window, string as_menuitemtext, integer ai_menuitemindex);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_UpdateVisuals
//
//	Access:		protected
//
//	Arguments:
//	aw_window				window menu resides on
//	as_menuitemtext		text to place in the menu item text
//	ai_menuitemindex		the menu item number we want to modify
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Set and Make visible the MRU items on the window's menu
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
integer		li_rc
string		ls_menuitemname
menu			lm_menu
n_cst_menu	lnv_menu

// check the arguments
if isnull(aw_window) or not isvalid(aw_window) then return -1
if isnull(as_menuitemtext) or (as_menuitemtext = "") then return -1
if isnull(ai_menuitemindex) then return -1

// set the menu item values
ls_menuitemname = is_menuitemstring + string(ai_menuitemindex)
li_rc = lnv_menu.of_GetMenuReference(aw_window.menuid, ls_menuitemname, lm_menu)

if li_rc < 1 then return -1

lm_menu.text = as_menuitemtext
lm_menu.visible = True

return 1


end function

public function integer of_unregister (string as_id, integer ai_itemcount);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_UnRegister
//
//	Access:		public
//
//	Arguments:
//	as_id			   name of the id to remove from the service
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:	unregister an id from the service and remove its data
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
Integer	li_count, li_position

// check for valid values
if IsNull(as_id) or (as_id = "") Then 
	Return -1
end if

// Trim and Convert the ID to lower case.
as_id = Trim(Lower(as_id))

// get the position of the registered id
li_position = of_GetRegistered(as_id)
if li_position < 1 then
	Return -1
End If

// remove from register array
inv_register[li_position].is_id = ""
inv_register[li_position].ii_itemcount = 0

// remove from datastore
this.of_reset(as_id)

Return 1
end function

on pfc_n_cst_mru.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_mru.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	Constructor
//
//	Description:
//	Create the service datastore
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version - Brian J. Grimm
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

ids_mrukeys = create n_ds
ids_mrukeys.DataObject = 'd_mruservice'

end event

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	Destructor
//
//	Description:
//	Destroy the MRU datastore
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

//Destroy the Mrukeys datastore.
If IsValid(ids_mrukeys) Then
 	Destroy ids_mrukeys
End If
end event


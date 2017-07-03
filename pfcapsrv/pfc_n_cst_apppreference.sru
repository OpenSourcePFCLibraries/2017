HA$PBExportHeader$pfc_n_cst_apppreference.sru
$PBExportComments$PFC Application Preference service
forward
global type pfc_n_cst_apppreference from n_base
end type
end forward

global type pfc_n_cst_apppreference from n_base
event type integer pfc_open ( string as_commandline )
event type integer pfc_close ( )
end type
global pfc_n_cst_apppreference pfc_n_cst_apppreference

type variables
Public:
constant	integer	CST_FILETYPE_REG	= 1
constant	integer	CST_FILETYPE_INI		= 2
constant	integer	CST_FILETYPE_XML	= 3

Protected:
boolean	ib_restoreapp = False
boolean	ib_restoreuser = False

integer	ii_filetype

string		is_appinifile
string		is_appxmlfile
string		is_userinifile
string		is_userxmlfile
string		is_appkey
string		is_userkey
string		is_appprefsection = "AppPref"
string		is_userprefsection = "AppUserPref"

n_cst_appmanager	inv_appmanager
n_cst_list					inv_context

end variables

forward prototypes
public function integer of_save (boolean ab_processapp, string as_inifile, string as_inisection)
public function integer of_save (boolean ab_processapp, string as_regkey)
protected function integer of_save (boolean ab_useregistry, boolean ab_processapp, string as_keyorini, string as_inisection)
protected function integer of_restore (boolean ab_useregistry, string as_keyorini, string as_inisection, string as_subkey, ref string as_value, string as_default)
protected function integer of_save (boolean ab_useregistry, string as_keyorini, string as_inisection, string as_subkey, string as_value)
protected function integer of_restore (boolean ab_useregistry, boolean ab_processapp, string as_keyorini, string as_inisection)
public function integer of_restore (boolean ab_processapp, string as_inifile, string as_inisection)
public function integer of_restore (boolean ab_processapp, string as_regkey)
public function integer of_setrequestor (n_cst_appmanager anv_requestor)
public function integer of_setuserinifile (string as_userinifile)
public function integer of_setappinifile (string as_appinifile)
public function integer of_setappkey (string as_appkey)
public function integer of_setuserkey (string as_userkey)
public function integer of_setrestoreapp (boolean ab_switch)
public function integer of_setrestoreuser (boolean ab_switch)
public function boolean of_isrestoreapp ()
public function boolean of_isrestoreuser ()
protected function integer of_restoreuser (boolean ab_useregistry, string as_keyorini, string as_inisection)
protected function integer of_restoreapp (boolean ab_useregistry, string as_keyorini, string as_inisection)
protected function integer of_saveapp (boolean ab_useregistry, string as_keyorini, string as_inisection)
protected function integer of_saveuser (boolean ab_useregistry, string as_keyorini, string as_inisection)
public function integer of_save (string as_subkey, string as_value, boolean ab_processapp)
public function integer of_restore (string as_subkey, ref string as_value, string as_default, boolean ab_processapp)
protected function integer of_restore (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot, string as_subkeyelement, ref string as_value, string as_default)
protected function integer of_save (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot, string as_subkeyelement, string as_value)
protected function integer of_restoreapp (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot)
protected function integer of_restoreuser (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot)
protected function integer of_saveapp (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot)
protected function integer of_saveuser (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot)
public function integer of_setuserxmlfile (string as_userxmlfile)
public function integer of_setappxmlfile (string as_appxmlfile)
protected function integer of_restore (string as_keyoriniorxml, string as_inisectionxmlroot, string as_subkeyelement, ref string as_value, string as_default)
protected function integer of_restoreapp (string as_keyoriniorxml, string as_inisectionxmlroot)
protected function integer of_restoreuser (string as_keyoriniorxml, string as_inisectionxmlroot)
protected function integer of_save (string as_keyoriniorxml, string as_inisectionxmlroot, string as_subkeyelement, string as_value)
protected function integer of_saveapp (string as_keyoriniorxml, string as_inisectionxmlroot)
protected function integer of_saveuser (string as_keyoriniorxml, string as_inisectionxmlroot)
public function integer of_getfiletype ()
public function integer of_save (string as_inisectionxmlroot, string as_subkeyelement, string as_value)
public function integer of_setcontext (string as_key, any aa_value)
public function integer of_getcontext (string as_key, ref any aa_value)
public function integer of_restore (string as_inisectionxmlroot, string as_subkeyelement, ref string as_value, string as_default)
end prototypes

event pfc_open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_open
//
//	Arguments:
//	as_commandline:  command line parameter to the application
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Restore Application preferences on Application startup
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

if is_appkey = ""     and is_userkey = ""     and &
	is_appinifile = "" and is_userinifile = "" then
	return -1
end if

// Restore application information
if ib_restoreapp then
	if (is_appkey <> "") then
		li_rc = of_Restore(True, is_appkey)
	elseif (is_appinifile <> "") then
		li_rc = of_Restore(True, is_appinifile, is_appprefsection )
	else
		// no place to get application level info
		return 0
	end if
end if

if li_rc < 0 then return li_rc

// Restore User App Preferences
if ib_restoreuser then
	if (is_userkey <> "") then
		li_rc = of_Restore(False, is_userkey)
	elseif (is_userinifile <> "") then
		li_rc = of_Restore(False, is_userinifile, is_userprefsection  )
	else
		// no place to get User level info
		return 0
	end if
end if

return li_rc

end event

event pfc_close;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_close
//
//	Arguments:	None
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Save Application preferences on Application close
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

if is_appkey = ""     and is_userkey = ""     and &
	is_appinifile = "" and is_userinifile = "" then
	return -1
end if

// Save application information
if ib_restoreapp then
	if (is_appkey <> "") then
		li_rc = of_Save(True, is_appkey)
	elseif (is_appinifile <> "") then
		li_rc = of_Save(True, is_appinifile, is_appprefsection )
	else
		// no place to Save application level info
		return 0
	end if
end if

if li_rc < 0 then return li_rc

// Save User App Preferences
if ib_restoreuser then
	if (is_userkey <> "") then
		li_rc = of_Save(False, is_userkey)
	elseif (is_userinifile <> "") then
		li_rc = of_Save(False, is_userinifile, is_userprefsection )
	else
		// no place to Save User level info
		return 0
	end if
end if

return li_rc
end event

public function integer of_save (boolean ab_processapp, string as_inifile, string as_inisection);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Save
//
//	Access:  		public
//
//	Arguments:		
// ab_processapp  True if saving application info, false if saving user info
//	as_inifile		The name of the .INI file
//	as_inisection		The section name in the .INI file to save settings to.
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Saves the preference information to an .INI file.
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

//Check for valid parameters
If IsNull(ab_processapp) Or IsNull(as_inifile) Or IsNull(as_inisection)Then 
	Return -1
End If

if (as_inifile = "") or (as_inisection = "") then
	return -1
end if

Return of_Save (False, ab_processapp, as_inifile, as_inisection)

end function

public function integer of_save (boolean ab_processapp, string as_regkey);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Save
//
//	Access:  		public
//
//	Arguments:		
// ab_processapp  True if saving application info, false if saving user info
//	as_regkey		The name of the registry key 
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Saves the preference information to the Registry.
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

//Check for valid parameters
If IsNull(ab_processapp) Or IsNull(as_regkey) or (as_regkey = "") Then 
	Return -1
End If

Return of_Save(True, ab_processapp, as_regkey, "")

end function

protected function integer of_save (boolean ab_useregistry, boolean ab_processapp, string as_keyorini, string as_inisection);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Save
//
//	Access:  		protected
//
//	Arguments:	
//	ab_UseRegistry	Function behavior - use the registry or an .ini file.
// ab_ProcessApp  Function behavior - save application info or save user info
//	as_KeyOrIni		The KeyName for use with the Registry or the IniFile name
//						for use with an .Ini file.
//	as_IniSection	The name of the .Ini section. 
//
//	Returns:  		Integer
//						 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Saves the preference information to either the Registry or
//						to an .INI file.
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

integer				li_rc

n_cst_inifile		lnv_inifile
n_cst_conversion 	lnv_conversion

//Check arguments
If IsNull(ab_UseRegistry) or IsNull(ab_ProcessApp) or IsNull(as_KeyOrIni) or (as_keyorini = "") Then
	Return -1
End If

//Validate specifics for either Registry or .Ini functionality.
If ab_UseRegistry Then
Else
	//Check for the existance of the file.
	If Not FileExists(as_KeyOrIni) Then
		Return -1
	End If
	//Check the section parameter
	If IsNull(as_IniSection) or Len(Trim(as_IniSection))=0 Then
		Return -1
	End If
End If

//Clear the section prior to updating it
If ab_UseRegistry Then
	RegistryDelete (as_KeyOrIni, '')
Else
	lnv_inifile.of_Delete(as_KeyOrIni, as_IniSection)
End If

if ab_ProcessApp then
	li_rc = of_SaveApp(ab_UseRegistry, as_KeyOrIni, as_IniSection)
else
	li_rc = of_SaveUser(ab_UseRegistry, as_KeyOrIni, as_IniSection)
end if

Return li_rc

end function

protected function integer of_restore (boolean ab_useregistry, string as_keyorini, string as_inisection, string as_subkey, ref string as_value, string as_default);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Restore
//
//	Access:  		protected
//
//	Arguments:
//	ab_UseRegistry	Function behavior. - use the registry or an .ini file.
//	as_KeyOrIni		The KeyName for use with the Registry or the IniFile name
//						for use with an .Ini file.
//	as_IniSection	The name of the .Ini section. 
//	as_SubKey			The key value to be used on either the Registry or .Ini file.
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

If ab_UseRegistry Then
	If RegistryGet (as_KeyOrIni, as_SubKey, as_Value) =1 Then
		Return 1
	End If
	as_Value = as_default
	Return 0
End If	

as_value = ProfileString (as_KeyOrIni, as_IniSection, as_SubKey, DEFAULT)
If as_value=DEFAULT Then
	as_Value = as_default
	Return 0
End If
Return 1

end function

protected function integer of_save (boolean ab_useregistry, string as_keyorini, string as_inisection, string as_subkey, string as_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Save
//
//	Access:  		protected
//
//	Arguments:
//	ab_UseRegistry	Function behavior. - use the registry or an .ini file.
//	as_KeyOrIni		The KeyName for use with the Registry or the IniFile name
//						for use with an .Ini file.
//	as_IniSection	The name of the .Ini section. 
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

If ab_UseRegistry Then
	If RegistrySet (as_KeyOrIni, as_SubKey, as_Value) =1 Then
		Return 1
	End If
	Return -1
End If	

If SetProfileString (as_KeyOrIni, as_IniSection, as_SubKey, as_Value) =1 Then
	Return 1
End If
Return -1

end function

protected function integer of_restore (boolean ab_useregistry, boolean ab_processapp, string as_keyorini, string as_inisection);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Restore
//
//	Access:  		protected
//
//	Arguments:	
//	ab_useregistry	Function behavior - use the registry or an .ini file.
// ab_processapp  Function behavior - restore application info or restore user info
//	as_keyorini		The KeyName for use with the Registry or the IniFile name
//						for use with an .Ini file.
//	as_inisection	The name of the .Ini section. 
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Restores the preference information from either the Registry
//						or from an .INI file.
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

//Check arguments
if isnull(ab_useregistry) or isnull(ab_processapp) or isnull(as_keyorini) then
	return -1
end if

// as_inisection will be blank if using registry
if (as_keyorini = "") then
	return -1
end if

//Validate specifics for either Registry or .Ini functionality.
if ab_useregistry then
else
	//Check for the existance of the file.
	if not fileexists(as_keyorini) then
		return -1
	end If
	//Check the section parameter
	if isnull(as_inisection) or Len(Trim(as_inisection))=0 then
		return -1
	end if
end if

if ab_processapp then
	li_rc = of_RestoreApp(ab_useregistry, as_keyorini, as_inisection)
else
	li_rc = of_RestoreUser(ab_useregistry, as_keyorini, as_inisection)
end if

return li_rc
end function

public function integer of_restore (boolean ab_processapp, string as_inifile, string as_inisection);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Restore
//
//	Access:  		public
//
//	Arguments:		
// ab_processapp  True if restoring application info, false if restoring user info
//	as_inifile		The name of the .INI file to restore settings from
//	as_inisection	The section name in the .INI file to restore settings from
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Restores the preference information from an .INI file.
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

//Check for valid parameters
if isnull(ab_processapp) or isnull(as_inifile) or isnull(as_inisection) then 
	return -1
end if

if (as_inifile = "") or (as_inisection = "") then
	return -1
end if

Return of_Restore(false, ab_processapp, as_inifile, as_inisection)

end function

public function integer of_restore (boolean ab_processapp, string as_regkey);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Restore
//
//	Access:  		public
//
//	Arguments:	
// ab_processapp  True if restoring application info, false if restoring user info
//	as_regkey		The registry key path to read values from.
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Restores the preference information from the Registry.
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

//Check for valid parameters
if isnull(ab_processapp) or isnull(as_regkey) or (as_regkey = "") then 
	return -1
end if

return of_Restore (true, ab_processapp, as_regkey, "")

end function

public function integer of_setrequestor (n_cst_appmanager anv_requestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetRequestor
//
//	Access:		Public
//
//	Arguments:
// anv_Requestor	The appmanager nvo requesting the service
//
//	Returns:		Integer
//	 1 = success 
//	-1 = error 
//
//	Description:	Associates the appmanager nvo with this service 
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

If IsNull(anv_requestor) or Not IsValid(anv_requestor) Then
	Return -1
End If

inv_appmanager = anv_Requestor

return 1
end function

public function integer of_setuserinifile (string as_userinifile);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetUserIniFile
//
//	Access:		public
//
//	Arguments:		
//	as_userinifile	Full pathname of the user's INI file.
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
//		  6.0   Initial version
//		12.5 	Manage file type
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

ii_filetype = cst_filetype_ini
Return 1
end function

public function integer of_setappinifile (string as_appinifile);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetAppIniFile
//
//	Access:		public
//
//	Arguments:
//	as_appinifile	the full pathname of the application INI file
//
//	Returns:		Integer
//	 1 = success
//	-1 = error
//
//	Description:	Sets the filename of the application's INI file
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	  	  6.0   Initial version
//		12.5	Manage file type
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

//Check arguments
If IsNull(as_appinifile) Then
	Return -1
End If

is_appinifile = as_appinifile

ii_filetype = cst_filetype_ini

Return 1
end function

public function integer of_setappkey (string as_appkey);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetAppKey
//
//	Access:		public
//
//	Arguments:		
//	as_appkey	Full key value for the application.
//
//	Returns:		Integer
//	 1 = success 
//	-1 = error 
//
//	Description:	Sets the value for the application key on the registry.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//		  6.0   Initial version
//		12.5	Manage File type
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

If IsNull(as_appkey) Then
	Return -1
End If

is_appkey = as_appkey

ii_filetype = cst_filetype_reg

Return 1
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
//		  6.0   Initial version
//		12.5	Manage file type
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

ii_filetype = cst_filetype_reg

Return 1
end function

public function integer of_setrestoreapp (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetRestoreApp
//
//	Access:  		public
//
//	Arguments:
//	ab_switch	   Mode of the service.  False = do not restore app attributes
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Tells the service to restore or not to restore
//						the application information attributes.
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

If IsNull(ab_switch) Then
	Return -1
End If

ib_restoreapp = ab_switch

Return 1

end function

public function integer of_setrestoreuser (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetRestoreUser
//
//	Access:  		public
//
//	Arguments:
//	ab_switch	   Mode of the service.  False = do not restore app user attributes
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Tells the service to restore or not to restore
//						the application user level information.
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

If IsNull(ab_switch) Then
	Return -1
End If

ib_restoreuser = ab_switch

Return 1

end function

public function boolean of_isrestoreapp ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_IsRestoreApp
//
//	Access:  	public
//
//	Arguments:	none
//
//	Returns:  	boolean
//	True if the service will restore the application information 
//						
//	Description:
//	Reports if the service is to restore the application information 
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

return ib_restoreapp


end function

public function boolean of_isrestoreuser ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_IsRestoreUser
//
//	Access:  	public
//
//	Arguments:	none
//
//	Returns:  	boolean
//	True if the service will restore the user level information 
//						
//	Description:  	
//	Reports if the service is to restore the user level information
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

return ib_restoreuser

end function

protected function integer of_restoreuser (boolean ab_useregistry, string as_keyorini, string as_inisection);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RestoreUser
//
//	Access:  		protected
//
//	Arguments:	
//	ab_useregistry	Function behavior - use the registry or an .ini file.
//	as_keyorini		The KeyName for use with the Registry or the IniFile name
//						for use with an .Ini file.
//	as_inisection	The name of the .Ini section. 
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Restores the App User preference information from either the Registry
//						or from an .INI file.
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

boolean		lb_toolbartext, lb_toolbartips
integer		li_rc
string		ls_toolbartext, ls_toolbartips, ls_userid
n_cst_conversion	lnv_conversion

//Parameter checking done in calling function

//Restore user information
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'toolbartext', ls_toolbartext, &
	lnv_conversion.of_string(inv_appmanager.iapp_object.toolbartext))
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'toolbartips', ls_toolbartips, &
	lnv_conversion.of_string(inv_appmanager.iapp_object.toolbartips))
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'userid', ls_userid, &
	inv_appmanager.of_getuserid() )

//Convert to the appropriate data types
lb_toolbartext = lnv_conversion.of_Boolean(ls_toolbartext)
lb_toolbartips = lnv_conversion.of_Boolean(ls_toolbartips)

// Important values so validate them.
if isnull(lb_toolbartext) then lb_toolbartext = false
if isnull(lb_toolbartips) then lb_toolbartips = true
	
// application properties - if value is blank then we don't want to change the current setting
inv_appmanager.iapp_object.toolbartext = lb_ToolbarText
inv_appmanager.iapp_object.toolbartips = lb_ToolbarTips
if ls_userid <> "" then inv_appmanager.of_SetUserid(ls_userid)

return li_rc
end function

protected function integer of_restoreapp (boolean ab_useregistry, string as_keyorini, string as_inisection);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RestoreApp
//
//	Access:  		protected
//
//	Arguments:	
//	ab_useregistry	Function behavior - use the registry or an .ini file.
//	as_keyorini		The KeyName for use with the Registry or the IniFile name
//						for use with an .Ini file.
//	as_inisection	The name of the .Ini section. 
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Restores the App preference information from either the Registry
//						or from an .INI file.
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

boolean		lb_microhelp, lb_righttoleft, lb_toolbarusercontrol
integer		li_ddetimeout
integer		li_rc
string		ls_userinifile, ls_userkey, ls_microhelp, ls_helpfile
string		ls_version, ls_logo, ls_copyright 
string		ls_ddetimeout, ls_displayname, ls_dwmessagetitle
string		ls_microhelpdefault, ls_righttoleft, ls_toolbarframetitle
string		ls_toolbarpopmenutext, ls_toolbarsheettitle, ls_toolbarusercontrol
string		ls_toolbartext, ls_toolbartips, ls_userid
n_cst_string		lnv_string
n_cst_conversion	lnv_conversion

//Parameter checking done in calling function

//Restore application information -- Default Information is current info
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'userinifile', ls_userinifile, & 
	inv_appmanager.of_GetUserinifile() )
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'userkey', ls_userkey, &
	inv_appmanager.of_GetUserkey() )
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'microhelp', ls_microhelp, &
	lnv_conversion.of_string(inv_appmanager.of_GetMicrohelp() ) )
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'helpfile', ls_helpfile, &
	inv_appmanager.of_GetHelpfile() )
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'version', ls_version, &
	inv_appmanager.of_GetVersion() )
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'logo', ls_logo, &
	inv_appmanager.of_GetLogo() )
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'copyright', ls_copyright, &
	inv_appmanager.of_GetCopyright() )
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'userid', ls_userid, &
	inv_appmanager.of_GetUserid() )
		
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'ddetimeout',  ls_ddetimeout, &
	string(inv_appmanager.iapp_object.ddetimeout))
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'displayname', ls_displayname, &
	inv_appmanager.iapp_object.displayname)
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'dwmessagetitle',   ls_dwmessagetitle, &
	inv_appmanager.iapp_object.dwmessagetitle)
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'microhelpdefault', ls_microhelpdefault, &
	inv_appmanager.iapp_object.microhelpdefault)
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'righttoleft', ls_righttoleft, &
	lnv_conversion.of_string(inv_appmanager.iapp_object.righttoleft))
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'toolbarframetitle', ls_toolbarframetitle, &
	inv_appmanager.iapp_object.toolbarframetitle)
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'toolbarpopmenutext', ls_toolbarpopmenutext, &
	inv_appmanager.iapp_object.toolbarpopmenutext)
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'toolbarsheettitle', ls_toolbarsheettitle, &
	inv_appmanager.iapp_object.toolbarsheettitle)
li_rc = of_Restore (ab_useregistry, as_keyorini, as_inisection, 'toolbarusercontrol', ls_toolbarusercontrol, &
	lnv_conversion.of_string(inv_appmanager.iapp_object.toolbarusercontrol))

//Convert to the appropriate data types
lb_microhelp = lnv_conversion.of_Boolean(ls_microhelp)
lb_righttoleft = lnv_conversion.of_Boolean(ls_righttoleft)
lb_toolbarusercontrol = lnv_conversion.of_Boolean(ls_toolbarusercontrol)
If isnumber(ls_ddetimeout) then 
	li_ddetimeout = integer(ls_ddetimeout)
else
	li_ddetimeout = 0
end if

// Important values so validate them.
if isnull(lb_microhelp) then lb_microhelp = false
if isnull(lb_righttoleft) then lb_righttoleft = false
if isnull(lb_toolbarusercontrol) then lb_toolbarusercontrol = true

// pfc appmanager properties - if value is blank then we don't want to change the current setting
if ls_userkey <> ""     then inv_appmanager.of_SetUserkey(ls_userkey)
if ls_userinifile <> "" then inv_appmanager.of_SetUserinifile(ls_userinifile)
if ls_helpfile <> ""    then inv_appmanager.of_SetHelpfile(ls_helpfile)
if ls_version <> ""     then inv_appmanager.of_SetVersion(ls_version)
if ls_logo <> ""        then inv_appmanager.of_SetLogo(ls_logo)
if ls_copyright <> ""   then inv_appmanager.of_SetCopyright(ls_copyright)
if ls_userid <> ""      then inv_appmanager.of_SetUserid(ls_userid)
inv_appmanager.of_SetMicrohelp(lb_microhelp)

// application object properties - if value is blank then we don't want to change the current setting
inv_appmanager.iapp_object.ddetimeout = li_DDEtimeOut
if ls_DisplayName <> ""        then inv_appmanager.iapp_object.displayname = ls_DisplayName
if ls_dwMessageTitle <> ""     then inv_appmanager.iapp_object.dwmessagetitle = ls_dwMessageTitle
if ls_MicroHelpDefault <> ""   then inv_appmanager.iapp_object.microhelpdefault = ls_MicroHelpDefault
if ls_ToolbarFrameTitle <> ""  then inv_appmanager.iapp_object.toolbarframetitle = ls_ToolbarFrameTitle
if ls_ToolbarPopmenuText <> "" then inv_appmanager.iapp_object.toolbarpopmenutext = ls_ToolbarPopmenuText
if ls_ToolbarSheetTitle <> ""  then inv_appmanager.iapp_object.toolbarsheettitle = ls_ToolbarSheetTitle
inv_appmanager.iapp_object.righttoleft = lb_RightToLeft
inv_appmanager.iapp_object.toolbarusercontrol = lb_ToolbarUserControl

return li_rc
end function

protected function integer of_saveapp (boolean ab_useregistry, string as_keyorini, string as_inisection);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SaveApp
//
//	Access:  		protected
//
//	Arguments:	
//	ab_UseRegistry	Function behavior - use the registry or an .ini file.
//	as_KeyOrIni		The KeyName for use with the Registry or the IniFile name
//						for use with an .Ini file.
//	as_IniSection	The name of the .Ini section. 
//
//	Returns:  		Integer
//						 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Saves the App preference information to either the Registry or
//						to an .INI file.
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

integer				li_rc
n_cst_conversion 	lnv_conversion

//Parameter checking done in calling function

//Save application information
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'userinifile', &
	inv_appmanager.of_GetUserinifile() )
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'userkey', &
	inv_appmanager.of_GetUserkey() )
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'microhelp', &
	lnv_conversion.of_string(inv_appmanager.of_GetMicrohelp() ) )
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'helpfile', &
	inv_appmanager.of_GetHelpfile() )
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'version', &
	inv_appmanager.of_GetVersion() )
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'logo', &
	inv_appmanager.of_GetLogo() )
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'copyright', &
	inv_appmanager.of_GetCopyright() )
		
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'ddetimeout', &
	string(inv_appmanager.iapp_object.ddetimeout))
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'displayname', &
	inv_appmanager.iapp_object.displayname)
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'dwmessagetitle', &
	inv_appmanager.iapp_object.dwmessagetitle)
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'microhelpdefault', &
	inv_appmanager.iapp_object.microhelpdefault)
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'righttoleft',&
	lnv_conversion.of_string(inv_appmanager.iapp_object.righttoleft))
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'toolbarframetitle', &
	inv_appmanager.iapp_object.toolbarframetitle)
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'toolbarpopmenutext', &
	inv_appmanager.iapp_object.toolbarpopmenutext)
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'toolbarsheettitle', &
	inv_appmanager.iapp_object.toolbarsheettitle)
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'toolbarusercontrol', &
	lnv_conversion.of_string(inv_appmanager.iapp_object.toolbarusercontrol))

Return li_rc

end function

protected function integer of_saveuser (boolean ab_useregistry, string as_keyorini, string as_inisection);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Save
//
//	Access:  		protected
//
//	Arguments:	
//	ab_UseRegistry	Function behavior - use the registry or an .ini file.
//	as_KeyOrIni		The KeyName for use with the Registry or the IniFile name
//						for use with an .Ini file.
//	as_IniSection	The name of the .Ini section. 
//
//	Returns:  		Integer
//						 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Saves the App User preference information to either the Registry or
//						to an .INI file.
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

integer				li_rc
n_cst_conversion 	lnv_conversion

//Parameter checking done in calling function

//Save user information
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'toolbartext', &
	lnv_conversion.of_string(inv_appmanager.iapp_object.toolbartext))
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'toolbartips', &
	lnv_conversion.of_string(inv_appmanager.iapp_object.toolbartips))
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'userid', &
	inv_appmanager.of_GetUserid() )

Return li_rc

end function

public function integer of_save (string as_subkey, string as_value, boolean ab_processapp);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Save
//
//	Access:  		public
//
//	Arguments:
//	as_SubKey		The key value to be used on either the Registry or .Ini file.
//	as_value			The value to be stored on either the Registry or .Ini file.
//	ab_ProcessApp	True if saving value with application level preferences
//						False if saving value with Application User level preferences
//
//	Returns:  		integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Public function to enable the developer to store other application
//						type attributes in the same location as this service.
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

// Save application information
if ab_processapp then
	if (is_appkey <> "") then
		// use the registry
		Return of_Save(True, is_appkey, "", as_subkey, as_value)
	elseif (is_appinifile <> "") then
		Return of_Save(False, is_appinifile, is_appprefsection, as_subkey, as_value)
	else
		// no place to Save application level info
		return -1
	end if
Else
	if (is_userkey <> "") then
		// use the registry
		Return of_Save(True, is_userkey, "", as_subkey, as_value)
	elseif (is_userinifile <> "") then
		Return of_Save(False, is_userinifile, is_userprefsection, as_subkey, as_value)
	else
		// no place to Save User level info
		return -1
	end if
end if

return -1
end function

public function integer of_restore (string as_subkey, ref string as_value, string as_default, boolean ab_processapp);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Restore
//
//	Access:  		public
//
//	Arguments:
//	as_SubKey		The key value to be used on either the Registry or .Ini file.
//	as_value			The value to be restored from either the Registry or .Ini file.
//							Passed by reference.
// as_default		Used also as a default value, if the desired value is not found.
//	ab_ProcessApp	True if saving value with application level preferences
//						False if saving value with Application User level preferences
//
//	Returns:  		integer
//						1 if it succeeds.
//						0 if the default value was used.
//
//	Description:  	Public function to enable the developer to restore other application
//						type attributes in the same location as this service.
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

// Save application information
if ab_processapp then
	if (is_appkey <> "") then
		// use the registry
		Return of_Restore(True, is_appkey, "", as_subkey, as_value, as_default)
	elseif (is_appinifile <> "") then
		Return of_Restore(False, is_appinifile, is_appprefsection, as_subkey, as_value, as_default)
	else
		// no place to Restore application level info from
		as_value = as_default
		return 0
	end if
Else
	if (is_userkey <> "") then
		// use the registry
		Return of_Restore(True, is_userkey, "", as_subkey, as_value, as_default)
	elseif (is_userinifile <> "") then
		Return of_Restore(False, is_userinifile, is_userprefsection, as_subkey, as_value, as_default)
	else
		// no place to Restore User level info from
		as_value = as_default
		return 0
	end if
end if

as_value = as_default
return 0
end function

protected function integer of_restore (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot, string as_subkeyelement, ref string as_value, string as_default);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Restore
//
//	Access:  		protected
//
//	Arguments:
//	ai_filetype				Function behavior. - use the registry, an .ini or .xml file.
//	as_keyoriniorxml		The KeyName for use with the Registry , the Ini or XML file name
//								for use with an .Ini or .Xml File
//	as_inisectionxmlroot	The name of the .Ini section. or Xml Root
//	as_subkeyelement		The key/element value to be used on either the Registry , .Ini or .Xml file.
//	as_value					The value to be restored from either the Registry, .Ini or .Xml file
//								Passed by reference.
// as_default				Used also as a default value, if the desired value is not found.
//
//	Returns:  		integer
//						1 if it succeeds.
//						0 if the default value was used.
//					   -1 if an error occurs.
//
//	Description:  	Perform the actual Get from the Registry, .Ini or .Xml File
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5   Initial version
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

integer	li_rc = 1

choose case ai_filetype
	case CST_FILETYPE_REG
		
		if RegistryGet (as_keyoriniorxml, as_subkeyelement, as_Value) <> 1 Then
			as_Value = as_default
			li_rc = 0
		End If
		
	case CST_FILETYPE_INI
		
		as_value = ProfileString (as_keyoriniorxml, as_inisectionxmlroot, as_subkeyelement, DEFAULT)

		If as_value=DEFAULT Then
			as_Value = as_default
			li_rc = 0
		End If
		
	case CST_FILETYPE_XML
		
		PBDOM_BUILDER     	l_pbdom_builder
		PBDOM_DOCUMENT	l_pbdom_doc
		PBDOM_ELEMENT		l_pbdom_ele[]
		PBDOM_ELEMENT		l_pbdom_val

		TRY
		
			l_pbdom_builder = Create PBDOM_Builder
			l_pbdom_doc = l_pbdom_builder.BuildFromFile(as_keyoriniorxml)
			l_pbdom_doc.Getelementsbytagname( as_inisectionxmlroot, l_pbdom_ele )
			l_pbdom_val =  l_pbdom_ele[1].getchildelement( as_subkeyelement )
			as_value = l_pbdom_val.Gettext()

			if isnull( as_value ) then
				as_value = as_default
			end if
			
		CATCH ( PBDOM_Exception pbde )
			MessageBox( "Preference Service - PBDOM Exception", pbde.getMessage() )
			li_rc = -1

		CATCH ( PBXRuntimeError re )   
			MessageBox( "Preference Service - PBNI Exception", re.getMessage() )
			li_rc = -1
		END TRY
	case else
		li_rc = -1
end choose

return li_rc

end function

protected function integer of_save (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot, string as_subkeyelement, string as_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Save
//
//	Access:  		protected
//
//	Arguments:
//	ai_filetype					Function behavior. - use the registry, an .ini or an .xml file.
//	as_KeyOrIniOrXml			The KeyName for use with the Registry, the IniFile name
//									for use with an .Ini file, or the XmlFile for use with an .Xml file.
//	as_IniSectionXmlRoot		The name of the .Ini section or the root element of the Xml File. 
//	as_SubKeyElement		The key value to be used on either the Registry, .Ini or .Xml file.
//	as_value						The value to be stored on either the Registry or .Ini file.
//
//	Returns:  		integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Perform the actual put into the Registry, the .Ini or .Xml file.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5   Initial version
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

n_cst_inifile	lnv_ini

integer	li_rc =1

choose case ai_filetype
	case CST_FILETYPE_REG
		li_rc = RegistrySet (as_keyoriniorxml, as_subkeyElement, as_Value)
	
	case  CST_FILETYPE_INI
		if fileexists( as_keyoriniorxml) = false then
			if lnv_ini.of_create( as_keyoriniorxml, as_inisectionxmlroot ) <> success then return failure
		end if
		
		li_rc = SetProfileString (as_keyoriniorxml, as_inisectionxmlroot, as_subkeyElement, as_Value) 

	case	CST_FILETYPE_XML
		
		PBDOM_BUILDER     	l_pbdom_builder
		PBDOM_DOCUMENT	l_pbdom_doc
		PBDOM_ELEMENT		l_pbdom_ele[]
		PBDOM_ELEMENT		l_pbdom_val

		TRY
		
			l_pbdom_builder = Create PBDOM_Builder
			l_pbdom_doc = l_pbdom_builder.BuildFromFile(as_keyoriniorxml)
			l_pbdom_doc.Getelementsbytagname( as_inisectionxmlroot, l_pbdom_ele )
			l_pbdom_val =  l_pbdom_ele[1].getchildelement( as_subkeyelement )
			l_pbdom_val.settext( as_value)
			
		CATCH ( PBDOM_Exception pbde )
			MessageBox( "Preference Service - PBDOM Exception", pbde.getMessage() )
			li_rc = -1

		CATCH ( PBXRuntimeError re )   
			MessageBox( "Preference Service - PBNI Exception", re.getMessage() )
			li_rc = -1
		END TRY
			
			
	case else	
		li_rc = -1
end choose

return		li_rc
end function

protected function integer of_restoreapp (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RestoreApp
//
//	Access:  		protected
//
//	Arguments:	
//	ai_filetype				Function behavior - use the registry , an .ini or .Xml file.
//	as_keyoriniorxmlorxml		The KeyName for use with the Registry, he IniFile or XmlFile name
//								for use with an .Ini or .Xml file.
//	as_inisectionxmlrootxmlroot	The name of the .Ini section or .Xml Root. 
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Restores the App preference information from either the Registry
//						or from an .INI file.
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

boolean		lb_microhelp, lb_righttoleft, lb_toolbarusercontrol
integer		li_ddetimeout
integer		li_rc
string		ls_userinifile, ls_userkey, ls_microhelp, ls_helpfile
string		ls_version, ls_logo, ls_copyright 
string		ls_ddetimeout, ls_displayname, ls_dwmessagetitle
string		ls_microhelpdefault, ls_righttoleft, ls_toolbarframetitle
string		ls_toolbarpopmenutext, ls_toolbarsheettitle, ls_toolbarusercontrol
string		ls_toolbartext, ls_toolbartips, ls_userid
n_cst_string		lnv_string
n_cst_conversion	lnv_conversion

//Parameter checking done in calling function

//Restore application information -- Default Information is current info
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'userinifile', ls_userinifile, inv_appmanager.of_GetUserinifile() )
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'userkey', ls_userkey, 	inv_appmanager.of_GetUserkey() )
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'microhelp', ls_microhelp, lnv_conversion.of_string(inv_appmanager.of_GetMicrohelp() ) )
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'helpfile', ls_helpfile, inv_appmanager.of_GetHelpfile() )
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'version', ls_version, inv_appmanager.of_GetVersion() )
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'logo', ls_logo, inv_appmanager.of_GetLogo() )
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'copyright', ls_copyright, 	inv_appmanager.of_GetCopyright() )
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'userid', ls_userid, 	inv_appmanager.of_GetUserid() )
		
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'ddetimeout',  ls_ddetimeout, string(inv_appmanager.iapp_object.ddetimeout))
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'displayname', ls_displayname, inv_appmanager.iapp_object.displayname)
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'dwmessagetitle',   ls_dwmessagetitle, inv_appmanager.iapp_object.dwmessagetitle)
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'microhelpdefault', ls_microhelpdefault, inv_appmanager.iapp_object.microhelpdefault)
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'righttoleft', ls_righttoleft, lnv_conversion.of_string(inv_appmanager.iapp_object.righttoleft))
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'toolbarframetitle', ls_toolbarframetitle, inv_appmanager.iapp_object.toolbarframetitle)
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'toolbarpopmenutext', ls_toolbarpopmenutext, inv_appmanager.iapp_object.toolbarpopmenutext)
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'toolbarsheettitle', ls_toolbarsheettitle, inv_appmanager.iapp_object.toolbarsheettitle)
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'toolbarusercontrol', ls_toolbarusercontrol, lnv_conversion.of_string(inv_appmanager.iapp_object.toolbarusercontrol))

//Convert to the appropriate data types
lb_microhelp = lnv_conversion.of_Boolean(ls_microhelp)
lb_righttoleft = lnv_conversion.of_Boolean(ls_righttoleft)
lb_toolbarusercontrol = lnv_conversion.of_Boolean(ls_toolbarusercontrol)
If isnumber(ls_ddetimeout) then 
	li_ddetimeout = integer(ls_ddetimeout)
else
	li_ddetimeout = 0
end if

// Important values so validate them.
if isnull(lb_microhelp) then lb_microhelp = false
if isnull(lb_righttoleft) then lb_righttoleft = false
if isnull(lb_toolbarusercontrol) then lb_toolbarusercontrol = true

// pfc appmanager properties - if value is blank then we don't want to change the current setting
if ls_userkey <> ""     then inv_appmanager.of_SetUserkey(ls_userkey)
if ls_userinifile <> "" then inv_appmanager.of_SetUserinifile(ls_userinifile)
if ls_helpfile <> ""    then inv_appmanager.of_SetHelpfile(ls_helpfile)
if ls_version <> ""     then inv_appmanager.of_SetVersion(ls_version)
if ls_logo <> ""        then inv_appmanager.of_SetLogo(ls_logo)
if ls_copyright <> ""   then inv_appmanager.of_SetCopyright(ls_copyright)
if ls_userid <> ""      then inv_appmanager.of_SetUserid(ls_userid)
inv_appmanager.of_SetMicrohelp(lb_microhelp)

// application object properties - if value is blank then we don't want to change the current setting
inv_appmanager.iapp_object.ddetimeout = li_DDEtimeOut
if ls_DisplayName <> ""        then inv_appmanager.iapp_object.displayname = ls_DisplayName
if ls_dwMessageTitle <> ""     then inv_appmanager.iapp_object.dwmessagetitle = ls_dwMessageTitle
if ls_MicroHelpDefault <> ""   then inv_appmanager.iapp_object.microhelpdefault = ls_MicroHelpDefault
if ls_ToolbarFrameTitle <> ""  then inv_appmanager.iapp_object.toolbarframetitle = ls_ToolbarFrameTitle
if ls_ToolbarPopmenuText <> "" then inv_appmanager.iapp_object.toolbarpopmenutext = ls_ToolbarPopmenuText
if ls_ToolbarSheetTitle <> ""  then inv_appmanager.iapp_object.toolbarsheettitle = ls_ToolbarSheetTitle
inv_appmanager.iapp_object.righttoleft = lb_RightToLeft
inv_appmanager.iapp_object.toolbarusercontrol = lb_ToolbarUserControl

return li_rc
end function

protected function integer of_restoreuser (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RestoreUser
//
//	Access:  		protected
//
//	Arguments:	
//	ai_filetype				Function behavior - use the registry, an .ini or .xml file.
//	as_keyoriniorxmlorxml		The KeyName for use with the Registry, the IniFile or XmlFile name
//								for use with an .Ini or .Xml file.
//	as_inisectionxmlrootxmlroot	The name of the .Ini section or .Xml root. 
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Restores the App User preference information from either the Registry, an .INI file
//						or .Xml file.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5   Initial version
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

boolean		lb_toolbartext, lb_toolbartips
integer		li_rc
string			ls_toolbartext, ls_toolbartips, ls_userid
n_cst_conversion	lnv_conversion

//Parameter checking done in calling function

//Restore user information
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'toolbartext', ls_toolbartext, 	lnv_conversion.of_string(inv_appmanager.iapp_object.toolbartext))
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'toolbartips', ls_toolbartips, 	lnv_conversion.of_string(inv_appmanager.iapp_object.toolbartips))
li_rc = of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'userid', ls_userid, 	inv_appmanager.of_getuserid() )

//Convert to the appropriate data types
lb_toolbartext = lnv_conversion.of_Boolean(ls_toolbartext)
lb_toolbartips = lnv_conversion.of_Boolean(ls_toolbartips)

// Important values so validate them.
if isnull(lb_toolbartext) then lb_toolbartext = false
if isnull(lb_toolbartips) then lb_toolbartips = true
	
// application properties - if value is blank then we don't want to change the current setting
inv_appmanager.iapp_object.toolbartext = lb_ToolbarText
inv_appmanager.iapp_object.toolbartips = lb_ToolbarTips
if ls_userid <> "" then inv_appmanager.of_SetUserid(ls_userid)

return li_rc
end function

protected function integer of_saveapp (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SaveApp
//
//	Access:  		protected
//
//	Arguments:	
//	ai_filetype				Function behavior - use the registry? an .ini or .xml file.
//	as_keyoriniorxmlorxml		The KeyName for use with the Registry, the IniFile or XmlFile name
//								for use with an .Ini or .Xml file.
//	as_inisectionxmlrootxmlroot	The name of the .Ini section. 
//
//	Returns:  		Integer
//						 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Saves the App preference information to either the Registry, an .INI or .XML file.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5   Initial version
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

integer				li_rc
n_cst_conversion 	lnv_conversion

//Parameter checking done in calling function

//Save application information
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'userinifile', 	inv_appmanager.of_GetUserinifile() )
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'userkey', 		inv_appmanager.of_GetUserkey() )
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'microhelp', 	lnv_conversion.of_string(inv_appmanager.of_GetMicrohelp() ) )
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'helpfile', 		inv_appmanager.of_GetHelpfile() )
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'version', 		inv_appmanager.of_GetVersion() )
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'logo', 			inv_appmanager.of_GetLogo() )
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'copyright', 	inv_appmanager.of_GetCopyright() )
		
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'ddetimeout', 				string(inv_appmanager.iapp_object.ddetimeout))
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'displayname', 			inv_appmanager.iapp_object.displayname)
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'dwmessagetitle', 		inv_appmanager.iapp_object.dwmessagetitle)
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'microhelpdefault', 		inv_appmanager.iapp_object.microhelpdefault)
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'righttoleft',				lnv_conversion.of_string(inv_appmanager.iapp_object.righttoleft))
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'toolbarframetitle', 		inv_appmanager.iapp_object.toolbarframetitle)
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'toolbarpopmenutext', 	inv_appmanager.iapp_object.toolbarpopmenutext)
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'toolbarsheettitle', 		inv_appmanager.iapp_object.toolbarsheettitle)
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'toolbarusercontrol', 	lnv_conversion.of_string(inv_appmanager.iapp_object.toolbarusercontrol))

Return li_rc

end function

protected function integer of_saveuser (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SaveUser
//
//	Access:  		protected
//
//	Arguments:	
//	ai_filetype				Function behavior - use the registry, an .ini or .xml file.
//	as_keyoriniorxml		The KeyName for use with the Registry, the IniFile or XmlFile name
//								for use with an .Ini or .Xml file.
//	as_inisectionxmlroot	The name of the .Ini section or Xml root. 
//
//	Returns:  		Integer
//						 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Saves the App User preference information to either the Registry,
//						an .INI or .XML file.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5   Initial version
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

integer				li_rc
n_cst_conversion 	lnv_conversion

//Parameter checking done in calling function

//Save user information
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'toolbartext', 	lnv_conversion.of_string(inv_appmanager.iapp_object.toolbartext))
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'toolbartips', 	lnv_conversion.of_string(inv_appmanager.iapp_object.toolbartips))
li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, 'userid', 	inv_appmanager.of_GetUserid() )

Return li_rc

end function

public function integer of_setuserxmlfile (string as_userxmlfile);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetuserXmlFile
//
//	Access:		public
//
//	Arguments:
//	as_userxmlfile	the full pathname of the use XML file
//
//	Returns:		Integer
//	 1 = success
//	-1 = error
//
//	Description:	Sets the filename of the use's XML file
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	 	12.5   Initial version
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

//Check arguments
If IsNull(as_userxmlfile) Then
	Return -1
End If

is_userXMLfile = as_userXMLfile

ii_filetype = cst_filetype_xml

Return 1
end function

public function integer of_setappxmlfile (string as_appxmlfile);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetAppXmlFile
//
//	Access:		public
//
//	Arguments:
//	as_appxmlfile	the full pathname of the application XML file
//
//	Returns:		Integer
//	 1 = success
//	-1 = error
//
//	Description:	Sets the filename of the application's XML file
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	 	12.5   Initial version
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

//Check arguments
If IsNull(as_appxmlfile) Then
	Return -1
End If

is_appXMLfile = as_appXMLfile

ii_filetype = cst_filetype_xml

Return 1
end function

protected function integer of_restore (string as_keyoriniorxml, string as_inisectionxmlroot, string as_subkeyelement, ref string as_value, string as_default);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Restore
//
//	Access:  		protected
//
//	Arguments:
//	as_keyoriniorxml		The KeyName for use with the Registry , the Ini or XML file name
//								for use with an .Ini or .Xml File
//	as_inisectionxmlroot	The name of the .Ini section. or Xml Root
//	as_subkeyelement		The key/element value to be used on either the Registry , .Ini or .Xml file.
//	as_value					The value to be restored from either the Registry, .Ini or .Xml file
//								Passed by reference.
// as_default				Used also as a default value, if the desired value is not found.
//
//	Returns:  		integer
//						1 if it succeeds.
//						0 if the default value was used.
//					   -1 if an error occurs.
//
//	Description:  	Perform the actual Get from the Registry, .Ini or .Xml File
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5   Initial version
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

choose case ii_filetype
	case CST_FILETYPE_REG
		
		if RegistryGet (as_keyoriniorxml, as_subkeyelement, as_Value) <> 1 Then
			as_Value = as_default
			li_rc = 0
		End If
		
	case CST_FILETYPE_INI
		
		as_value = ProfileString (as_keyoriniorxml, as_inisectionxmlroot, as_subkeyelement, as_default )


	case CST_FILETYPE_XML
		
		PBDOM_BUILDER     	l_pbdom_builder
		PBDOM_DOCUMENT	l_pbdom_doc
		PBDOM_ELEMENT		l_pbdom_ele[]
		PBDOM_ELEMENT		l_pbdom_val

		TRY
		
			l_pbdom_builder = Create PBDOM_Builder
			l_pbdom_doc = l_pbdom_builder.BuildFromFile(as_keyoriniorxml)
			l_pbdom_doc.Getelementsbytagname( as_inisectionxmlroot, l_pbdom_ele )
			l_pbdom_val =  l_pbdom_ele[1].getchildelement( as_subkeyelement )
			as_value = l_pbdom_val.Gettext()

			if isnull( as_value ) then
				as_value = as_default
			end if
			
		CATCH ( PBDOM_Exception pbde )
			MessageBox( "Preference Service - PBDOM Exception", pbde.getMessage() )
			li_rc = -1

		CATCH ( PBXRuntimeError re )   
			MessageBox( "Preference Service - PBNI Exception", re.getMessage() )
			li_rc = -1
		END TRY
	case else
		li_rc = -1
end choose

return li_rc

end function

protected function integer of_restoreapp (string as_keyoriniorxml, string as_inisectionxmlroot);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RestoreApp
//
//	Access:  		protected
//
//	Arguments:	
//	as_keyoriniorxmlorxml		The KeyName for use with the Registry, he IniFile or XmlFile name
//								for use with an .Ini or .Xml file.
//	as_inisectionxmlrootxmlroot	The name of the .Ini section or .Xml Root. 
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Restores the App preference information from either the Registry
//						or from an .INI file.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//		12.5   Initial version
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

return of_restoreapp( ii_filetype, as_keyoriniorxml, as_inisectionxmlroot )
end function

protected function integer of_restoreuser (string as_keyoriniorxml, string as_inisectionxmlroot);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RestoreUser
//
//	Access:  		protected
//
//	Arguments:	
//	ai_filetype				Function behavior - use the registry, an .ini or .xml file.
//	as_keyoriniorxmlorxml		The KeyName for use with the Registry, the IniFile or XmlFile name
//								for use with an .Ini or .Xml file.
//	as_inisectionxmlrootxmlroot	The name of the .Ini section or .Xml root. 
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Restores the App User preference information from either the Registry, an .INI file
//						or .Xml file.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5   Initial version
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

return of_restoreuser( ii_filetype, as_keyoriniorxml, as_inisectionxmlroot )
end function

protected function integer of_save (string as_keyoriniorxml, string as_inisectionxmlroot, string as_subkeyelement, string as_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Save
//
//	Access:  		protected
//
//	Arguments:
//	as_KeyOrIniOrXml			The KeyName for use with the Registry, the IniFile name
//									for use with an .Ini file, or the XmlFile for use with an .Xml file.
//	as_IniSectionXmlRoot		The name of the .Ini section or the root element of the Xml File. 
//	as_SubKeyElement		The key value to be used on either the Registry, .Ini or .Xml file.
//	as_value						The value to be stored on either the Registry or .Ini file.
//
//	Returns:  		integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Perform the actual put into the Registry, the .Ini or .Xml file.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5   Initial version
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

return this.of_save( ii_filetype, as_keyoriniorxml, as_inisectionxmlroot, as_subkeyelement,as_value )
end function

protected function integer of_saveapp (string as_keyoriniorxml, string as_inisectionxmlroot);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SaveApp
//
//	Access:  		protected
//
//	Arguments:	
//	ai_filetype				Function behavior - use the registry? an .ini or .xml file.
//	as_keyoriniorxmlorxml		The KeyName for use with the Registry, the IniFile or XmlFile name
//								for use with an .Ini or .Xml file.
//	as_inisectionxmlrootxmlroot	The name of the .Ini section. 
//
//	Returns:  		Integer
//						 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Saves the App preference information to either the Registry, an .INI or .XML file.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5   Initial version
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

return of_saveapp( ii_filetype, as_keyoriniorxml, as_inisectionxmlroot )

end function

protected function integer of_saveuser (string as_keyoriniorxml, string as_inisectionxmlroot);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SaveUser
//
//	Access:  		protected
//
//	Arguments:	
//	as_keyoriniorxml		The KeyName for use with the Registry, the IniFile or XmlFile name
//								for use with an .Ini or .Xml file.
//	as_inisectionxmlroot	The name of the .Ini section or Xml root. 
//
//	Returns:  		Integer
//						 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Saves the App User preference information to either the Registry,
//						an .INI or .XML file.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5   Initial version
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

return of_saveuser( ii_filetype, as_keyoriniorxml, as_inisectionxmlroot )

end function

public function integer of_getfiletype ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getfiletype
//
// Access:			Public
//
// Returns:			integer
//			CST_FILETYPE_REG 	(1) - Regsitry Used
//			CST_FILETYPE_INI		(2) - INI file used
//			CST_FILETYPE_XML	(3) - XML file used
//
// Description:	Return the actual file type used to store Preferences
//						Informations.
//
// Usage:			Call this method to know the file type used to store
//							prefrences.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5	Initial Version
//////////////////////////////////////////////////////////////////////////////

return ii_filetype
end function

public function integer of_save (string as_inisectionxmlroot, string as_subkeyelement, string as_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Save
//
//	Access:  		public
//
//	Arguments:
//	as_IniSectionXmlRoot		The name of the .Ini section or the root element of the Xml File. 
//	as_SubKeyElement		The key value to be used on either the Registry, .Ini or .Xml file.
//	as_value						The value to be stored on either the Registry or .Ini file.
//
//	Returns:  		integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Perform the actual put into the Registry, the .Ini or .Xml file.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5   Initial version
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
string	ls_Keyoriniorxml

choose case ii_filetype
	case cst_filetype_ini
		ls_Keyoriniorxml = is_appinifile
	case cst_filetype_reg
		ls_Keyoriniorxml = is_appkey
	case cst_filetype_xml
		ls_Keyoriniorxml = is_appxmlfile
	case else
		return failure
end choose


return this.of_save( ii_filetype, ls_keyoriniorxml, as_inisectionxmlroot, as_subkeyelement,as_value )
end function

public function integer of_setcontext (string as_key, any aa_value);n_cst_linkedlistnode	lnv_listnode

if isnull( as_key ) or len(trim(as_key)) = 0 then return failure

lnv_listnode.of_setkey( as_key )
lnv_listnode.of_setdata( aa_value)

return inv_context.of_add( lnv_listnode )
end function

public function integer of_getcontext (string as_key, ref any aa_value);
n_cst_linkedlistnode	lnv_keynode
n_cst_linkedlistnode	lnv_valuenode

if isnull( as_key ) or len( trim( as_key) ) = 0 then return failure

if lnv_keynode.of_setkey( as_key ) <> success then return failure

if inv_context.of_find( lnv_valuenode, lnv_keynode ) <> success then return failure

return lnv_valuenode.of_getdata( aa_value )

end function

public function integer of_restore (string as_inisectionxmlroot, string as_subkeyelement, ref string as_value, string as_default);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Restore
//
//	Access:  		public
//
//	Arguments:
//	as_inisectionxmlroot	The name of the .Ini section. or Xml Root
//	as_subkeyelement		The key/element value to be used on either the Registry , .Ini or .Xml file.
//	as_value					The value to be restored from either the Registry, .Ini or .Xml file
//								Passed by reference.
// as_default				Used also as a default value, if the desired value is not found.
//
//	Returns:  		integer
//						1 if it succeeds.
//						0 if the default value was used.
//					   -1 if an error occurs.
//
//	Description:  	Perform the actual Get from the Registry, .Ini or .Xml File
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5   Initial version
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

string	ls_Keyoriniorxml

choose case ii_filetype
	case cst_filetype_ini
		ls_Keyoriniorxml = is_appinifile
	case cst_filetype_reg
		ls_Keyoriniorxml = is_appkey
	case cst_filetype_xml
		ls_Keyoriniorxml = is_appxmlfile
	case else
		return failure
end choose

return this.of_restore( ii_filetype , ls_Keyoriniorxml , as_inisectionxmlroot, as_subkeyelement, as_value, as_default )


end function

on pfc_n_cst_apppreference.create
call super::create
end on

on pfc_n_cst_apppreference.destroy
call super::destroy
end on

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	Constructor
//
//	Description:
//	Application Manager preference service.
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
end event


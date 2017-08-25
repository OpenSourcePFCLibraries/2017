HA$PBExportHeader$pfc_n_cst_appmanager.sru
$PBExportComments$PFC Application Manager class
forward
global type pfc_n_cst_appmanager from n_base
end type
end forward

global type pfc_n_cst_appmanager from n_base
event pfc_open ( string as_commandline )
event pfc_close ( )
event pfc_systemerror ( )
event pfc_idle ( )
event pfc_preabout ( ref n_cst_aboutattrib anv_aboutattrib )
event type connectprivilege pfc_connectionbegin ( string as_userid,  string as_password,  string as_connectstring )
event pfc_connectionend ( )
event pfc_presplash ( ref n_cst_splashattrib anv_splashattrib )
event pfc_exit ( )
event pfc_prelogondlg ( ref n_cst_logonattrib anv_logonattrib )
event type integer pfc_logon ( string as_userid,  string as_password )
end type
global pfc_n_cst_appmanager pfc_n_cst_appmanager

type variables
Public:
application	iapp_object
environment	ienv_object
n_cst_trregistration	inv_trregistration
n_cst_dwcache	inv_dwcache
n_cst_debug	inv_debug
n_cst_error	inv_error
n_cst_security	inv_security
n_cst_apppreference	inv_apppref
n_cst_mru		inv_mru

Protected:
boolean	ib_microhelp
string	is_appinifile
string	is_userinifile
string	is_appkey
string	is_userkey
string	is_helpfile
string	is_version
string	is_logo
string	is_userid
string	is_copyright
w_frame	iw_frame
end variables

forward prototypes
public function string of_getuserid ()
public function boolean of_isregistryavailable ()
public function string of_getcopyright ()
public function string of_getversion ()
public function string of_getappinifile ()
public function string of_gethelpfile ()
public function string of_getuserinifile ()
public function string of_getlogo ()
public function integer of_setmicrohelp (boolean ab_microhelp)
public function boolean of_getmicrohelp ()
public function integer of_about ()
public function integer of_splash (integer ai_secondsvisible)
public function integer of_setcopyright (string as_copyright)
public function integer of_setappinifile (string as_appinifile)
public function integer of_setversion (string as_version)
public function integer of_setuserinifile (string as_userinifile)
public function integer of_setuserid (string as_userid)
public function integer of_setlogo (string as_logo)
public function integer of_sethelpfile (string as_helpfile)
public function integer of_setappkey (string as_appkey)
public function integer of_setuserkey (string as_userkey)
public function string of_getappkey ()
public function string of_getuserkey ()
public function w_frame of_getframe ()
public function integer of_logondlg ()
public function integer of_setdebug (boolean ab_switch)
public function integer of_setdwcache (boolean ab_switch)
public function integer of_seterror (boolean ab_switch)
public function integer of_setframe (w_frame aw_frame)
public function integer of_settrregistration (boolean ab_switch)
public function integer of_setsecurity (boolean ab_switch)
public function integer of_setapppreference (boolean ab_switch)
public function integer of_setmru (boolean ab_switch)
end prototypes

event pfc_open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_open
//
//	Arguments:
//	as_commandline:  command line parameter to the application
//
//	Returns:  None
//
//	Description:  Perform open processing
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0   Add Application Preference and Most Recently Used Service hooks
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

iapp_object.dwMessageTitle = iapp_object.DisplayName

// App Manager Preference services.
if IsValid (inv_AppPref) then 
	li_rc = inv_AppPref.Event pfc_open(as_commandline) 
	if li_rc < 0 and isvalid(inv_debug) then
		of_MessageBox ("pfc_appmanager_appprefdebug", "PowerBuilder Class Library", &
			"The PFC Application Preferences service" +&
			" has been requested but the REQUIRED Application registry/INI File attributes" +&
			" have not been set.  Use of_SetAppKey/of_SetAppIniFile on the PFC Application" +&
			" Manager to set the attribute.", &
			Exclamation!, Ok!, 1)
	end if
end if 

// Initialize the Most Recently Used Serivce
if isvalid(inv_mru) then
	inv_mru.event pfc_open(as_commandline)
end if

end event

event pfc_close;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_close
//
//	Arguments:  None
//
//	Returns:  None
//
//	Description:  Perform close processing
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0   Add Application Preference and MRU Service hooks
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

// App Manager Preference services.
if IsValid (inv_AppPref) then
	li_rc = inv_AppPref.Event pfc_close () 
	if li_rc < 0 and isvalid(inv_debug) then
		of_MessageBox ("pfc_appmanager_appprefdebug", "PowerBuilder Class Library", &
			"The PFC Application Preferences service" +&
			" has been requested but the REQUIRED Application registry/INI File attributes" +&
			" have not been set.  Use of_SetAppKey/of_SetAppIniFile on the PFC Application" +&
			" Manager object to set the attribute.", &
			Exclamation!, Ok!, 1)
	end if
end if

// Most Recently Used service.
if IsValid (inv_mru) then
	inv_mru.Event pfc_close () 
end if

end event

event pfc_systemerror;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  PFC_systemerror
//
//	Arguments:	None
//
//	Returns:  None
//
//
//	Description:  Triggered whenever the a system level error occurs.
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
string 	ls_message
string	ls_msgparm[1]

ls_message = 'Error Number '+string(error.number) & 
	+'.~r~nError text = '+Error.text &
	+'.~r~nWindow/Menu/Object = '+error.windowmenu &
	+'.~r~nError Object/Control = '+Error.object &
	+'.~r~nScript = '+Error.objectevent &
	+'.~r~nLine in Script = '+string(Error.line) + '.'

if isvalid(inv_error) then
	ls_msgparm[1] = ls_message
	inv_error.of_message('pfc_systemerror', ls_msgparm)
else
	of_Messagebox('pfc_systemerror','System Error',ls_message, StopSign!, Ok!, 1)
end if

this.event pfc_exit()



end event

event pfc_preabout;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_preabout
//
//	Arguments:		
//	anv_aboutattrib:  About object by reference
//
//	Returns:  None
//
//	Description:	Populate about object before the about window opens.
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

anv_aboutattrib.is_application = iapp_object.displayname
anv_aboutattrib.is_logo = is_logo
anv_aboutattrib.is_version = is_version
anv_aboutattrib.is_copyright = is_copyright
end event

event pfc_presplash;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_presplash
//
//	Arguments:		
//	anv_splashattrib  splash object by reference
//
//	Returns:  None
//
//	Description:  Populate splash object before the splash window opens.
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

anv_splashattrib.is_application = iapp_object.displayname
anv_splashattrib.is_logo = is_logo
anv_splashattrib.is_version = is_version
anv_splashattrib.is_copyright = is_copyright

end event

event pfc_exit;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_exit
//
//	Arguments:  None
//
//	Returns:  None
//
//	Description:
//	Exit from the application.
//	If the application contains a Frame, an explicit close will be issued to
//	the active MDI frame window.
//
//	NOTE:  This event is a stubb event and may need to be overriden.
// Examples of why to override:
//	1) The application is SDI and you want to issue an explicit close to the main window
//	2) The application contains multiple frames and the desired behavior is to
// 	close all of them.
// 3) ...
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.02   Modified default behavior to close the active frame window if available.
//		If there is no active MDI frame window available, function will issue a halt close.
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

w_frame	lw_activeframe

lw_activeframe = of_GetFrame()
if IsValid (lw_activeframe) then
	Close (lw_activeframe)
else
	halt close
end if
end event

event pfc_prelogondlg;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_prelogondlg
//
//	Arguments:		
//	anv_logonattrib:  Logon object by reference
//
//	Returns:  None
//
//	Description:	Populate logon object before the logon window opens.
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

string	ls_userid
n_cst_platform	lnv_platform

//////////////////////////////////////////////////////////////////////////////
// Determine default User ID
//////////////////////////////////////////////////////////////////////////////
if of_IsRegistryAvailable() then
	if Len (is_userkey) > 0 then
		RegistryGet (is_userkey + "\logon", "userid", ls_userid)		
	end if
else
	if Len (is_userinifile) > 0 then
		ls_userid = ProfileString (is_userinifile, "logon", "userid", "")
	end if
end if
if Len (ls_userid) = 0 then
	f_setplatform (lnv_platform, true)
	ls_userid = lnv_platform.of_GetUserID()
	f_setplatform (lnv_platform, false)
end if
anv_logonattrib.is_userid = ls_userid

//////////////////////////////////////////////////////////////////////////////
// This object will by default be used to perform logon
//////////////////////////////////////////////////////////////////////////////
anv_logonattrib.ipo_source = this

//////////////////////////////////////////////////////////////////////////////
// Application name and logo
//////////////////////////////////////////////////////////////////////////////
anv_logonattrib.is_appname = iapp_object.DisplayName
anv_logonattrib.is_logo = is_logo
end event

event pfc_logon;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_logon
//
//	Arguments:
//	as_userid   User ID attempting to logon
//	as_password   Password of user attempting to logon
//
//	Returns:  integer
//	 1 = successful logon
//	-1 = failure
//
//	Description:  Specific logon functionality for the application.
//	Perform logon processing based on User ID and password given.
//
//	Note:  this event will be responsible for displaying any error messages
//	if the logon fails for any reason.
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

return -1
end event

public function string of_getuserid ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetUserid
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  string   the current user's id.
//
//	Description:  Returns the user's id.
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

return is_userid

end function

public function boolean of_isregistryavailable ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_IsRegistryAvailable
//
//	Access:  	public
//
//	Arguments:	 none
//
//	Returns:  boolean
//
//	Description:  
//	Returns a boolean stating whether the registry is available.
//
//	Note: 
// This is a stub function.  Overload to get desired functionality.
// For example, if you only want INI functionality simply overload this
// function to always return False.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.04 Corrected so that (OSType=Windows! and OSMajorRevision=3 and
//			OSMinorRevision >= 95) does not return TRUE. A 16bit application 
//			cannot access the registry
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

If ienv_object.Win16 Then Return False

If (ienv_object.OSType=Windows! and ienv_object.OSMajorRevision >= 4) or &
	ienv_object.OSType=WindowsNT! Then
	Return True
End If

Return False

end function

public function string of_getcopyright ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetCopyright
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  string   the copyright statement.
//
//	Description:  Returns the application copyright statement.
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

return is_copyright

end function

public function string of_getversion ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetVersion
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  String   the current application version.
//
//	Description:  Returns the application version.
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

return is_version

end function

public function string of_getappinifile ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetAppIniFile
//
//	Access:  public
//
//	Arguments:	 none
//
//	Returns:  string   the name of the application INI file.
//
//	Description:  Returns the name of the application INI file.
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

return is_appinifile
end function

public function string of_gethelpfile ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetHelpFile
//
//	Access:  public
//
//	Arguments:  None
//
//	Returns:  String   the name of the application help file
//
//	Description:  Returns the name of the application's help file.
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

return is_helpfile

end function

public function string of_getuserinifile ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetUserIniFile
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  string   the name of the user INI file.
//
//	Description:  Returns the name of the user-specific INI file.
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

return is_userinifile

end function

public function string of_getlogo ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetLogo
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  string   the bitmap filename of the logo.
//
//	Description:  returns the bitmap file name of the application logo
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

return is_logo

end function

public function integer of_setmicrohelp (boolean ab_microhelp);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetMicrohelp
//
//	Access:  public
//
//	Arguments:		
//	ab_microhelp   enable/disable microhelp
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Enables/disables microhelp for the application
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

// Check arguments
if IsNull (ab_microhelp) then
	return -1
end if

ib_microhelp = ab_microhelp
return 1
end function

public function boolean of_getmicrohelp ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetMicrohelp
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  Boolean
//	True - Application has microhelp capabilities
//	False - Application does not use microhelp
//
//	Description:  Returns the current application's microhelp behavior.
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

return ib_microhelp
end function

public function integer of_about ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_About
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:  Display the about window.
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

n_cst_aboutattrib lnv_aboutattrib

// Populate information passed to the About window.
this.Event pfc_preabout (lnv_aboutattrib)

Return OpenWithParm (w_about, lnv_aboutattrib)

end function

public function integer of_splash (integer ai_secondsvisible);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Splash
//
//	Access:  public
//
//	Arguments:		
//	ai_secondsvisible   the length of time to display the splash window.
//
//	Returns:integer
//	 1 = success
//	-1 = error
//
//	Description:  Display the splash window for a specified length of time.
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

n_cst_splashattrib lnv_splashattrib

// Check arguments
If IsNull(ai_secondsvisible) Then
	ai_secondsvisible = 0
End If

// Number of seconds for splash window to be visible
lnv_splashattrib.ii_secondsvisible = ai_secondsvisible

// Populate information passed to the Splash window.
this.Event pfc_presplash (lnv_splashattrib)

Return OpenWithParm (w_splash, lnv_splashattrib)

end function

public function integer of_setcopyright (string as_copyright);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetCopyright
//
//	Access:  public
//
//	Arguments:  as_copyright   the copyright statement.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:  Sets the application copyright message
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

If IsNull(as_copyright) Then
	Return -1
End If

is_copyright = as_copyright
Return 1
end function

public function integer of_setappinifile (string as_appinifile);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetAppIniFile
//
//	Access:  public
//
//	Arguments:
//	as_appinifile:  the full pathname of the application INI file
//
//	Returns:  Integer
//	 1 = success
//	-1 = error
//
//	Description:  Sets the filename of the application's INI file
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

//Check arguments
If IsNull(as_appinifile) Then
	Return -1
End If

is_appinifile = as_appinifile
Return 1
end function

public function integer of_setversion (string as_version);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetVersion
//
//	Access:  public
//
//	Arguments:		
//	as_version   Application version.
//
//	Returns:  Integer
//	 1 = succeess
//	-1 = error
//
//	Description:  Sets the version of this application
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

If IsNull(as_version) Then
	Return -1
End If

is_version = as_version
Return 1
end function

public function integer of_setuserinifile (string as_userinifile);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetUserIniFile
//
//	Access:  public
//
//	Arguments:		
//	as_userinifile   Full pathname of the user's INI file.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:  Sets the filename for the user INI file
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

If IsNull(as_userinifile) Then
	Return -1
End If

is_userinifile = as_userinifile
Return 1
end function

public function integer of_setuserid (string as_userid);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetUserid
//
//	Access:  public
//
//	Arguments:  as_userid   the current user's id
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:  Sets the current user's id
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

If IsNull(as_userid) Then
	Return -1
End If

is_userid = as_userid
Return 1

end function

public function integer of_setlogo (string as_logo);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetLogo
//
//	Access:  		public
//
//	Arguments:		
//	as_logo			Name of the logo.
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs. 
//
//	Description:  	Sets the value for the Logo attribute.
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

If IsNull(as_logo) Then	
	Return -1
End If

is_logo = as_logo
Return 1
end function

public function integer of_sethelpfile (string as_helpfile);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetHelpfile
//
//	Access:  public
//
//	Arguments:
//	as_helpfile:  Full pathname of the application's online help file.
//
//	Returns:  Integer
//	 1 = success
//	-1 = error
//
//	Description:  Sets the value of the online help file of the application
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

If IsNull(as_helpfile) Then
	Return -1
End If

is_helpfile = as_helpfile
Return 1
end function

public function integer of_setappkey (string as_appkey);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetAppKey
//
//	Access:  public
//
//	Arguments:		
//	as_appkey   Full key value for the application.
//
//	Returns:  Integer
//	 1 = success 
//	-1 = error 
//
//	Description:  Sets the value for the application key on the registry.
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

If IsNull(as_appkey) Then
	Return -1
End If

is_appkey = as_appkey
Return 1
end function

public function integer of_setuserkey (string as_userkey);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetUserKey
//
//	Access:  public
//
//	Arguments:		
//	as_userkey:  full registry key for the user.
//
//	Returns:  Integer
//	 1 = success
//	-1 = error 
//
//	Description:  Sets the value of the registy key for the user
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

If IsNull(as_userkey) Then
	Return -1
End If

is_userkey = as_userkey
Return 1
end function

public function string of_getappkey ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetAppKey
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  string   the name of the application key.
//
//	Description:  Returns the name of the application's key in the registry.
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

return is_appkey
end function

public function string of_getuserkey ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetUserKey
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  string
//
//	Description:  Returns the name of the user's key in the registry
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

return is_userkey
end function

public function w_frame of_getframe ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetFrame
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  w_frame
//
//	Description:  Returns the currently active frame window
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

return iw_frame

end function

public function integer of_logondlg ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_LogonDlg
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = successful logon
//	 0 = User cancelled from the logon dialog
//	-1 = an error occurred opening the logon window
//
//	Description:  Obtain a User ID and password from the user
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

n_cst_logonattrib	lnv_logonattrib

//////////////////////////////////////////////////////////////////////////////
// Load logon object values
//////////////////////////////////////////////////////////////////////////////
this.event pfc_prelogondlg (lnv_logonattrib)

//////////////////////////////////////////////////////////////////////////////
// Open logon window
//////////////////////////////////////////////////////////////////////////////
if OpenWithParm (w_logon, lnv_logonattrib) < 0 then
	return -1
end if

//////////////////////////////////////////////////////////////////////////////
// Get return logon object
//////////////////////////////////////////////////////////////////////////////
lnv_logonattrib = message.powerobjectparm

//////////////////////////////////////////////////////////////////////////////
// Store user id
//////////////////////////////////////////////////////////////////////////////
if Len (lnv_logonattrib.is_userid) > 0 then
	if of_IsRegistryAvailable() then
		RegistrySet (is_userkey + "\logon", "userid", lnv_logonattrib.is_userid)
	else
		SetProfileString (is_userinifile, "logon", "userid", lnv_logonattrib.is_userid)
	end if

	of_SetUserID (lnv_logonattrib.is_userid)
end if

return lnv_logonattrib.ii_rc

end function

public function integer of_setdebug (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetDebug
//
//	Access:  		public
//
//	Arguments:
//	ab_switch		True - start (create) the service,
//						False - stop (destroy) the service
//
//	Returns:  		Integer
//						 1 - Successful operation.
//						 0 - No action taken.
//						-1 - An error was encountered.
//						
//	Description:  	Starts or stops the Debug Service.
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

//Check arguments
If IsNull(ab_switch) Then
	Return -1
End If

IF ab_Switch THEN
	IF IsNull(inv_debug) Or Not IsValid (inv_debug) THEN
		inv_debug = CREATE n_cst_debug
		Return 1
	END IF
ELSE
	IF IsValid (inv_debug) THEN
		DESTROY inv_debug
		Return 1
	END IF	
END IF

Return 0
end function

public function integer of_setdwcache (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetDwCache
//
//	Access:  		public
//
//	Arguments:		
//	ab_Switch		True - start (create) the service,
//						False - stop (destroy) the service
//
//Returns:  		Integer
//						 1 - Successful operation.
//						 0 - No action taken.
//						-1 - An error was encountered.
//
//	Description:  	Starts or stops the DW Caching service
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

//Check arguments
If IsNull(ab_switch) Then
	Return -1
End if

IF ab_Switch THEN
	IF IsNull(inv_dwcache) Or Not IsValid (inv_dwcache) THEN
		inv_dwcache = CREATE n_cst_dwcache
		Return 1
	END IF
ELSE
	IF IsValid (inv_dwcache) THEN
		DESTROY inv_dwcache
		Return 1
	END IF	
END IF

Return 0

end function

public function integer of_seterror (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetError
//
//	Access:  		public
//
//	Arguments:
//	ab_switch		True - start (create) the service,
//						False - stop (destroy) the service
//
//	Returns:  		Integer
//						 1 - Successful operation.
//						 0 - No action taken.
//						-1 - An error was encountered.
//						
//	Description:  	Starts or stops the Error Handling Service.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Enhanced to default User name.
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
If IsNull(ab_switch) Then
	Return -1
End If

IF ab_Switch THEN
	IF IsNull(inv_error) Or Not IsValid (inv_error) THEN
		inv_error = CREATE n_cst_error
		inv_error.of_SetUser( this.of_GetUserID() )
		Return 1
	END IF
ELSE
	IF IsValid (inv_error) THEN
		DESTROY inv_error
		Return 1
	END IF	
END IF

Return 0
end function

public function integer of_setframe (w_frame aw_frame);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetFrame
//
//	Access:  public
//
//	Arguments:  aw_frame   the MDI Frame Window
//
//	Returns:  		Integer
//						 1 - Successful operation.
//						-1 - An error was encountered.
//
//	Description:  Sets the currently active MDI frame.
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

/* No Check for valid arguments is performed. */

// This variable might not contain a valid reference.
iw_frame = aw_frame
Return 1
end function

public function integer of_settrregistration (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetTrRegistration
//
//	Access:  		public
//
//	Arguments:		
//	ab_switch		True - start (create) the service,
//						False - stop (destroy) the service
//
//	Returns:  		Integer
//						 1 - Successful operation.
//						 0 - No action taken.
//						-1 - An error was encountered.
//
//	Description:  	Starts or stops the Transaction Object Registration Service
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

//Check arguments
If IsNull(ab_switch) Then
	Return -1
End If

IF ab_Switch THEN
	IF IsNull(inv_trregistration) Or Not IsValid (inv_trregistration) THEN
		inv_trregistration = CREATE n_cst_trregistration
		Return 1
	END IF
ELSE
	IF IsValid (inv_trregistration) THEN
		DESTROY inv_trregistration
		Return 1
	END IF	
END IF

Return 0
end function

public function integer of_setsecurity (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetSecurity
//
//	Access:  		public
//
//	Arguments:		
//	ab_Switch		True - start (create) the service,
//						False - stop (destroy) the service
//
//Returns:  		Integer
//						 1 - Successful operation.
//						 0 - No action taken.
//						-1 - An error was encountered.
//
//	Description:  	Starts or stops the Security service
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0.02   Initial version
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
If IsNull(ab_switch) Then
	Return -1
End if

IF ab_Switch THEN
	IF IsNull(inv_security) Or Not IsValid (inv_security) THEN
		inv_security = CREATE n_cst_security
		Return 1
	END IF
ELSE
	IF IsValid (inv_security) THEN
		DESTROY inv_security
		Return 1
	END IF	
END IF

Return 0

end function

public function integer of_setapppreference (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetAppPreference
//
//	Access:  		public
//
//	Arguments:
//	ab_switch		True - start (create) the service,
//						False - stop (destroy) the service
//
//	Returns:  		Integer
//						 1 - Successful operation.
//						 0 - No action taken.
//						-1 - An error was encountered.
//						
//	Description:  	Starts or stops the Application Preference Service.
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

//Check arguments
If IsNull(ab_switch) Then
	Return -1
End If

IF ab_Switch THEN
	IF IsNull(inv_apppref) Or Not IsValid (inv_apppref) THEN
		inv_apppref = CREATE n_cst_apppreference
		inv_apppref.of_SetRequestor ( this )

		// set up some defaults
		inv_apppref.of_setappkey( this.of_getappkey() )
		inv_apppref.of_setappinifile( this.of_getappinifile() )
		inv_apppref.of_setuserkey( this.of_getuserkey() )
		inv_apppref.of_setuserinifile( this.of_getuserinifile() )

		Return 1
	END IF
ELSE
	IF IsValid (inv_apppref) THEN
		DESTROY inv_apppref
		Return 1
	END IF	
END IF

Return 0
end function

public function integer of_setmru (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetMRU
//
//	Access:  		public
//
//	Arguments:
//	ab_switch		True - start (create) the service,
//						False - stop (destroy) the service
//
//	Returns:  		Integer
//						 1 - Successful operation.
//						 0 - No action taken.
//						-1 - An error was encountered.
//						
//	Description:  	Starts or stops the Most Recently Used Service.
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

//Check arguments
If IsNull(ab_switch) Then
	Return -1
End If

IF ab_Switch THEN
	IF IsNull(inv_mru) Or Not IsValid (inv_mru) THEN
		inv_mru = CREATE n_cst_mru

		// set up some defaults
		inv_mru.of_setuserkey( this.of_getuserkey() )
		inv_mru.of_setuserinifile( this.of_getuserinifile() )

		Return 1
	END IF
ELSE
	IF IsValid (inv_mru) THEN
		DESTROY inv_mru
		Return 1
	END IF	
END IF

Return 0
end function

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  destructor
//
//	Description:	Destroy any instantiated application service objects 
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.02   Destroy security service
// 6.0	Destroy app preference and MRU services
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

of_SetTrRegistration (false)
of_SetDwCache (false)
of_SetDebug (false)
of_SetError (false)
of_SetSecurity (false)
of_SetAppPreference (false)
of_SetMRU (false)
end event

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  	pfc_n_cst_appmanager
//
//	Description:  	PFC Application Manager class
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

//////////////////////////////////////////////////////////////////////////////
// Get a handle to the application object
//////////////////////////////////////////////////////////////////////////////
iapp_object = GetApplication()

//////////////////////////////////////////////////////////////////////////////
// Populate the environment object
//////////////////////////////////////////////////////////////////////////////
GetEnvironment (ienv_object)

//////////////////////////////////////////////////////////////////////////////
// The following code can be implemented in descendants
//////////////////////////////////////////////////////////////////////////////
//// Name of the application
//iapp_object.DisplayName=""
//
//// Microhelp functionality
//of_SetMicroHelp (true)
//
//// The file name of the application INI file
//of_SetAppIniFile ("")
//
//// The file name of the user INI file
//of_SetUserIniFile ("")
//
//// Application registry key
//of_SetAppKey ("")
//
//// User registry key
//of_SetUserKey ("")
//
//// The file name of the application's online help file
//of_SetHelpFile ("")
//
//// The application version
//of_SetVersion ("")
//
//// The application logo (bitmap file name)
//of_SetLogo ("")
//
//// Application copyright message
//of_SetCopyright ("")


end event

on pfc_n_cst_appmanager.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_appmanager.destroy
TriggerEvent( this, "destructor" )
end on


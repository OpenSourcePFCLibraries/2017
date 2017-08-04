HA$PBExportHeader$pfc_n_cst_platform.sru
$PBExportComments$PFC Cross Platform service
forward
global type pfc_n_cst_platform from n_base
end type
end forward

global type pfc_n_cst_platform from n_base
end type
global pfc_n_cst_platform pfc_n_cst_platform

type variables
Protected:
string		is_separator
string		is_ClassName[] = {"FNWND3120","FNWNS3120"}
end variables

forward prototypes
public function unsignedinteger of_findwindow (string as_window_name)
public function integer of_getactivewindowborder ()
public function string of_getcomputername ()
public function long of_getfreememory ()
public function integer of_getfreeresources (integer ai_type)
public function long of_getphysicalmemory ()
public function string of_getsystemdirectory ()
public function integer of_gettextsize (ref window aw_obj, string as_text, string as_fontface, integer ai_fontsize, boolean ab_bold, boolean ab_italic, boolean ab_underline, ref integer ai_height, ref integer ai_width)
public function string of_getuserid ()
public function string of_getwindowsdirectory ()
public function string of_getwindowtext (unsignedinteger ai_handle)
public function boolean of_isapprunning (string as_app_name)
public function long of_PageSetupDlg (ref s_pagesetupattrib astr_pagesetup)
public function integer of_playsound (string as_file)
public function integer of_PlaySound (string as_file, boolean ab_beeponfailure)
public function integer of_setfindwindowclasses (string as_classname[])
public function integer of_getknownfolderpath (integer ai_foldercode, ref string as_folderpath)
public function integer of_getknownfolderpath (integer ai_foldercode, boolean ab_currentpath, ref string as_folderpath)
end prototypes

public function unsignedinteger of_findwindow (string as_window_name);//////////////////////////////////////////////////////////////////////////////
//	In case this function is not found in descendant
//////////////////////////////////////////////////////////////////////////////
return 0
end function

public function integer of_getactivewindowborder ();//////////////////////////////////////////////////////////////////////////////
//	In case this function is not found in descendant
//////////////////////////////////////////////////////////////////////////////
return -1
end function

public function string of_getcomputername ();//////////////////////////////////////////////////////////////////////////////
//	In case this function is not found in descendant
//////////////////////////////////////////////////////////////////////////////
return ""
end function

public function long of_getfreememory ();//////////////////////////////////////////////////////////////////////////////
//	In case this function is not found in descendant
//////////////////////////////////////////////////////////////////////////////
return -1
end function

public function integer of_getfreeresources (integer ai_type);//////////////////////////////////////////////////////////////////////////////
//	In case this function is not found in descendant
//////////////////////////////////////////////////////////////////////////////
return -1
end function

public function long of_getphysicalmemory ();//////////////////////////////////////////////////////////////////////////////
//	In case this function is not found in descendant
//////////////////////////////////////////////////////////////////////////////
return -1
end function

public function string of_getsystemdirectory ();//////////////////////////////////////////////////////////////////////////////
//	In case this function is not found in descendant
//////////////////////////////////////////////////////////////////////////////
return ""
end function

public function integer of_gettextsize (ref window aw_obj, string as_text, string as_fontface, integer ai_fontsize, boolean ab_bold, boolean ab_italic, boolean ab_underline, ref integer ai_height, ref integer ai_width);//////////////////////////////////////////////////////////////////////////////
//	In case this function is not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

public function string of_getuserid ();//////////////////////////////////////////////////////////////////////////////
//	In case this function is not found in descendant
//////////////////////////////////////////////////////////////////////////////
return ""
end function

public function string of_getwindowsdirectory ();//////////////////////////////////////////////////////////////////////////////
//	In case this function is not found in descendant
//////////////////////////////////////////////////////////////////////////////
return ""
end function

public function string of_getwindowtext (unsignedinteger ai_handle);//////////////////////////////////////////////////////////////////////////////
//	In case this function is not found in descendant
//////////////////////////////////////////////////////////////////////////////
return ""
end function

public function boolean of_isapprunning (string as_app_name);//////////////////////////////////////////////////////////////////////////////
//	In case this function is not found in descendant
//////////////////////////////////////////////////////////////////////////////
boolean lb_temp
setnull (lb_temp)
return lb_temp
end function

public function long of_PageSetupDlg (ref s_pagesetupattrib astr_pagesetup);//////////////////////////////////////////////////////////////////////////////
// Public Function:		of_PageSetupDlg
//	Arguments:			astr_pagesetup -  page setup structure by ref
//	Returns: 				1 = success
//	 						0 = User cancelled from page setup dialog
//							-1 = error
//	Description:  		Opens the page setup dialog
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							5.0		Initial version
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
long	ll_rc

ll_rc = OpenWithParm (w_pagesetup, astr_pagesetup)
if ll_rc > 0 then
	astr_pagesetup = message.PowerObjectParm
	if not astr_pagesetup.b_actiontaken then
		ll_rc = 0
	end if
end if

return ll_rc
end function

public function integer of_playsound (string as_file);//////////////////////////////////////////////////////////////////////////////
//	In case this function is not found in descendant
//////////////////////////////////////////////////////////////////////////////
return -1
end function

public function integer of_PlaySound (string as_file, boolean ab_beeponfailure);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_PlaySound
//	Arguments: 			as_file - sound file to play
//							ab_beeponfailure - Play a beep if the requested sound fails.
//	Returns:  			integer
//	Description:  		Play a sound file
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							6.0		Initial version
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
Integer	li_rc

// Play the sound.
li_rc = of_playsound(as_file)

// Confirm that the sound was played succesfully.
If li_rc <= 0 Then
	// Play a default beep.
	beep(1)
End If

Return li_rc
end function

public function integer of_setfindwindowclasses (string as_classname[]);//////////////////////////////////////////////////////////////////////////////
//	Public Function: 	of_SetFindWindowClasses
//	Arguments: 			as_className[] - An array of window class names to be used by the service. 
//	Returns:  			Integer. Returns 1 if the function succeeds -1 if an error occurs.
//	Description: 		The function sets the class window class names to be used by the service.  of_FindWindow
//							will use all of the class names specified in the as_className array.
//							The defaults are PowerBuilder window class names - "FNWND390" and "FNWNS390".   
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							7.0		Initial version
//							8.0		Change PB window class names
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
long ll_idx, ll_upper

ll_upper = UpperBound(as_className)

IF ll_upper < 1 THEN return -1

FOR ll_idx = 1 TO ll_upper
	IF IsNull(as_className[ll_idx]) THEN 
		// Nulls are allowed as wildcards
		Continue
	END IF
	
	IF Len(as_className[ll_idx]) < 1 THEN 
		return -1
	END IF
NEXT

is_className = as_className
return 1
end function

public function integer of_getknownfolderpath (integer ai_foldercode, ref string as_folderpath);//////////////////////////////////////////////////////////////////////////////
//	In case this function is not found in descendant
//////////////////////////////////////////////////////////////////////////////
return -1
end function

public function integer of_getknownfolderpath (integer ai_foldercode, boolean ab_currentpath, ref string as_folderpath);//////////////////////////////////////////////////////////////////////////////
//	In case this function is not found in descendant
//////////////////////////////////////////////////////////////////////////////
return -1
end function

on pfc_n_cst_platform.create
call super::create
end on

on pfc_n_cst_platform.destroy
call super::destroy
end on


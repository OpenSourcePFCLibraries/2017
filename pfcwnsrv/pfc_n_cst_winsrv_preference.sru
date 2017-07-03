HA$PBExportHeader$pfc_n_cst_winsrv_preference.sru
$PBExportComments$PFC Window Preferences service
forward
global type pfc_n_cst_winsrv_preference from n_cst_winsrv
end type
end forward

global type pfc_n_cst_winsrv_preference from n_cst_winsrv
end type
global pfc_n_cst_winsrv_preference pfc_n_cst_winsrv_preference

type variables
Public:
constant	integer	CST_FILETYPE_REG	= 1
constant	integer	CST_FILETYPE_INI		= 2
constant	integer	CST_FILETYPE_XML	= 3

Protected:
boolean	ib_window=True
boolean	ib_menuitems=True
boolean	ib_toolbars=True
boolean	ib_toolbaritemvisible=True
boolean	ib_toolbaritemspace=True
boolean	ib_toolbaritemorder=True
boolean	ib_toolbartitles=True

//Store the NormalState Window Size and Position.
integer	ii_normalstate_x
integer	ii_normalstate_y
integer	ii_normalstate_width
integer	ii_normalstate_height
end variables

forward prototypes
public function integer of_save (string as_inifile, string as_inisection)
public function integer of_restore (string as_regkey)
public function integer of_save (string as_regkey)
protected function integer of_save (boolean ab_useregistry, string as_keyorini, string as_inisection)
public function integer of_settoolbaritemorder (boolean ab_switch)
public function integer of_SetToolbaritemspace (boolean ab_switch)
public function integer of_SetMenuItems (boolean ab_switch)
public function integer of_SetToolbars (boolean ab_switch)
public function integer of_SetWindow (boolean ab_switch)
public function boolean of_GetMenuItems ()
public function boolean of_GetToolbarItemOrder ()
public function boolean of_GetToolbarItemSpace ()
public function boolean of_gettoolbars ()
public function boolean of_GetWindow ()
public function boolean of_GetToolbarItemVisible ()
public function integer of_SetToolbarItemVisible (boolean ab_switch)
public function boolean of_GetToolbarTitles ()
public function integer of_SetToolbarTitles (boolean ab_switch)
protected function boolean of_restorepositivenumber (boolean ab_useregistry, string as_keyorini, string as_inisection, string as_key, ref integer ai_value)
protected function integer of_save (boolean ab_useregistry, string as_keyorini, string as_inisection, string as_subkey, string as_value)
protected function integer of_savemenu (boolean ab_useregistry, string as_keyorini, string as_inisection, menu am_source)
protected function integer of_restoremenu (boolean ab_useregistry, string as_keyorini, string as_inisection, menu am_source)
public function integer of_setpossize ()
public function integer of_restore (string as_inifile, string as_inisection)
protected function integer of_restore (boolean ab_useregistry, string as_keyorini, string as_inisection, string as_subkey, ref string as_value, string as_default)
protected function integer of_restore (boolean ab_useregistry, string as_keyorini, string as_inisection)
protected function integer of_save (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot, string as_subkeyelement, string as_value)
protected function integer of_restore (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot, string as_subkeyelement, ref string as_value, string as_default)
protected function integer of_restoremenu (integer ai_filetype, string as_keyoriniorxml, string as_inisectionorelement, menu am_source)
protected function boolean of_restorepositivenumber (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot, string as_keyelement, ref integer ai_value)
protected function integer of_savemenu (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot, menu am_source)
end prototypes

public function integer of_save (string as_inifile, string as_inisection);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Save
//
//	Access:  		public
//
//	Arguments:		
//	as_inifile		The name of the .INI file
//	as_inisection		The section name in the .INI file to save settings to.
//							This argument is used to identify which window's 
//							settings were saved.   (ex. - The window can be 
//							identified by its title or some other key)
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Saves the preference information to an .Ini file.
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

integer li_rc

//Check for a window association with this object.
If IsNull(iw_requestor) Or Not IsValid (iw_requestor) Then 
	Return -1
End If

li_rc =	of_Save (False, as_inifile, as_inisection)

Return li_rc

end function

public function integer of_restore (string as_regkey);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Restore
//
//	Access:  		public
//
//	Arguments:	
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

integer 		li_rc
window		lw_obj
n_cst_menu 	lnv_menu

//Check for a window association with this object.
If IsNull(iw_requestor) Or Not IsValid (iw_requestor) Then 
	Return -1
End If

//Prevent flickering of toolbars.
lnv_menu.of_GetMDIFrame(iw_requestor.MenuID, lw_obj)
If IsValid(lw_obj) Then	
	lw_obj.SetRedraw(False)
Else
	iw_requestor.SetRedraw(False)
End If

li_rc = of_Restore (True, as_regkey, '')

//Prevent flickering of toolbars.
If IsValid(lw_obj) Then	
	lw_obj.SetRedraw(True)
Else
	iw_requestor.SetRedraw(True)
End If

Return li_rc
end function

public function integer of_save (string as_regkey);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Save
//
//	Access:  		public
//
//	Arguments:		
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

integer li_rc

//Check for a window association with this object.
If IsNull(iw_requestor) Or Not IsValid (iw_requestor) Then 
	Return -1
End If

li_rc = of_Save(True, as_regkey, '')

Return li_rc

end function

protected function integer of_save (boolean ab_useregistry, string as_keyorini, string as_inisection);//////////////////////////////////////////////////////////////////////////////
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
//	5.0   Initial version
//	5.0.02 Check for an associated menu prior to saving menu preferences.
// 5.0.02 Save menu items that have pictures only when requested.
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

string				ls_tbindex
string				ls_title
integer				li_rc
integer				li_barindexarray[]
integer				li_upperbound
integer				li_cnt=0
integer				li_tbindex
integer				li_x, li_y, li_width, li_height
boolean				lb_visible
toolbaralignment	ltb_alignment
n_cst_menu			lnv_menu
n_cst_inifile		lnv_inifile
n_cst_conversion 	lnv_conversion

//Check for a window association with this object.
If IsNull(iw_requestor) Or Not IsValid (iw_requestor) Then 
	Return -1
End If

//Check arguments
If IsNull(ab_UseRegistry) or IsNull(as_KeyOrIni) Then
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

//Save window size and position
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, 'window.windowstate', &
	lnv_conversion.of_string(iw_requestor.WindowState))

//If the window is currently Maximized or Minimized then used the 
//stored Position/Size values.  If the window is currently Normal!
//then refresh the stored Position/Size values to ensure accurate data.
If iw_requestor.WindowState=Normal! Then of_SetPosSize()

//The X,Y,Width,&Height values are for the Normal State Window.
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
	'window.x', string(ii_normalstate_x))
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
	'window.y', string(ii_normalstate_y))
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
	'window.width', string(ii_normalstate_width))
li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
	'window.height', string(ii_normalstate_height))

//Check for a Menu on the window
If Not IsValid(iw_requestor.MenuId) or IsNull(iw_requestor.MenuId) Then
	//There is no menu associated on this window.  Processing
	//can end.
	Return 1
End If

//Check for toolbars
If Not lnv_menu.of_ToolBarExists (iw_requestor.MenuId) Then	
	//Toolbars do not exist. Processing can end.	
	Return 1 
End If

//Get handles to all the Toolbars
If lnv_menu.of_GetAllToolbarIndex (iw_requestor.MenuId, li_barindexarray) < 0 Then
	//Fatal error
	Return -1
End If

//Loop around all the toolbars		
li_upperbound = UpperBound(li_barindexarray[])
For li_cnt = 1 to li_upperbound
	li_tbindex = li_barindexarray[li_cnt]
	ls_tbindex = 'toolbarindex'+string(li_tbindex)
	
	//Get the GetToolbar information.
	If iw_requestor.GetToolbar (li_tbindex,lb_visible,ltb_alignment,ls_title) = 1 Then
		li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
					ls_tbindex+'.title', ls_title)
		li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
					ls_tbindex+'.visible', lnv_conversion.of_string(lb_visible))
		li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
					ls_tbindex+'.alignment', lnv_conversion.of_string(ltb_alignment))
	End If

	//Call the appropriate function for a Floating Toolbar.
	If ltb_alignment = Floating! Then
		If Not iw_requestor.GetToolbarPos &
			(li_tbindex, li_x, li_y, li_width, li_height) = 1 Then Continue
	Else
		If Not iw_requestor.GetToolbarPos &
			(li_tbindex, li_x, li_y) = 1 Then Continue
	End If

	//Save the Toolbar information.
	li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
		ls_tbindex+'.x', string(li_x))
	li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
		ls_tbindex+'.y', string(li_y))
	If ltb_alignment = Floating! Then
		li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
			ls_tbindex+'.width', string(li_width))
		li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
			ls_tbindex+'.height', string(li_height))
	End If
Next

//When requested, save menu items that have pictures.
If ib_menuitems Then
	If of_SaveMenu (ab_UseRegistry, as_KeyOrIni, as_IniSection, iw_requestor.MenuId) < 0 Then
		Return -1
	End If
End If

//Success return value
Return 1

end function

public function integer of_settoolbaritemorder (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetToolbarItemOrder
//
//	Access:  		public
//
//	Arguments:
//	ab_switch	   Mode of the service.
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Tells the service to restore or not to restore
//						the ToolbarItemOrder attribute on the menu items.
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

If IsNull(ab_switch) Then
	Return -1
End If

ib_toolbaritemorder = ab_switch
Return 1

end function

public function integer of_SetToolbaritemspace (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetToolbarItemSpace
//
//	Access:  		public
//
//	Arguments:
//	ab_switch	   Mode of the service.
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Tells the service to restore or not to restore
//						the ToolbarItemSpace attribute on the menu items.
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

If IsNull(ab_switch) Then
	Return -1
End If

ib_toolbaritemspace = ab_switch
Return 1

end function

public function integer of_SetMenuItems (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetMenuItems
//
//	Access:  		public
//
//	Arguments:
//	ab_switch	   Mode of the service.
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Tells the service to restore or not to restore
//						the attributes on the menu items.
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

If IsNull(ab_switch) Then
	Return -1
End If

ib_menuitems = ab_switch
Return 1

end function

public function integer of_SetToolbars (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetToolbars
//
//	Access:  		public
//
//	Arguments:
//	ab_switch	   Mode of the service.
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Tells the service to restore or not to restore
//						the attributes from the toolbars.
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

If IsNull(ab_switch) Then
	Return -1
End If

ib_toolbars = ab_switch
Return 1

end function

public function integer of_SetWindow (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetWindow
//
//	Access:  		public
//
//	Arguments:
//	ab_switch	   Mode of the service.
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Tells the service to restore or not to restore
//						the window attributes.
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

If IsNull(ab_switch) Then
	Return -1
End If

ib_window = ab_switch
Return 1

end function

public function boolean of_GetMenuItems ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetMenuItems
//
//	Access:  		public
//
//	Arguments:		none
//
//	Returns:  		boolean
//						True if the service will restore the attributes on the 
//								menu items.
//						
//	Description:  	Reports if the service is to restore the attributes on 
//						the menu items.
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

Return ib_menuitems

end function

public function boolean of_GetToolbarItemOrder ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetToolbarItemOrder
//
//	Access:  		public
//
//	Arguments:		none
//
//	Returns:  		boolean
//						True if the service will restore the Order attributes 
//							on the menu items.
//						
//	Description:  	Reports if the service is to restore the Order attributes
//						on the menu items.
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

Return ib_toolbaritemorder

end function

public function boolean of_GetToolbarItemSpace ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetToolbarItemSpace
//
//	Access:  		public
//
//	Arguments:		none
//
//	Returns:  		boolean
//						True if the service will restore the Space attribute 
//							on the menu items.
//						
//	Description:  	Reports if the service is to restore the Space attribute
//						on the menu items.
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

Return ib_toolbaritemspace

end function

public function boolean of_gettoolbars ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetToolbars
//
//	Access:  		public
//
//	Arguments:		none
//
//	Returns:  		boolean
//						True if the service will restore the toolbar attributes.
//						
//	Description:  	Reports if the service is to restore the toolbar attributes.
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

Return ib_toolbars

end function

public function boolean of_GetWindow ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetWindow
//
//	Access:  		public
//
//	Arguments:		none
//
//	Returns:  		boolean
//						True if the service will restore the window attributes.
//						
//	Description:  	Reports if the service is to restore the window attribues.
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

Return ib_window

end function

public function boolean of_GetToolbarItemVisible ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetToolbarItemVisible
//
//	Access:  		public
//
//	Arguments:		none
//
//	Returns:  		boolean
//						True if the service will restore the toolbaritemvisible
//							attribute on the menu items.
//						
//	Description:  	Reports if the service is to restore the toolbaritemvisible
//						attribute on the menu items.
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

Return ib_toolbaritemvisible

end function

public function integer of_SetToolbarItemVisible (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetToolbarItemVisible
//
//	Access:  		public
//
//	Arguments:
//	ab_switch	   Mode of the service.
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Tells the service to restore or not to restore
//						the ToolbarItemVisible attribute on the menu items.
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

If IsNull(ab_switch) Then
	Return -1
End If

ib_toolbaritemvisible = ab_switch
Return 1

end function

public function boolean of_GetToolbarTitles ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetToolbarTitles
//
//	Access:  		public
//
//	Arguments:		none
//
//	Returns:  		boolean
//						True if the service will restore the ToolbarTitles
//						
//	Description:  	Reports if the service is to restore the ToolbarTitles.
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

Return ib_toolbartitles

end function

public function integer of_SetToolbarTitles (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetToolbarTitles
//
//	Access:  		public
//
//	Arguments:
//	ab_switch	   Mode of the service.
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Tells the service to restore or not to restore
//						the ToolbarTitles.
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

If IsNull(ab_switch) Then
	Return -1
End If

ib_toolbartitles = ab_switch
Return 1

end function

protected function boolean of_restorepositivenumber (boolean ab_useregistry, string as_keyorini, string as_inisection, string as_key, ref integer ai_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RestorePositiveNumber
//
//	Access:  		protected
//
//	Arguments:
//	ab_UseRegistry	Function behavior. - use the registry or an .ini file.
//	as_KeyOrIni		The KeyName for use with the Registry or the IniFile name
//						for use with an .Ini file.
//	as_IniSection	The name of the .Ini section. 
//	as_key			The key value to be used on either the Registry or .Ini file.
//	ai_value			The value to be restored from either the Registry or .Ini file.
//							Passed by reference.
//
//	Returns:  		boolean
//						True if it got a positive number.
//						False if it did not get a positive number.
//
//	Description:  	Performs a get to the Registry or .Ini file. It then checks
//						and reports if it got a valid positive number.
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

string	ls_retvalue

//Initialize return value
ai_value = 1

If of_Restore (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
		as_key, ls_retvalue, '') = -1 Then 
	Return False
End If
	
If IsNumber(ls_retvalue) Then 
	ai_value = Integer(ls_retvalue)
Else
	Return False
End If
	
If ai_value <= 0 Then
	Return False
End If

Return True


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
//	as_SubKey			The key value to be used on either the Registry or .Ini file.
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

protected function integer of_savemenu (boolean ab_useregistry, string as_keyorini, string as_inisection, menu am_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SaveMenu
//
//	Access:  		protected
//
//	Arguments:
//	ab_UseRegistry	Function behavior. - use the registry or an .ini file.
//	as_KeyOrIni		The KeyName for use with the Registry or the IniFile name
//						for use with an .Ini file.
//	as_IniSection	The name of the .Ini section. 
//	am_Source		The menu that should be searched.
//
//	Returns:  		integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Recursively save all Menu items that have a pictures into
//						the registry.  Function will continue to save even if an
//						error is found.
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

integer				li_rc
integer				li_limit
integer				li_cnt
string				ls_item

//Check arguments
If Not IsValid(am_source) or IsNull(am_source) Then
	Return -1
End If

//Check If the menu item has a picture.
if Len (am_source.ToolbarItemName) > 0 then
	//Store all appropriate Menu item information.	
	ls_item = 'menuitem.'+am_source.ClassName()
	li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
		ls_item+'.toolbaritembarindex', string(am_source.ToolbarItemBarIndex))
	li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
		ls_item+'.toolbaritemorder', string(am_source.ToolbarItemOrder))
	li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
		ls_item+'.toolbaritemspace', string(am_source.ToolbarItemSpace))
	li_rc = of_Save (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
		ls_item+'.toolbaritemvisible', string(am_source.ToolbarItemVisible))
End If
	
//Search through the rest of the menu	
li_limit = UpperBound (am_source.item)
For li_cnt = 1 to li_limit
	of_SaveMenu (ab_UseRegistry, as_KeyOrIni, as_IniSection, am_Source.item[li_cnt])
Next

return 1

end function

protected function integer of_restoremenu (boolean ab_useregistry, string as_keyorini, string as_inisection, menu am_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RestoreMenu
//
//	Access:  		protected
//
//	Arguments:	
//	ab_UseRegistry	Function behavior. - use the registry or an .ini file.
//	as_KeyOrIni		The KeyName for use with the Registry or the IniFile name
//						for use with an .Ini file.
//	as_IniSection	The name of the .Ini section. 
//	am_source		The menu that should be restored.
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Recursively restore all Menu items from either the registry
//						or an .Ini file.
//						If a desired value is not found, then current value found
//						on the menu is left as it is.
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

integer				li_rc
integer				li_limit
integer				li_cnt
string				ls_item
string				ls_retvalue
boolean				lb_visible
n_cst_conversion 	lnv_conversion

//Check arguments
If Not IsValid(am_source) or IsNull(am_source) Then
	Return -1
End If

//Current entry
ls_item = 'menuitem.'+am_source.ClassName()

//Check if the menu item was stored
li_rc = of_Restore (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
			ls_item+'.toolbaritembarindex', ls_retvalue,'')
If Len(ls_retvalue) > 0 Then
	If IsNumber(ls_retvalue) Then
		am_source.ToolbarItemBarIndex = Integer(ls_retvalue)
	End If
	
	If ib_toolbaritemorder Then
		li_rc = of_Restore (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
				ls_item+'.toolbaritemorder', ls_retvalue, '')
		If IsNumber(ls_retvalue) Then 
			am_source.ToolbarItemOrder = Integer(ls_retvalue)
		End If
	End If
	
	If ib_toolbaritemspace Then
		li_rc = of_Restore (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
				ls_item+'.toolbaritemspace', ls_retvalue, '')
		If IsNumber(ls_retvalue) Then 
			am_source.ToolbarItemSpace = Integer(ls_retvalue)
		End If
	End If
	
	If ib_toolbaritemvisible Then
		li_rc = of_Restore (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
				ls_item+'.toolbaritemvisible', ls_retvalue,'')
		lb_visible = lnv_conversion.of_boolean(ls_retvalue)
		If Not IsNull(lb_visible) Then
			am_source.ToolbarItemVisible = lb_visible
		End If
	End If
End if

//Search through the rest of the menu	
li_limit = UpperBound (am_source.item)
For li_cnt = 1 to li_limit
	of_RestoreMenu (ab_UseRegistry, as_KeyOrIni, as_IniSection, am_Source.item[li_cnt])
Next

Return 1

end function

public function integer of_setpossize ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetPosSize
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		integer
//						 1 if it succeeds.
//						 0 if the WindowState is not Normal!.
//						-1 if an error occurs.
//						
//	Description:  	Store in the service the current Position and Size of Requestor.
//						This is needed so the service knows the Normal size of the 
//						Requestor even when the Requestor is closed as Maximized/Minimized.
//
//			*Note:	This function should be called from the resize and move events.
//						This function should only be called when the WindowState is
//						of type Normal!.
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

If IsNull(iw_requestor) Or Not IsValid (iw_requestor) Then 
	Return -1
End If

//Confirm that the WindowState is of type Normal!
If iw_requestor.WindowState = Normal! Then
	ii_normalstate_x = iw_requestor.X
	ii_normalstate_y = iw_requestor.Y
	ii_normalstate_width = iw_requestor.Width
	ii_normalstate_height = iw_requestor.Height
	Return 1
End If

Return 0

end function

public function integer of_restore (string as_inifile, string as_inisection);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Restore
//
//	Access:  		public
//
//	Arguments:		
//	as_inifile		The name of the .INI file to restore settings from
//	as_inisection	The section name in the .INI file to restore settings from
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Restores the preference information from an .Ini file.
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

integer 		li_rc
window		lw_obj
n_cst_menu 	lnv_menu

//Check for a window association with this object.
If IsNull(iw_requestor) Or Not IsValid (iw_requestor) Then 
	Return -1
End If

//Prevent flickering of toolbars.
lnv_menu.of_GetMDIFrame(iw_requestor.MenuID, lw_obj)
If IsValid(lw_obj) Then	
	lw_obj.SetRedraw(False)
Else
	iw_requestor.SetRedraw(False)
End If

li_rc = of_Restore(False, as_inifile, as_inisection)

//Prevent flickering of toolbars.
If IsValid(lw_obj) Then	
	lw_obj.SetRedraw(True)
Else
	iw_requestor.SetRedraw(True)
End If

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

protected function integer of_restore (boolean ab_useregistry, string as_keyorini, string as_inisection);//////////////////////////////////////////////////////////////////////////////
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
//	5.0    Initial version
//	5.0.02 Check for an associated menu prior to restoring menu preferences.
// 5.0.03 Check for the existance of the section.
// 7.0	 Add logic to restore the window state to maximized or normal
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

string				ls_title
string				ls_tbindex 
string				ls_visible
string				ls_alignment
string				ls_x, ls_y, ls_width, ls_height
string				ls_sections[], ls_regvalues[]
string				ls_windowstate
integer				li_tbindex 
integer				li_x, li_y, li_width, li_height
integer				li_rc = 1
integer				li_cnt
integer				li_upperbound
integer				li_barindexarray[]
boolean				lb_visible
boolean				lb_toolbarposition
boolean				lb_sectionfound=False
toolbaralignment	ltb_alignment
n_cst_menu			lnv_menu
n_cst_conversion	lnv_conversion
n_cst_inifile		lnv_ini

//Check for a window association with this object.
If IsNull(iw_requestor) Or Not IsValid (iw_requestor) Then 
	Return -1
End If

//Check arguments
If IsNull(ab_UseRegistry) or IsNull(as_KeyOrIni) Then
	Return -1
End If

//Validate specifics for either Registry or .Ini functionality.
If ab_UseRegistry Then
	//Check for the existance of the section.	
	RegistryValues(as_KeyOrIni, ls_regvalues)
	If UpperBound(ls_regvalues) <= 0 Then
		Return -1
	End If
Else
	//Check for the existance of the file.
	If Not FileExists(as_KeyOrIni) Then
		Return -1
	End If
	//Check the section parameter
	If IsNull(as_IniSection) or Len(Trim(as_IniSection))=0 Then
		Return -1
	End If
	//Check for the existance of the section.
	lnv_ini.of_GetSections(as_KeyOrIni, ls_sections)
	li_upperbound = UpperBound(ls_sections)
	For li_cnt = 1 to li_upperbound
		If Lower(Trim(as_IniSection)) = Lower(Trim(ls_sections[li_cnt])) Then
			lb_sectionfound = True
		End If
	Next
	If Not lb_sectionfound Then 
		Return -1
	End If
End If

If ib_window Then
	// Restore the window state
   li_rc = of_Restore (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
           'window.windowstate', ls_windowstate, 'normal')
   Choose Case ls_windowstate 
		Case 'maximized' 
			iw_requestor.windowstate = Maximized!
		Case Else
			iw_requestor.windowstate = Normal!
	End Choose
		
	If iw_requestor.WindowState = Normal! Then
		//Restore Normal State window position and size.
		li_rc = of_Restore (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
			'window.x', ls_x, '')
		li_rc = of_Restore (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
			'window.y', ls_y, '')
		li_rc = of_Restore (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
				'window.width', ls_width, '')
		li_rc = of_Restore (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
				'window.height', ls_height, '')		
		If IsNumber(ls_x) and IsNumber(ls_y) Then
			iw_requestor.Move(Integer(ls_x), Integer(ls_y))
		ElseIf IsNumber(ls_x) Then
			iw_requestor.x = Integer (ls_x)
		ElseIf IsNumber(ls_y) Then
			iw_requestor.y = Integer (ls_y)
		End If
		If iw_requestor.Resizable Then
			If IsNumber(ls_width) and IsNumber(ls_height) Then
				iw_requestor.Resize(Integer(ls_width), Integer(ls_height))
			ElseIf IsNumber(ls_width) Then
				iw_requestor.width = Integer (ls_width)	
			ElseIf IsNumber(ls_height) Then
				iw_requestor.height = Integer (ls_height)	
			End If
		End If
	End If
End If

If ib_menuitems Then
	//Restore menu items
	li_rc = of_RestoreMenu(ab_UseRegistry, as_KeyOrIni, as_IniSection, iw_requestor.MenuId)
End If

//Check if the last functionality in this script is requested.
If ib_toolbars=False Then
	//Finished restore process.		
	Return 1
End If

//Check for a Menu on the window
If Not IsValid(iw_requestor.MenuId) or IsNull(iw_requestor.MenuId) Then
	//There is no menu associated on this window.  Processing
	//can end.
	Return 1
End If

//Get handles to all the Toolbars.
If lnv_menu.of_GetAllToolbarIndex (iw_requestor.MenuId, li_barindexarray) < 0 Then
	Return -1  //Fatal error
End If

//Loop through all toolbars.
li_upperbound = UpperBound(li_barindexarray)
For li_cnt = 1 to li_upperbound
	//Get the Toolbar for this iteration
	li_tbindex = li_barindexarray[li_cnt]
	ls_tbindex = 'toolbarindex'+string(li_barindexarray[li_cnt])

	//Restore all SetToolbar information.
	li_rc = of_Restore (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
		ls_tbindex+'.title', ls_title, '')
	li_rc = of_Restore (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
		ls_tbindex+'.visible', ls_visible, 'true')
	li_rc = of_Restore (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
		ls_tbindex+'.alignment', ls_alignment, '')
	
	//Restore all SetToolbarPos information.
	//Only valid values for the toolbar position are numerical,
	//and greater than zero.
	lb_toolbarposition = True //Initialize to true.
	If Not of_RestorePositiveNumber (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
		ls_tbindex+'.x', li_x) Then lb_toolbarposition=False	
	If Not of_RestorePositiveNumber (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
		ls_tbindex+'.y', li_y) Then lb_toolbarposition=False
	If Lower(ls_alignment) = 'floating' Then
		If Not of_RestorePositiveNumber (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
			ls_tbindex+'.width', li_width) Then lb_toolbarposition=False
		If Not of_RestorePositiveNumber (ab_UseRegistry, as_KeyOrIni, as_IniSection, &
			ls_tbindex+'.height', li_height) Then lb_toolbarposition=False
	End If

	//Convert to the appropriate data types. (no validation at this time)
	lb_visible = lnv_conversion.of_boolean(ls_visible)
	li_rc = lnv_conversion.of_ToolbarAlignment(ls_alignment, ltb_alignment)
	
	//Validate Toolbars values. 
	If IsNull(lb_visible) Then lb_visible=True	
	If IsNull(ls_title) Then ls_title=''	
	If IsNull(ltb_alignment) or lb_toolbarposition=False Then 
		//There was a problem with one value; Force Toolbar to appear TopLeft!
		ltb_alignment = AlignAtLeft!
		li_x = 1
		li_y = 1
	End If
	
	//Restore Toolbar values
	If ib_toolbartitles Then
		li_rc = iw_requestor.SetToolbar(li_tbindex, lb_visible, ltb_alignment, ls_title)
	Else
		li_rc = iw_requestor.SetToolbar(li_tbindex, lb_visible, ltb_alignment)		
	End If
		
	//Call the appropriate function for a Floating or NonFloating Toolbar.
	If ltb_alignment = Floating! Then	
		li_rc = iw_requestor.SetToolbarPos(li_tbindex, li_x, li_y, li_width, li_height)
	Else
		li_rc = iw_requestor.SetToolbarPos (li_tbindex, li_x, li_y, False)
	End If
Next

Return 1
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

integer	li_rc =1

choose case ai_filetype
	case CST_FILETYPE_REG
		li_rc = RegistrySet (as_keyoriniorxml, as_subkeyElement, as_Value)
	
	case  CST_FILETYPE_INI
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

protected function integer of_restoremenu (integer ai_filetype, string as_keyoriniorxml, string as_inisectionorelement, menu am_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RestoreMenu
//
//	Access:  		protected
//
//	Arguments:	
//	ai_filetype					Function behavior. - use the registry, an .ini or .xml file.
//	as_KeyOrIniorXml			The KeyName for use with the Registry or the IniFile or XmlFile name
//									for use with an .Ini or .Xml file.
//	as_IniSectionXmlRoot		The name of the .Ini section or .Xml Root. 
//	am_source					The menu that should be restored.
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Recursively restore all Menu items from either the registry, an .Ini file
//						or .Xml File
//						If a desired value is not found, then current value found
//						on the menu is left as it is.
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
integer				li_limit
integer				li_cnt
string					ls_item
string					ls_retvalue
boolean				lb_visible
n_cst_conversion 	lnv_conversion

//Check arguments
If Not IsValid(am_source) or IsNull(am_source) Then
	Return -1
End If

//Current entry
ls_item = 'menuitem.'+am_source.ClassName()

//Check if the menu item was stored
li_rc = of_Restore (ai_filetype, as_keyoriniorXml, as_inisectionorelement, ls_item+'.toolbaritembarindex', ls_retvalue,'')
If Len(ls_retvalue) > 0 Then
	If IsNumber(ls_retvalue) Then
		am_source.ToolbarItemBarIndex = Integer(ls_retvalue)
	End If
	
	If ib_toolbaritemorder Then
		li_rc = of_Restore (ai_filetype, as_keyoriniorXml, as_inisectionorelement, ls_item+'.toolbaritemorder', ls_retvalue, '')
		If IsNumber(ls_retvalue) Then 
			am_source.ToolbarItemOrder = Integer(ls_retvalue)
		End If
	End If
	
	If ib_toolbaritemspace Then
		li_rc = of_Restore (ai_filetype, as_keyoriniorXml, as_inisectionorelement, ls_item+'.toolbaritemspace', ls_retvalue, '')
		If IsNumber(ls_retvalue) Then 
			am_source.ToolbarItemSpace = Integer(ls_retvalue)
		End If
	End If
	
	If ib_toolbaritemvisible Then
		li_rc = of_Restore (ai_filetype, as_keyoriniorXml, as_inisectionorelement, ls_item+'.toolbaritemvisible', ls_retvalue,'')
		lb_visible = lnv_conversion.of_boolean(ls_retvalue)
		If Not IsNull(lb_visible) Then
			am_source.ToolbarItemVisible = lb_visible
		End If
	End If
End if

//Search through the rest of the menu	
li_limit = UpperBound (am_source.item)
For li_cnt = 1 to li_limit
	of_RestoreMenu (ai_filetype, as_keyoriniorXml, as_inisectionorelement, am_Source.item[li_cnt])
Next

Return 1

end function

protected function boolean of_restorepositivenumber (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot, string as_keyelement, ref integer ai_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RestorePositiveNumber
//
//	Access:  		protected
//
//	Arguments:
//	ai_filetype				Function behavior. - use the registry, an .ini or .xml file.
//	as_inisectionxmlroot	The KeyName for use with the Registry or the IniFile name
//								for use with an .Ini file.
//	as_inisectionxmlroot	The name of the .Ini section. 
//	as_keyelement			The key value to be used on either the Registry or .Ini file.
//	ai_value					The value to be restored from either the Registry or .Ini file.
//								Passed by reference.
//
//	Returns:  		boolean
//						True if it got a positive number.
//						False if it did not get a positive number.
//
//	Description:  	Performs a get to the Registry, .Ini or .xml file. It then checks
//						and reports if it got a valid positive number.
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

string	ls_retvalue

//Initialize return value
ai_value = 1

If of_Restore (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, as_keyelement, ls_retvalue, '') = -1 Then 
	Return False
End If
	
If IsNumber(ls_retvalue) Then 
	ai_value = Integer(ls_retvalue)
Else
	Return False
End If
	
If ai_value <= 0 Then
	Return False
End If

Return True


end function

protected function integer of_savemenu (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot, menu am_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SaveMenu
//
//	Access:  		protected
//
//	Arguments:
//	ai_filetype				Function behavior. - use the registry, an .ini or .xml file.
//	as_keyoriniorxml		The KeyName for use with the Registry, the IniFile or XmlFile name
//								for use with an .Ini or .xml file.
//	as_inisectionxmlroot	The name of the .Ini section or Xml Root. 
//	am_Source				The menu that should be searched.
//
//	Returns:  		integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Recursively save all Menu items that have a pictures into
//						the registry.  Function will continue to save even if an
//						error is found.
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
integer				li_limit
integer				li_cnt
string				ls_item

//Check arguments
If Not IsValid(am_source) or IsNull(am_source) Then
	Return -1
End If

//Check If the menu item has a picture.
if Len (am_source.ToolbarItemName) > 0 then
	//Store all appropriate Menu item information.	
	ls_item = 'menuitem.'+am_source.ClassName()
	li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, ls_item+'.toolbaritembarindex', string(am_source.ToolbarItemBarIndex))
	li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, ls_item+'.toolbaritemorder', string(am_source.ToolbarItemOrder))
	li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, ls_item+'.toolbaritemspace', string(am_source.ToolbarItemSpace))
	li_rc = of_Save (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, ls_item+'.toolbaritemvisible', string(am_source.ToolbarItemVisible))
End If
	
//Search through the rest of the menu	
li_limit = UpperBound (am_source.item)
For li_cnt = 1 to li_limit
	of_SaveMenu (ai_filetype, as_keyoriniorxml, as_inisectionxmlroot, am_Source.item[li_cnt])
Next

return 1

end function

on pfc_n_cst_winsrv_preference.create
call super::create
end on

on pfc_n_cst_winsrv_preference.destroy
call super::destroy
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Object:  pfc_n_cst_winsrv_preference
//
//	Description:
//	Window's preference service.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version - Claudio J. Quant
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


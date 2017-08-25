HA$PBExportHeader$pfc_n_ds.sru
$PBExportComments$PFC DataStore class
forward
global type pfc_n_ds from datastore
end type
end forward

global type pfc_n_ds from datastore
event type boolean pfc_printpreview ( )
event type boolean pfc_ruler ( )
event type integer pfc_zoom ( )
event type integer pfc_printimmediate ( )
event type integer pfc_print ( )
event type integer pfc_pagesetup ( )
event type integer pfc_pagesetupdlg ( ref s_pagesetupattrib astr_pagesetup )
event pfc_prepagesetupdlg ( ref s_pagesetupattrib astr_pagesetup )
event type integer pfc_accepttext ( boolean ab_focusonerror )
event type integer pfc_updatespending ( )
event type integer pfc_validation ( )
event type integer pfc_update ( boolean ab_accepttext,  boolean ab_resetflag )
event type integer pfc_updateprep ( )
event type long pfc_retrieve ( )
event type integer pfc_postupdate ( )
event type integer pfc_resetupdate ( )
end type
global pfc_n_ds pfc_n_ds

type variables
Public :
// - Common return value constants:
constant integer 		SUCCESS = 1
constant integer 		FAILURE = -1
constant integer 		NO_ACTION = 0
// - Continue/Prevent return value constants:
constant integer 		CONTINUE_ACTION = 1
constant integer 		PREVENT_ACTION = 0
//constant integer 		FAILURE = -1

n_cst_dssrv		inv_base
n_cst_dssrv_multitable	inv_multitable
n_cst_dssrv_report		inv_report
n_cst_dssrv_printpreview	inv_printpreview
n_tr	itr_object

Protected :
boolean		ib_append
boolean		ib_isupdateable = True
boolean		ib_IsObsolete
string			is_updatesallowed='IUD'

window			iw_parentwindow
powerobject		ipo_parent
powerobject		ipo_updaterequestor
end variables

forward prototypes
public function integer of_settransobject (n_tr atr_object)
public function integer of_setbase (boolean ab_switch)
public function integer of_setappend (boolean ab_append)
public function boolean of_getappend ()
public function integer of_setupdateable (boolean ab_switch)
public function integer of_checkrequired (dwbuffer adw_buffer, ref long al_row, ref integer ai_col, ref string as_colname, boolean ab_updateonly)
public function integer of_setparentwindow (window aw_parent)
public function integer of_getparentwindow (ref window aw_parent)
public function integer of_setmultitable (boolean ab_switch)
public function integer of_setreport (boolean ab_switch)
public function integer of_setprintpreview (boolean ab_switch)
public function integer of_AcceptText (boolean ab_focusonerror)
public function integer of_setupdaterequestor (powerobject apo_updaterequestor)
public function integer of_update (boolean ab_accepttext, boolean ab_resetflag, powerobject apo_requestor)
public function integer of_updatespending ()
public function integer of_validation ()
public function integer of_update (boolean ab_accepttext, boolean ab_resetflag)
public function integer of_update (boolean ab_accepttext, boolean ab_resetflag, boolean ab_insert, boolean ab_update, boolean ab_delete)
public function integer of_updateprep ()
public function long of_retrieve ()
public function integer of_postupdate ()
public function boolean of_IsUpdateable ()
protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default)
public function integer of_setparent (powerobject apo_parent)
public function integer of_getparent (ref powerobject apo_parent)
end prototypes

event pfc_printpreview;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_printpreview
//
//	Arguments:  none
//
//	Returns:  boolean
//	true = Datastore is in printpreview
//	false = Datastore is in editmode
//
//	Description:	Toggles the Datastore in printpreview/edit mode
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

boolean	lb_rc

if IsValid (inv_printpreview) then
	lb_rc = inv_printpreview.of_GetEnabled()
	lb_rc = not lb_rc
	inv_printpreview.of_SetEnabled (lb_rc)
end if

return lb_rc
end event

event pfc_ruler;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_ruler
//
//	Arguments:  none
//
//	Returns:  boolean
//	true = Printpreview rulers are displayed
//	false = Printpreview rulers are not displayed
//
//	Description:	Toggles the ruler display in printpreview mode
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

boolean	lb_rc

if IsValid (inv_printpreview) then
	if inv_printpreview.of_GetEnabled() then
		lb_rc = inv_printpreview.of_GetRuler()
		lb_rc = not lb_rc
		inv_printpreview.of_SetRuler (lb_rc)
	end if
end if

return lb_rc
end event

event pfc_zoom;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_zoom
//
//	Arguments:  none
//
//	Returns:  integer
//	 zoom level chosen by the user
//	 0 = user cancelled from zoom dialog
//	-1 = error
//
//	Description:  Zooms the print preview level to the user-specified amount
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

if IsValid (inv_printpreview) then
	if inv_printpreview.of_GetEnabled() then
		return inv_printpreview.of_SetZoom()
	end if
else
	return -1
end if

return -1
end event

event pfc_printimmediate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_printimmediate
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:  Prints the Datastore (without displaying a print dialog)
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

return this.Print (true)
end event

event type integer pfc_print();//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_print
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Opens the print dialog to allow user to change print settings,
//	and then prints the DataWindow.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
// 8.0   Fix CR#261992  11/20/2001
// 10.0 Use new overloaded function ds.Print(canceldlg, showPrintDlg) which could display Print Dialog,
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
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
long		ll_selectedcount
long		ll_selectedrow
long		ll_selected[]
long		ll_cnt
string		ls_val
datastore				lds_selection

// Print selection
if this.object.datawindow.print.page.range = "selection" then
	// Get selected count
	do
		ll_selectedrow = this.GetSelectedRow (ll_selectedrow)
		if ll_selectedrow > 0 then
			ll_selectedcount++
			ll_selected[ll_selectedcount] = ll_selectedrow
		end if
	loop while ll_selectedrow > 0
	
	if ll_selectedcount > 0 then
		// Create a datastore to print selected rows
		lds_selection = create datastore
		lds_selection.dataobject = this.dataobject

		// First discard any data in the dataobject
		lds_selection.Reset()

		// Copy selected rows
		for ll_cnt = 1 to ll_selectedcount
			if this.RowsCopy (ll_selected[ll_cnt], ll_selected[ll_cnt], primary!, lds_selection, 2147483647, primary!) < 0 then
				return -1
			end if
		next
	end if
	
end if

// Print
if IsValid (lds_selection) then
	li_rc = lds_selection.Print (true, true)
	destroy lds_selection
else
	li_rc = this.Print (true, true)
end if

return li_rc
end event

event pfc_pagesetup;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  
//	pfc_pagesetup
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	 0 = user cancelled from pagesetup dialog
//	-1 = error
//
//	Description:
//	Opens the pagesetup dialog to allow user to change settings
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

s_pagesetupattrib	lstr_pagesetup

return this.event pfc_pagesetupdlg (lstr_pagesetup)



end event

event pfc_pagesetupdlg;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_pagesetupdlg
//
//	Arguments:
//	astr_pagesetup:  page setup structure by ref
//
//	Returns:  integer
//	 1 = success
//	 0 = user cancelled from page setup
//	-1 = error
//
//	Description:  
//	Opens the page setup dialog for this DataWindow, 
//	and sets the page setup values the user selected for the DW.
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

integer	li_margin
integer	li_papersize
integer	li_papersource
integer	li_units
string		ls_margin
string		ls_papersize
string		ls_papersource
string		ls_portraitorientation
string		ls_units
long		ll_rc
n_cst_platform	lnv_platform

// Initialize pagesetup structure with current values of DW
// Margin bottom
ls_margin = this.object.datawindow.print.margin.bottom
if not IsNumber (ls_margin) then
	ls_margin = "0"
end if
li_margin = Integer (ls_margin)
astr_pagesetup.i_marginbottom = li_margin

// Margin left
ls_margin = this.object.datawindow.print.margin.left
if not IsNumber (ls_margin) then
	ls_margin = "0"
end if
li_margin = Integer (ls_margin)
astr_pagesetup.i_marginleft = li_margin

// Margin right
ls_margin = this.object.datawindow.print.margin.right
if not IsNumber (ls_margin) then
	ls_margin = "0"
end if
li_margin = Integer (ls_margin)
astr_pagesetup.i_marginright = li_margin

// Margin top
ls_margin = this.object.datawindow.print.margin.top
if not IsNumber (ls_margin) then
	ls_margin = "0"
end if
li_margin = Integer (ls_margin)
astr_pagesetup.i_margintop = li_margin

// DataWindow units
ls_units = this.object.datawindow.units
if not IsNumber (ls_units) then
	ls_units = "0"
end if
li_units = Integer (ls_units)
if li_units < 2 then
	astr_pagesetup.b_disablemargins = true
end if
astr_pagesetup.i_units = li_units

// Paper Size
ls_papersize = this.object.datawindow.print.paper.size
if not IsNumber (ls_papersize) then
	ls_papersize = "0"
end if
li_papersize = Integer (ls_papersize)
astr_pagesetup.i_papersize = li_papersize

// Paper Source
ls_papersource = this.object.datawindow.print.paper.source
if not IsNumber (ls_papersource) then
	ls_papersource = "0"
end if
li_papersource = Integer (ls_papersource)
astr_pagesetup.i_papersource = li_papersource

// Orientation
ls_portraitorientation = this.object.datawindow.print.orientation
if ls_portraitorientation = "0" then
	SetNull (astr_pagesetup.b_portraitorientation)
elseif ls_portraitorientation = "2" then
	astr_pagesetup.b_portraitorientation = true
end if

// Allow pagesetup structure to have additional values
// set before opening print dialog
this.event pfc_prepagesetupdlg (astr_pagesetup)

// Open page setup dialog
f_setplatform (lnv_platform, true)
ll_rc = lnv_platform.of_PageSetupDlg (astr_pagesetup)
f_setplatform (lnv_platform, false)

// Set page setup values based on users selection
if ll_rc > 0 then
	// Margins
	this.object.datawindow.print.margin.bottom = astr_pagesetup.i_marginbottom
	this.object.datawindow.print.margin.left = astr_pagesetup.i_marginleft
	this.object.datawindow.print.margin.right = astr_pagesetup.i_marginright
	this.object.datawindow.print.margin.top = astr_pagesetup.i_margintop

	// Paper Size
	this.object.datawindow.print.paper.size = astr_pagesetup.i_papersize

	// Paper Source
	this.object.datawindow.print.paper.source = astr_pagesetup.i_papersource

	// Orientation
	if IsNull (astr_pagesetup.b_portraitorientation) then
		this.object.datawindow.print.orientation = 0
	elseif not astr_pagesetup.b_portraitorientation then
		this.object.datawindow.print.orientation = 1
	elseif astr_pagesetup.b_portraitorientation then
		this.object.datawindow.print.orientation = 2
	end if
end if

return ll_rc

end event

event type integer pfc_accepttext(boolean ab_focusonerror);//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_accepttext
//
//	Arguments:
//	ab_focusonerror Disregarded parameter.
//
//	Returns:  Integer
//	 1 = success
//	-1 = error
//	
//	Description:	 
//	Perform an accepttext.
//
//	Note:
//	In most cases, since users cannot enter data into a datastore, the
//	accepttext operation should not be allowed to fail by the developer.
//	Since a datastore is a nonvisual object, the accepttext does not
//	generate fail messages.
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

integer 	li_rc
string	ls_message
string	ls_msgparm[2]
boolean	lb_skipmessage
window	lw_parent
w_master	lw_pfcparent

// Perform AcceptText, check rc
li_rc = this.AcceptText()
If li_rc < 0 Then 

	// Get a reference to the window
	this.of_GetParentWindow (lw_parent) 
	if IsValid (lw_parent) then
		if lw_parent.TriggerEvent ("pfc_descendant") = 1 then
			lw_pfcparent = lw_parent
		end if
	end if
	
	// Make sure the window is not closing.  
	if IsValid (lw_pfcparent) then
		if lw_pfcparent.of_GetCloseStatus() then
			// It is closing, so don't show errors now.	
			lb_skipmessage = True
		end if
	end if
		
	// Determine if the message should be displayed.
	If Not lb_skipmessage Then
		// Get the column information for the message.
		ls_msgparm[1] = this.GetColumnName()
		ls_msgparm[2] = string(this.GetRow())

		If IsValid(gnv_app) Then
			If IsValid(gnv_app.inv_error) Then
				gnv_app.inv_error.of_Message ('pfc_dsaccepttext', ls_msgparm, &
							gnv_app.iapp_object.DisplayName)					
			Else
				ls_message = "Failed accepttext validation on datastore.  "+&
								 "Column "+ ls_msgparm[1] + &
								 " on row "+ ls_msgparm[2] + "."
				of_Messagebox ("pfc_acceptext_failedvalidation", gnv_app.iapp_object.DisplayName, &
					ls_message, Exclamation!, Ok!, 1)
			End If
		Else
			of_Messagebox ("pfc_acceptext_failedvalidation", "", &
				ls_message, Exclamation!, Ok!, 1)
		End If
	End If
	
	Return -1
End If
	
Return 1
end event

event pfc_updatespending;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_UpdatesPending
//
//	Arguments:  none
//
//	Returns:  integer
//	1 = Updates are pending.
//	0 = No updates are pending
//
//	Description:
//	Determine if any updates are pending on this datastore.
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

// Check if DataStore is updateable
if not of_IsUpdateable() then
	return 0
end if

// Check for any updates that may be pending
if this.ModifiedCount() + this.DeletedCount() > 0 then
	li_rc = 1
end if

// There are no updates pending on this DataStore.
return li_rc

end event

event pfc_validation;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_validation
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = All validation passed
//	-1 = validation failed
//
//	Description:
//	Validate the DataStore.
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

integer	li_checkcolumn = 1
integer	li_rc
long		ll_checkrow = 1
string	ls_checkcolname = ''
boolean	ib_updateonly = true

// Check for Missing Required Fields
li_rc = of_CheckRequired (primary!, ll_checkrow, li_checkcolumn, ls_checkcolname, ib_updateonly)
if (li_rc < 0) or (ll_checkrow > 0) then return -1
				
// No errors found
return 1
end event

event pfc_update;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_update
//
//	Arguments:  
//	ab_accepttext	When applicable, specifying whether control should perform an
//						AcceptText prior to performing the update:
//	ab_resetflag	Value specifying whether object should automatically 
//						reset its update flags.
//
//	Returns: Integer
//	 1 = The update was successful
//	-1 = The update failed
//
//	Description:  	Specific Update logic. 
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

// Verify passed arguments.
IF IsNull(ab_accepttext) Or IsNull(ab_resetflag) Then Return -1 

if isValid (inv_multitable) then
	li_rc = inv_multitable.of_update (ab_accepttext, ab_resetflag)
else
	li_rc = this.Update(ab_accepttext, ab_resetflag)	
end if

Return li_rc
end event

event pfc_updateprep;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_UpdatePrep
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Update Preparation for the DataStore.
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

// No errors found
Return 1
end event

event pfc_retrieve;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_retrieve
//
//	Arguments:  none
//
//	Returns:  long
//	The return code from the Retrieve Powerscript function
//	 0 = No rows returned from successful retrieve
//	-1 = Retrieve was unsuccessful
//	>0 = The number of rows returned from the retrieve)
//
//	Description:  
//	Specific retrieve logic should be coded in descendant scripts
//
//	Note: 
//	This event might not be used at all.  It all depends how the datastore object
//	is being	used.
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

Return 0
end event

event pfc_postupdate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_postupdate
//
//	Arguments:  None
//
//	Returns:  1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//	
//	Description:	
//	Perform post update process.
//	Clear the update flags in the DataStore.
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

Return this.Event pfc_resetupdate()
end event

event pfc_resetupdate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_resetupdate
//
//	Arguments:  None
//
//	Returns:  1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//	
//	Description:	
//	Clear the update flags in the DataStore.
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

Return this.ResetUpdate( )
end event

public function integer of_settransobject (n_tr atr_object);//////////////////////////////////////////////////////////////////////////////
//

//	Function:  of_SetTransObject
//
//	Access:  public
//
//	Arguments:
//	atr_object:  transaction object to set for the datastore
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets the transaction object that the datastore will use
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

// Check arguments
if IsNull (atr_object) or not IsValid (atr_object) then
	return -1
end if

// Set the transaction object
li_rc = this.SetTransObject (atr_object)
if li_rc = 1 then
	itr_object = atr_object
end if

return li_rc
end function

public function integer of_setbase (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetBase
//
//	Access:  public
//
//	Arguments:
//	ab_switch:  whether an instance of the base datastore service is enabled/disabled
//
//	Returns:  integer
//	 1 = success
//	 0 = no action taken
//	-1 = error
//
//	Description:
//	Enables/disables an instance of the base datastore service
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.04   Return 0 if no action is taken
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
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
	IF IsNull(inv_base) Or Not IsValid (inv_base) THEN
		inv_base = Create n_cst_dssrv
		inv_base.of_SetRequestor ( this )
		Return 1
	END IF
ELSE 
	IF IsValid (inv_base) THEN
		Destroy inv_base
		Return 1
	END IF	
END IF

Return 0
end function

public function integer of_setappend (boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetAppend
//
//	Access:  public
//
//	Arguments:
//	ab_append:  whether data will be appended to existing data when retrieving
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets the behavior for retrieval so that data appends or is replaced
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
if IsNull (ab_append) then
	return -1
end if

ib_append = ab_append
return 1
end function

public function boolean of_getappend ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetAppend
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  boolean
//
//	Description:
//	Returns whether data is appended to existing data when retrieving
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

return ib_append
end function

public function integer of_setupdateable (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetUpdateable
//
//	Access:  Public
//
//	Arguments:
//	ab_switch   Indicates whether the DataStore is updateable
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets whether the DataStore is updateable
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

// Check arguments
if IsNull (ab_switch) then
	return -1
end if

ib_isupdateable =  ab_switch
return 1
end function

public function integer of_checkrequired (dwbuffer adw_buffer, ref long al_row, ref integer ai_col, ref string as_colname, boolean ab_updateonly);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_CheckRequired 
//
//	Access:  Public
//
//	Arguments:
//	adw_buffer   The buffer to check for required fields
// al_row   First row to be checked.  Also stores the number of the found row
//	ai_col   First column to be checked.  Also stores the number of the found column
//	as_colname   Contains the columnname in error
//
//	Returns:  integer
//	 1 = The required fields test was successful, check arguments for required fields missing
//	 0 = The required fields test was successful and no errors were found
//  -1 = The FindRequired failed
//
//	Description:
//	Calls the FindRequired function to determine if any of the required
//	columns contain null values.
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
w_master	lw_pfcparent
window	lw_parent
boolean	lb_skipmessage=False
string	ls_msgparm[2]


// Check arguments
if IsNull (adw_buffer) or IsNull (al_row) or IsNull (ai_col) or IsNull (as_colname) then
	return -1
end if

SetPointer(HourGlass!) 

// Call FindRequired to locate first error, if any
if this.FindRequired (adw_buffer, al_row, ai_col, as_colname, ab_updateonly) < 0 then
	return -1
end if

// Check if an error was found.
if al_row <> 0 then

	// Get a reference to the window
	this.of_GetParentWindow (lw_parent) 
	if IsValid (lw_parent) then
		if lw_parent.TriggerEvent ("pfc_descendant") = 1 then
			lw_pfcparent = lw_parent
		end if
	end if	
		
	// Make sure the window is not closing.  
	if IsValid (lw_pfcparent) then
		if lw_pfcparent.of_GetCloseStatus() then
			// It is closing, so don't show errors now.	
			lb_skipmessage = True
		end if
	end if
	
	If Not lb_skipmessage Then
		If IsValid(gnv_app) Then				
			If IsValid(gnv_app.inv_error) Then
				ls_msgparm[1] = as_colname
				ls_msgparm[2] = String (al_row)
				gnv_app.inv_error.of_Message('pfc_requiredmissingondatastore', ls_msgparm, &
						gnv_app.iapp_object.DisplayName)
			Else
				of_MessageBox ("pfc_checkrequired_missingvalue", gnv_app.iapp_object.DisplayName, &
					"Required DataStore value missing for " + as_colname + " on row "  + &
					String (al_row) + ".", information!, Ok!, 1)
			End If
		Else
			of_MessageBox ("pfc_checkrequired_missingvalue", "", &
				"Required DataStore value missing for " + as_colname + " on row "  + &
				String (al_row) + ".", information!, Ok!, 1)
		End If
	End If
	
	return 1
end if

return 0
end function

public function integer of_setparentwindow (window aw_parent);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetParentWindow
//
//	Access:  public
//
//	Arguments:
//	aw_parent   The Parent window for this Dynamically created object.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:	Sets the Parent window for this Dynamically created object.
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

// Validate the argument.
If IsNull(aw_parent) or Not IsValid(aw_parent) Then
	Return -1
End If

iw_parentwindow = aw_parent
Return 1
end function

public function integer of_getparentwindow (ref window aw_parent);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetParentWindow
//
//	Access:  public
//
//	Arguments:
//	aw_parent   The Parent window for this Dynamically created object. (by reference)
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:	Gets the Parent window for this Dynamically created object.
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

window lw_notvalid

// Check if the parentwindow reference is still valid.
If IsValid(iw_parentwindow) Then
	// Return the parent window.
	aw_parent = iw_parentwindow
	Return 1
End If

// There is no valid parent to return.
If IsValid(gnv_app) Then				
	If IsValid(gnv_app.inv_debug) Then				
		of_MessageBox ("pfc_getparentwindow_debug", "PowerBuilder Class Library", &
			"For certain functionality the " + &
			"PFC DataStore requires a reference to its parent window. " + &
			"One of these cases has been encountered.  To let the Datastore "+&
			"know who its parent window call the of_SetParentWindow(...) "+&
			"function after the DataStore creation.", &
			Exclamation!, Ok!, 1)
	End If
End If

aw_parent = lw_notvalid
Return -1
end function

public function integer of_setmultitable (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Event:  of_SetMultitable
//
//	(Arguments: boolean
//   TRUE  - Start (create) the service
//   FALSE - Stop (destroy ) the service
//
//	Returns:  		Integer
//						 1 - Successful operation.
//						 0 - No action taken.
//						-1 - An error was encountered.
//
//	Description:  Starts or stops the Multi-Table Update Services.  This service
//				     facilitates updating datastores where multiple SQL tables 
//				     are used.
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
	IF IsNull(inv_MultiTable) Or Not IsValid (inv_MultiTable) THEN
		inv_MultiTable = Create n_cst_dssrv_multitable
		inv_MultiTable.of_setRequestor ( this )
		Return 1
	END IF
ELSE 
	IF IsValid (inv_MultiTable) THEN
		Destroy inv_MultiTable
		Return 1
	END IF	
END IF

Return 0
end function

public function integer of_setreport (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Event:  of_SetReport
//
//	(Arguments: boolean
//   TRUE  - Start (create) the service
//   FALSE - Stop (destroy ) the service
//
//	Returns:  		Integer
//						 1 - Successful operation.
//						 0 - No action taken.
//						-1 - An error was encountered.
//
//	Description:  Starts or stops the Reporting Services.  The Reporting Services
//				     provide the ability to dynamically change the appearance of 
//				     datawindows.
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
	IF IsNull(inv_Report) Or Not IsValid (inv_Report) THEN
		inv_Report = Create n_cst_dssrv_report
		inv_Report.of_setRequestor(This)
		Return 1
	END IF
ELSE
	IF IsValid (inv_Report) THEN
		Destroy inv_Report
		Return 1
	END IF	
END IF

Return 0
end function

public function integer of_setprintpreview (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Event:  of_SetPrintPreview
//
//	Arguments:  ab_switch
//   TRUE  - Start (create) the service
//   FALSE - Stop (destroy ) the service
//
//	Returns:  		Integer
//						 1 - Successful operation.
//						 0 - No action taken.
//						-1 - An error was encountered.
//
//	Description:  
//	Starts or stops the printpreview service.
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
	IF IsNull(inv_printpreview) Or Not IsValid (inv_printpreview) THEN
		inv_printpreview = Create n_cst_dssrv_printpreview
		inv_printpreview.of_setRequestor ( this )
		Return 1
	END IF
ELSE 
	IF IsValid (inv_printpreview) THEN
		Destroy inv_printpreview
		Return 1
	END IF	
END IF

Return 0
end function

public function integer of_AcceptText (boolean ab_focusonerror);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_AcceptText
//
//	Arguments:  
//	ab_focusonerror	States if focus should be set in case of error.
//
//	Returns:  Integer
//	1 if it succeeds 
//	-1 if an error occurs.
//	
//	Description:
//	Perform an accepttext and set focus when requested.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

return this.Event pfc_AcceptText(ab_focusonerror)

end function

public function integer of_setupdaterequestor (powerobject apo_updaterequestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_SetUpdateRequestor
//
//	Access:    
//	Public
//
//	Arguments:
// apo_updaterequestor   The object which is requesting an update within a 
//			transaction.  Or an invalid reference to clear the reference.
//
//	Returns:  Integer
//	1 for success
//	-1 for error.
//
//	Description:  
//	Associates the object which is requesting an update within a transaction.
//	Or clears the reference to mean there is no current object requesting an
//	update within a transaction.
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

// Checking for a valid apo_updaterequestor is not desired.

ipo_updaterequestor = apo_updaterequestor
Return 1
end function

public function integer of_update (boolean ab_accepttext, boolean ab_resetflag, powerobject apo_requestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_Update
//
//	Arguments:  
//	ab_accepttext	When applicable, specifying whether control should perform an
//						AcceptText prior to performing the update:
//	ab_resetflag	Value specifying whether object should automatically 
//						reset its update flags.
//	apo_requestor	An object requesting the update within a transaction.
//
//	Returns: Integer
//	 1 = The update was successful
//	-1 = The update failed
//
//	Description:  	
//	Request Update logic while also setting the requestor object.
//
// Note:
//	Specific Update logic should be coded in pfc_Update event.
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

Integer li_rc
Powerobject lpo_notvalid

// Set the object requesting the update.
If this.of_SetUpdateRequestor(apo_requestor) <0 Then Return -1
	
// Perform the actual update.	
li_rc = this.of_Update(ab_accepttext, ab_resetflag)
	
// Clear the object which requested the update.
this.of_SetUpdateRequestor(lpo_notvalid)

Return li_rc
end function

public function integer of_updatespending ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_UpdatesPending
//
//	Arguments:  none
//
//	Returns:  integer
//	1 = Updates are pending.
//	0 = No updates are pending
//
//	Description:
//	Determine if any updates are pending on this datastore.
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

Return this.Event pfc_UpdatesPending()
end function

public function integer of_validation ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_Validation
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = All validation passed
//	-1 = validation failed
//
//	Description:
//	Validate the DataStore
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

Return this.Event pfc_Validation()

end function

public function integer of_update (boolean ab_accepttext, boolean ab_resetflag);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_Update
//
//	Arguments:  
//	ab_accepttext	When applicable, specifying whether control should perform an
//						AcceptText prior to performing the update:
//	ab_resetflag	Value specifying whether object should automatically 
//						reset its update flags.
//
//	Returns: Integer
//	 1 = The update was successful
//	-1 = The update failed
//
//	Description:  	
//	Request the Update logic.  
//
// Note:
//	Specific Update logic should be coded in pfc_Update event.
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

Integer li_rc
	
// Perform the actual update.	
li_rc = this.Event pfc_Update(ab_accepttext, ab_resetflag)
	
Return li_rc
end function

public function integer of_update (boolean ab_accepttext, boolean ab_resetflag, boolean ab_insert, boolean ab_update, boolean ab_delete);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_Update
//
//	Arguments:  
//	ab_accepttext	Value specifying whether the DataWindow control should perform an
//						AcceptText prior to performing the update:
//	ab_resetflag	Value specifying whether DWControl should automatically 
//						reset the update flags.
//	ab_insert		Boolean stating if Inserts should be performed.
//	ab_update		Boolean stating if Updates should be performed.
//	ab_delete		Boolean stating if Deletes should be performed.
//
//	Returns: Integer
//	 1 = The update was successful
//	-1 = The update failed
//
//	Description:  	
//	Perform the Specific Update logic, but only perform the requested
//	SQL (insert, update, delete) statements.
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

// Verify passed arguments.
IF IsNull(ab_accepttext) Or IsNull(ab_resetflag) &
	Or IsNull(ab_insert) Or IsNull(ab_update) Or IsNull(ab_delete) Then 
	Return -1 
End If

// Set the variable which determines which updates are allowed.
is_updatesallowed = ''
If ab_insert Then is_updatesallowed += 'I'
If ab_update Then is_updatesallowed += 'U'
If ab_delete Then is_updatesallowed += 'D'

// Perform the update.
li_rc = this.Event pfc_update (ab_accepttext, ab_resetflag)

// Reset the variable which determines which updates are allowed.
is_updatesallowed = "IUD"

Return li_rc
end function

public function integer of_updateprep ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_UpdatePrep
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = All preparation passed
//	-1 = preparation failed
//
//	Description:
//	Prepare the DataStore
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

Return this.Event pfc_UpdatePrep()
end function

public function long of_retrieve ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_Retrieve
//
//	Arguments:  none
//
//	Returns:  long
//	The return code from the Retrieve Powerscript function
//	 0 = No rows returned from successful retrieve
//	-1 = Retrieve was unsuccessful
//	>1 = Success.
//
//	Description:  
// Execute the specific Retrieve logic.
//
// Note:
//	This event might not be used at all.  It all depends how the datastore object
//	is being	used.  If used, Specific retrieve logic should be coded in 
//	descendant pfc_Retrieve event.
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

Return this.Event pfc_Retrieve()

end function

public function integer of_postupdate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_PostUpdate
//
//	Arguments:  None
//
//	Returns:  Integer
//	1 if it succeeds 
//$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//	
//	Description:	
//	Clear the update flags in the DataStore.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0	Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Return this.Event pfc_PostUpdate()

end function

public function boolean of_IsUpdateable ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_IsUpdateable
//
//	Access:  Public
//
//	Arguments:	None
//	ab_switch   Indicates whether the DataStore is updateable
//
//	Returns:  Boolean
//	 True = DataStore is updateable.
//	 False1 = DataStore is Not updateable.
//
//	Description:
//	Reports whether the DataStore is updateable.
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

return ib_isupdateable
end function

protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  			of_MessageBox
//
//	Access:  			protected
//
//	Arguments:
//	as_id			An ID for the Message.
//	as_title  	Text for title bar
//	as_text		Text for the actual message.
//	ae_icon 		The icon you want to display on the MessageBox.
//	ae_button	Set of CommandButtons you want to display on the MessageBox.
//	ai_default  The default button.
//
//	Returns:  integer
//	Return value of the MessageBox.
//
//	Description:
//	Display a PowerScript MessageBox.  
//	Allow PFC MessageBoxes to be manipulated prior to their actual display.
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

Return MessageBox(as_title, as_text, ae_icon, ae_button, ai_default)
end function

public function integer of_setparent (powerobject apo_parent);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetParent
//
//	Access:  public
//
//	Arguments:
//	apo_parent   The Parent Object for this Dynamically created object.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:	Sets the Parent for this Dynamically created object.
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

// Validate the argument.
If IsNull(apo_parent) or Not IsValid(apo_parent) Then
	Return -1
End If

ipo_parent = apo_parent
Return 1
end function

public function integer of_getparent (ref powerobject apo_parent);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetParentWindow
//
//	Access:  public
//
//	Arguments:
//	apo_parent (by ref) The Parent for this Dynamically created object.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:	Gets the Parent  for this Dynamically created object.
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

powerobject lpo_notvalid

// Check if the parentwindow reference is still valid.
If IsValid(ipo_parent) Then
	// Return the parent window.
	apo_parent = ipo_parent
	Return 1
End If

// There is no valid parent to return.
If IsValid(gnv_app) Then				
	If IsValid(gnv_app.inv_debug) Then				
		of_MessageBox ("pfc_getparent_debug", "PowerBuilder Class Library", &
			"For certain functionality the " + &
			"PFC DataStore requires a reference to its parent object. " + &
			"One of these cases has been encountered.  To let the Datastore "+&
			"know who its parent window call the of_SetParent(...) "+&
			"function after the DataStore creation.", &
			Exclamation!, Ok!, 1)
	End If
End If

apo_parent = lpo_notvalid
Return -1
end function

event retrievestart;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  retrievestart
//
//	Description:
//	Determine if retrieved data should be appended to the existing data,
//	or if the existing data should be reset prior to retrieval.
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

long	ll_rc

if ib_append then
	ll_rc = 2
end if
	
return ll_rc

end event

on pfc_n_ds.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_ds.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Destructor
//
//	Description:
//	Destroy any instantiated datastore services for this object
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

of_setBase (false)
of_setPrintPreview (false)
of_setReport (false)
of_setMultitable (false)

end event

event sqlpreview;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  SQLPreview
//
//	Description:  Allow for SQLSpy service
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0 	Only perform the requested SQL (insert, update, delete) statements.
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

integer					li_rc
string 					ls_sqlsyntax
sqlpreviewfunction	l_request 	
sqlpreviewtype			l_sqltype		
dwbuffer					l_buffer			

//Check the arguments.
If IsNull(sqltype) or IsNull(sqlsyntax) or IsNull(buffer) Then
	//There is nothing to process.
	Return
End If

// Only perform the requested SQL (insert, update, delete) statements.
If (sqltype = PreviewSelect!) Or &
	(sqltype = PreviewInsert! And Pos(is_updatesallowed,'I')>0) Or &
	(sqltype = PreviewUpdate! And Pos(is_updatesallowed,'U')>0) Or &
	(sqltype = PreviewDelete! And Pos(is_updatesallowed,'D')>0) Then
	// Allow the continuation of the SQL statament.	
Else
	// Stop this SQL statement from being executed.
	// Return 2 - Skip this request and execute the next request.
	Return 2
End If

//If available trigger the SQLSpy service.
If IsValid(gnv_app) Then
	If IsValid(gnv_app.inv_debug) Then
		If IsValid(gnv_app.inv_debug.inv_sqlspy) Then
	
			ls_sqlsyntax = sqlsyntax
			l_request = request
			l_sqltype = sqltype
			l_buffer = buffer
	
			//Send the information to the service for processing.
			li_rc = gnv_app.inv_debug.inv_sqlspy.of_sqlpreview &
				(this.ClassName(), l_request, l_sqltype, ls_sqlsyntax, l_buffer, row)
			If li_rc = 1 or li_rc = 2 Then
				// 1 Stop processing of all entries.
				// 2 Skip this request and execute the next request.
				Return li_rc
			Else
				// Normal processing.
				If ls_sqlsyntax <> sqlsyntax Then
					//The sqlsyntax was inspected and changed by the user.
					//Update the SQL to the new syntax.
					If this.SetSQLPreview (ls_sqlsyntax) = 1 Then 
						Return
					Else
						// An error was encountered on the Modified SQLStatement
						of_Messagebox ('pfc_sqlpreview_error', 'SQLSpy on SQLPreview', &
							'An error was encountered with the following SQL:~r~n~r~n'+ &
							ls_sqlsyntax, Information!, Ok!, 1)
					End If				
				End If
			End If
			
		End If
	End If
End If

end event

event dberror;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  dberror
//
//	Description:
//	Display messagebox that a database error has occurred.
// If appropriate delay displaying the database error until the appropriate
// Rollback has been performed.
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

w_master	lw_parent
boolean 	lb_pfcsaveprocess=False
string	ls_message
string	ls_msgparm[1]
string	ls_sqlspyheading
string	ls_sqlspymessage
powerobject lpo_updaterequestor
n_cst_dberrorattrib lnv_dberrorattrib

// Construct the error message.
ls_message = "A database error has occurred.~r~n~r~n~r~n" + &
	"Database error code:  " + String (sqldbcode) + "~r~n~r~n" + &
	"Database error message:~r~n" + sqlerrtext

// Set the error attributes.
lnv_dberrorattrib.il_sqldbcode = sqldbcode
lnv_dberrorattrib.is_sqlerrtext = sqlerrtext
lnv_dberrorattrib.is_sqlsyntax = sqlsyntax
lnv_dberrorattrib.idwb_buffer = buffer
lnv_dberrorattrib.il_row = row
lnv_dberrorattrib.is_errormsg = ls_message
lnv_dberrorattrib.ipo_inerror = this

//If available trigger the SQLSpy service.
If IsValid(gnv_app) Then
	If IsValid(gnv_app.inv_debug) Then
		If IsValid(gnv_app.inv_debug.inv_sqlspy) Then
	
			//Create the heading and message for the SQLSpy.
			ls_sqlspyheading = 'DBError - ' + this.ClassName() + '(' + string(row) + ')'
			ls_sqlspymessage = "Database error code:  " + String (sqldbcode) + "~r~n" + &
				"Database error message:  " + sqlerrtext
			
			//Send the information to the service for processing.
			gnv_app.inv_debug.inv_sqlspy.of_sqlSyntax  &
				(ls_sqlspyheading, '/*** ' + ls_sqlspymessage + ' ***/')
		End If
	End If
End If


// Determine if Transaction Management is being performed by another object.
If IsValid(ipo_updaterequestor) Then
	lpo_updaterequestor = ipo_updaterequestor
Else
	// Determine if the window is in the save process. 
	This.of_GetParentWindow(lw_parent)
	If IsValid(lw_parent) Then
		If lw_parent.TriggerEvent ("pfc_descendant") = 1 Then	
			If lw_parent.of_GetSaveStatus() Then
				lpo_updaterequestor = lw_parent
			End If
		End If
	End If
End If

If IsValid(lpo_updaterequestor) Then
	// Suppress the error message (let the UpdateRequestor display it).
	// MetaClass check, Dynamic Function Call.
	lpo_updaterequestor.Dynamic Function of_SetDBErrorMsg(lnv_dberrorattrib)
Else
	// Display the message immediately.
	If IsValid(gnv_app) Then
		If IsValid(gnv_app.inv_error) Then
			ls_msgparm[1] = ls_message
			gnv_app.inv_error.of_Message ('pfc_dwdberror', ls_msgparm, &
						gnv_app.iapp_object.DisplayName)
		Else
			of_Messagebox ("pfc_dberror", gnv_app.iapp_object.DisplayName, &
				ls_message, StopSign!, Ok!, 1)
		End If
	Else
		of_Messagebox ("pfc_dberror", "", &
			ls_message, StopSign!, Ok!, 1)
	End If
End If

return 1




end event

event retrieveend;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  RetrieveEnd
//
//	Description:  Allow for SQLSpy service
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

string 	ls_sqlspyheading
string	ls_sqlspymessage

//If available trigger the SQLSpy service.
If IsValid(gnv_app) Then
	If IsValid(gnv_app.inv_debug) Then
		If IsValid(gnv_app.inv_debug.inv_sqlspy) Then
	
			//Create the heading and message for the SQLSpy.
			ls_sqlspyheading = 'RetrieveEnd - ' + this.ClassName() 
			ls_sqlspymessage = "Rows Retrieved = "+ string(rowcount)
			
			//Send the information to the service for processing.
			gnv_app.inv_debug.inv_sqlspy.of_sqlSyntax  &
				(ls_sqlspyheading, '/*** ' + ls_sqlspymessage + ' ***/')
			
		End If
	End If
End If

end event


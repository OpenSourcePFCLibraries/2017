HA$PBExportHeader$pfc_w_master.srw
$PBExportComments$PFC Master Window class
forward
global type pfc_w_master from window
end type
end forward

global type pfc_w_master from window
integer x = 466
integer y = 372
integer width = 2670
integer height = 1724
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
event pfc_controlgotfocus ( dragobject adrg_control )
event pfc_preopen ( )
event type integer pfc_messagerouter ( string as_message )
event pfc_new ( )
event pfc_open ( )
event pfc_postopen ( )
event move pbm_move
event type integer pfc_help ( )
event type integer pfc_print ( )
event type integer pfc_printimmediate ( )
event type integer pfc_pagesetup ( )
event type integer pfc_preclose ( )
event type integer pfc_preupdate ( )
event type integer pfc_updatespending ( powerobject apo_control[] )
event type integer pfc_update ( powerobject apo_control[] )
event type integer pfc_postupdate ( powerobject apo_control[] )
event type integer pfc_save ( )
event type integer pfc_begintran ( )
event type integer pfc_endtran ( integer ai_update_results )
event type integer pfc_validation ( powerobject apo_control[] )
event type integer pfc_accepttext ( powerobject apo_control[],  boolean ab_focusonerror )
event pfc_microhelp ( string as_microhelp )
event pfc_close ( )
event pfc_saveas ( )
event type boolean pfc_descendant ( )
event pfc_dberror ( )
event type integer pfc_saveobjects ( powerobject apo_control[] )
event type integer pfc_mruclicked ( )
event type integer pfc_mrurestore ( )
event type integer pfc_mrusave ( )
event type integer pfc_mruprocess ( integer ai_row )
event type integer pfc_premrusave ( ref n_cst_mruattrib anv_mruattrib )
event type integer pfc_updateprep ( powerobject apo_control[] )
event type integer pfc_updateobjects ( powerobject apo_control[],  boolean ab_accepttext,  boolean ab_resetflag )
event type integer pfc_updatespendingref ( powerobject apo_control[],  ref powerobject apo_pending[] )
event pfc_preprint ( )
event pfc_postprint ( )
end type
global pfc_w_master pfc_w_master

type variables
Public:
// - Common return value constants:
constant integer 		SUCCESS = 1
constant integer 		FAILURE = -1
constant integer 		NO_ACTION = 0
// - Continue/Prevent return value constants:
constant integer 		CONTINUE_ACTION = 1
constant integer 		PREVENT_ACTION = 0
//constant integer 		FAILURE = -1

n_cst_winsrv					inv_base
n_cst_winsrv_preference		inv_preference
n_cst_resize						inv_resize
n_cst_winsrv_style				inv_style

Protected:
any			ia_helptypeid
u_dw			idw_active

// Logical Unit of Work -  SelfUpdatingObject - Save Process - (Attributes).
boolean			ib_isupdateable = True
boolean			ib_disableclosequery
boolean			ib_alwaysvalidate	// Save process flag to include all objects in validation process.
boolean			ib_closestatus
boolean			ib_savestatus
string			is_dberrormsg  	// Obsoleted in 6.0.
n_cst_dberrorattrib 		inv_dberrorattrib  	// Replaces Obsoleted is_dberrormsg.
powerobject		ipo_updaterequestor
powerobject		ipo_pendingupdates[]
powerobject		ipo_updateobjects[]
powerobject		ipo_tempupdateobjects[]
n_cst_luw		inv_luw

boolean		ib_IsObsolete
end variables

forward prototypes
public function boolean of_getclosestatus ()
public function integer of_setresize (boolean ab_switch)
public function integer of_setbase (boolean ab_switch)
public function integer of_setpreference (boolean ab_switch)
protected function integer of_getdwtype (datawindow adw_dw)
protected function integer of_updatechecks ()
public function boolean of_GetSaveStatus ()
public function integer of_setdberrormsg (string as_msg)
protected function integer of_updatechecks (powerobject apo_control[])
public function integer of_setlogicalunitofwork (boolean ab_switch)
protected function integer of_getupdateobjects (ref powerobject apo_objects[])
protected function integer of_setupdateobjects (powerobject apo_objects[])
protected function integer of_setalwaysvalidate (boolean ab_switch)
protected function boolean of_isalwaysvalidate ()
public function integer of_accepttext (boolean ab_focusonerror)
public function integer of_updatespending ()
public function integer of_validation ()
public function integer of_updateprep ()
public function integer of_update (boolean ab_accepttext, boolean ab_resetflag, powerobject apo_requestor)
public function integer of_postupdate ()
protected function integer of_setupdateable (boolean ab_switch)
protected function boolean of_isupdateable ()
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
protected function integer of_setupdaterequestor (powerobject apo_updaterequestor)
public function integer of_update (boolean ab_accepttext, boolean ab_resetflag)
protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default)
public function integer of_setdberrormsg (n_cst_dberrorattrib anv_dberrorattrib)
public function integer of_setstyle (boolean ab_switch)
end prototypes

event pfc_controlgotfocus;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_controlgotfocus
//
//	Arguments:
//	adrg_control   Control which just got focus
//
//	Returns:  none
//
//	Description:
//	Keeps track of last active DataWindow
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

If adrg_control.TypeOf() = DataWindow! Then
	If adrg_control.TriggerEvent ("pfc_descendant") = 1 Then
		idw_active = adrg_control
	End If
End If
end event

event pfc_messagerouter;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_messagerouter
//
//	Arguments:
//	as_message   message (event notification) to send
//
//	Returns:  integer
//	 1 = message successfully sent
//	 0 = no receivers recognized the message
//	-1 = error
//
//	Description:	 
//	This event routes a message (event notification) 
//	to the appropriate object.
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

graphicobject lgo_focus

// Check argument
If IsNull (as_message) or Len (Trim (as_message)) = 0 Then
	Return -1
End If

// Try sending the message to this window, if successful exit event.
If This.TriggerEvent (as_message) = 1 Then Return 1

// Try sending the message to the current control, if successful exit event.
lgo_focus = GetFocus()
If IsValid (lgo_focus) Then
	If lgo_focus.TriggerEvent (as_message) = 1 Then Return 1
End If

// Try sending the message to the last active datawindow, if successful exit event.
If IsValid (idw_active) Then
	If idw_active.TriggerEvent (as_message) = 1 Then Return 1
End If

// No objects recognized the message
Return 0
end event

event move;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  move
//
//	Description:
//	Send move notification to services
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

// Store the position and size on the preference service.
// With this information the service knows the normal size of the 
// window even when the window is closed as maximized/minimized.
If IsValid (inv_preference) And This.windowstate = normal! Then
	inv_preference.Post of_SetPosSize()
End If
end event

event pfc_help;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_help
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	 0 = helpfile property of the application manager not specified
//	-1 = error
//
//	Description:
//	Call the windows help file associated with the application.
//	Uses the HelpType property of this window to determine what help
//	to display.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 7.0 	If help type id is not specified open the top-level contents topic.
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

Long		ll_helptypeid
String	ls_helpfile
String	ls_helptypeid

ls_helpfile = gnv_app.of_GetHelpFile()
If Len (Trim (ls_helpfile)) > 0 Then
	If Lower (ClassName (ia_helptypeid)) = 'long' Then
		ll_helptypeid = ia_helptypeid
		Return ShowHelp (ls_helpfile, Topic! , ll_helptypeid)
	ElseIf Lower (ClassName (ia_helptypeid)) = 'string' Then
		ls_helptypeid = ia_helptypeid
		Return ShowHelp (ls_helpfile, Keyword!, ls_helptypeid)
	Else
		Return ShowHelp (ls_helpfile, Index!)
	End If
End If

If IsValid(gnv_app.inv_debug) Then		
	of_MessageBox ("pfc_master_helpdebug", "PowerBuilder Class Library", "Help has been requested but the"+&
					" Required Help File Name has Not been Set.  Use of_SetHelpFile"+&
					" on The Application Manager to Set The attribute.", &
					Exclamation!, OK!, 1)
End If
				
Return 0
end event

event type integer pfc_print();//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_print
//
//	Arguments:	None	
//
//	Returns:  integer
//	 1 = success
//	 0 = nothing done
//	-1 = error
//
//	Description:
//	Extends this event at descendant level in order to print windows content.
//  Extends pfc_preprint() event at descendant level to implement pre printing process
//  Extends pfc_postprint() event at descendant level  to implements post printing process.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
// 5.0 	Initial version	
// 12.5 	Add pre & post print process handling.
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

// Allow for pre and post print events to occur
This.Event pfc_preprint()
This.Post Event pfc_postprint()

return 0
end event

event type integer pfc_printimmediate();//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_printimmediate
//
//	Arguments:	None	
//
//	Returns:  integer
//	 1 = success
//	 0 = nothing done
//	-1 = error
//
//	Description:
//	Extends this event at descendant level in order to print immediately windows content.
//  Extends pfc_preprint() event at descendant level to implement pre printing process
//  Extends pfc_postprint() event at descendant level  to implements post printing process.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
// 5.0 	Initial version	
// 12.5 	Add pre & post print process handling.
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

// Allow for pre and post print events to occur
This.Event pfc_preprint()
This.Post Event pfc_postprint()

return 0
end event

event pfc_preclose;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PreClose
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = The pfc_preclose process was successful, continue with closequery
//	-1 = The pfc_preclose process failed, do not allow window to close
//
//	Description:	Used to perform any user-defined process prior to the closequery.
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

Return 1 
end event

event pfc_preupdate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_preupdate
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	-1 = fail, do not continue with the save process
//
//	Description:
//	Perform any user-defined processing prior to saving
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Redirected to the Logical Unit of Work Service.
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

// Let Logical Unit of Work Service perform the functionality (create if necessary).
If IsNull(inv_luw) Or Not IsValid (inv_luw) Then of_SetLogicalUnitofWork(True)
If IsValid(inv_luw) Then
	Return inv_luw.of_PreUpdate()
End If

Return -1
end event

event pfc_updatespending;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_UpdatesPending
//
//	Arguments:
//	apo_control  array of controls to check for any updates pending
//
//	Returns:  integer
//	 1 = updates are pending (no errors found)
//	 0 = No updates pending (no errors found)
//	-1 = error
//
//	Description:
//	Check for any unsaved objects in the specified array and store
//	references in inv_pendingupdates.
//
// Note:
//	This event stores the objects with updates pending in inv_pendingupdates.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Corrected variable information which allowed the new upperbound for 
//		ipo_pendingupdates to be off due to the recursive nature of the event. 
// 6.0	Redirected to the simulated Event Overloading.
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

Integer	li_rc
PowerObject lpo_pending[]

li_rc = this.Event pfc_updatespendingref(apo_control, lpo_pending)
ipo_pendingupdates = lpo_pending // *Set* the instance ipo_pendingupdates
Return li_rc

end event

event pfc_update;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_Update
//
//	Arguments:
//	apo_control   Array of controls that need to be updated
//
//	Returns:   integer
//	 1 = all updates successful
//	-1 = At least one update failed
//
//	Description:
//	Updates the specified array of controls
//
//	Note:
//	This function will update objects in the order in which they are found in
//	the array.  The linked datawindows are updated according to linkage service
// information.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Redirected to pfc_updateobjects.
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

Return this.Event pfc_updateobjects(apo_control, True, False)
end event

event pfc_postupdate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  
//	pfc_postupdate
//
//	Arguments:  none
//
//	Returns:  integer 
//	 1 = success
//	-1 = fail
//
//	Description:
//	Perform Post Update process. 
//	i.e. Reset the datawindow update flags on a successful save.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Redirected to the Logical Unit of Work Service.
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

// Make sure there is something to take action on.
If UpperBound(apo_control) = 0 Then Return NO_ACTION

// Let Logical Unit of Work Service perform the functionality (create if necessary).
If IsNull(inv_luw) Or Not IsValid (inv_luw) Then of_SetLogicalUnitofWork(True)
If IsValid(inv_luw) THen
	Return inv_luw.of_PostUpdate(apo_control)
End If

Return -1
end event

event pfc_save;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_save
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	 0 = No pending changes found 
//	-1 = AcceptText error
//	-2 = UpdatesPending error was encountered
//	-3 = Validation error was encountered
// -9 = The pfc_updateprep process failed
//	-4 = The pfc_preupdate process failed
//	-5 = The pfc_begintran process failed
//	-6 = The pfc_update process failed
//	-7 = The pfc_endtran process failed
//	-8 = The pfc_postsave process failed
//
//	Description:
//	Performs a save operation on the window.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Prevent datawindow dberror messages from appearing while the window
// 		PFC_Save is in progress.
// 6.0	Enhanced to allow updates of specific objects.
// 6.0	Enhanced for pfc_updateprep process.
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

Integer		li_rc
Integer		li_save_rc
Integer		li_endtran_rc
powerobject lpo_updatearray[]

// Check if the CloseQuery process is in progress
If Not ib_closestatus Then
	
	// Determine the objects for which an update will be attempted.
	// For the pfc_save, the order sequence is as follows: 
	//		1) Specified one time sequence (thru pfc_saveobjects event).
	//		2) Specified permananent sequence (thru of_SetUpdateObjects(...)).
	//		3) None was specified, so use default window control array.
	If UpperBound(ipo_tempupdateobjects) > 0 Then
		lpo_updatearray = ipo_tempupdateobjects
	ElseIf UpperBound(ipo_updateobjects) > 0 Then
		lpo_updatearray = ipo_updateobjects
	Else
		lpo_updatearray = This.Control		
	End If
	
	// Perform the Update Checks to determine if there are any updates 
	// pending and if they pass the standard validation
	li_rc = of_UpdateChecks(lpo_updatearray)
	If li_rc <= 0 Then 
		//	 0 = No pending changes found 
		//	-1 = AcceptText error
		//	-2 = UpdatesPending error was encountered
		//	-3 = Validation error was encountered		
		Return li_rc
	End If
End If

// Perform the Update Preparation process.
If This.Event pfc_UpdatePrep(ipo_pendingupdates) <> 1 Then Return -9

// Perform the preupdate process.
If This.Event pfc_PreUpdate() <> 1 Then Return -4

// Begin the transaction.
If This.Event pfc_BeginTran() <> 1 Then Return -5

// Prevent datawindow dberror messages from appearing while PFC_Save 
// updates are in progress. 
ib_savestatus = True

// Update the changed objects.
li_save_rc = This.Event pfc_Update (ipo_pendingupdates) 

// PFC_Save Updates are no longer in progress.
ib_savestatus = False


// Perform the endtransaction process
li_endtran_rc = This.Event pfc_EndTran(li_save_rc) 

// If appropriate, display dberror message.
If li_save_rc<=0 Then This.Event pfc_dberror()

// Check for a successful save before performing any post operation.
If li_save_rc <> 1 Then Return -6

// Check for a successful end transaction before performing any post operation.
If li_endtran_rc <> 1 Then Return -7

// Perform the postupdate process.
If This.Event pfc_PostUpdate(ipo_pendingupdates) <> 1 Then Return -8

Return 1
end event

event pfc_begintran;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_BeginTran
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = The begin transaction was successful
//	-1 = error
//
//	Description:
//	Perform begin transaction processing.
//
//	Note: Developer you should supply feedback to user (messageboxes) 
// based on the failure of the action.
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

Return 1
end event

event pfc_endtran;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_endtran
//
//	Arguments:		
//	ai_update_results   the return code of the Update that occurred
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Perform end-of-transaction processing, such as commits / rollbacks
//	based on the success of the update which occurred.
//
//	Note: Developer may need to supply feedback to user (messageboxes) 
// based on the success/failure of the update.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Suppress datawindow error messages until after a rollback has 
// 	been performed. 	
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

Return 1
end event

event pfc_validation;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  
//	pfc_validation
//
//	Arguments:		
//	apo_control   Array of controls that need validation.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Perform validation for specified powerobject array.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Redirected to the Logical Unit of Work Service.
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

// Let Logical Unit of Work Service perform the functionality (create if necessary).
If IsNull(inv_luw) Or Not IsValid (inv_luw) Then of_SetLogicalUnitofWork(True)
If IsValid(inv_luw) THen
	Return inv_luw.of_Validation(apo_control)
End If

Return -1
end event

event pfc_accepttext;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  
//	pfc_AcceptText
//
//	Arguments:
//	apo_control   Array of controls to check for accepttext
//	ab_focusonerror   Should focus be set to object in error
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Perform an AcceptText on all objects found on the specified array.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Do not perform AcceptText on Datawidows found on uncreated tab pages.
// 6.0	Redirected to the Logical Unit of Work Service.
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

If IsNull(ab_focusonerror) Then Return -1

// Make sure there is something to take action on.
If UpperBound(apo_control) = 0 Then Return NO_ACTION

// Let Logical Unit of Work Service perform the functionality (create if necessary).
If IsNull(inv_luw) Or Not IsValid (inv_luw) Then of_SetLogicalUnitofWork(True)
If IsValid(inv_luw) THen
	Return inv_luw.of_AcceptText(apo_control[], ab_focusonerror)
End If

Return -1
end event

event pfc_microhelp;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_microhelp
//
//	Arguments:
//	as_microhelp   microhelp which should be displayed
//
//	Returns:  none
//
//	Description:
//	Display specified microhelp
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
end event

event pfc_close;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_close
//
//	Arguments:  none
//
//	Returns:  none
//
//	Description:
//	Close the window
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

Close (this)
end event

event pfc_descendant;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_descendant
//
//	Arguments:   none
//
//	Returns:  boolean
//
//	Description:
//	Always returns true and is used to determine that this
//	class is part of the PowerBuilder Foundation Class Library.
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

Return True
end event

event pfc_dberror;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_dberror
//
//	Arguments:	None	
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Display the dberror that was encountered during the pfc_save process.
//
// Note: Triggered by the pfc_save when the update failed, after the appropriate
//		end transaction process (which if appropriate should include rollback process)
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
// 5.0.02 Initial version	
// 6.0 	Enhanced to use dberrorattrib.
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

string	ls_msgparm[1]
n_cst_dberrorattrib lnv_dberrorattrib

// Get the error message.  First check on the dberrorattrib.  If not found there,
// get it from is_dberrormsg (backward compatibility code).
If IsValid(inv_dberrorattrib) Then
	If Len(Trim(inv_dberrorattrib.is_errormsg)) > 0 Then
		ls_msgparm[1] = inv_dberrorattrib.is_errormsg
	Else
		ls_msgparm[1] = is_dberrormsg
	End If
Else
	ls_msgparm[1] = is_dberrormsg
End If

// Display the error message (it was suppressed until after the end transaction process).
If IsValid(gnv_app.inv_error) Then
	gnv_app.inv_error.of_Message ('pfc_dwdberror', ls_msgparm, &
				gnv_app.iapp_object.DisplayName)				
Else
	of_Messagebox ('pfc_master_dwdberror', gnv_app.iapp_object.DisplayName, &
		ls_msgparm[1], StopSign!, Ok!, 1)
End If

// Clear the error message variable.
of_SetDBErrorMsg(lnv_dberrorattrib)
end event

event pfc_saveobjects;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_saveobjects
//
//	Arguments:  
//	  apo_control[] The array of objects that should be saved.
//
//	Returns:  integer
//	 1 = success
//	 0 = No pending changes found 
//	-1 = AcceptText error
//	-2 = UpdatesPending error was encountered
//	-3 = Validation error was encountered
//	-4 = The pfc_preupdate process failed
//	-5 = The pfc_begintran process failed
//	-6 = The pfc_update process failed
//	-7 = The pfc_endtran process failed
//	-8 = The pfc_postsave process failed
//
//	Description:
//	Performs a save operation for the specified objects.
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
powerobject lpo_empty[]

// Initialize array holding the objects that need to be updated.
ipo_tempupdateobjects = apo_control

// Perform the actual update(s).
li_rc = this.Event pfc_save()

// Clear array holding the objects that were just updated.
ipo_tempupdateobjects = lpo_empty

Return li_rc
end event

event pfc_mruclicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_mruclicked
//
//	Arguments:	None
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Triggered when MRU memu item is selected.  Checks for existence of menu item
// in datastore and triggers pfc_mruprocess event if menu item found
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
integer		li_row
string		ls_menutext 

// check parameters 
ls_menutext = message.stringparm
if isnull(ls_menutext) or ls_menutext = "" then
	return -1
end if 

if isvalid(gnv_app.inv_mru) then
	// determine if item selected is within our mru list
	li_row = gnv_app.inv_mru.of_finditem(ls_menutext, 0)
	if li_row > 0 then
		return this.event pfc_mruprocess(li_row)
	end if
end if

Return -1
end event

event pfc_mrurestore;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_mrurestore
//
//	Arguments:	none
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Allow MRU service to restore settings
//
//	Extend this event to restore MRU information for the ID
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
//string	ls_id
//
//// Allow MRU service to restore settings if necessary
//If IsValid(gnv_app.inv_mru) Then
//	Return gnv_app.inv_mru.of_Restore( ls_id, This ) 
//End If

Return -1
end event

event pfc_mrusave;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_mrusave
//
//	Arguments:	none
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
// 	Save the MRU key information to the service
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
n_cst_mruattrib	lnv_mruattrib

// add information to mru nvo service
If IsValid(gnv_app.inv_mru) Then

	// execute user defined save logic
	this.event pfc_premrusave( lnv_mruattrib )
	
	// id must be registered with mru service first 
	if gnv_app.inv_mru.of_IsRegistered(lnv_mruattrib.is_id) then
		Return gnv_app.inv_mru.of_additem(lnv_mruattrib)
	else
		Return -1
	end if
	
end if

return -1

end event

event pfc_mruprocess;//////////////////////////////////////////////////////////////////////////////
// 
//	Event:		pfc_mruprocess
//
//	Arguments:
//	ai_row	row in datastore containing our clicked menu item
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Perform the process needed when a user clicks on an MRU item in the menu.  
// The developer will have to extend this event to do the necessary opens for 
// the type of application being used (MDI or SDI)
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
//window	lw_frame, lw_window
//n_cst_menu	lnv_menu	
//n_cst_mruattrib	lnv_mruattrib
//
//// check parameters
//if isnull(ai_row) or (ai_row < 1) then
//	return -1
//end if
//
//if not isvalid(gnv_app.inv_mru) or IsNull(gnv_app.inv_mru) then
//	return -1
//end if
//
//// retrieve row from datastore and do some work with it
//gnv_app.inv_mru.of_getitem(ai_row, lnv_mruattrib)
//
//// get the mdi frame if necessary
//lnv_menu.of_getmdiframe(this.menuid, lw_frame)
//
////example opens
//// SDI Process
//// open(lw_window, lnv_mruattrib.is_classname)
//// openwithparm(lw_window, lnv_mruattrib.is_menuitemkey, lnv_mruattrib.is_classname)
//// MDI Process
//// opensheet(lw_window, lnv_mruattrib.is_classname, lw_frame)
//// opensheet(lw_window, lnv_mruattrib.is_classname, lw_frame, 0, original!)
// opensheetwithparm(lw_window, lnv_mruattrib.is_menuitemkey, lnv_mruattrib.is_classname, lw_frame, 0, original! )
//
return -1

end event

event pfc_premrusave;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_premrusave
//
//	Arguments:	anv_mruattrib - MRU attributes to populate for save
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
// Extend this event and put in the logic to make a key which your application
// can recognize and reconvert in the pfc_mruprocess event to open the closing window.
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

////all these values must be populated
//anv_mruattrib.is_id = this.classname()
//anv_mruattrib.is_classname = this.classname()
//anv_mruattrib.is_menuitemname = this.title
//anv_mruattrib.is_menuitemkey = this.classname()
//anv_mruattrib.is_menuitemmhelp = "Opens " + this.classname()

return -1


end event

event pfc_updateprep;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  
//	pfc_updateprep
//
//	Arguments:		
//	apo_control   Array of controls that may need preparation.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Perform update preparation for specified powerobject array.
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

// Make sure there is something to take action on.
If UpperBound(apo_control) = 0 Then Return NO_ACTION

// Let Logical Unit of Work Service perform the functionality (create if necessary).
If IsNull(inv_luw) Or Not IsValid (inv_luw) Then of_SetLogicalUnitofWork(True)
If IsValid(inv_luw) THen
	Return inv_luw.of_UpdatePrep(apo_control)
End If

Return -1
end event

event pfc_updateobjects;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_Update2
//
//	Arguments:
//	apo_control   Array of controls that need to be updated
//	ab_accepttext	When applicable, specifying whether control should perform an
//						AcceptText prior to performing the update:
//	ab_resetflag	Value specifying whether object should automatically 
//						reset its update flags.
//
//	Returns:   integer
//	 1 = all updates successful
//  0 = No action taken
//	-1 = At least one update failed
//
//	Description:
//	Updates the specified array of controls
//
//	Note:
//	This function will update objects in the order in which they are found in
//	the array.  The linked datawindows are updated according to linkage service
// information.
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

// Validate arguments.
If IsNull(ab_accepttext) or IsNull(ab_resetflag) Then Return -1

// Make sure there is something to take action on.
If UpperBound(apo_control) = 0 Then Return NO_ACTION
If Not of_IsUpdateable() Then Return NO_ACTION

// Let Logical Unit of Work Service perform the functionality (create if necessary).
If IsNull(inv_luw) Or Not IsValid (inv_luw) Then of_SetLogicalUnitofWork(True)
If IsValid(inv_luw) THen
	Return inv_luw.of_Update(apo_control, ab_accepttext, ab_resetflag)
End If

Return -1
end event

event pfc_updatespendingref;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_UpdatesPendingRef
//
//	Arguments:	
//	apo_control[]	The controls on which to perform functionality.
//	apo_pending[] (by ref) The controls which have updates pending.
//
//	Returns:  integer
//	 1 = updates are pending (no errors found)
//	 0 = No updates pending (no errors found)
//	-1 = error
//
//	Description:
//	Request the Logical Unit of Work service to determine which objects have
//	UpdatesPending. 
//
// Note:
//	Simulated Event overloading.
//	This event does NOT store the objects with updates pending in inv_pendingupdates.
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

constant integer NO_UPDATESPENDING =0
Integer	li_rc
PowerObject lpo_empty[]
PowerObject lpo_pending[]
powerobject lpo_updatearray[]

// Clear the pending by reference array.
apo_pending = lpo_empty

// Make sure there is something to take action on.
If UpperBound(apo_control) = 0 Then Return NO_UPDATESPENDING
If Not of_IsUpdateable() Then Return NO_UPDATESPENDING

// Let Logical Unit of Work Service perform the functionality (create if necessary).
If IsNull(inv_luw) Or Not IsValid (inv_luw) Then of_SetLogicalUnitofWork(True)
If IsValid(inv_luw) Then
	li_rc = inv_luw.of_UpdatesPending(apo_control, lpo_pending)
	apo_pending = lpo_pending
	If li_rc > 0 Then li_rc = 1
	Return li_rc
End If

Return -1
end event

event pfc_preprint();//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PrePrint
//
//	Arguments:  none
//
//	Returns:  none
//
//	Description:	Used to perform any user-defined process prior to the pfc_print event.
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

end event

event pfc_postprint();//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PostPrint
//
//	Arguments:  none
//
//	Returns:  none
//
//	Description:	Used to perform any user-defined process after the pfc_print event.
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

end event

public function boolean of_getclosestatus ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetCloseStatus
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  boolean
//	true  = window is closing
//	false = window is not closing
//
//	Description:
//	Returns whether the window is in the process of closing
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

return ib_closestatus
end function

public function integer of_setresize (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_SetResize
//	Arguments:		ab_switch   starts/stops the window resize service
//	Returns:			Integer 		1 = success,  0 = no action necessary, -1 error
//	Description:		Starts or stops the window resize service
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
//						8.0   Modified to initially set window dimensions based on the class definition
//						12.5	11001		Reverting original size logic back to pre 8.0 logic
//////////////////////////////////////////////////////////////////////////////
//	Copyright $$HEX2$$a9002000$$ENDHEX$$1996-2001 Sybase, Inc. and its subsidiaries.  All rights reserved.  Any distribution of the 
// PowerBuilder Foundation Classes (PFC) source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////////////////////////////////////////////////////////////////////////////
integer	li_rc, li_v, li_vars
integer li_origwidth, li_origheight

// Check arguments
if IsNull (ab_switch) then
	return -1
end if

if ab_Switch then
	if IsNull(inv_resize) Or not IsValid (inv_resize) then
		inv_resize = create n_cst_resize
		
//		/*  Get this window's class definition and extract the width and height  */
//		classdefinition lcd_class
//		lcd_class = this.ClassDefinition
//		
//		li_vars = UpperBound ( lcd_class.VariableList )
//		For li_v = 1 to li_vars
//			If lcd_class.VariableList[li_v].Name = "width" Then li_origwidth = Integer ( lcd_class.VariableList[li_v].InitialValue ) 
//			If lcd_class.VariableList[li_v].Name = "height" Then li_origheight = Integer ( lcd_class.VariableList[li_v].InitialValue ) 
//			If li_origwidth > 0 And li_origheight > 0 Then Exit
//		Next
//		inv_resize.of_SetOrigSize ( li_origwidth, li_origheight )

		inv_resize.of_setOrigSize(this.WorkSpaceWidth(), this.WorkSpaceHeight())
		li_rc = 1
	end if
else
	if IsValid (inv_resize) then
		destroy inv_resize
		li_rc = 1
	end if
end If

return li_rc
end function

public function integer of_setbase (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetBase
//
//	Access:  public
//
//	Arguments:
//	ab_switch   enable/disable the base window service
//
//	Returns:  integer
//	 1 = success
//	 0 = no action necessary
//	-1 = error
//
//	Description:
//	Instantiates or destroys the base window service
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
if IsNull (ab_switch) then
	return -1
end if

if ab_Switch then
	if IsNull(inv_base) Or not IsValid (inv_base) then
		inv_base = create n_cst_winsrv
		inv_base.of_SetRequestor (this)
		li_rc = 1
	end if
else
	if IsValid (inv_base) then
		destroy inv_base
		li_rc = 1
	end if	
end if

return li_rc


end function

public function integer of_setpreference (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Event:  of_SetPreference
//
//	Arguments:
//	ab_switch   starts/stops the window preference service
//
//	Returns:  integer
//	 1 = Successful operation.
//	 0 = No action necessary
//	-1 = An error was encountered
//
//	Description:
//	Starts or stops the window preference service
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

// Check arguments.
if IsNull (ab_switch) then return -1

if ab_Switch then
	if IsNull(inv_preference) Or not IsValid (inv_preference) then
		inv_preference = create n_cst_winsrv_preference
		inv_preference.of_SetRequestor (this)
		li_rc = 1
	end if
else
	if IsValid (inv_preference) then
		destroy inv_preference
		li_rc = 1
	end if
end if

return li_rc
end function

protected function integer of_getdwtype (datawindow adw_dw);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetDWType
//
//	Access:  protected
//
//	Arguments:
//	adw_dw   DataWindow to determine type for
//
//	Returns:  integer
//	 2 = Datawindow is a PFC Datawindow that is Linked.
//	 1 = Datawindow is a PFC Datawindow that is not using linkage service
//	 0 = Datawindow is a not a PFC Datawindow.
//	-1 = error
//
//	Description:
//	Determines the type of DataWindow specified
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

u_dw	ldw_pfc_dw

// Check arguments
If IsNull(adw_dw) Or Not IsValid(adw_dw) Then Return -1

// Determine if this is a PFC Datawindow
IF adw_dw.TriggerEvent ( "pfc_descendant" ) = 1 THEN 
	// This is a PFC datawindow
	ldw_pfc_dw = adw_dw

	// A PFC Datawindow can either be Linked or NotLinked
	IF IsValid ( ldw_pfc_dw.inv_Linkage ) THEN
		// This is a PFC Datawindow that is Linked
		Return 2
	End If

	// This is a PFC DataWindow that is not Linked
	Return 1
End If

// This is a standard DataWindow
Return 0

end function

protected function integer of_updatechecks ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_UpdateChecks
//
//	Access:  protected
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = updates were found
//	 0 = No changes to update were found
//	-1 = AcceptText error
//	-2 = UpdatesPending error was encountered
//	-3 = Validation error was encountered
//
//	Description:	Perform accepttext, updatespending and validation 
//		functionality on the objects which can be found on the control array.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Added function overloading to support updatechecks for specific objects.
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

powerobject lpo_array[]

lpo_array = This.Control
Return of_UpdateChecks(lpo_array)
end function

public function boolean of_GetSaveStatus ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetSaveStatus
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  boolean
//	true  = window is in pfc_save process
//	false = window is not in pfc_save process
//
//	Description:
//	Returns whether the window is in the pfc_save process.
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

return ib_savestatus
end function

public function integer of_setdberrormsg (string as_msg);// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetDBErrorMsg
//
//	Access:  public
//
//	Arguments:  
//		as_msg	The error message that needs to be displayed by the PFC Save
//					process, after the appropriate database rollback.
//
//	Returns:  integer
//		1 if the function succeeds and -1 if an error occurs.
//
//	Description:
//		Sets the error message that needs to be displayed by the PFC Save
//		process, after the appropriate database rollback.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0.02   Initial version
// 6.0  Marked obsolete Replaced by of_SetDBErrorMsg(n_cst_dberrorattrib).
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

// Check the argument.
If IsNull(as_msg) Then
	Return -1
End If

is_dberrormsg = as_msg
return 1
end function

protected function integer of_updatechecks (powerobject apo_control[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_UpdateChecks
//
//	Access:  protected
//
//	Arguments:  
//	  apo_control[]  The array of object for which the checks need to be 
//							performed.
//
//	Returns:  integer
//	 1 = updates were found
//	 0 = No changes to update were found
//	-1 = AcceptText error
//	-2 = UpdatesPending error was encountered
//	-3 = Validation error was encountered
//
//	Description:	Perform accepttext, updatestpending and validation on 
//			the objects.
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

Boolean 		lb_focusonerror
Integer		li_pending_rc = 1
Integer		li_validation_rc = 1
powerobject	lpo_pendingupdates[]

// Determine whether pfc_AcceptText should perform a SetFocus if an 
//	error is found.
lb_focusonerror = Not ib_closestatus

// Apply the contents of the edit controls to all datawindows
If This.Event pfc_accepttext (apo_control, lb_focusonerror) <0 Then 
	Return -1
End If

// Determine if any changes are pending.
ipo_pendingupdates = lpo_pendingupdates // *Clear* the instance ipo_pendingupdates
li_pending_rc = This.Event pfc_updatespending(apo_control)
If li_pending_rc < 0 Then
	Return -2
End If

// Check for Errors on controls.
If ib_alwaysvalidate Then
	li_validation_rc = This.Event pfc_validation(apo_control)
ElseIf li_pending_rc > 0 Then
	li_validation_rc = This.Event pfc_validation(ipo_pendingupdates)
End If
If li_validation_rc <0 Then 
	Return -3
End If	

If li_pending_rc = 0 Then 
	// No changes to update were found.
	Return 0
End If

// There are updates pending and no Errors were found.
Return 1
end function

public function integer of_setlogicalunitofwork (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetLogicalUnitofWork
//
//	Access:  public
//
//	Arguments:
//	ab_switch   enable/disable the base window service
//
//	Returns:  integer
//	 1 = success
//	 0 = no action necessary
//	-1 = error
//
//	Description:
//	Instantiates or destroys the Logical Unit of Work service
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
if IsNull (ab_switch) then return -1

if ab_switch then
	if IsNull(inv_luw) Or not IsValid (inv_luw) then
		inv_luw = create n_cst_luw
		inv_luw.of_SetRequestor (this)
		// Tell service who the original update requestor is.
		inv_luw.of_SetUpdateRequestor (this)
		return 1
	end if
else
	if IsValid (inv_luw) then
		destroy inv_luw
		return 1
	end if	
end if

return 0


end function

protected function integer of_getupdateobjects (ref powerobject apo_objects[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetUpdateObjects
//
//	Access:  protected
//
//	Arguments:		
//	apo_objects[]   by Reference.  The current array of objects on which the update 
//						process may take effect.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Get the array on which updates would be attempted.
//
// Note:
// If the ipo_updateobjects array has not been set, the PFC Save functionality, 
//	uses the window control array (this.Control[]).  
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

If UpperBound(ipo_updateobjects) > 0 Then
	apo_objects = ipo_updateobjects
Else
	// If the ipo_updateobjects array has not been set, the PFC Save functionality, 
	//	uses the window control array (this.Control[]).  	
	apo_objects = this.Control
End If

Return 1
end function

protected function integer of_setupdateobjects (powerobject apo_objects[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetUpdateObjects
//
//	Access:  protected
//
//	Arguments:		
//	apo_objects[]   An array of objects on which the update process may take 
//						effect.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets a new default array holding objects for which an updates may be attempted.
// If this function is not called, the PFC default is the window control 
//	array (this.Control[]).  The reason the description states 'may' is because of 
//	the pfc_saveobjects event, which can be used to save a different array of objects.  
//
//	The pfc_save process will look in the following order to determine what 
// should be updated.
//		1) Specified one time sequence (thru pfc_saveobjects event).
//		2) Specified permananent sequence (thru of_SetUpdateObjects(...)).
//		3) None was specified, so use default window control array.
//
//	The pfc_closequery process will look in the following order to determine what 
// should be updated.
//		1) Specified permananent sequence (thru of_SetUpdateObjects(...)).
//		2) None was specified, so use default window control array.
//
// *Note: To reset the default back to the window control array, call this 
// 		function with an empty powerobject array.
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

If IsNull(apo_objects) Then Return -1
ipo_updateobjects = apo_objects
Return 1
end function

protected function integer of_setalwaysvalidate (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetAlwaysValidate
//
//	Access:  protected
//
//	Arguments:		
//	ab_switch	Switch which determines which objects should be validated in the 
//					save process.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Switch which determines which objects should be validated in the save process.
//	If false, the objects with updates pending will be validated.
//	If true, all objects that were tested for updates pending will be validated.
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

If IsNull(ab_switch) Then Return -1
ib_alwaysvalidate = ab_switch
Return 1
end function

protected function boolean of_isalwaysvalidate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_IsAlwaysValidate
//
//	Access:  protected
//
//	Arguments:  None
//
//	Returns:  boolean
//	False, the objects with updates pending will be validated.
//	True, all objects that were tested for updates pending will be validated.
//
//	Description:
//	Gets the switch which determines which objects should be validated in the save 
//	process.
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

return ib_alwaysvalidate
end function

public function integer of_accepttext (boolean ab_focusonerror);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_AcceptText
//
//	Access:  		public
//
//	Arguments:  
//	ab_focusonerror	States if focus should be set in case of error.
//
//	Returns:  Integer
//	1 Success
// 0 No Action
//	-1 Failure
//	
//	Description:
//	Perform an accepttext and set focus when requested.
//
// Note:
//	Specific acceptext logic should be coded in descendant pfc_AcceptText event.
//	Part of the SelfUpdatingObject(SUO) API.
//	No Action will be executed, If the object is not Updateable.
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

powerobject lpo_updatearray[]

// Make sure there is something to take action on.
If Not of_IsUpdateable() Then Return NO_ACTION

// Determine the appropriate array.
If UpperBound(ipo_updateobjects) > 0 Then
	lpo_updatearray = ipo_updateobjects
Else
	lpo_updatearray = This.Control		
End If

Return this.Event pfc_AcceptText(lpo_updatearray, ab_focusonerror)

end function

public function integer of_updatespending ();//////////////////////////////////////////////////////////////////////////////
//
//	Funciton:
//	of_UpdatesPending
//
//	Access:  		public
//
//	Arguments:  none
//
//	Returns:  integer
//	1 = Updates are pending.
//	0 = No updates are pending
// -1 = Failure
//
//	Description:
//	Determine if any updates are pending on this object.  
//	Set the ipo_pendingupdates array.
//
// Note:
//	Specific UpdatesPending logic should be coded in descendant pfc_UpdatesPending event.
//	Part of the SelfUpdatingObject(SUO) API.
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

constant integer NO_UPDATESPENDING =0
integer	li_rc 
powerobject lpo_updatearray[]
powerobject lpo_pending[]

// Make sure there is something to take action on.
If Not of_IsUpdateable() Then Return NO_UPDATESPENDING

// Determine the appropriate array.
If UpperBound(ipo_updateobjects) > 0 Then
	lpo_updatearray = ipo_updateobjects
Else
	lpo_updatearray = This.Control		
End If

li_rc = this.Event pfc_UpdatesPendingRef(lpo_updatearray, lpo_pending)
ipo_pendingupdates = lpo_pending  // *Set* the instance ipo_pendingupdates
return li_rc
end function

public function integer of_validation ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_Validation
//
//	Access:  		public
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = All validation passed
//  0 = No Action
//	-1 = validation failed
//
//	Description:
//	Perform validation logic.
//
// Note:
//	Specific Validation logic should be coded in descendant pfc_validation event.
//	Part of the SelfUpdatingObject(SUO) API.
//	No Action will be executed, If the object is not Updateable.
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

powerobject lpo_updatearray[]
powerobject lpo_validatearray[]
powerobject lpo_pending[]

// Make sure there is something to take action on.
If Not of_IsUpdateable() Then Return NO_ACTION

If ib_alwaysvalidate Then
	// Don't need to know the objects with updatespending.
	If UpperBound(ipo_updateobjects) > 0 Then
		lpo_validatearray = ipo_updateobjects
	Else
		lpo_validatearray = This.Control		
	End If
Else
	If UpperBound(ipo_pendingupdates) > 0 Then
		// Should be part of a SUO unit.
		lpo_pending = ipo_pendingupdates
	Else
		// Might not be part of an SUO unit.  Need to know what objects had updatespending. 
		If UpperBound(ipo_updateobjects) > 0 Then
			lpo_updatearray = ipo_updateobjects
		Else
			lpo_updatearray = This.Control		
		End If
		If this.Event pfc_UpdatesPendingRef(lpo_updatearray, lpo_pending) < 0 Then
			Return -1
		End If
	End If
	lpo_validatearray = lpo_pending
End If

Return this.Event pfc_validation(lpo_validatearray)
end function

public function integer of_updateprep ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_UpdatePrep
//
//	Access:  		public
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = All preparation passed
//	 0 = No Action
//	-1 = preparation failed
//
//	Description:
//	Perform an Update Preparation.
//
// Note:
//	Specific updateprep logic should be coded in descendant pfc_updateprep event.
//	Part of the SelfUpdatingObject(SUO) API.
//	No Action will be executed, If the object is not Updateable.
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

powerobject lpo_updatearray[]
powerobject lpo_pending[]
powerobject lpo_empty[]

// Make sure there is something to take action on.
If Not of_IsUpdateable() Then Return NO_ACTION

If UpperBound(ipo_pendingupdates) > 0 Then
	// Should be part of a SUO unit.
	lpo_pending = ipo_pendingupdates
Else
	// Might not be part of an SUO unit.  Need to know what objects had updatespending. 
	If UpperBound(ipo_updateobjects) > 0 Then
		lpo_updatearray = ipo_updateobjects
	Else
		lpo_updatearray = This.Control		
	End If
	If this.Event pfc_UpdatesPendingRef(lpo_updatearray, lpo_pending) < 0 Then
		Return -1
	End If
End If

Return this.Event pfc_updateprep(lpo_pending)
end function

public function integer of_update (boolean ab_accepttext, boolean ab_resetflag, powerobject apo_requestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_Update
//
//	Access:  		public
//
//	Arguments:  
//	ab_accepttext	When applicable, specifying whether control should perform an
//						AcceptText prior to performing the update:
//	ab_resetflag	Value specifying whether object should automatically 
//						reset its update flags.
//	apo_requestor	An object requesting the update within a transaction.
//
//	Returns: Integer
//	 1 = The update was successfull
//	 0 = No Action
//	-1 = The update failed
//
//	Description:  	
//	Execute the specific Update logic.  
//
// Note:
//	Specific Update logic should be coded in descendant pfc_Update event.
//	Part of the SelfUpdatingObject(SUO) API.
//	No Action will be executed, If the object is not Updateable.
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
powerobject	lpo_notvalid

// Make sure there is something to take action on.
If Not of_IsUpdateable() Then Return NO_ACTION

// Set the object requesting the update.
If of_SetUpdateRequestor(apo_requestor) <0 Then Return -1

// Ask the LUW to present itself as the original update requestor (create if necessary).
If IsNull(inv_luw) Or Not IsValid (inv_luw) Then of_SetLogicalUnitofWork(True)
If IsValid(inv_luw) Then 
	inv_luw.of_SetUpdateRequestor(apo_requestor)
End If
	
// Perform the actual update.
li_rc = this.of_Update(ab_accepttext, ab_resetflag)
	
// Clear the object which requested the update.
of_SetUpdateRequestor(lpo_notvalid)
If IsValid(inv_luw) Then 
	inv_luw.of_SetUpdateRequestor(lpo_notvalid)
End If

Return li_rc
end function

public function integer of_postupdate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_PostUpdate
//
//	Access:  	public
//
//	Arguments:  None
//
//	Returns:  Integer
//	1 if it succeeds
// 0 No Action
// -1 if an error occurs
//	
//	Description:
//	Perform post update processing.  Clear the ipo_pendingupdates array.
//
// Note:
//	Specific PostUpdate logic should be coded in descendant pfc_PostUpdate event.
//	Part of the SelfUpdatingObject(SUO) API.
//	No Action will be executed, If the object is not Updateable.
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

integer	li_rc
powerobject lpo_updatearray[]
powerobject lpo_pending[]
powerobject lpo_empty[]

// Make sure there is something to take action on.
If Not of_IsUpdateable() Then Return NO_ACTION

If UpperBound(ipo_pendingupdates) > 0 Then
	// Should be part of a SUO unit.
	lpo_pending = ipo_pendingupdates
Else
	// Might not be part of an SUO unit.  Need to know what objects had updatespending. 
	If UpperBound(ipo_updateobjects) > 0 Then
		lpo_updatearray = ipo_updateobjects
	Else
		lpo_updatearray = This.Control		
	End If
	If this.Event pfc_UpdatesPendingRef(lpo_updatearray, lpo_pending) < 0 Then
		Return -1
	End If
End If

li_rc = this.Event pfc_postupdate(lpo_pending)
ipo_pendingupdates = lpo_empty // *Clear* the instance ipo_pendingupdates
Return li_rc
end function

protected function integer of_setupdateable (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetUpdateable
//
//	Access:  Protected
//
//	Arguments:
//	ab_switch   Indicates whether the Object is updateable
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets whether the Object is updateable
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

if IsNull (ab_switch) then return -1
ib_isupdateable =  ab_switch
return 1
end function

protected function boolean of_isupdateable ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_IsUpdateable
//
//	Access:  Protected
//
//	Arguments:  None
//
//	Returns:  boolean
//	TRUE   The object is marked as updateable
//	FALSE   The object is not marked as updateable
//
//	Description:
//	Gets the value of the updateable property.
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

public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetInfo
//
//	Access:   		Public
//
//	Arguments:		
//		anv_infoattrib	(By reference) The Information attributes.
//
//	Returns:  		Integer
//	 1 for success.
//	-1 for error.
//
//	Description:  
//	 Gets the Object Information.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0    Initial version
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

// Populate Information.
anv_infoattrib.is_name = 'Master Window'
anv_infoattrib.is_description = 'Master Window'

Return 1
end function

protected function integer of_setupdaterequestor (powerobject apo_updaterequestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetUpdateRequestor
//
//	Access:    Protected
//
//	Arguments:
// apo_updaterequestor   The object which is requesting an update within a 
//			transaction.  Or an invalid reference to clear the reference.
//
//	Returns:  Integer
//		1 for success
//		-1 for error.
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

// Check for a valid apo_updaterequestor is not desired.
ipo_updaterequestor = apo_updaterequestor
Return 1
end function

public function integer of_update (boolean ab_accepttext, boolean ab_resetflag);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_Update
//
//	Access:  		public
//
//	Arguments:  
//	ab_accepttext	When applicable, specifying whether control should perform an
//						AcceptText prior to performing the update:
//	ab_resetflag	Value specifying whether object should automatically 
//						reset its update flags.
//
//	Returns: Integer
//	 1 = The update was successful
//  0 = No action 
//	-1 = The update failed
//
//	Description:  	
//	Execute the specific Update logic.  
//
// Note:
//	Specific Update logic should be coded in descendant pfc_Update event.
//	Part of the SelfUpdatingObject(SUO) API.
//	No Action will be executed, If the object is not Updateable.
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

powerobject lpo_updatearray[]
powerobject lpo_pending[]
powerobject lpo_empty[]

// Make sure there is something to take action on.
If Not of_IsUpdateable() Then Return NO_ACTION

If UpperBound(ipo_pendingupdates) > 0 Then
	// Should be part of a SUO unit.
	lpo_pending = ipo_pendingupdates
Else
	// Might not be part of an SUO unit.  Need to know what objects had updatespending. 
	If UpperBound(ipo_updateobjects) > 0 Then
		lpo_updatearray = ipo_updateobjects
	Else
		lpo_updatearray = This.Control		
	End If
 	If this.Event pfc_UpdatesPendingRef(lpo_updatearray, lpo_pending) < 0 Then
		Return -1
	End If
	If UpperBound(lpo_pending) = 0 Then Return NO_ACTION
End If

Return this.Event pfc_UpdateObjects(lpo_pending, ab_accepttext, ab_resetflag)
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

public function integer of_setdberrormsg (n_cst_dberrorattrib anv_dberrorattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetDBErrorMsg
//
//	Access:  public
//
//	Arguments:  
//	anv_dberrorattrib	The error information that needs to be displayed by the 
//		PFC Save process, after the appropriate database rollback.
//
//	Returns:  integer
//	 1 if the function succeeds
//	-1 if an error occurs.
//
//	Description:
//	Sets the error information that needs to be displayed by the PFC Save
//	process, after the appropriate database rollback.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 6.0   Initial version - Replaces obsoleted function of_SetDBErrorMsg(string).
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

// Check the argument.
If IsNull(anv_dberrorattrib) Then
	Return -1
End If

// Set the error information.
inv_dberrorattrib = anv_dberrorattrib

// Provide backward compatibility.
If IsValid(anv_dberrorattrib) Then
	of_SetDBErrorMSG(anv_dberrorattrib.is_errormsg)
End If

return 1
end function

public function integer of_setstyle (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Event:  of_SetStyle
//
//	Arguments:
//	ab_switch   starts/stops the window style service
//
//	Returns:  integer
//	 1 = Successful operation.
//	 0 = No action necessary
//	-1 = An error was encountered
//
//	Description:
//	Starts or stops the window style service
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

integer	li_rc

// Check arguments.
if IsNull (ab_switch) then return -1

if ab_Switch then
	if IsNull(inv_style) Or not IsValid (inv_style) then
		inv_style = create n_cst_winsrv_style
		inv_style.of_SetRequestor (this)
		li_rc = 1
	end if
else
	if IsValid (inv_style) then
		destroy inv_style
		li_rc = 1
	end if
end if

return li_rc
end function

event closequery;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  closequery
//
//	Description:
//	Search for unsaved datawindows prompting the user if any
//	pending updates are found.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Enhanced control on what objects are to be updated.
// 6.0.01 Make sure the window is not minimized and behind other windows.
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

Constant Integer	ALLOW_CLOSE = 0
Constant Integer	PREVENT_CLOSE = 1

Integer	li_msg
Integer	li_rc
String	ls_msgparms[]
Powerobject lpo_updatearray[]

// Check if the CloseQuery process has been disabled
If ib_disableclosequery Then
	Return ALLOW_CLOSE
End If

// Call event to perform any pre-CloseQuery processing
If This.Event pfc_preclose ( ) <> 1 Then
	// Prevent the window from closing
	Return PREVENT_CLOSE 
End If

// Prevent validation error messages from appearing while the window is closing
// and allow others to check if the  CloseQuery process is in progress
ib_closestatus = True

// Determine the objects for which an update will be attempted.
// For the CloseQuery, the order sequence is as follows: 
//		1) Specified permananent sequence (thru of_SetUpdateObjects(...)).
//		2) None was specified, so use default window control array.
If UpperBound(ipo_updateobjects) > 0 Then
	lpo_updatearray = ipo_updateobjects
Else
	lpo_updatearray = This.Control		
End If

// Check for any pending updates
li_rc = of_UpdateChecks(lpo_updatearray)
If li_rc = 0 Then
	// Updates are NOT pending, allow the window to be closed.
	ib_closestatus = False
	Return ALLOW_CLOSE
ElseIf li_rc < 0 Then
	// Make sure the window is not minimized and behind other windows.
	If this.WindowState = Minimized! Then
		this.WindowState = Normal!
	End If
	this.BringToTop = True

	// There are Updates pending, but at least one data entry error was found.
	// Give the user an opportunity to close the window without saving changes
	If IsValid(gnv_app.inv_error) Then
		li_msg = gnv_app.inv_error.of_Message('pfc_closequery_failsvalidation', &
					 ls_msgparms, gnv_app.iapp_object.DisplayName)
	Else
		li_msg = of_MessageBox ("pfc_master_closequery_failsvalidation", &
					gnv_app.iapp_object.DisplayName, &
					"The information entered does not pass validation and "  + &
					"must be corrected before changes can be saved.~r~n~r~n" + &
					"Close without saving changes?", &
					exclamation!, YesNo!, 2)
	End If
	If li_msg = 1 Then
		ib_closestatus = False
		Return ALLOW_CLOSE
	End If
Else
	// Make sure the window is not minimized and behind other windows.
	If this.WindowState = Minimized! Then
		this.WindowState = Normal!
	End If	
	this.BringToTop = True
	
	// Changes are pending, prompt the user to determine if they should be saved
	If IsValid(gnv_app.inv_error) Then
		li_msg = gnv_app.inv_error.of_Message('pfc_closequery_savechanges',  &
					ls_msgparms, gnv_app.iapp_object.DisplayName)		
	Else
		li_msg = of_MessageBox ("pfc_master_closequery_savechanges", &
					gnv_app.iapp_object.DisplayName, &
					"Do you want to save changes?", exclamation!, YesNoCancel!, 1)
	End If
	Choose Case li_msg
		Case 1
			// YES - Update
			// If the update fails, prevent the window from closing
			If This.Event pfc_save() >= 1 Then
				// Successful update, allow the window to be closed
				ib_closestatus = False
				Return ALLOW_CLOSE
			End If
		Case 2
			// NO - Allow the window to be closed without saving changes
			ib_closestatus = False
			Return ALLOW_CLOSE
		Case 3
			// CANCEL -  Prevent the window from closing
	End Choose
End If

// Prevent the window from closing
ib_closestatus = False
Return PREVENT_CLOSE
end event

event open;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  pfc_w_master
//
//	Description:
//	The ancestor to all PFC window classes
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0   Added MRU and Logical Unit of Work service code
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

// Allow for pre and post open events to occur
This.Event pfc_preopen()
This.Post Event pfc_postopen()

// Default window title is application title
If Len (This.title) = 0 Then
	If IsValid (gnv_app.iapp_object) Then
		This.title = gnv_app.iapp_object.DisplayName
	End If
End If

// Allow preference service to restore settings if necessary
If IsValid(inv_preference) Then
	If gnv_app.of_IsRegistryAvailable() Then
		If Len(gnv_app.of_GetUserKey())> 0 Then 
			li_rc = inv_preference.of_Restore( &
				gnv_app.of_GetUserKey()+'\'+this.ClassName()+'\Preferences')
		ElseIf IsValid(gnv_app.inv_debug) Then				
			of_MessageBox ("pfc_master_open_preferenceregistrydebug", &
				"PowerBuilder Foundation Class Library", "The PFC User Preferences service" +&
				" has been requested but The UserRegistrykey property has not" +&
				" been Set on The application manager Object.~r~n~r~n" + &
  				"Call of_SetRegistryUserKey on The Application Manager" +&
				" to Set The property.", &
				Exclamation!, OK!, 1)
		End If
	Else
		If Len(gnv_app.of_GetUserIniFile()) > 0 Then
			li_rc = inv_preference.of_Restore (gnv_app.of_GetUserIniFile(), This.ClassName()+' Preferences')
		ElseIf IsValid(gnv_app.inv_debug) Then		
			of_MessageBox ("pfc_master_open_preferenceinidebug", &
				"PowerBuilder Class Library", "The PFC User Preferences service" +&
				" has been requested but The UserINIFile property has not" +&
				" been Set on The application manager Object.~r~n~r~n" + &
  				"Call of_SetUserIniFile on The Application Manager" +&
				" to Set The property.", &
				Exclamation!, OK!, 1)		
		End If
	End If
End If

// Allow MRU service to restore settings if necessary
If IsValid(gnv_app.inv_mru) Then
	this.event pfc_mrurestore()
End if

end event

on pfc_w_master.create
end on

on pfc_w_master.destroy
end on

event resize;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  resize
//
//	Description:
//	Send resize notification to services
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//	7.0   Change to not resize when window is being restored from a minimized state
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

// Notify the resize service that the window size has changed.
If IsValid (inv_resize) and This.windowstate <> minimized! Then
	inv_resize.Event pfc_Resize (sizetype, This.WorkSpaceWidth(), This.WorkSpaceHeight())
End If

// Store the position and size on the preference service.
// With this information the service knows the normal size of the 
// window even when the window is closed as maximized/minimized.	
If IsValid (inv_preference) And This.windowstate = normal! Then
	inv_preference.Post of_SetPosSize()
End If
end event

event close;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  close
//
//	Description:
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Added MRU and Logical Unit of Work service code
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
window	lw_obj

// store preference service information
If IsValid(inv_preference) Then
	If gnv_app.of_IsRegistryAvailable() Then
		If Len(gnv_app.of_GetUserKey())> 0 Then 
			li_rc = inv_preference.of_Save( &
				gnv_app.of_GetUserKey()+'\'+this.ClassName()+'\Preferences')
		ElseIf IsValid(gnv_app.inv_debug) Then				
			of_MessageBox ("pfc_master_close_preferenceregistrydebug", &
				"PowerBuilder Class Library", "The PFC Window Preferences service" +&
				" has been requested but The Required registry attribute has not" +&
				" been Set.  Use of_SetRegistryUserKey on The Application Manager" +&
				" to Set The attribute.", &
				Exclamation!, OK!, 1)				
		End If
	Else
		If Len(gnv_app.of_GetUserIniFile()) > 0 Then
			li_rc = inv_preference.of_Save( &
				gnv_app.of_GetUserIniFile(), This.ClassName()+' Preferences')
		ElseIf IsValid(gnv_app.inv_debug) Then		
			of_MessageBox ("pfc_master_close_preferenceinidebug", &
				"PowerBuilder Class Library", "The PFC Window Preferences service" +&
				" has been requested but The Required inifile attribute has not" +&
				" been Set.  Use of_SetUserIniFile on The Application Manager" +&
				" to Set The attribute.", &
				Exclamation!, OK!, 1)
		End If
	End If
End If

// Update MRU information on the parent window
If IsValid(gnv_app.inv_mru) Then
	lw_obj = this.parentwindow()
	If IsValid(lw_obj) Then
		lw_obj.post dynamic event pfc_mrurestore()
	End If
End If

// Destroy instantiated services
of_SetBase (False)
of_SetResize (False)
of_SetPreference (False)
of_SetLogicalUnitofWork (False)
end event

event activate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:	Activate
//
//	Description:
//	Occurs when window recieves focus
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Add MRU Code 
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

// restore changed menu items if needed
if isvalid(gnv_app.inv_mru) then
	this.post event pfc_mrurestore()
end if

end event


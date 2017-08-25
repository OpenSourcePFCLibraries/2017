HA$PBExportHeader$pfc_u_base.sru
$PBExportComments$PFC Visual Ancestor class
forward
global type pfc_u_base from userobject
end type
end forward

global type pfc_u_base from userobject
integer width = 1330
integer height = 740
long backcolor = 79741120
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 553648127
event resize pbm_size
event type integer pfc_accepttext ( powerobject apo_control[],  boolean ab_focusonerror )
event type integer pfc_validation ( powerobject apo_control[] )
event type integer pfc_updateprep ( powerobject apo_control[] )
event type integer pfc_updatespending ( powerobject apo_control[],  ref powerobject apo_pending[] )
event type integer pfc_update ( powerobject apo_control[],  boolean ab_accepttext,  boolean ab_resetflag )
event type integer pfc_postupdate ( powerobject apo_control[] )
end type
global pfc_u_base pfc_u_base

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

n_cst_resize	inv_resize

Protected:
// - Logical Unit of Work -  SelfUpdatingObject - Save Process - (Attributes).
boolean		ib_isupdateable = True
boolean		ib_alwaysvalidate = false // Save process flag to include all objects in validation process.
powerobject	ipo_updaterequestor
powerobject	ipo_pendingupdates[]
powerobject	ipo_updateobjects[]
n_cst_luw	inv_luw
boolean		ib_IsObsolete
end variables

forward prototypes
public function integer of_getparentwindow (ref window aw_parent)
public function integer of_setresize (boolean ab_switch)
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_setlogicalunitofwork (boolean ab_switch)
public function integer of_update (boolean ab_accepttext, boolean ab_resetflag, powerobject apo_requestor)
public function integer of_accepttext (boolean ab_focusonerror)
public function integer of_postupdate ()
public function integer of_update (boolean ab_accepttext, boolean ab_resetflag)
public function integer of_updateprep ()
public function integer of_updatespending ()
public function integer of_validation ()
protected function integer of_setalwaysvalidate (boolean ab_switch)
protected function boolean of_isalwaysvalidate ()
protected function integer of_setupdateable (boolean ab_switch)
protected function boolean of_isupdateable ()
protected function integer of_setupdateobjects (powerobject apo_objects[])
protected function integer of_getupdateobjects (ref powerobject apo_objects[])
protected function integer of_setupdaterequestor (powerobject apo_updaterequestor)
protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default)
end prototypes

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

// Notify the resize service that the object size has changed.
If IsValid (inv_resize) Then
	inv_resize.Event pfc_resize (sizetype, This.Width, This.Height)
End If
end event

event pfc_accepttext;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  
//	pfc_AcceptText
//
//	Arguments:
//	apo_control[]		The controls on which to perform functionality.
//	ab_focusonerror   Should focus be set to object in error
//
//	Returns:  integer
//	 1 = success
//	 0 = no action
//	-1 = error
//
//	Description:
//	Request the Logical Unit of Work service to perform Accepttext functionality
//	on the array.
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
If IsValid(inv_luw) Then
	Return inv_luw.of_AcceptText(apo_control, ab_focusonerror)
End If

Return -1
end event

event pfc_validation;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  
//	pfc_validation
//
//	Arguments:	
//	apo_control[]	The controls on which to perform functionality.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Request the Logical Unit of Work service to perform Validation functionality
//	on the array.
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
	Return inv_luw.of_Validation(apo_control)
End If

Return -1
end event

event pfc_updateprep;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  
//	pfc_updateprep
//
//	Arguments:	
//	apo_control[]	The controls on which to perform functionality.
//
//	Returns:  integer
//	 1 = success
//  0 = no action
//	-1 = error
//
//	Description:
//	Request the Logical Unit of Work service to perform Update Preparation
//	functionality on the array.
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

event pfc_updatespending;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_UpdatesPending
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
//	UpdatesPending.  Store references in pending array.
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
PowerObject lpo_pending[]
powerobject lpo_updatearray[]

// Clear the pending by reference array.
apo_pending = lpo_pending

// Make sure there is something to take action on.
If UpperBound(apo_control) = 0 Then Return NO_UPDATESPENDING
If Not of_IsUpdateable() Then Return NO_UPDATESPENDING

// Let Logical Unit of Work Service perform the functionality (create if necessary).
If IsNull(inv_luw) Or Not IsValid (inv_luw) Then of_SetLogicalUnitofWork(True)
If IsValid(inv_luw) Then
	li_rc = inv_luw.of_UpdatesPending(apo_control, lpo_pending)
	apo_pending = lpo_pending
	Return li_rc
End If

Return -1
end event

event pfc_update;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_update
//
//	Arguments:
//	apo_control[]	The controls on which to perform functionality.
//	ab_accepttext	When applicable, specifying whether control should perform an
//						AcceptText prior to performing the update:
//	ab_resetflag	Value specifying whether object should automatically 
//						reset its update flags.
//
//	Returns:   integer
//	 1 = all updates successful
//  0 = No Action
//	-1 = At least one update failed
//
//	Description:
//	Request the Logical Unit of Work service to perform Update functionality
//	on the array.
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

// Make sure there is something to take action on.
If UpperBound(apo_control) = 0 Then Return NO_ACTION
If Not of_IsUpdateable() Then Return NO_ACTION

// Let Logical Unit of Work Service perform the functionality (create if necessary).
If IsNull(inv_luw) Or Not IsValid (inv_luw) Then of_SetLogicalUnitofWork(True)
If IsValid(inv_luw) Then
	Return inv_luw.of_Update(apo_control, ab_accepttext, ab_resetflag)
End If

Return -1
end event

event pfc_postupdate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  
//	pfc_postupdate
//
//	Arguments:
//	apo_control[]	The controls on which to perform functionality.
//
//	Returns:  integer
//	 1 = success
//  0 = no action
//	-1 = error
//
//	Description:
//	Request the Logical Unit of Work service to perform PostUpdate functionality
//	on the array.
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
If IsValid(inv_luw) Then
	Return inv_luw.of_PostUpdate(apo_control)
End If

Return -1
end event

public function integer of_getparentwindow (ref window aw_parent);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetParentWindow
//
//	Access:  		public
//
//	Arguments:
//	aw_parent		The Parent window for this object (passed by reference).
//						If a parent window is not found, variable returns
//						with NULL.
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:	Calculates the parent window of a window object.
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

powerobject	lpo_parent

//Loop getting the parent of the object until it is of type window!
lpo_parent = this.GetParent()
do while IsValid (lpo_parent)
	If lpo_parent.TypeOf() = window! Then Exit
	lpo_parent = lpo_parent.GetParent()
loop

if not IsValid (lpo_parent) then
	setnull(aw_parent)	
	return -1
end If

aw_parent = lpo_parent
return 1

end function

public function integer of_setresize (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetResize
//
//	Access:  public
//
//	Arguments:		
//	ab_switch   starts/stops the window resize service
//
//	Returns:  integer
//	 1 = success
//	 0 = no action necessary
//	-1 = error
//
//	Description:
//	Starts or stops the window resize service
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

Integer	li_rc

// Check arguments
If IsNull (ab_switch) Then
	Return -1
End If

If ab_Switch Then
	If Not IsValid (inv_resize) Then
		inv_resize = Create n_cst_resize
		inv_resize.of_SetOrigSize (This.Width, This.Height)
		li_rc = 1
	End If
Else
	If IsValid (inv_resize) Then
		Destroy inv_resize
		li_rc = 1
	End If
End If

Return li_rc

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
anv_infoattrib.is_name = 'UserObject Base'
anv_infoattrib.is_description = 'UserObject Base'

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

integer	li_rc

// Check arguments
if IsNull (ab_switch) then return -1

if ab_Switch then
	if IsNull(inv_luw) Or not IsValid (inv_luw) then
		inv_luw = create n_cst_luw
		inv_luw.of_SetRequestor (this)
		li_rc = 1
	end if
else
	if IsValid (inv_luw) then
		destroy inv_luw
		li_rc = 1
	end if	
end if

return li_rc


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
//	 0 = No Action taken
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

public function integer of_postupdate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_PostUpdate
//
//	Access:  		public
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
	If this.Event pfc_UpdatesPending(lpo_updatearray, lpo_pending) < 0 Then
		Return -1
	End If
End If

return this.Event pfc_postupdate(lpo_pending)

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
	If this.Event pfc_UpdatesPending(lpo_updatearray, lpo_pending) < 0 Then
		Return -1
	End If
End If

Return this.Event pfc_Update(lpo_pending, ab_accepttext, ab_resetflag)
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
	If this.Event pfc_UpdatesPending(lpo_updatearray, lpo_pending) < 0 Then
		Return -1
	End If
End If

Return this.Event pfc_updateprep(lpo_pending)
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

li_rc = this.Event pfc_UpdatesPending(lpo_updatearray, lpo_pending)
ipo_pendingupdates = lpo_pending
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
		If this.Event pfc_UpdatesPending(lpo_updatearray, lpo_pending) < 0 Then
			Return -1
		End If
	End If
	lpo_validatearray = lpo_pending
End If

Return this.Event pfc_validation(lpo_validatearray)
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
//	Access:  Protected
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

protected function integer of_setupdateobjects (powerobject apo_objects[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetUpdateObjects
//
//	Access:  protected
//
//	Arguments:		
//	apo_objects[]   An array of objects on which the update process will take 
//						effect.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets a new default array holding objects for which an updates will be attempted.
// If this function is not called, the PFC default is the object control 
//	array (this.Control[]).
//
// Note:
//	To reset the default back to the window control array, call this function 
//	with an empty powerobject array.
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

protected function integer of_getupdateobjects (ref powerobject apo_objects[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetUpdateObjects
//
//	Access:  protected
//
//	Arguments:		
//	apo_objects[] (by reference) An array of objects on which the update process 
//				will take effect.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Gets the current default array holding objects for which an updates will be
//	attempted.
//
//	Note:
// If ipo_updateobjects has not yet been set, the function returns the object's
//	control array.
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
	Return 1
End If

apo_objects = this.Control
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

on pfc_u_base.create
end on

on pfc_u_base.destroy
end on

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  pfc_u_base
//
//	Description:
//	The ancestor to all PFC object classes
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

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  destructor
//
//	Description:
//	Perform cleanup.
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

// Destroy instantiated services
of_SetLogicalUnitofWork (False)
of_SetResize(False)
end event


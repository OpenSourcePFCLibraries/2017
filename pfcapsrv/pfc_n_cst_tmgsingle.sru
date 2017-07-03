HA$PBExportHeader$pfc_n_cst_tmgsingle.sru
$PBExportComments$PFC timing single object service
forward
global type pfc_n_cst_tmgsingle from n_base
end type
end forward

global type pfc_n_cst_tmgsingle from n_base
event type integer pfc_timer ( )
end type
global pfc_n_cst_tmgsingle pfc_n_cst_tmgsingle

type variables
Public:
constant integer	TRIGGEREVENT = 0
constant integer	POSTEVENT = 1

Protected:
powerobject	ipo_notifyobject
string		is_notifyevent
integer		ii_notifystyle = TRIGGEREVENT 

boolean		ib_autodisable = True
boolean 		ib_disabled = false
real		ir_interval = 0

n_tmg		itmg_requestor
end variables

forward prototypes
public function integer of_getcount ()
public function boolean of_isdisabled ()
public function integer of_setdisabled (boolean ab_switch)
public function boolean of_isregistered (powerobject apo_object)
public function boolean of_isregistered (powerobject apo_object, string as_eventname)
public function integer of_unregister ()
public function integer of_setrequestor (n_tmg atmg_requestor)
public function integer of_register (powerobject apo_object, string as_eventname, real ar_interval)
public function real of_getinterval ()
public function integer of_register (powerobject apo_object, string as_eventname, real ar_interval, integer ai_style)
public function integer of_getregistered (ref powerobject apo_registered, ref string as_eventname, ref real ar_interval, ref integer ai_style)
public function integer of_setautodisable (boolean ab_switch)
public function boolean of_isautodisable ()
end prototypes

event pfc_timer;call super::pfc_timer;//////////////////////////////////////////////////////////////////////////////
//
//	Event: pfc_timer
//
//	Arguments: None
//
//	Returns:  integer
//	1 - Success
// 0 - Disabled
//	-1 - Error
//
//	Description:
//	Notify the registered object.
//
// Note:
//	While this process is going on, ignore any timer interrupts that may occur.
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

If of_IsDisabled() Then 
	// We are busy then reject any timer interrupts
	Return 0
End If

If of_IsAutoDisable() Then
	// Disable the service.
	of_SetDisabled(True)
End If

If IsValid(ipo_notifyobject) And Len(Trim(is_notifyevent)) > 0 Then
	// Notify the object.
	If ii_notifystyle = TRIGGEREVENT Then
		ipo_notifyobject.TriggerEvent(is_notifyevent)
	Else
		ipo_notifyobject.PostEvent(is_notifyevent)
	End If
End If

If of_IsAutoDisable() Then
	// OK to start processing timer interrupts again
	of_SetDisabled(False)
End If

Return 1
end event

public function integer of_getcount ();//////////////////////////////////////////////////////////////////////////////
//
//	Function: of_getcount
//
//	Access: public
//
//	Arguments: 	None
//
//	Returns: integer 
// 1 - An object is registered.
// 0 - No object has been registered.
// -1 - Error
//
//	Description:
//	Returns the number of object/events registered.  Either 1 or 0.
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

If IsValid(ipo_notifyobject) Then
	Return 1
End If

Return 0
end function

public function boolean of_isdisabled ();//////////////////////////////////////////////////////////////////////////////
//
//	Function: of_IsDisabled
//
//	Access: 	public
//
//	Arguments: None
//
//	Returns:
//	Boolean : True = the service is disabled , False = the service is not
//
//	Description:
//	Returns the 'disabled state' of the service. 
//
//	Note:
//	If disabled then the service is not sending notifications to the objects 
//	that have registered with it.
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

Return ib_disabled
end function

public function integer of_setdisabled (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Disabled
//
//	Access: 	public
//
//	Arguments:  
//	ab_switch  The new state for the disabled switch
//
//	Returns:
//	integer
//	SUCCESS = 1
//	ERR = -1
//
//	Description:
//	Set the state of the disabled switch.
//
// Note:
//	When True, it prevents the service from sending any notifications to any of the 
//	objects that are registered with it.
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

// Validate arguments
If IsNull(ab_switch) Then Return -1

ib_disabled = ab_switch
return 1
end function

public function boolean of_isregistered (powerobject apo_object);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_IsRegistered
//
//	Access:
//	public
//
//	Arguments:
//	apo_object : powerobject ; Object to be searched for
//
//	Returns:
//	Boolean
//	SUCCESS = True
//	Entry not found = False
//
//	Description:
//	Returns whether the passed in object was found or not.
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

// Validate the arguments.
If isnull(apo_object) Then Return false
If not isvalid(apo_object) Then Return false

If IsValid(ipo_notifyobject) Then
	If ipo_notifyobject = apo_object Then
		Return True
	End If
End If

// Not found
Return false

end function

public function boolean of_isregistered (powerobject apo_object, string as_eventname);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_IsRegistered
//
//	Access:
//	public
//
//	Arguments:
//	apo_object : powerobject ; Object to be searched for
//	as_eventname : string; Event to be searched for
//
//	Returns:
//	Boolean
//	SUCCESS = True
//	Entry not found = False
//
//	Description:
//	Returns whether the passed in object/eventname pair was found or not.
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

// Validate the arguments.
If isnull(apo_object) Then Return false
If not isvalid(apo_object) Then Return false
If len(trim(as_eventname)) = 0 Then Return false

If IsValid(ipo_notifyobject) Then
	If ipo_notifyobject = apo_object And is_notifyevent = Trim(Lower(as_eventname)) Then
		Return True
	End If
End If

// Not found
Return false
end function

public function integer of_unregister ();//////////////////////////////////////////////////////////////////////////////
//
//	Function: of_UnRegister
//
//	Access: 	public
//
//	Arguments: 	None
//
//	Returns:
//	integer : the number of entries that were unregistered
//
//	Description:
//	Unregister all entries.
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

// Validated required references.
If IsNull(itmg_requestor) Or Not IsValid(itmg_requestor) Then
	Return -1
End If

If IsValid(ipo_notifyobject) Then
	// Unregister the current entry.
	ipo_notifyobject = lpo_notvalid
	is_notifyevent = ''
	ir_interval = 0
	itmg_requestor.Stop()
	Return 1
End If

Return 0
end function

public function integer of_setrequestor (n_tmg atmg_requestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetRequestor
//
//	Access:    Public
//
//	Arguments:
// atmg_requestor   The timing object requesting the service
//
//	Returns:  None
//
//	Description: 
//	Associates a timing object control with a timing object service.
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

If IsNull(atmg_requestor) or Not IsValid(atmg_requestor) Then
	Return -1
End If

itmg_requestor = atmg_requestor
Return 1
end function

public function integer of_register (powerobject apo_object, string as_eventname, real ar_interval);//////////////////////////////////////////////////////////////////////////////
//
//	Function: of_Register
//
//	Access: public
//
//	Arguments:
//	apo_object : powerobject ; Object to be notified
//	as_eventname : string; Event to be notified
//	ar_interval : long ; How often to notify (in seconds)
//
//	Returns: integer
//	1 - Success
//	-1 - Errror
//
//	Description:
//	Registers the passed object/event pair. 
//
// Note:
//	There can only be one object registered.
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

integer 	li_cnt
integer	li_idx
integer	li_firstopening
integer	li_rc
long 		ll_row
string 	ls_filter
time 		it_now
datetime idtm_nexttime

// Validate the arguments
If isnull(apo_object) Then Return -1
If Not isvalid(apo_object) Then Return -1
If len(trim(as_eventname)) = 0 Then Return -1

// Validate required references.
If IsNull(itmg_requestor) Or Not IsValid(itmg_requestor) Then Return -1

// No interrupts while processing
itmg_requestor.Stop()

// Check for the valid minimum and maximum intervals.
If ar_interval < .055 Then ar_interval = .055
If ar_interval > 65 Then ar_interval = 65

// Keep track of the new object/event to notify.
ipo_notifyobject = apo_object
is_notifyevent = Trim(Lower(as_eventname))
ir_interval = ar_interval

// Start the interrupts.
itmg_requestor.Start(ir_interval)

Return 1
end function

public function real of_getinterval ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_GetInterval
//
//	Access:
//	public
//
//	Arguments:
//	None
//
//	Returns:
//	real
//	# - The interval.
//	0 - No interval defined; 
//
//	Description:
//	Returns the current interval
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

Return ir_interval
end function

public function integer of_register (powerobject apo_object, string as_eventname, real ar_interval, integer ai_style);//////////////////////////////////////////////////////////////////////////////
//
//	Function: of_Register
//
//	Access: public
//
//	Arguments:
//	apo_object : powerobject ; Object to be notified
//	as_eventname : string; Event to be notified
//	ar_interval : long ; How often to notify (in seconds)
//	ai_style: integer ; The style - TriggerEvent or PostEvent.
//
//	Returns: integer
//	1 - Success
//	-1 - Errror
//
//	Description:
//	Registers the passed object/event pair. 
//
// Note:
//	There can only be one object registered.
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

integer 	li_cnt
integer	li_idx
integer	li_firstopening
integer	li_rc
long 		ll_row
string 	ls_filter
time 		it_now
datetime idtm_nexttime

// Validate the arguments
If isnull(apo_object) Then Return -1
If Not isvalid(apo_object) Then Return -1
If len(trim(as_eventname)) = 0 Then Return -1
If ai_style <> TRIGGEREVENT And ai_style <> POSTEVENT Then Return -1

// Validate required references.
If IsNull(itmg_requestor) Or Not IsValid(itmg_requestor) Then Return -1

// No interrupts while processing
itmg_requestor.Stop()

// Check for the valid minimum and maximum intervals.
If ar_interval < .055 Then ar_interval = .055
If ar_interval > 65 Then ar_interval = 65

// Keep track of the new object/event to notify.
ipo_notifyobject = apo_object
is_notifyevent = Trim(Lower(as_eventname))
ir_interval = ar_interval
ii_notifystyle = ai_style

// Start the interrupts.
itmg_requestor.Start(ir_interval)

Return 1
end function

public function integer of_getregistered (ref powerobject apo_registered, ref string as_eventname, ref real ar_interval, ref integer ai_style);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_GetRegistered
//
//	Access:
//	public
//
//	Arguments:
//	apo_registered (by ref) - The object registered.
//	as_eventname (by ref)	- Then event to go with the registered object.
//	ar_interval (by ref)		- The interval
//	ai_style (by ref)			- The notification style.
//
//	Returns: integer 
//	1 - Success
// 0 - Nothing registered
//	-1 - Error
//
//	Description:
//	Returns the object registered.
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

// Clear the references.
apo_registered = lpo_notvalid
as_eventname = ''
ar_interval = 0
ai_style = 0

If IsValid(ipo_notifyobject) Then
	apo_registered = ipo_notifyobject
	as_eventname = is_notifyevent
	ar_interval = ir_interval
	ai_style = ii_notifystyle
	Return 1
End If

Return 0


end function

public function integer of_setautodisable (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetAutoDisable
//
//	Access: 	public
//
//	Arguments:  
//	ab_switch  The new state for the auto disable switch
//
//	Returns:
//	integer
//	SUCCESS = 1
//	ERR = -1
//
//	Description:
//	Set the state of the auto disable switch.
//
// Note:
//	When True, the service will set the ib_disabled attribute to 
//	disable / enable at appropriate times.
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

// Validate arguments
If IsNull(ab_switch) Then Return -1

ib_autodisable = ab_switch
return 1
end function

public function boolean of_isautodisable ();//////////////////////////////////////////////////////////////////////////////
//
//	Function: of_IsAutoDisable
//
//	Access: 	public
//
//	Arguments: None
//
//	Returns:
//	Boolean : the status of the auto disable switch
//
//	Description:
//	Returns the 'auto disable status' of the service. 
//
// Note:
//	When True, the service will set the ib_disabled attribute to 
//	disable / enable at appropriate times.
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

Return ib_autodisable
end function

on pfc_n_cst_tmgsingle.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_tmgsingle.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event: Constructor
//
//	Description:
//	The Timing Single the service.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
// 6.0.01 Removed instance variable for the datetime service.
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
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


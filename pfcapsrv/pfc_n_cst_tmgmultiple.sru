HA$PBExportHeader$pfc_n_cst_tmgmultiple.sru
$PBExportComments$PFC timing multiple object service
forward
global type pfc_n_cst_tmgmultiple from n_base
end type
end forward

global type pfc_n_cst_tmgmultiple from n_base
event type integer pfc_timer ( )
end type
global pfc_n_cst_tmgmultiple pfc_n_cst_tmgmultiple

type variables
Public:
constant integer	TRIGGEREVENT = 0
constant integer	POSTEVENT = 1

Protected:
n_tmg		itmg_requestor
boolean 		ib_disabled = False
boolean		ib_autodisable = True
long 		il_interval = 0
n_ds 		ids_list
n_cst_datetime 	inv_datetime
n_cst_tmgregisterattrib inv_tmgregister[]
end variables

forward prototypes
public function long of_gcommondenominator (long al_one, long al_two)
public function integer of_getcount ()
public function long of_getinterval ()
public function boolean of_isdisabled ()
public function integer of_setdisabled (boolean ab_switch)
public function boolean of_isregistered (powerobject apo_object)
public function boolean of_isregistered (powerobject apo_object, string as_eventname)
public function long of_recalcinterval ()
public function integer of_unregister ()
public function integer of_unregister (powerobject apo_object)
public function integer of_unregister (powerobject apo_object, string as_eventname)
public function integer of_setrequestor (n_tmg atmg_requestor)
public function integer of_getregistered (ref n_cst_tmgregisterattrib anv_timerattrib[])
public function integer of_register (powerobject apo_object, string as_eventname, long al_interval, integer ai_notifystyle)
public function integer of_Register (powerobject apo_object, string as_eventname, long al_interval)
public function integer of_SetAutoDisable (boolean ab_switch)
public function boolean of_IsAutoDisable ()
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
//	Processes all registered objects that have enties where the next time that 
//	they are to be notified is after the time received.
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

string	ls_filter
integer 	li_rc
integer	li_rowcount
integer	li_idx = 1
integer	li_index
datetime	ldtm_when
boolean	lb_deleted = False

If of_IsDisabled() Then 
	// We are busy then reject any timer interrupts
	Return 0
End If

If of_IsAutoDisable() Then
	// Disable the service.
	of_SetDisabled(True)
End If

ldtm_when = datetime(today(),now())
// Filter the datastore
ls_filter =  "next_time <= datetime(date('"+ &
	string(date(ldtm_when),'[shortdate]')+"'), time('"+ &
	string(time(ldtm_when),'[time]')+"'))"
li_rc = ids_list.SetFilter(ls_filter)
li_rc = ids_list.Filter()
li_rc = ids_list.Sort()

// Process any rows that are ready to go
li_rowcount = ids_list.rowCount()
Do While li_idx <= li_rowcount
	li_index = ids_list.object.index[li_idx]
	If isvalid(inv_tmgregister[li_index].ipo_notify) Then
		
		// Notify the object.
		If inv_tmgregister[li_index].ii_notifystyle = TRIGGEREVENT Then
			inv_tmgregister[li_index].ipo_notify.TriggerEvent( &
				inv_tmgregister[li_index].is_notifyevent)
		Else
			inv_tmgregister[li_index].ipo_notify.PostEvent( &
				inv_tmgregister[li_index].is_notifyevent)			
		End If
			
		ldtm_when = ids_list.object.next_time[li_idx]
		ldtm_when = inv_datetime.of_RelativeDatetime( &
			ldtm_when, inv_tmgregister[li_index].il_notifyinterval)
		ids_list.object.next_time[li_idx] = ldtm_when
		li_idx++
	Else  
		// Update the Support list.
		//	keep the loop index in the same place so we can get the next row.
		// decrement the number of rows.
		ids_list.DeleteRow(li_idx)  
		li_rowcount --
		lb_deleted = True
	End If
Loop

If lb_deleted Then 
	// found at least one entry that was no longer valid.
	// Recalculate the interval.
	of_ReCalcInterval() 
End If

If of_IsAutoDisable() Then
	// OK to start processing timer interrupts again
	of_SetDisabled(False)
End If

Return 1
end event

public function long of_gcommondenominator (long al_one, long al_two);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_GCommonDenominator
//
//	Access:
//	protected
//
//	Arguments:
//	al_one : Long; parameter #1
//	al_two : Long; parameter #2
//
//	Returns:
//	long : the GCD of the two numbers
// -1 : Error
//
//	Description:
//	Calculates the Greatest Common Denominator of the two values
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

long	ll_rem
long	ll_temp

// Validate the arguments.
If IsNull(al_one) Or IsNull(al_two) Then Return -1

// Make the first parameter the largest
if al_two > al_one then 
	ll_temp = al_one
	al_one = al_two
	al_two = ll_temp
end if

// Determine the remainder
ll_rem = Mod(al_one, al_two) 

// If it's zero then we are done
if ll_rem = 0 then return al_two

// Use the remainder as input
Return of_GCommonDenominator(al_two, ll_rem)

end function

public function integer of_getcount ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_getcount
//
//	Access:
//	public
//
//	Arguments:
//	None
//
//	Returns:
//	integer : the number of object/event name pairs registered with the service
//
//	Description:
//	Returns the number of object/event name pairs registered with the service
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
integer	li_count=0

// Loop around all entries, count the number of valid entries.
li_cnt = upperbound(inv_tmgregister)
For li_idx = 1 To li_cnt
	If isvalid(inv_tmgregister[li_idx].ipo_notify) Then
		// Found a valid object, increment the count.
		li_count ++
	End If
Next

Return li_count
end function

public function long of_getinterval ();//////////////////////////////////////////////////////////////////////////////
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
//	long
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

Return il_interval
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
//	Function:  of_SetDisabled
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

integer	li_cnt
integer	li_idx

// Validate the argument.
If isnull(apo_object) Then Return false
If not isvalid(apo_object) Then Return false

// Loop, find the object pair
li_cnt = upperbound(inv_tmgregister)
For li_idx = 1 To li_cnt
	If isvalid(inv_tmgregister[li_idx].ipo_notify) Then
		If inv_tmgregister[li_idx].ipo_notify = apo_object Then
			Return true
		End If
	End If
Next

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

integer 	li_cnt
integer	li_idx

// Validate the arguments.
If isnull(apo_object) Then Return false
If not isvalid(apo_object) Then Return false
If len(trim(as_eventname)) = 0 Then Return false

// Loop, find the object/event pair
li_cnt = upperbound(inv_tmgregister)
For li_idx = 1 To li_cnt
	If isvalid(inv_tmgregister[li_idx].ipo_notify) Then
		If inv_tmgregister[li_idx].ipo_notify = apo_object And &
			inv_tmgregister[li_idx].is_notifyevent = as_eventname Then
			Return true
		End If
	End If
Next

// Not found
Return false
end function

public function long of_recalcinterval ();//////////////////////////////////////////////////////////////////////////////
//
//	Function: of_ReCalInterval
//
//	Access:  protected
//
//	Arguments: None
//
//	Returns: integer
//	# - The new interval
//	ERR = -1
//
//	Description:
//	Calculates a new interval.
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

integer	li_cnt
integer	li_idx = 1
long  	ll_gcd = 0

// Find the first valid entry and get it's interval
li_cnt = upperbound(inv_tmgregister)
Do While li_idx <= li_cnt 
	If isvalid(inv_tmgregister[li_idx].ipo_notify) Then
		ll_gcd = inv_tmgregister[li_idx].il_notifyinterval
		Exit
	End If
	li_idx++
Loop

If ll_gcd > 0 Then 
	// We found a valid entry.
	// Now look at the rest of the intervals and determine 
	//	the GCD (greatest Common Divisor).
	Do While li_idx < li_cnt 
		li_idx++
		If isvalid(inv_tmgregister[li_idx].ipo_notify) Then
			ll_gcd = of_GCommonDenominator(inv_tmgregister[li_idx].il_notifyinterval,ll_gcd)
			If ll_gcd = 1 Then 
				// No sense in looking further, 1 is the smallest number we handle.
				Exit 
			End If
		End If
	Loop
End If

// Check if the GCD is greater than the maximum PB interval supported.
if ll_gcd > 60 then
	ll_gcd = of_GCommonDenominator(ll_gcd, 60)
end if

// Set and Start the new timer interval.
il_interval = ll_gcd
itmg_requestor.Start(il_interval)
Return il_interval

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

integer	li_cnt
integer	li_count
n_cst_tmgregisterattrib lnv_emptyregister[]

// Validate required references.
If IsNull(itmg_requestor) Or Not IsValid(itmg_requestor) Then Return -1

// No longer need to generate timer interrupts.
itmg_requestor.Stop() 

// Get the number of entries currently registered.
li_count = of_GetCount()

// Reset the main register list.
inv_tmgregister = lnv_emptyregister

// Reset the support register list.
ids_list.reset()

// return the number of entries unregistered.
Return li_count

end function

public function integer of_unregister (powerobject apo_object);//////////////////////////////////////////////////////////////////////////////
//
//	Function: of_UnRegister
//
//	Access: 	public
//
//	Arguments:
//	apo_object : powerobject ; Object to be notified
//
//	Returns:
//	integer
// # - Number of entries removed - could be more than one for the same object.
//	0 - Entry not found
//	-1 - Error
//
//	Description:
//	Removes all entries for the passed object
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

integer	li_cnt
integer	li_idx
integer	li_count = 0
integer	li_rc
integer	li_rowcnt
integer	li_rowidx
string ls_filter
powerobject lpo_invalid

// Validate arguments.
If isnull(apo_object) Then Return -1
If Not isvalid(apo_object) Then Return -1

// Validate required references.
If IsNull(itmg_requestor) Or Not IsValid(itmg_requestor) Then Return -1

// Determine if the object is registered.
If Not of_IsRegistered(apo_object) Then Return 0

// No interrupts while Unregistering.
itmg_requestor.stop() 

// Find the object and unregister it.
li_cnt = upperbound(inv_tmgregister)
For li_idx = 1 To li_cnt
	If isvalid(inv_tmgregister[li_idx].ipo_notify) Then
		If inv_tmgregister[li_idx].ipo_notify = apo_object  Then
			// -- Found the object that needs to be unregistered. --
			
			// Main register list - Make the object point to nothing.
			inv_tmgregister[li_idx].ipo_notify = lpo_invalid
			inv_tmgregister[li_idx].is_notifyevent = ''
			li_count ++
			
			// Support register list - Remove the object entry.
			ls_filter =  "index = "+string(li_idx)
			li_rc = ids_list.SetFilter(ls_filter)
			li_rc = ids_list.Filter()
			li_rowcnt = ids_list.RowCount()
			ids_list.RowsDiscard(1, li_rowcnt, Primary!)
			li_rc = ids_list.SetFilter('')
			li_rc = ids_list.Filter()
		End If
	End If
Next

// Calculate and Set the new interval.
of_ReCalcInterval()

// Return the number of  objects unregistered.
Return li_count

end function

public function integer of_unregister (powerobject apo_object, string as_eventname);//////////////////////////////////////////////////////////////////////////////
//
//	Function: of_UnRegister
//
//	Access: 	public
//
//	Arguments:
//	apo_object : powerobject ; Object to be notified
//	as_eventname : string; Event to be notified
//
//	Returns: integer
//	1 - Success
// 0 - Entry not found
//	-1 - Error
//
//	Description:
//	Removes the entry denoted by the object and event passed in.
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
integer	li_cnt
integer	li_idx
integer	li_functionrc = 0 
integer	li_rowcnt
string 	ls_filter
powerobject lpo_invalid

// Validate arguments.
If isnull(apo_object) Then Return -1
If not isvalid(apo_object) Then Return -1
If len(trim(as_eventname)) = 0 Then Return -1

// Validate required references.
If IsNull(itmg_requestor) Or Not IsValid(itmg_requestor) Then Return -1

// Determine if the object is registered.
If Not of_IsRegistered(apo_object, as_eventname) Then Return 0

// No interrupts while Unregistering.
itmg_requestor.stop() 

// Find the object/event pair.
li_cnt = upperbound(inv_tmgregister)
For li_idx = 1 To li_cnt
	If isvalid(inv_tmgregister[li_idx].ipo_notify) Then
		If inv_tmgregister[li_idx].ipo_notify = apo_object And &
			inv_tmgregister[li_idx].is_notifyevent = as_eventname Then
			
			// -- Found the object that needs to be unregistered. --
			
			// Main register list - Make the object point to nothing.
			inv_tmgregister[li_idx].ipo_notify = lpo_invalid
			inv_tmgregister[li_idx].is_notifyevent = ''
			
			// Support register list - Remove the object entry.			
			ls_filter =  "index = "+string(li_idx)
			li_rc = ids_list.SetFilter(ls_filter)
			li_rc = ids_list.filter()
			li_rowcnt = ids_list.RowCount()
			li_rc = ids_list.RowsDiscard(1, li_rowcnt, primary!)
			li_rc = ids_list.SetFilter('')
			li_rc = ids_list.Filter()
			
			// Set return code that object was unregistered.
			li_functionrc = 1
			Exit
		End If
	End If
Next

// Calculate and set the new interval.
of_ReCalcInterval()

Return li_functionrc

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

public function integer of_getregistered (ref n_cst_tmgregisterattrib anv_timerattrib[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_GetRegistered
//
//	Access:
//	public
//
//	Arguments:
//	anv_timerattrib[] : n_cst_tmgregisterattrib (by ref); array of entries
//
//	Returns:
//	integer : the number of entries in the passed back array
//	SUCCESS = 1
//	ERR = -1
//
//	Description:
//	Returns the list of entries that have been registered.
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

integer	li_get = 0
integer	li_cnt
integer	li_idx
n_cst_tmgregisterattrib lnv_empty[]

// Clear out the reference variable.
anv_timerattrib = lnv_empty

// Find and get the objects.
li_cnt = upperbound(inv_tmgregister)
For li_idx = 1 To li_cnt
	If isvalid(inv_tmgregister[li_idx].ipo_notify) Then
		li_get ++
		anv_timerattrib[li_get] = inv_tmgregister[li_idx]
	End If
Next

Return li_get


end function

public function integer of_register (powerobject apo_object, string as_eventname, long al_interval, integer ai_notifystyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function: of_Register
//
//	Access: public
//
//	Arguments:
//	apo_object : powerobject ; Object to be notified
//	as_eventname : string; Event to be notified
//	al_interval : long ; How often to notify (in seconds)
//	ai_notifystyle: integer ; The style - either TRIGGEREVENT or POSTEVENT.
//
//	Returns: integer
//	SUCCESS = 1
//	ERR = -1
//
//	Description:
//	Registers the passed object/event pair. 
//
// Note:
//	If the object/event pair has already been registered then replace the
//	old interval with the new interval.
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
n_cst_tmgregisterattrib lnv_tmgentry

// Validate the arguments
If isnull(apo_object) Then Return -1
If Not isvalid(apo_object) Then Return -1
If len(trim(as_eventname)) = 0 Then Return -1
If ai_notifystyle <> TRIGGEREVENT And ai_notifystyle <> POSTEVENT Then Return -1

// Validate required references.
If IsNull(itmg_requestor) Or Not IsValid(itmg_requestor) Then Return -1

// No interrupts while processing
itmg_requestor.stop()

if al_interval < 1 then al_interval = 1

// Loop, see if the object/event pair has already been registered.
li_cnt = upperbound(inv_tmgregister)
For li_idx = 1 To li_cnt
	If isvalid(inv_tmgregister[li_idx].ipo_notify) Then
		If inv_tmgregister[li_idx].ipo_notify = apo_object And &
			inv_tmgregister[li_idx].is_notifyevent = as_eventname Then
			
			// Object already registered.
			//	Reset the interval and notifystyle.
			
			// Main register list.
			inv_tmgregister[li_idx].il_notifyinterval = al_interval
			inv_tmgregister[li_idx].ii_notifystyle = ai_notifystyle
			
			// Support register list.
			idtm_nexttime = inv_datetime.of_RelativeDatetime( &
				datetime(today(),now()), inv_tmgregister[li_idx].il_notifyinterval)
			ls_filter =  "index = "+string(li_idx)
			li_rc = ids_list.SetFilter(ls_filter)
			li_rc = ids_list.Filter()
			ids_list.object.next_time[1] = idtm_nexttime
			li_rc = ids_list.SetFilter('')
			li_rc = ids_list.Filter()
			
			// Calculate and set the new interval.
			of_ReCalcInterval()
			Return 1
		End If
	Else
		If li_firstopening = 0 Then 
			// Save the first opening in the array, if there is one
			li_firstopening = li_idx 
		End If
	End If
Next

// No duplicate entries, needs to be added to the list
If li_firstopening > 0 Then 
	// Reuse the opening in the list.
	li_idx = li_firstopening
Else 
	// Add it to the end of the list.
	li_idx = li_cnt + 1
End If

// Add it to the Master list.
lnv_tmgentry.ipo_notify = apo_object
lnv_tmgentry.is_notifyevent = as_eventname
lnv_tmgentry.il_notifyinterval = al_interval
lnv_tmgentry.ii_notifystyle = ai_notifystyle
inv_tmgregister[li_idx] = lnv_tmgentry

// Add it to the Support list.
ll_row = ids_list.InsertRow(0)
ids_list.Object.index[ll_row] = li_idx 
// create a new next time (current time plus the interval)
it_now = RelativeTime(now(), al_interval)
idtm_nexttime = datetime(today(),it_now)
ids_list.Object.next_time[ll_row] = idtm_nexttime

// Calculate and set the new interval.
of_ReCalcInterval()

Return 1
end function

public function integer of_Register (powerobject apo_object, string as_eventname, long al_interval);//////////////////////////////////////////////////////////////////////////////
//
//	Function: of_Register
//
//	Access: public
//
//	Arguments:
//	apo_object : powerobject ; Object to be notified
//	as_eventname : string; Event to be notified
//	al_interval : long ; How often to notify (in seconds)
//
//	Returns: integer
//	SUCCESS = 1
//	ERR = -1
//
//	Description:
//	Registers the passed object/event pair. 
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

Return of_Register(apo_object, as_eventname, al_interval, TRIGGEREVENT)
end function

public function integer of_SetAutoDisable (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
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

public function boolean of_IsAutoDisable ();//////////////////////////////////////////////////////////////////////////////
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

on pfc_n_cst_tmgmultiple.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_tmgmultiple.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event: Constructor
//
//	Arguments: None
//
//	Returns: None
//
//	Description:
//	Timing object - Multiple notifications.
//
//	Note:
//	This object uses 1 second increments. 
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

// Create the datastore
ids_list  = Create n_ds

// Assign the dataobject to the datastore
ids_list.dataobject = 'd_timerlist'

Return 

end event

event destructor;call super::destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event: Destructor
//
//	Arguments: None
//
//	Returns: None
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

if IsValid(ids_list) then destroy ids_list

Return 

end event


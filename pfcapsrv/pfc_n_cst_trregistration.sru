HA$PBExportHeader$pfc_n_cst_trregistration.sru
$PBExportComments$PFC Transaction Registration service
forward
global type pfc_n_cst_trregistration from n_base
end type
end forward

global type pfc_n_cst_trregistration from n_base
end type
global pfc_n_cst_trregistration pfc_n_cst_trregistration

type variables
Protected:
integer		ii_count
//	7.0   Instance variable datatype changed from os_transentry to n_cst_trregistrationattrib type
//	7.0   Instance variable name changed from istr_trans to inv_trans
n_cst_trregistrationattrib	inv_trans[]
boolean		ib_destructordestroy = TRUE
boolean		ib_allowsqlcadestroy = TRUE

// 7.0	This variable is obsolete.  Left in for migration purposes.
//			DO NOT USE THIS VARIABLE
n_cst_trregistrationattrib	istr_trans[]
end variables

forward prototypes
public function integer of_getcount ()
public function integer of_register (n_tr atr_object)
public function integer of_unregister (n_tr atr_obj)
public function integer of_getregistered (ref n_tr atr_obj[])
public function boolean of_isregistered (string as_name)
public function boolean of_isregistered (n_tr atr_obj)
public function integer of_getbyname (string as_name, ref n_tr atr_obj)
public function integer of_setdestructordestroy (boolean ab_switch)
public function integer of_SetAllowSQLCADestroy (boolean ab_switch)
public function boolean of_isallowsqlcadestroy ()
public function boolean of_isdestructordestroy ()
public function integer of_destroy ()
public function integer of_unregister ()
end prototypes

public function integer of_getcount ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetCount
//
//	Access:  		public
//
//	Arguments:  	none
//
//	Returns:  		integer
//						Number of registered transaction objects
//
//	Description:  	Returns the number of registered trans objects
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

return ii_count
end function

public function integer of_register (n_tr atr_object);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Register
//
//	Access:  		public
//
//	Arguments:
//	atr_object   	Transaction object to register.
//
//	Returns:  		integer
//						 1 = success
//						 0 = transaction object has already been registered.
//						-1 = error
//
//	Description:  	Registers a transaction object with the service.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Prevent objects from being registered more than once.
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

integer	li_slotavailable=0
integer	li_cnt=0
integer	li_upperbound=0

// Check arguments.
if IsNull(atr_object) Or not IsValid (atr_object) then
	return -1
end if

// Determine if there is an open slot available.
// Determine if the object has already been registered.
li_upperbound = UpperBound (inv_trans[])
For li_cnt = 1 to li_upperbound
	// Check to see if transaction object was already registered.
	if inv_trans[li_cnt].tr_object = atr_object then
		Return 0
	end if	

	// Determine if there is an open slot.
	if not inv_trans[li_cnt].b_used then
		If li_slotavailable = 0 Then
			//Get the first slot found
			li_slotavailable = li_cnt
		End If		
	end if
Next

//If an available slot was not found then create a new entry
If li_slotavailable = 0 Then
	li_slotavailable = li_upperbound + 1
End If

// Register the transaction object.
inv_trans[li_slotavailable].tr_object = atr_object
inv_trans[li_slotavailable].b_used = true

// Increase count of registered transaction objects.
ii_count++	

Return 1
end function

public function integer of_unregister (n_tr atr_obj);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UnRegister
//
//	Access:  		public
//
//	Arguments:
//	atr_obj   		transaction object to be unregistered
//
//	Returns:  		integer
//	 1 = successful unregister
//	 0 = the specified trans object was not registered
//	-1 = error
//
//	Description:  	
//	Unregisters a transaction object from the service.
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

integer	li_upperbound
integer	li_cnt = 1
boolean	lb_found

// Check arguments
if IsNull(atr_obj) Or not IsValid (atr_obj) then
	return -1
end if

// Find transaction object to unregister
li_upperbound = UpperBound (inv_trans)
do while not lb_found and li_cnt <= li_upperbound
	if inv_trans[li_cnt].tr_object = atr_obj then
		// Unregister the transaction.
		inv_trans[li_cnt].b_used = false
		SetNull (inv_trans[li_cnt].tr_object)
		// Decrease count of registered transaction objects.
		ii_count --
		Return 1
	end if
	li_cnt++
loop

// Trans object not found.
return 0
end function

public function integer of_getregistered (ref n_tr atr_obj[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetRegistered
//
//	Access:  public
//
//	Arguments:
//	atr_obj[]   array of trans objects passed by reference
//
//	Returns:  integer
//	The number of registered transaction objects
//
//	Description:  Returns the registered transaction objects
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

integer	li_upperbound
integer	li_cnt
integer	li_count

// Loop through the registered array.
li_upperbound = UpperBound (inv_trans)
for li_cnt = 1 to li_upperbound
	if inv_trans[li_cnt].b_used and IsValid (inv_trans[li_cnt].tr_object) then
		li_count++
		atr_obj[li_count] = inv_trans[li_cnt].tr_object
	end if
next

return li_count
end function

public function boolean of_isregistered (string as_name);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsRegistered
//
//	Access:  		public
//
//	Arguments:
//	as_name   		Name of the transaction object to check for registration
//
//	Returns:  		boolean
//						Returns whether the transaction object specified is registered
//						with the service.
//
//	Description:	Check whether the transaction object specified is registered
//						with the service.
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

integer	li_upperbound
integer	li_cnt
string	ls_name

// Check if registered.
li_upperbound = UpperBound (inv_trans)
for li_cnt = 1 to li_upperbound
	if inv_trans[li_cnt].b_used and IsValid (inv_trans[li_cnt].tr_object) then
		ls_name = inv_trans[li_cnt].tr_object.of_GetName()
		if ls_name = as_name then
			// The Transaction is registered.
			Return True
		end if
	end if
next

// The Transaction is NOT registered.
Return False
end function

public function boolean of_isregistered (n_tr atr_obj);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsRegistered
//
//	Access:  		public
//
//	Arguments:
//	atr_obj   		Transaction object to check for registration
//
//	Returns:  		boolean
//						Returns whether the transaction object specified is 
//						registered with the service.
//
//	Description:	Checks whether the transaction object specified is 
//						registered with the service.
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

integer	li_upperbound
integer	li_cnt

// Check arguments.
if IsNull(atr_obj) Or not IsValid (atr_obj) then
	return false
end if

// Check if registered
li_upperbound = UpperBound (inv_trans)
for li_cnt = 1 to li_upperbound
	if inv_trans[li_cnt].b_used and IsValid (inv_trans[li_cnt].tr_object) then
		if inv_trans[li_cnt].tr_object = atr_obj then
			// The Transaction is registered.
			Return True
		end if
	end if
next

// The Transaction is NOT registered.
Return False
end function

public function integer of_getbyname (string as_name, ref n_tr atr_obj);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetByName
//
//	Access:  		public
//
//	Arguments:
//	as_name:  		name of the transaction object to get a reference for
//	atr_obj:  		transaction object by reference
//
//	Returns:  		integer
//						1 = success
//						0 = transaction object not found
//
//	Description:  	Gets a reference to the registered trans object based on
//						the name specified.
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

integer	li_upperbound
integer	li_cnt
string	ls_name

// Loop through the registered array.
li_upperbound = UpperBound (inv_trans)
for li_cnt = 1 to li_upperbound
	if inv_trans[li_cnt].b_used and IsValid (inv_trans[li_cnt].tr_object) then
		ls_name = inv_trans[li_cnt].tr_object.of_GetName()
		if ls_name = as_name then
			// Transaction was found.
			atr_obj = inv_trans[li_cnt].tr_object
			Return 1
		end if
	end if
next

// Transaction was not found.
return 0

end function

public function integer of_setdestructordestroy (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetDestructorDestroy
//
//	Access:  		public
//
//	Arguments:
//	ab_switch		The desired switch value
//
//	Returns:  		integer
//	1 = success and -1 for error
//
//	Description:  	
//	Sets the switch value that determines if the Transaction objects registered
//	are destroyed by the destructor process.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0.01   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
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
If IsNull(ab_switch) Then
	Return -1
End If

ib_destructordestroy = ab_switch
return 1

end function

public function integer of_SetAllowSQLCADestroy (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetAllowSQLCADestroy
//
//	Access:  		public
//
//	Arguments:
//	ab_switch		The desired switch value
//
//	Returns:  		integer
//	1 = success and -1 for error
//
//	Description:  	
//	Sets the switch value that determines if the service will go ahead and destroy
// the gloval SQLCA Transaction object.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0.01   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
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
If IsNull(ab_switch) Then
	Return -1
End If

ib_allowsqlcadestroy = ab_switch
return 1

end function

public function boolean of_isallowsqlcadestroy ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsAllowSQLCADestroy
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		boolean
//	The switch value
//
//	Description:  	
//	Returns switch value that determines if the service will go ahead and destroy
// the gloval SQLCA Transaction object when requested.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0.01   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

return ib_allowsqlcadestroy

end function

public function boolean of_isdestructordestroy ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsDestructorDestroy
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		boolean
//	the switch value
//
//	Description:  	
//	Returns the switch value that determines if the Transaction objects registered
//	are destroyed by the destructor process.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0.01   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Return ib_destructordestroy
end function

public function integer of_destroy ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Destroy
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		integer
//	The number of transactions destroyed.  -1 in case of error.
//
//	Description:  	
//	Destroy all registered transaction objects.
//
// Note:
// Performing a destroy on a registed object also has the effect of
//	unregistering it.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0.01   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

integer	li_destroycnt
integer	li_idx
integer	li_upper
n_tr		ltr_object

// Loop around all transaction slots.
li_upper = UpperBound (inv_trans)
For li_idx = 1 To li_upper
	If IsValid (inv_trans[li_idx].tr_object) then
		If Not of_IsAllowSQLCADestroy() Then
			If IsValid(SQLCA) Then
				If inv_trans[li_idx].tr_object = SQLCA Then
					// Service has been asked not to delete the Gloval SQLCA.
					Continue
				End If
			End If
		End If
		// Unregister the transaction; Destroy the transaction.		
		ltr_object = inv_trans[li_idx].tr_object
		of_Unregister(ltr_object)
		Destroy ltr_object
		li_destroycnt ++
	End If
Next

Return li_destroycnt
end function

public function integer of_unregister ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UnRegister
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		integer
//	 The number of transactions that were unregistered. 
//	-1 = error
//
//	Description:  	
//	Unregisters all the transaction objecrts from the service.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0.01   Initial version
//	7.0   Local variable datatype changed from os_transentry to n_cst_trregistrationattrib type
//	7.0   Local variable name changed from lstr_trans to lnv_trans
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Integer li_registedcnt
n_cst_trregistrationattrib	lnv_trans[]

// Get the count of the currently registered transactions.
li_registedcnt = of_GetCount()

// Unregister them all by clearing out the transaction array.
inv_trans = lnv_trans
ii_count = 0

return li_registedcnt
end function

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			destructor
//
//	Description:  	
//	Perform service clenaup.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0.01 Make the destruction of transaction objects optional.
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// If requested, destroy registered transaction objects
If of_IsDestructorDestroy() Then
	of_Destroy()
End If
end event

on pfc_n_cst_trregistration.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_trregistration.destroy
TriggerEvent( this, "destructor" )
end on


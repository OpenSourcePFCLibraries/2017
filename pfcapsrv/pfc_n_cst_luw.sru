HA$PBExportHeader$pfc_n_cst_luw.sru
$PBExportComments$PFC Logical Unit of Work service
forward
global type pfc_n_cst_luw from n_base
end type
end forward

global type pfc_n_cst_luw from n_base
end type
global pfc_n_cst_luw pfc_n_cst_luw

type variables
Public:

Constant String	ALL_OBJECTS = ''
boolean		ib_assist = False

Protected:
Boolean		ib_alwaysvalidate
Boolean		ib_accepttext = True
Boolean		ib_resetflag = False
String		is_instancename
Powerobject	ipo_requestor
Powerobject	ipo_updaterequestor
Powerobject	ipo_pendingupdates[]
n_cst_metaclass	inv_metaclass
n_cst_dberrorattrib	inv_dberrorattrib

// Setup the default of objects to process.  This is can be used to enhance performance.
String		is_typetoprocess = ALL_OBJECTS

end variables

forward prototypes
public function string of_gettypetoprocess ()
public function integer of_getupdaterequestor (ref powerobject apo_requestor)
public function boolean of_isalwaysvalidate ()
public function integer of_postupdate (powerobject apo_control[])
public function integer of_preupdate ()
public function integer of_save (powerobject apo_control, n_tr atr_control)
public function integer of_save (powerobject apo_control, n_tr atr_control[])
public function integer of_save (powerobject apo_control[], n_tr atr_control)
public function integer of_save (powerobject apo_control[], n_tr atr_control[])
public function integer of_setalwaysvalidate (boolean ab_switch)
public function integer of_setrequestor (powerobject apo_requestor)
public function integer of_settypetoprocess (string as_types)
public function integer of_setupdaterequestor (powerobject apo_updaterequestor)
public function integer of_updateprep (powerobject apo_control[])
protected function integer of_updatespending (powerobject apo_control[])
public function integer of_validation (powerobject apo_control[])
public function integer of_update (powerobject apo_control[], boolean ab_accepttext, boolean ab_resetflag)
protected function string of_getclassnames (powerobject apo_control[])
protected function integer of_assist (string as_msg)
protected function boolean of_isselfupdatingobject (powerobject apo_control)
public function integer of_setdberrormsg (n_cst_dberrorattrib anv_dberrorattrib)
protected function integer of_dberror (n_cst_dberrorattrib anv_dberrorattrib)
protected function integer of_endtranerror (n_tr atr_performed[], n_tr atr_secondary[], integer ai_secondaryrc[], integer ai_saverc)
public function integer of_updatespending (powerobject apo_control[], ref powerobject apo_controlpending[])
public function integer of_begintran (n_tr atr_control[])
public function integer of_endtran (n_tr atr_control[], integer ai_saverc)
public function integer of_accepttext (powerobject apo_control[], boolean ab_focusonerror)
protected function string of_gettype (powerobject apo_control)
end prototypes

public function string of_gettypetoprocess ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_GetTypeToProcess
//
//	Access:  public
//
//	Arguments: None
//
//	Returns:  string
//	The objects the functions are operation on.  If the value matches the 
//	ALL_OBJECTS constant then all objects are being supported.
//
//	Description:
//	Gets the types of objects the processes are operating on.
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

Return is_typetoprocess
end function

public function integer of_getupdaterequestor (ref powerobject apo_requestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_GetUpdateRequestor
//
//	Access:    Public
//
//	Arguments:
//   apo_requestor (by reference)  The True (original) object requesting Updates.
//
//	Returns:  Integer
//		1 if it succesful. 
//	 	0 if there is no requestor.
// 	-1 in error.
//
//	Description:  
//	Gets the powerobject reference that has been associated with this the LUW 
//	service.  This is the referece, that where appropriate, the LUW service is
//	using when requesting functionality to the SelfUpdatingObjects.
// If not set the LUW will use itself as that reference.
//
//	Note:
//	This reference is not required.
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

If IsValid(ipo_updaterequestor) Then
	// Requestor object was found.
	apo_requestor = ipo_updaterequestor
	Return 1
End If

// No requestor object was found. 
//	Note that a requestor object is not needed by the LUW service.
apo_requestor = lpo_notvalid
Return 0
end function

public function boolean of_isalwaysvalidate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_IsAlwaysValidate
//
//	Access:  Public
//
//	Arguments:	None
//
//	Returns:  boolean
//
//	Description:
//	Gets the estate of the AlwaysValidate functionality.
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

public function integer of_postupdate (powerobject apo_control[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_postupdate
//
//	Access:  public
//
//	Arguments:  
//	apo_control[]  Array of controls that need processing.
//
//	Returns:  integer 
//	 1 = success
//	-1 = fail
//
//	Description:
//	Resets the datawindow update flags on a successful save
//
//	Note:	 
//	This function is called recursively to handle tab controls and user objects.
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

Any			la_rc
Integer		li_max
Integer		li_i
Integer		li_rc
String		ls_args[]
Boolean		lb_defined
PowerObject lpo_tocheck
UserObject	luo_control
tab			ltab_control
window		lw_control
DataWindow	ldw_nonpfc
DataStore	lds_nonpfc

// If requested use the assist funtionality.
If ib_assist Then 
	of_Assist(is_instancename+'.of_PostUpdate('+of_GetClassNames(apo_control)+')')
End If

// Loop thru all the objects
li_max = UpperBound (apo_control)
For li_i = 1 to li_max
	lpo_tocheck = apo_control[li_i]
	If IsNull(lpo_tocheck) or Not IsValid(lpo_tocheck) Then Continue
	
	Choose Case TypeOf ( lpo_tocheck )

		// Windows!, Tabs!, and UserObjects! can either be SelfUpdatingObjects (SUO) or
		// they can be controls which may be holding SelfUpdatingObjects.
		// If they are found to be SUO then they will treated as such, if not their
		// respective control array will be traversed in search of other SUOs.

		Case Window!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then					
				// Test for Window Controls (which may contain SelfUpdatingObjects)
				lw_control = lpo_tocheck
				li_rc = This.of_PostUpdate ( lw_control.control ) 
				If li_rc < 0 Then Return -1
				Continue
			End If

		Case Tab!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then					
				// Test for Tab Controls (which contain TabPages which may contain SelfUpdatingObjects)
				ltab_control = lpo_tocheck
				li_rc = This.of_PostUpdate ( ltab_control.control ) 
				If li_rc < 0 Then Return -1
				Continue
			End If

		Case UserObject!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then							
				// Test for UserObjects (which may contain SelfUpdatingObjects)
				luo_control = lpo_tocheck
				li_rc = This.of_PostUpdate ( luo_control.control ) 
				If li_rc < 0 Then Return -1
				Continue
			End If

	End Choose
		
	// -- An object which 'may' be a SUO has been encountered. --		
		
	// Determine if the SUO type is one the service has been asked to process.
	If Len (is_typetoprocess) > 0 Then
		If Pos (is_typetoprocess, of_GetType(lpo_tocheck)) = 0 Then
			// Not a SUO type the service has been asked to process.
			Continue
		End If
	End If					
		
	// Check/Perform for SelfUpdatingObject Functionality.
	lb_defined = inv_metaclass.of_isFunctionDefined &
		(lpo_tocheck.ClassDefinition, "of_PostUpdate", ls_args)
	If lb_defined Then
		li_rc = lpo_tocheck.Function Dynamic of_PostUpdate ()
		If li_rc < 0 Then Return -1
		Continue
	End If
	
	// Handle Reseting of NonPFC DataWindows/DataStores.
	If TypeOf (lpo_tocheck) = DataWindow! Then
		ldw_nonpfc = lpo_tocheck
		If ldw_nonpfc.ResetUpdate() < 0 Then
			Return -1
		End If
	ElseIf TypeOf (lpo_tocheck) = DataStore! Then
		lds_nonpfc = lpo_tocheck
		If lds_nonpfc.ResetUpdate() < 0 Then
			Return -1
		End If
	End If	
				
Next

// All were successful.
Return 1

end function

public function integer of_preupdate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_PreUpdate
//
//	Access:  public
//
//	Arguments:	None
//
//	Returns:   integer
//	 1 = preupdate was successful
//	-1 = error
//
//	Description:
//	Executes the 'Generic' PreUpdate functionality.
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

Return 1
end function

public function integer of_save (powerobject apo_control, n_tr atr_control);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_Save
//
//	Access:  public
//
//	Arguments:
//	apo_control 	object to save.
//	atr_control		transaction on which to perform Begin/End processing.
//
//	Returns:  integer
//	See of_Save(with all parameters) for return values.
//
//	Description:
//	Performs a save operation on the passed in object.
//
//	Note: The transaction object(s) must have valid 
//	of_Begin(), of_Commit(), and of_Rollback() functions.
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

powerobject lpo_control[]
n_tr ltr_control[]

lpo_control[1] = apo_control
ltr_control[1] = atr_control

Return of_Save(lpo_control, ltr_control)
end function

public function integer of_save (powerobject apo_control, n_tr atr_control[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_Save
//
//	Access:  public
//
//	Arguments:
//	apo_control		object to save.
//	atr_control[]	array of transactions on which to perform Begin/End processing.
//
//	Returns:  integer
//	 See of_Save(with all parameters) for return values.
//
//	Description:
//	Performs a save operation on the passed in object.
//
//	*Note: The transaction object(s) must have valid 
//		of_Begin(), of_Commit(), and of_Rollback() functions.
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

powerobject lpo_control[]

lpo_control[1] = apo_control

Return of_Save(lpo_control, atr_control)
end function

public function integer of_save (powerobject apo_control[], n_tr atr_control);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_Save
//
//	Access:  public
//
//	Arguments:
//	apo_control[] 	array of objects to save.
//	atr_control[] 	transaction on which to perform Begin/End processing.
//
//	Returns:  integer
//	 See of_Save(with all parameters) for return values.
//
//	Description:
//	Performs a save operation on the passed in objects.
//
//	*Note: The transaction object(s) must have valid 
//		of_Begin(), of_Commit(), and of_Rollback() functions.
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

n_tr ltr_control[]

ltr_control[1] = atr_control

Return of_Save(apo_control, ltr_control)
end function

public function integer of_save (powerobject apo_control[], n_tr atr_control[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_Save
//
//	Access:  public
//
//	Arguments:  
//	apo_control[] array of objects to save.
//	atr_control[] array of transactions on which to perform Begin/End processing.
//
//	Returns:  integer
//	 1 = success
//	 0 = No pending changes found 
//	-1 = AcceptText error
//	-2 = UpdatesPending error was encountered
//	-3 = Validation error was encountered
// -9 = The UpdatePrep process failed
//	-4 = The PreUpdate process failed
//	-5 = The BeginTran process failed
//	-6 = The Update process failed
//	-7 = The EndTran process failed
//	-8 = The PostSave process failed
//
//	Description:
//	Performs a save operation on the passed in objects.
//
//	*Note: The transaction object(s) must have valid 
//		of_Begin(), of_Commit(), and of_Rollback() functions.
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

Integer		li_pending_rc = 1
Integer		li_validation_rc = 1
Integer		li_rc
Integer		li_save_rc = 1
Integer		li_endtran_rc = 1
string 		ls_msgparm[]
Boolean		lb_focusonerror = True
PowerObject lpo_pending[]

// Validate Arguments.
If IsNull(apo_control) Then Return 0
If UpperBound(apo_control) = 0 Then Return 0

// If requested use the assist funtionality.
If ib_assist Then 
	of_Assist(is_instancename+'.of_Save('+of_GetClassNames(apo_control)+')')
End If

// Apply the contents of the edit controls to all datawindows
If This.of_accepttext (apo_control, lb_focusonerror) <0 Then 
	Return -1
End If

// Determine if any changes are pending.
li_pending_rc = This.of_updatespending(apo_control, lpo_pending) 
If li_pending_rc < 0 Then
	Return -2
End If

// Check for Errors on controls.
If ib_alwaysvalidate Then
	li_validation_rc = This.of_validation(apo_control)
ElseIf li_pending_rc > 0 Then
	li_validation_rc = This.of_validation(lpo_pending)
End If
If li_validation_rc <0 Then 
	Return -3
End If	

If li_pending_rc = 0 Then 
	// No changes to update were found.
	Return 0
End If

// Perform the Update Preparation process.
If This.of_UpdatePrep(lpo_pending) <> 1 Then Return -9

// Perform the preupdate process. 
If This.of_PreUpdate() <> 1 Then Return -4

// Begin the transaction.
If This.of_begintran(atr_control) <> 1 Then Return -5

// Update the changed objects.
li_save_rc = This.of_Update (lpo_pending, ib_accepttext, ib_resetflag ) 

// Perform the endtransaction process.
li_endtran_rc = This.of_endtran(atr_control, li_save_rc)

// If appropriate, display dberror message.
If li_save_rc<=0 Then This.of_dberror(inv_dberrorattrib)

// Check for a successful save before performing any post operation.
If li_save_rc <> 1 Then Return -6

// Check for a successful end transaction before performing any post operation.
If li_endtran_rc <> 1 Then Return -7

// Perform the postupdate process.
If This.of_PostUpdate(lpo_pending) <> 1 Then Return -8

Return 1
end function

public function integer of_setalwaysvalidate (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_SetAlwaysValidate
//
//	Access:  Public
//
//	Arguments:
//	ab_switch:  specifies whether the AlwaysValidate functionality is desired.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets whether the AlwaysValidate functionality is desired.
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
if IsNull (ab_switch) then return -1
ib_alwaysvalidate = ab_switch
return 1
end function

public function integer of_setrequestor (powerobject apo_requestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_SetRequestor
//
//	Access:    Public
//
//	Arguments:
//   apo_requestor   The object requesting the service.
//
//	Returns:  Integer
//	1 if it succesful. 
// -1 in error.
//
//	Description:  
//	Associates a requestor powerobject control with the LUW service.
//
//	Note:
//	This reference is not required.
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

// Validate argument.
If IsNull(apo_requestor) or Not IsValid(apo_requestor) Then Return -1

// Set the requestor
ipo_requestor = apo_requestor

// Give the object a better unique name.
is_instancename = ipo_requestor.ClassName()+'.'+this.ClassName()
Return 1
end function

public function integer of_settypetoprocess (string as_types);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_SetTypeToProcess
//
//	Access:  public
//
//	Arguments:  
//	as_types	The types of objects the Save Process should operate on.  These should
//				be a space separated list of the types.  To support all of the objects
//				use the ALL_OBJECTS constant.
//				For example set it to this common set:
//				'window tab userobject nonvisualobject datawindow listview '+
//				'richtextedit treeview datastore'
//
//	Returns:  integer
//	1 success
//	-1 error
//
//	Description:
//	Sets the types of objects the Save Process should operate on.
//
//	Note:
//	To support all of the objects set it to match the ALL_OBJECTS constant.
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

// Check the argument.
If IsNull(as_types) Then
	Return -1
End If

is_typetoprocess = Lower(as_types)
Return 1
end function

public function integer of_setupdaterequestor (powerobject apo_updaterequestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_SetUpdateRequestor
//
//	Access:    Public
//
//	Arguments:
//   apo_updaterequestor   The True (original) object requesting Updates.
//
//	Returns:  Integer
//		1 if it succesful. 
// 	-1 in error.
//
//	Description:  
//	Associates a powerobject control with this the LUW service.  Where appropriate
//	the LUW service will use this object reference as the object requesting 
// functionality to the SelfUpdatingObjects.  If not set the LUW will use itself
// as that reference.
//
//	Note:
//	This reference is not required.
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

// Check for a valid reference is not desired.
ipo_updaterequestor = apo_updaterequestor
Return 1
end function

public function integer of_updateprep (powerobject apo_control[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_UpdatePrep
//
//	Access:  public
//
//	Arguments:		
//	apo_control   Array of controls that need update preparation.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Perform update preparation for each object in the specified powerobject array.
//
//	Note:	 
//	This function is called recursively to handle tab controls and user objects.
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

Any			la_rc
Integer		li_max
Integer		li_i
Integer		li_rc
String		ls_args[]
Boolean		lb_defined
PowerObject lpo_tocheck
UserObject	luo_control
Tab			ltab_control
Window		lw_control
DataWindow	ldw_nonpfc

// If requested use the assist funtionality.
If ib_assist Then 
	of_Assist(is_instancename+'.of_UpdatePrep('+of_GetClassNames(apo_control)+')')
End If

// Loop thru all the objects
li_max = UpperBound (apo_control)
For li_i = 1 to li_max
	lpo_tocheck = apo_control[li_i]
	If IsNull(lpo_tocheck) or Not IsValid(lpo_tocheck) Then Continue
	
	Choose Case TypeOf ( lpo_tocheck )

		// Windows!, Tabs!, and UserObjects! can either be SelfUpdatingObjects (SUO) or
		// they can be controls which may be holding SelfUpdatingObjects.
		// If they are found to be SUO then they will treated as such, if not their
		// respective control array will be traversed in search of other SUOs.

		Case Window!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then			
				// Test for Window Controls (which may contain SelfUpdatingObjects)
				lw_control = lpo_tocheck
				li_rc = This.of_UpdatePrep ( lw_control.control ) 
				If li_rc < 0 Then Return -1
				Continue
			End If				

		Case Tab!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then			
				// Test for Tab Controls (which contain TabPages which may contain SelfUpdatingObjects)
				ltab_control = lpo_tocheck
				li_rc = This.of_UpdatePrep ( ltab_control.control ) 
				If li_rc < 0 Then Return -1
				Continue
			End If				

		Case UserObject!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then			
				// Test for UserObjects (which may contain SelfUpdatingObjects)
				luo_control = lpo_tocheck
				li_rc = This.of_UpdatePrep ( luo_control.control ) 
				If li_rc < 0 Then Return -1
				Continue
			End If				

	End Choose
			
	// -- An object which 'may' be a SUO has been encountered. --			
		
	// Determine if the SUO type is one the service has been asked to process.
	If Len (is_typetoprocess) > 0 Then
		If Pos (is_typetoprocess, of_GetType(lpo_tocheck)) = 0 Then
			// Not a SUO type the service has been asked to process.
			Continue
		End If
	End If					
		
	// Check/Perform for Functionality
	lb_defined = inv_metaclass.of_isFunctionDefined &
		(lpo_tocheck.ClassDefinition, "of_UpdatePrep", ls_args)
	If lb_defined Then
		li_rc = lpo_tocheck.Function Dynamic of_UpdatePrep ()
		If li_rc < 0 Then Return -1
		Continue
	End If
		
	// Handle NonPFC DataWindows/DataStores.
	If TypeOf (lpo_tocheck) = DataWindow! or TypeOf (lpo_tocheck) = DataStore! Then
		la_rc = lpo_tocheck.Event Dynamic ue_updateprep ()
		If ClassName(la_rc) = 'integer' or ClassName(la_rc)='long' Then
			// Functionality was found.
			If la_rc < 0 Then Return -1
		End If
	End If	
Next


// No errors found.
Return 1

end function

protected function integer of_updatespending (powerobject apo_control[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_UpdatesPending
//
//	Access:  protected
//
//	Arguments:
//	apo_control array of controls to check for any updates pending
//
//	Returns:  integer
//	 # of objects with updates pending
//	-1 = error
//
//	Description:
//	Check in each object for updatespending for the specified array and store
//	references in ipo_pendingupdates
//
//	Note:
//	This function is called recursively to handle tab controls and UserObjects
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

Integer		li_newupper, li_max, li_i, li_rc
Boolean		lb_updatespending=False
Boolean		lb_performedtest=False
any			la_rc
string		ls_updatetable
string		ls_args[]
Boolean		lb_defined
Powerobject	lpo_tocheck
UserObject	luo_control
tab			ltab_control
Window		lw_control
DataWindow 	ldw_nonpfc
DataStore	lds_nonpfc

// If requested use the assist funtionality.
If ib_assist Then 
	of_Assist(is_instancename+'.of_UpdatesPending('+of_GetClassNames(apo_control)+')')
End If

// Loop thru all the objects
li_max = UpperBound (apo_control)
For li_i = 1 to li_max
	lpo_tocheck = apo_control[li_i]
	If IsNull(lpo_tocheck) or Not IsValid(lpo_tocheck) Then Continue
	
	// Initialize
	lb_updatespending =False
	lb_performedtest =False
 
	Choose Case TypeOf ( lpo_tocheck )

		// Windows!, Tabs!, and UserObjects! can either be SelfUpdatingObjects (SUO) or
		// they can be controls which may be holding SelfUpdatingObjects.
		// If they are found to be SUO then they will treated as such, if not their
		// respective control array will be traversed in search of other SUOs.

		Case Window!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then					
				// Test for Window Controls (which may contain SelfUpdatingObjects)
				lw_control = lpo_tocheck
				li_rc = This.of_updatespending ( lw_control.control ) 
				If li_rc < 0 Then Return -1
				Continue
			End If
			
		Case Tab!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then						
				// Test for tab controls (which contain TabPages which may contain SelfUpdatingObjects)
				ltab_control = lpo_tocheck
				li_rc = This.of_updatespending ( ltab_control.control ) 
				If li_rc < 0 Then Return li_rc
				Continue
			End If

		Case UserObject!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then					
				// Test for UserObjects (which may contain SelfUpdatingObjects)
				luo_control = lpo_tocheck
				li_rc = This.of_updatespending ( luo_control.control ) 
				If li_rc < 0 Then Return li_rc
				Continue
			End If

	End Choose 
			
	// -- An object which 'may' be a SUO has been encountered. --

	// Determine if the SUO type is one the service has been asked to process.
	If Len (is_typetoprocess) > 0 Then
		If Pos (is_typetoprocess, of_GetType(lpo_tocheck)) = 0 Then
			// Not a SUO type the service has been asked to process.
			Continue
		End If
	End If		

	// Check/Perform for SelfUpdatingObject Functionality.
	lb_defined = inv_metaclass.of_isFunctionDefined &
		(lpo_tocheck.ClassDefinition, "of_UpdatesPending", ls_args)
	If lb_defined Then
		la_rc = lpo_tocheck.Dynamic of_UpdatesPending ()
		If ClassName(la_rc) = 'integer' or ClassName(la_rc)='long' Then
			// Functionality was found.
			If la_rc < 0 Then Return -1
			If la_rc >= 1 Then
				lb_updatespending = True
				If TypeOf (lpo_tocheck) = DataWindow! Then
					// PFC DataWindow.
					// Note: For linked DataWindows only the root is stored.  All of the
					//	DataWindows are processed but the process is always started with 
					//	the root	datawindow.
					// If pfc_MasterUpdatesPending() is found then of_IsRoot() should be there.
					la_rc = lpo_tocheck.Function Dynamic of_IsRoot()
					If ClassName(la_rc) = 'boolean' Then
						lb_updatespending = la_rc
					Else
						Return -1
					End If
				End If
			End If
			lb_performedtest = True
		End If		
	End If
	
	If lb_performedtest = False Then
		// Handle NonPFC DataWindows/DataStores.
		If TypeOf (lpo_tocheck) = DataWindow! Then
			ldw_nonpfc = lpo_tocheck
			ls_updatetable = ldw_nonpfc.Describe("DataWindow.Table.UpdateTable")
			If ls_updatetable = '?' or ls_updatetable = '' Then
			   lb_updatespending = False
			Else
			   lb_updatespending = (ldw_nonpfc.ModifiedCount() + ldw_nonpfc.DeletedCount() >= 1)
			End If							
		ElseIf TypeOf (lpo_tocheck) = DataStore! Then
			lds_nonpfc = lpo_tocheck
			ls_updatetable = lds_nonpfc.Describe("DataWindow.Table.UpdateTable")
			If ls_updatetable = '?' or ls_updatetable = '' Then
			   lb_updatespending = False
			Else
			   lb_updatespending = (lds_nonpfc.ModifiedCount() + lds_nonpfc.DeletedCount() >= 1)
			End If							
		End If		
	End If

	// If Updates are Pending, add the object to the list.
	If lb_updatespending Then
		// Get the new upperbound for the pending changes.
		li_newupper = UpperBound (ipo_pendingupdates)  + 1
		// Store the control with updates pending.
		ipo_pendingupdates[li_newupper] = lpo_tocheck  // *Add Entry* to instance.
	End If

Next

Return UpperBound (ipo_pendingupdates)
end function

public function integer of_validation (powerobject apo_control[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_validation
//
//	Access:  public
//
//	Arguments:		
//	apo_control   Array of controls that need validation.
//
//	Returns:  integer
//	 1 = success (no errors found)
//	-1 = An error was found during validation
//
//	Description:
//	Perform validation in each object for specified powerobject array.
//
//	Note:	 

//	This function is called recursively to handle tab controls and user objects.
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

Any			la_rc
Integer		li_max
Integer		li_i
Integer		li_rc
String		ls_args[]
Boolean		lb_defined
PowerObject lpo_tocheck
UserObject	luo_control
Tab			ltab_control
Window		lw_control
DataWindow	ldw_nonpfc

// If requested use the assist funtionality.
If ib_assist Then 
	of_Assist(is_instancename+'.of_Validation('+of_GetClassNames(apo_control)+')')
End If

// Loop thru all the objects
li_max = UpperBound (apo_control)
For li_i = 1 to li_max
	lpo_tocheck = apo_control[li_i]
	If IsNull(lpo_tocheck) or Not IsValid(lpo_tocheck) Then Continue
	
	Choose Case TypeOf ( lpo_tocheck )

		// Windows!, Tabs!, and UserObjects! can either be SelfUpdatingObjects (SUO) or
		// they can be controls which may be holding SelfUpdatingObjects.
		// If they are found to be SUO then they will treated as such, if not their
		// respective control array will be traversed in search of other SUOs.

		Case Window!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then			
				// Test for Window Controls (which may contain SelfUpdatingObjects)
				lw_control = lpo_tocheck
				li_rc = This.of_validation ( lw_control.control ) 
				If li_rc < 0 Then Return -1
				Continue
			End If				

		Case Tab!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then			
				// Test for Tab Controls (which contain TabPages which may contain SelfUpdatingObjects)
				ltab_control = lpo_tocheck
				li_rc = This.of_validation ( ltab_control.control ) 
				If li_rc < 0 Then Return -1
				Continue
			End If				

		Case UserObject!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then			
				// Test for UserObjects (which may contain SelfUpdatingObjects)
				luo_control = lpo_tocheck
				li_rc = This.of_validation ( luo_control.control ) 
				If li_rc < 0 Then Return -1
				Continue
			End If				

	End Choose
			
	// -- An object which 'may' be a SUO has been encountered. --			
		
	// Determine if the SUO type is one the service has been asked to process.
	If Len (is_typetoprocess) > 0 Then
		If Pos (is_typetoprocess, of_GetType(lpo_tocheck)) = 0 Then
			// Not a SUO type the service has been asked to process.
			Continue
		End If
	End If				
		
	// Check/Perform for SelfUpdatingObject Functionality
	lb_defined = inv_metaclass.of_isFunctionDefined &
		(lpo_tocheck.ClassDefinition, "of_Validation", ls_args)
	If lb_defined Then
		li_rc = lpo_tocheck.Function Dynamic of_Validation ()
		If li_rc < 0 Then Return -1
		Continue
	End If
		
	// Handle NonPFC DataWindows/DataStores.
	If TypeOf (lpo_tocheck) = DataWindow! or TypeOf (lpo_tocheck) = DataStore! Then
		la_rc = lpo_tocheck.Event Dynamic ue_validation ()
		If ClassName(la_rc) = 'integer' or ClassName(la_rc)='long' Then
			// Functionality was found.
			If la_rc < 0 Then Return -1
		End If
	End If
	
Next

// All validation was successful
Return 1

end function

public function integer of_update (powerobject apo_control[], boolean ab_accepttext, boolean ab_resetflag);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_Update
//
//	Access:  public
//
//	Arguments:
//	apo_control[]   Array of controls that need to be updated
//	ab_accepttext	When applicable, specifying whether control should perform an
//						AcceptText prior to performing the update:
//	ab_resetflag	Value specifying whether object should automatically 
//						reset its update flags.
//
//	Returns:   integer
//	 1 = all updates successful
//	-1 = At least one update failed
//
//	Description:
//	Updates the specified array of controls.
//
//	Note:
//	This function will update objects in the order in which they are found in
//	the array.  The linked datawindows are updated according to linkage service
// information.
//
//	Note:	 
//	This function is called recursively to handle tab controls and user objects.
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

Any			la_rc
Integer		li_max
Integer		li_i
Integer		li_rc
String		ls_args[]
Boolean		lb_defined
PowerObject lpo_tocheck
PowerObject	lpo_updaterequestor
UserObject	luo_control
tab			ltab_control
window		lw_control
DataWindow	ldw_nonpfc
DataStore	lds_nonpfc

// If requested use the assist funtionality.
If ib_assist Then 
	of_Assist(is_instancename+'.of_Update('+of_GetClassNames(apo_control)+')')
End If

If UpperBound(apo_control) = 0 Then Return NO_ACTION

// Set up arguments for MetaClass calls.
ls_args = {'boolean', 'boolean', 'powerobject'}

// Determine the object to pass in as the requestor.
If IsValid(ipo_updaterequestor) Then
	lpo_updaterequestor = ipo_updaterequestor
Else
	lpo_updaterequestor = this
End If

// Loop thru all the objects
li_max = UpperBound (apo_control)
For li_i = 1 to li_max
	lpo_tocheck = apo_control[li_i]
	If IsNull(lpo_tocheck) or Not IsValid(lpo_tocheck) Then Continue

	Choose Case TypeOf ( lpo_tocheck )

		// Windows!, Tabs!, and UserObjects! can either be SelfUpdatingObjects (SUO) or
		// they can be controls which may be holding SelfUpdatingObjects.
		// If they are found to be SUO then they will treated as such, if not their
		// respective control array will be traversed in search of other SUOs.

		Case Window!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then			
				// Test for Window Controls (which may contain SelfUpdatingObjects)
				lw_control = lpo_tocheck
				li_rc = This.of_Update ( lw_control.control, ab_accepttext, ab_resetflag ) 
				If li_rc < 0 Then Return -1
				Continue
			End If			

		Case Tab!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then			
				// Test for Tab Controls (which contain TabPages which may contain SelfUpdatingObjects)
				ltab_control = lpo_tocheck
				li_rc = This.of_Update ( ltab_control.control, ab_accepttext, ab_resetflag ) 
				If li_rc < 0 Then Return -1
				Continue
			End If			

		Case UserObject!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then			
				// Test for UserObjects (which may contain SelfUpdatingObjects)
				luo_control = lpo_tocheck
				li_rc = This.of_Update ( luo_control.control, ab_accepttext, ab_resetflag )
				If li_rc < 0 Then Return -1
				Continue
			End If			

	End Choose
			
	// -- An object which 'may' be a SUO has been encountered. --

	// Determine if the SUO type is one the service has been asked to process.
	If Len (is_typetoprocess) > 0 Then
		If Pos (is_typetoprocess, of_GetType(lpo_tocheck)) = 0 Then
			// Not a SUO type the service has been asked to process.
			Continue
		End If
	End If					
		
	// Check/Perform for SelfUpdatingObject Functionality.
	lb_defined = inv_metaclass.of_isFunctionDefined &
		(lpo_tocheck.ClassDefinition, "of_Update", ls_args)
	If lb_defined Then
		li_rc = lpo_tocheck.Function Dynamic of_Update (ab_accepttext,  ab_resetflag, lpo_updaterequestor)
		If li_rc < 0 Then Return -1
		Continue
	End If
		
	// Handle NonPFC DataWindows/DataStores.
	If TypeOf (lpo_tocheck) = DataWindow! Then
		ldw_nonpfc = lpo_tocheck
		If ldw_nonpfc.Update (ab_accepttext, ab_resetflag) < 0 Then
			// Visual notification is not displayed by PFC.  Left up to the NonPFC
			// object to process.
			Return -1
		End If
	ElseIf TypeOf (lpo_tocheck) = DataStore! Then
		lds_nonpfc = lpo_tocheck
		If lds_nonpfc.Update (ab_accepttext, ab_resetflag) < 0 Then
			// Visual notification is not displayed by PFC.  Left up to the NonPFC
			// object to process.
			Return -1
		End If
	End If	
Next

// All updates were successful.
Return 1

end function

protected function string of_getclassnames (powerobject apo_control[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_GetClassNames
//
//	Access:  protected
//
//	Arguments:
//	apo_control array of controls to get names.
//
//	Returns:  string
//	 ClassNames of all the objects passed in.
//	 ! = error
//
//	Description:
//	Get a name for all the objects passed in.
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

Integer		li_newupper, li_max, li_i, li_rc
powerobject	lpo_tocheck
string		ls_currentname
string		ls_classnames
string		ls_name
n_tr			ltr_object

If UpperBound(apo_control) = 0 Then Return '!'

// Loop thru all the objects
li_max = UpperBound (apo_control)
For li_i = 1 to li_max
	// Get an object.
	lpo_tocheck = apo_control[li_i]
	
	// Get the name of the object.
	If IsValid(lpo_tocheck) Then 
		ls_currentname = lpo_tocheck.ClassName()
		If TypeOf(lpo_tocheck) = Transaction! Then
			ltr_object = lpo_tocheck
			ls_name = ltr_object.of_GetName()
			if Len (ls_name) = 0 then
				ls_currentname = ls_name
			end if			
		End If
	ElseIf IsNull(lpo_tocheck) Then 
		ls_currentname = 'NullReference'
	Else
		ls_currentname = 'NotValidReference'	
	End If
	
	// Added it to the list.
	If Len(ls_classnames) > 0 Then ls_classnames += ', '
	ls_classnames += ls_currentname
Next

Return ls_classnames

end function

protected function integer of_assist (string as_msg);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_Assist
//
//	Access:  protected
//
//	Arguments:
//	as_msg	The message to provide assistance with.
//
//	Returns:  integer
//	 1 = successful
//	 0 = no action
//	-1 = error
//
//	Description:  
//	Display / Log / Provide assistance.
//
//	Note:  
//	This function should be implemented in descendant object.
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

//// -- Use this to display on the PFC Log Window. -- 
//If IsValid(gnv_app.inv_debug) Then
//	Return gnv_app.inv_debug.of_Message(as_msg)
//End If

Return NO_ACTION

end function

protected function boolean of_isselfupdatingobject (powerobject apo_control);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_IsSelfUpdatingObject
//
//	Access:  Protected
//
//	Arguments:	
//	apo_control	The object which needs to be tested.
//
//	Returns:  boolean
//
//	Description:
//	Determines if the object is a SelfUpdatingObject.
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

Boolean	lb_defined
String	ls_args[]

// If there is no valid reference then it is not a SUO object.
If IsNull(apo_control) Or Not IsValid(apo_control) Then
	Return False
End If

// Set up the arguments for the MetaClass information
ls_args = {'boolean', 'boolean', 'powerobject'}

// See if the one method which is required for an object to be a SelfUpdatingObject.
lb_defined = inv_metaclass.of_isFunctionDefined &
	(apo_control.ClassDefinition, "of_Update", ls_args)	

Return lb_defined
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
//	6.0	Initial verstion.
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
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

// If requested use the assist funtionality.
If ib_assist Then 
	of_Assist(is_instancename+'.of_SetDBErrorMsg to='+anv_dberrorattrib.is_errormsg)
End If

Return 1
end function

protected function integer of_dberror (n_cst_dberrorattrib anv_dberrorattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Event:  
//	of_dberror
//
//	Access:  protected
//
//	Arguments:
//	as_error	The error message.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Display the dberror that was encountered during the save process.
//
// Note: Triggered by the of_save when the update failed, after the appropriate
//	end transaction process (which if appropriate should include rollback process)
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
// 6.0 Initial version	
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

n_cst_dberrorattrib lnv_dberrorattrib

If IsNull(anv_dberrorattrib) Or Not IsValid(anv_dberrorattrib) Then
	Return -1
End If

// Display the message.
of_Messagebox ('pfc_luw_dberror','Save', anv_dberrorattrib.is_errormsg, &
	StopSign!, Ok!, 1)	

// Clear the error message variable.
of_SetDBErrorMsg(lnv_dberrorattrib)

// If requested use the assist funtionality.
If ib_assist Then 
	of_Assist(is_instancename+'.of_dberror() displayed the error.')
End If

Return 1
end function

protected function integer of_endtranerror (n_tr atr_performed[], n_tr atr_secondary[], integer ai_secondaryrc[], integer ai_saverc);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_EndTranError
//
//	Access:  protected
//
//	Arguments:
//	atr_performed[]   Array of controls which unfortunately successfully ended.
//	atr_secondary[]
//	ai_secondaryrc[]
// ai_saverc		The current Save Return code used to determine how to end
//						the transaction.
//
//	Returns:  integer
//	 1 = Succesful
//	-1 = An error was found
//
//	Description:
//		End Transaction error was encountered.  Provide feedback of this error.
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

Integer 	li_maxperformed
Integer	li_maxsecondary
Integer 	li_idx
n_tr		ltr_obj[]
string	ls_name
string	ls_msg
string	ls_msgheader
string	ls_msgmainerror
string	ls_msgperformedheader
string	ls_msgperformed
string	ls_msgsecondaryheader
string	ls_msgsecondary

// Validate the arguments.
If IsNull(atr_performed) Then Return -1
If IsNull(atr_secondary) Then Return -1
If IsNull(ai_secondaryrc) Then Return -1
If IsNull(ai_saverc) Then Return -1

// Get the upperbound.
li_maxperformed = UpperBound(atr_performed)
li_maxsecondary = UpperBound(atr_secondary)
If li_maxsecondary <= 0 Then Return -1

If ai_saverc > 0 Then
	ls_msgheader = 'A Database Transaction error has been encountered.~r~n~r~n'+&
		'The LUW.of_EndTran() function was to execute Commits to all the transactions.~r~n'+ &
		'The following details the problem.~r~n~r~n'
	ls_msgmainerror = 'The transaction statement that started the error - '+ &
		atr_secondary[1].ClassName()+'('+atr_secondary[1].of_GetName()+').of_Commit()' + &
		'~r~n~r~n'
	If li_maxperformed > 0 Then
		ls_msgperformedheader = 'Prior to the error the following transactions were Committed:~r~n'
	End If
	ls_msgsecondaryheader = 'After the error, the following were executed:~r~n'
Else
	ls_msgheader = 'A Database Transaction error has been encountered.~r~n~r~n'+&
		'The LUW.of_EndTran() function was to execute Rollbacks to all the transactions.~r~n'+ &
		'The following details the problem.~r~n~r~n'
	ls_msgmainerror = 'The transaction statement that started the error - '+ &
		atr_secondary[1].ClassName()+'('+atr_secondary[1].of_GetName()+').of_Rollback()' + &
		'~r~n~r~n'		
	If li_maxperformed > 0 Then
		ls_msgperformedheader = 'Prior to the error the following transactions were Rollback:~r~n'
	End If
	ls_msgsecondaryheader = 'After the error, the following were executed:~r~n'
End If

// Loop around all performed transactions.
For li_idx = 1 to li_maxperformed
	If Len(ls_msgperformed) > 0 Then ls_msgperformed += ', ~r~n'
	ls_msgperformed += atr_performed[li_idx].ClassName()+ &
		'('+atr_performed[li_idx].of_GetName()+')'
Next
If Len(ls_msgperformed) > 0 Then ls_msgperformed += '~r~n~r~n'

// Loop around the secondar transactions.
For li_idx = 1 to li_maxsecondary
	If Len(ls_msgsecondary) > 0 Then ls_msgsecondary += ', ~r~n'
	ls_msgsecondary += atr_secondary[li_idx].ClassName()+ &
		'('+atr_secondary[li_idx].of_GetName()+').of_RollBack()' + &
		' return code= '+string(ai_secondaryrc[li_idx])
Next

// Construct the total message.
ls_msg = ls_msgheader + &
			ls_msgmainerror + &
			ls_msgperformedheader + &
			ls_msgperformed + &
			ls_msgsecondaryheader + &
			ls_msgsecondary

// Display the error if there are more than one transactions involved.
If li_maxperformed + li_maxsecondary >= 2 Then
	of_Messagebox('pfc_luw_endtranerror','Save',ls_msg,StopSign!,Ok!,1)
End If

// If requested use the assist funtionality.
If ib_assist Then
	of_assist(is_instancename+'.of_EndTranError()  '+ ls_msg)
End If

Return 1
end function

public function integer of_updatespending (powerobject apo_control[], ref powerobject apo_controlpending[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_UpdatesPending
//
//	Access:  public
//
//	Arguments:
//	apo_control[]  array of controls to check for any updates pending
//	apo_controlpending[] (by reference) array of controls which have updates pending
//
//	Returns:  integer
//	 # of objects with updates pending
//	-1 = error
//
//	Description:
//	Check in each object for updatespending for the specified array and store
//	references in ipo_pendingupdates.  Return by reference those objects with 
//	updates pending in apo_controlpending.
//
//	Note:
//	The objects with updates pending are stored in ipo_pendingupdates[].
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

Integer		li_rc
PowerObject	lpo_empty[]

// Initiliaze reference variable.
apo_controlpending = lpo_empty

// Clear the instace variable which holds pending objects.
ipo_pendingupdates = lpo_empty	// *Clear* instance.

// Determine the objects with Updates pending.
li_rc = this.of_UpdatesPending(apo_control)
If li_rc >= 1 Then
	// Populate the pending objects reference.
	apo_controlpending = ipo_pendingupdates
End If

// Clear the instace variable which holds pending objects.
ipo_pendingupdates = lpo_empty	// *Clear* instance.

Return li_rc

end function

public function integer of_begintran (n_tr atr_control[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_BeginTran
//
//	Access:  Public
//
//	Arguments:
//	atr_control[]   Array of controls to Begin Transactions on.
//
//	Returns:  integer
//	 1 = no error found
//	-1 = error
//
//	Description:
//	Begin Transaction(s) on all the Transaction Objects.
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

Integer 	li_max
Integer	li_maxundo
Integer	li_idx
Integer 	li_i
Integer	li_rc
string	ls_name

// Validate the argument.
If IsNull(atr_control) Then
	Return -1
End If

// If requested use the assist funtionality.
If ib_assist Then 
	of_Assist(is_instancename+'.of_BeginTran('+of_GetClassNames(atr_control)+')')
End If

// Loop around all transactions objects, Begining a new Transaction on each.
li_max = UpperBound(atr_control)
For li_i = 1 to li_max
	If atr_control[li_i].of_Begin() < 0 Then
		// -- An error begining a transaction has been encountered. --
		
		// RollBack the transactions that were just started.
		li_maxundo = li_i - 1
		For li_idx = 1 to li_maxundo
			li_rc = atr_control[li_idx].of_Rollback()				
		Next					
		
		// If requested use the assist funtionality.
		If ib_assist Then
			ls_name = atr_control[li_i].of_GetName()
			If Len(ls_name) = 0 Then ls_name = atr_control[li_i].Classname()
			of_assist(is_instancename+'.of_BeginTran() failed with '+ls_name+' of_Begin()')
		End If		
		Return -1
	End If
Next

// If requested use the assist funtionality.
If ib_assist Then
	of_assist(is_instancename+'.of_BeginTran() successfully executed of_Begin()(s).')
End If

Return 1
end function

public function integer of_endtran (n_tr atr_control[], integer ai_saverc);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_EndTran
//
//	Access:  Public
//
//	Arguments:
//	atr_control[]   Array of controls to End Transactions on.
// ai_saverc		The current Save Return code used to determine how to end
//						the transaction.
//
//	Returns:  integer
//	 1 = Ending of Transaction(s) were successful, no errors found
//	-1 = An error was found
//
//	Description:
//	End Transaction(s) on all the Transaction Objects.  Depending on the save
//	return code, the transaction is either committed or rollback.
//
// Note:
//	This function assumes that all transaction passed in currently have a 
// transaction to be ended.
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
Integer 	li_max
Integer 	li_i
Integer	li_idx
Integer	li_cnt = 0
n_tr		ltr_performed[]
n_tr		ltr_secondary[]
integer	li_secondaryrc[]

// Validate the argument.
If IsNull(atr_control) Then
	Return -1
End If

// If requested use the assist funtionality.
If ib_assist Then 
	of_Assist(is_instancename+'.of_EndTran('+of_GetClassNames(atr_control)+ &
		', '+String(ai_saverc)+')')
End If

// Loop around all transactions objects, Begining a new Transaction.
li_max = UpperBound(atr_control)
For li_i = 1 to li_max
	If ai_saverc > 0 Then
		If atr_control[li_i].of_Commit() < 0 Then
			// -- An error committing a transaction has been encountered. --			
			
			// Loop around Uncommitted transactions.
			li_cnt = 0
			For li_idx = li_i to li_max
				// Rollback.
				li_rc = atr_control[li_idx].of_Rollback()				
				
				// Create an array of the these transactions.
				li_cnt ++
				ltr_secondary[li_cnt] = atr_control[li_idx]
				li_secondaryrc[li_cnt] = li_rc
			Next
	
			// Provide immediate feedback of the problem.
			li_rc = of_EndTranError(ltr_performed, ltr_secondary, li_secondaryrc, ai_saverc)
			
			// If requested use the assist funtionality.
			If ib_assist Then
				of_assist(is_instancename+'.of_EndTran() failed of_Commit()(s).')
			End If						
			Return -1
		End If
	Else
		If atr_control[li_i].of_Rollback() < 0 Then
			// -- An rollback error has been encountered. --			
			
			// Loop around Other transactions.
			li_cnt = 0
			For li_idx = li_i to li_max
				// Rollback.
				li_rc = atr_control[li_idx].of_Rollback()				
				
				// Create an array of the these transactions.
				li_cnt ++
				ltr_secondary[li_cnt] = atr_control[li_idx]
				li_secondaryrc[li_cnt] = li_rc
			Next			
			
			// Provide immediate feedback of the problem.
			li_rc = of_EndTranError(ltr_performed, ltr_secondary, li_secondaryrc, ai_saverc)			
			
			// If requested use the assist funtionality.
			If ib_assist Then
				of_assist(is_instancename+'.of_EndTran() failed of_RollBack()(s).')
			End If			
			Return -1
		End If		
	End If
	
	// In case there is a problem, Keep track of the transactions successfully ended. 
	ltr_performed[li_i] = atr_control[li_i]
Next

// If requested use the assist funtionality.
If ib_assist Then
	If ai_saverc > 0 Then
		of_assist(is_instancename+'.of_EndTran() successfully executed of_Commit()(s).')
	Else
		of_assist(is_instancename+'.of_EndTran() successfully executed of_Rollback()(s).')
	End If
End If

Return 1
end function

public function integer of_accepttext (powerobject apo_control[], boolean ab_focusonerror);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  
//	of_AcceptText
//
//	Access:  public
//
//	Arguments:
//	apo_control   Array of controls to check for accepttext
//	ab_focusonerror   Should focus be set to object in error
//
//	Returns:  integer
//	 1 = accepttext successful, no errors found
//	-1 = An error was found
//
//	Description:
//	Perform AcceptText functionality on all objects found on the specified array.
//
//	Note:	 
//	This function is called recursively to handle tab controls and user objects.
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

Any			la_rc
Integer		li_max
Integer		li_i
Integer		li_rc
Boolean		lb_defined
string		ls_args[]
string		ls_errmessage
powerobject	lpo_tocheck
DataWindow	ldw_nonpfc
DataStore	lds_nonpfc
UserObject	luo_control
tab			ltab_control
window		lw_control

// If requested use the assist funtionality.
If ib_assist Then 
	of_Assist(is_instancename+'.of_AcceptText('+of_GetClassNames(apo_control)+')')
End If

// Set up arguments for MetaClass calls.
ls_args[1] = 'boolean'

// Loop thru all the objects
li_max = UpperBound (apo_control)
For li_i = 1 to li_max
	lpo_tocheck = apo_control[li_i]
	If IsNull(lpo_tocheck) or Not IsValid(lpo_tocheck) Then Continue

	Choose Case TypeOf (lpo_tocheck)

		// Windows!, Tabs!, and UserObjects! can either be SelfUpdatingObjects (SUO) or
		// they can be controls which may be holding SelfUpdatingObjects.
		// If they are found to be SUO then they will treated as such, if not their
		// respective control array will be traversed in search of other SUOs.

		Case Window!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then			
				// Test for Window Controls (which may contain SelfUpdatingObjects)
				lw_control = lpo_tocheck
				li_rc = This.of_AcceptText ( lw_control.control, ab_FocusOnError ) 
				If li_rc < 0 Then Return -1
				Continue
			End If
			
		Case Tab!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then
				// Test for Tab Controls (which contain TabPages which may contain SelfUpdatingObjects)
				ltab_control = lpo_tocheck
				li_rc = This.of_AcceptText ( ltab_control.control, ab_FocusOnError ) 
				If li_rc < 0 Then Return -1
				Continue
			End If

		Case UserObject!
			If Not of_IsSelfUpdatingObject (lpo_tocheck) Then
				// Test for UserObjects (which may contain SelfUpdatingObjects)
				luo_control = lpo_tocheck
				li_rc = This.of_AcceptText ( luo_control.control, ab_FocusOnError ) 
				If li_rc < 0 Then Return -1
				Continue
			End If

	End Choose 
			
	// -- An object which 'may' be a SUO has been encountered. --
			
	// Determine if the SUO type is one the service has been asked to process.
	If Len (is_typetoprocess) > 0 Then
		If Pos (is_typetoprocess, of_GetType(lpo_tocheck)) = 0 Then
			// Not a SUO type the service has been asked to process.
			Continue
		End If
	End If				
			
	// Check/Perform for SelfUpdatingObject Functionality.
	lb_defined = inv_metaclass.of_isFunctionDefined &
		(lpo_tocheck.ClassDefinition, "of_AcceptText", ls_args)
	If lb_defined Then
		li_rc = lpo_tocheck.Function Dynamic of_AcceptText (ab_focusonerror)
		If li_rc < 0 Then Return -1
		Continue		
	End If
	
	// Handle NonPFC DataWindows/DataStores.
	If TypeOf (lpo_tocheck) = DataWindow! Then
		ldw_nonpfc = lpo_tocheck
		// Do not perform AcceptText on Datawidows found on uncreated tab pages.				
		If ldw_nonpfc.RowCount() + ldw_nonpfc.FilteredCount() + &
			ldw_nonpfc.ModifiedCount() + ldw_nonpfc.DeletedCount() > 0 Then						
			// Perform AcceptText functionality.
			la_rc = ldw_nonpfc.AcceptText()
			If la_rc < 0 Then 
				If ab_FocusOnError Then ldw_nonpfc.SetFocus()
				Return -1
			End If
		End If
	ElseIf TypeOf (lpo_tocheck) = DataStore! Then
		lds_nonpfc = lpo_tocheck
		// Do not perform AcceptText on Datawidows found on uncreated tab pages.				
		If lds_nonpfc.RowCount() + lds_nonpfc.FilteredCount() + &
			lds_nonpfc.ModifiedCount() + lds_nonpfc.DeletedCount() > 0 Then						
			// Perform AcceptText functionality.
			la_rc = lds_nonpfc.AcceptText()
			If la_rc < 0 Then
				// DataStore AcceptText() does not give visual notification on error.
				ls_errmessage = "Failed AcceptText validation on datastore.  "+&
							 "Column "+ lds_nonpfc.GetColumnName() + &
							 " on row "+ string(lds_nonpfc.GetRow()) + "."
				of_Messagebox ('pfc_luw_dsaccepttextfailed','AcceptText', &
					ls_errmessage, Exclamation!, Ok!, 1)
				Return -1
			End If
		End If
	End If
		
Next

// All AcceptText were successful
Return 1

end function

protected function string of_gettype (powerobject apo_control);//////////////////////////////////////////////////////////////////////////////
//	Protected Function:	of_GetType
//	Arguments:		apo_control   Control for which the type is desired.
//	Returns:			string
//	 					1 = accepttext successful, no errors found
//						! = The type was not found. (If apo_control is not null and apo_control is one 
//							 which updating is desired on, the function should be enhanced to include 
//							 the type.)
//	Description:	Gets the type of the control.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						6.0   Initial version
// 					7.0	Added new controls hprogressbar!, htrackbar!, vprogressbar!,
//								vtrackbar!, picturehyperlink!, statichyperlink!
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

choose case apo_control.TypeOf()
	case DataWindow!
		return 'datawindow'
	case DataStore!
		return 'datastore'			
	case TreeView!
		return 'treeview'		
	case ListView!
		return 'listview'
	case RichTextEdit!
		return 'richtextedit'
	case Window!
		return 'window'
	case UserObject!
		return 'userobject'		
	case NonVisualObject!
		return 'nonvisualobject'				
	case CheckBox!
		return 'checkbox'
	case CommandButton!
		return 'commandbutton'		
	case DropDownListBox!
		return 'dropdownlistbox'
	case Graph!
		return 'graph'		
	case GroupBox!
		return 'groupbox'		
	case HScrollBar!
		return 'hscrollbar'
	case ListBox!
		return 'listbox'
	case MultilineEdit!
		return 'multilineedit'		
	case OMControl!
		return 'omcontrol'
	case Picture!
		return 'picture'
	case RadioButton!
		return 'radiobutton'		
	case SingleLineEdit!
		return 'singlelineedit'
	case StaticText!
		return 'statictext'
	case Tab!
		return 'tab'		
	case VScrollBar!
		return 'vscrollbar'
	case Line!
		return 'line'		
	case Oval!
		return 'oval'
	case Rectangle!
		return 'rectangle'
	case RoundRectangle!
		return 'roundrectangle'
	case HProgressBar!
		return 'hprogressbar'
	case HTrackBar!	
		return 'htrackbar'
	case VProgressBar!
		return 'vprogressbar'
	case VTrackBar!
		return 'vtrackbar'
	case StaticHyperlink!
		return 'statichyperlink'
	case PictureHyperlink!
		return 'picturehyperlink'
	case else
		return '!'
end choose

return '!'
end function

on pfc_n_cst_luw.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_luw.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:	
//	Constructor
//
//	Description:
//	Logical Unit of Work service.
//	To work (1) as a stand alone service and (2) in conjuction with the 
//	PFC saving process.  Every object now has the capabilities to be a 
//	self updating object.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version - LUW & SUO - Claudio J. Quant
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// Give the service an unique name.
is_instancename = string(CPU())+'.'+this.ClassName()
end event


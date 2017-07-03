HA$PBExportHeader$pfc_n_cst_treenode.sru
$PBExportComments$PFC tree node
forward
global type pfc_n_cst_treenode from n_cst_nodebase
end type
end forward

global type pfc_n_cst_treenode from n_cst_nodebase
end type
global pfc_n_cst_treenode pfc_n_cst_treenode

type variables
protected:
integer 		ii_balance

end variables

forward prototypes
public function integer of_getbalance ()
public function integer of_setbalance (integer ai_balance)
public function integer of_copyto (ref n_cst_treenode anv_copy)
end prototypes

public function integer of_getbalance ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_getbalance
//
//	Access:  public
//
//	Arguments :  None
//
//	Returns:  integer
//	value of ii_balance
//
//	Description:  
//	Return the value of ii_balance
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

return ii_balance
end function

public function integer of_setbalance (integer ai_balance);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_setbalance
//
//	Access:  public
//
//	Arguments :  None
//
//	Returns:  integer
//	1 : success
// -1 : input value out of range
//
//	Description:  
//	Set the value of ii_balance. Balance can only be -1,0 or +1
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

if IsNull(ai_balance) or ai_balance< -1 or ai_balance > 1 then return -1

ii_balance = ai_balance
return 1
end function

public function integer of_copyto (ref n_cst_treenode anv_copy);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_CopyTo
//
//	Access:  public
//
//	Arguments : 
//	anv_copy (by reference) copies the contents of the node into this node
//
//	Returns:  Integer
//	1 : Success
//	-1 : Failure, the passed node is invalid
//
//	Description:  
//	Copies the contents of the node into the passed node. 
//
//	Note:
//	If the node is extended MAKE SURE that you OVERRIDE ancestor function.
// Descendant function then should call this function to set known attributes,
// then in descendant add code to copy new elements.
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

if IsNull(anv_copy) or not isvalid(anv_copy) then return -1

// Copy the standard ancestor attributes.
li_rc = Super::of_CopyTo(anv_copy)
If li_rc <= 0 Then Return li_rc

// Copy the added attribute(s).
anv_copy.of_SetBalance(ii_balance)

return 1
end function

on pfc_n_cst_treenode.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_treenode.destroy
TriggerEvent( this, "destructor" )
end on


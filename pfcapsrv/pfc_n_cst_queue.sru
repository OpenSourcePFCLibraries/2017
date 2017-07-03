HA$PBExportHeader$pfc_n_cst_queue.sru
$PBExportComments$PFC Queue List service
forward
global type pfc_n_cst_queue from n_cst_linkedlistbase
end type
end forward

global type pfc_n_cst_queue from n_cst_linkedlistbase
end type

forward prototypes
public function integer of_put (n_cst_linkedlistnode anv_node)
public function integer of_get (ref n_cst_linkedlistnode anv_node)
end prototypes

public function integer of_put (n_cst_linkedlistnode anv_node);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_put
//
//	Access:  public
//
//	Arguments : 
//	anv_node 	node to add.
//
//	Returns:  integer
//	same as the ancestor of_AddTail function
//
//	Description: 
//	Adds the node the Tail of the Queue.
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

return of_AddTail(anv_node)


end function

public function integer of_get (ref n_cst_linkedlistnode anv_node);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_get
//
//	Access:  public
//
//	Arguments : 
//	anv_node  (by reference) node to be returned
//
//	Returns:  integer
//	1 = success
//	-1 = failure 
//
//	Description: 
//	Gets the Head node by removing it from the Queue.
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

// Validate that the reference to get is valid.
if isnull(inv_head) or not isvalid(inv_head) then 
	return -1
end if

// Take the top node.
anv_node = inv_head

// Remove the node.
return of_remove(anv_node)
end function

on pfc_n_cst_queue.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_queue.destroy
TriggerEvent( this, "destructor" )
end on


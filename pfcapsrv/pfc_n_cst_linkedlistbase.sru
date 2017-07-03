HA$PBExportHeader$pfc_n_cst_linkedlistbase.sru
$PBExportComments$PFC Linked List Base service
forward
global type pfc_n_cst_linkedlistbase from n_base
end type
end forward

global type pfc_n_cst_linkedlistbase from n_base autoinstantiate
end type

type variables
protected:

n_cst_linkedlistnode 	inv_nil  // To always stay nil.
n_cst_linkedlistnode 	inv_head
n_cst_linkedlistnode	inv_tail
n_cst_linkedlistnodecompare 	inv_compare
end variables

forward prototypes
public function long of_get (ref n_cst_linkedlistnode anv_list[])
public function long of_count ()
public function long of_destroy ()
protected function integer of_removehead (ref n_cst_linkedlistnode anv_headnode)
protected function integer of_removetail (ref n_cst_linkedlistnode anv_tailnode)
protected function integer of_addhead (n_cst_linkedlistnode anv_newheadnode)
protected function integer of_addtail (n_cst_linkedlistnode anv_newtailnode)
protected function integer of_add (n_cst_linkedlistnode anv_newnode, n_cst_linkedlistnode anv_insertafternode)
protected function integer of_remove (ref n_cst_linkedlistnode anv_removenode)
public function boolean of_iscompareobjectassigned ()
public function boolean of_isempty ()
public function integer of_setcompare (n_cst_linkedlistnodecompare anv_compare)
end prototypes

public function long of_get (ref n_cst_linkedlistnode anv_list[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Get
//
//	Access:  public
//
//	Arguments : 
//	anv_list[]  (by reference) an array of nodes.
//
//	Returns:  long
//	The number of nodes in the list.
//  -1 : Error
//
//	Description:  
//	Returns an in unbounded array all of the nodes.
//
// Note:
//	
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

long 		ll_cnt = 0
integer 	li_rc
n_cst_linkedlistnode lnv_current

lnv_current = inv_head
do while isvalid(lnv_current)
	ll_cnt ++
	anv_list[ll_cnt] = lnv_current
	li_rc = lnv_current.of_getnext(lnv_current)
	if li_rc = -1 then 
		// no more nodes
		exit 
	end if
loop

return ll_cnt

end function

public function long of_count ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Count
//
//	Access:  public
//
//	Arguments : None
//
//	Returns:  
//	integer : the number of nodes in the list
//	
//	Description:  
//	Returns the number of nodes in the list
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

integer 		li_cnt
n_cst_linkedlistnode 	lnv_node

// Determine if there are any.
if isnull(inv_head) or not isvalid(inv_head) then return 0

// Loop counting the number of entries.
lnv_node = inv_head
do while isvalid(lnv_node)
	li_cnt ++
	lnv_node.of_getnext(lnv_node)
loop

return li_cnt
end function

public function long of_destroy ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Destroy
//
//	Access:  public
//
//	Arguments : None
//
//	Returns:  
//	long : the number of nodes destroyed in the list
//	-1 error.
//	
//	Description:  
//	Destroys all of the nodes in the list
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

long li_cnt
n_cst_linkedlistnode 	lnv_node
n_cst_linkedlistnode	lnv_prev

// Confirm that there is a valid tail.
if isnull(inv_tail) or not isvalid(inv_tail) then return 0

// Loop destroying from tail to the head.
lnv_node = inv_tail
do while isvalid(lnv_node)
	// Get the previous node prior to Removing/Destroying the current Tail.
	lnv_node.of_getprev(lnv_prev)
	
	// Remove the current tail.
	If of_remove(lnv_node) <= 0 Then Return -1
	
	// Destroy the current tail.
	If IsValid(lnv_node) Then destroy lnv_node
	
	// Keep track of the destroyed nodes.
	li_cnt ++
	
	// Go after the new Tail.
	lnv_node = lnv_prev
loop

return li_cnt
end function

protected function integer of_removehead (ref n_cst_linkedlistnode anv_headnode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RemoveHead
//
//	Access:  protected
//
//	Arguments : 
//	anv_headnode  (by ref) The previous Head Node which was removed from the list.
//
//	Returns:  integer
//	1 = success
//	-1 = failure
//
//	Description:  
//	Removes and returns the previous Head node.
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

// Clear the reference variable.
anv_headnode = inv_nil

If IsValid(inv_head) Then
	anv_headnode = inv_head
	Return of_Remove(anv_headnode)
End If

Return -1
end function

protected function integer of_removetail (ref n_cst_linkedlistnode anv_tailnode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RemoveTail
//
//	Access:  protected
//
//	Arguments : 
//	anv_tailnode  (by ref) The previous Tail Node which was removed from the list.
//
//	Returns:  integer
//	1 = success
//	-1 = failure
//
//	Description:  
//	Removes and returns the previous Tail node.
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

// Clear the reference variable.
anv_tailnode = inv_nil

If IsValid(inv_tail) Then
	anv_tailnode = inv_tail
	Return of_Remove(anv_tailnode)
End If

Return -1
end function

protected function integer of_addhead (n_cst_linkedlistnode anv_newheadnode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddHead
//
//	Access:  protected
//
//	Arguments : 
//	anv_newheadnode  The node to be added to the list as the new Head node.
//
//	Returns:  integer
//	1 = success
//	-1 = failure
//
//	Description:  
//	Adds a new node to the Head of the linked list.
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
if isnull(anv_newheadnode) or not isvalid(anv_newheadnode) then 
	return -1
end if

// See if this is the first node.
if isnull(inv_head) or not isvalid(inv_head) then
	// This is the first node, so there is no previous or next pointers.
	anv_newheadnode.of_setnext(inv_nil)
	anv_newheadnode.of_setprev(inv_nil)  
	// Point the head and tail pointers.
	inv_head = anv_newheadnode
	inv_tail = inv_head
	return 1
end if

// -- Add as the new Head Node. -- 

// Set the About to be New Head Next pointer to point to the Current Head.
anv_newheadnode.of_setnext(inv_head)

// Head nodes never have a previous pointer.
anv_newheadnode.of_setprev(inv_nil) 

// Set the current Head previous pointer to the About to be New Head node.
inv_head.of_setprev(anv_newheadnode)

// Replace the current Head reference with the New Head node.
inv_head = anv_newheadnode
		
return 1
end function

protected function integer of_addtail (n_cst_linkedlistnode anv_newtailnode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddTail
//
//	Access:  protected
//
//	Arguments : 
//	anv_newtailnode  The node to be added to the list as the new Tail node.
//
//	Returns:  integer
//	1 = success
//	-1 = failure
//
//	Description:  
//	Adds a new node to the end of the linked list.
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
if isnull(anv_newtailnode) or not isvalid(anv_newtailnode) then
	return -1
end if

// Check to if this is the first node.
if isnull(inv_head) or not isvalid(inv_head) then
	return of_AddHead(anv_newtailnode)
end if

// -- Add as the new tail. -- 

// Set the current tail as the previous node to the About to be new Tail.
anv_newtailnode.of_setprev(inv_tail)

// Tail nodes never have a next pointer.
anv_newtailnode.of_setnext(inv_nil)

// Set the current Tail next pointer to the About to be New Tail node.
inv_tail.of_setnext(anv_newtailnode)

// Replace the current Tail reference with the New Tail node.
inv_tail = anv_newtailnode

return 1
end function

protected function integer of_add (n_cst_linkedlistnode anv_newnode, n_cst_linkedlistnode anv_insertafternode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Add
//
//	Access:  protected
//
//	Arguments : 
//	anv_newnode  node to be added to the list
//	anv_insertafternode The node to insert after.
//
//	Returns:  integer
//	1 = success
//	-1 = failure
//
//	Description:  
//	Adds a new node after the passed in node.  Two valid nodes have to passed in,
// the insert after node has to already be in the list.
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

n_cst_linkedlistnode	lnv_nextnode

// Validate required references.
if IsNull(anv_insertafternode) or Not IsValid(anv_insertafternode) Then return -1
if IsNull(anv_newnode) or Not IsValid(anv_newnode) then return -1
if IsNull(inv_head) or Not IsValid(inv_head) Then return -1
if IsNull(inv_tail) or Not IsValid(inv_tail) then return -1

// Determine if the insertion point the Tail node.
If anv_insertafternode = inv_tail Then
	// Add the new Tail node.
	Return of_AddTail(anv_newnode)
End If

// -- Adding a node between the Head node and the node prior to the Tail node.

// Get and Validate the current next node for the Insertion Point node.
anv_insertafternode.of_GetNext(lnv_nextnode)
If IsNull(lnv_nextnode) Or Not IsValid(lnv_nextnode) Then Return -1

// Set the links between the Insertion point and the New node.
anv_insertafternode.of_SetNext(anv_newnode)
anv_newnode.of_SetPrev(anv_insertafternode)

// Set the links between the New node and the Next node.
anv_newnode.of_SetNext(lnv_nextnode)
lnv_nextnode.of_SetPrev(anv_newnode)

Return 1
end function

protected function integer of_remove (ref n_cst_linkedlistnode anv_removenode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Remove
//
//	Access:  protected
//
//	Arguments : 
//	anv_removenode  (by ref) The actual node to be removed from the list.
//
//	Returns:  integer
//	1 = success
//	-1 = failure
//
//	Description:  
//	Removes the passed in node from the list, resetting any nodes previous 
//	and after that point to it.  Also clearing its own Next and Previous 
//	pointers.
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

n_cst_linkedlistnode lnv_previous
n_cst_linkedlistnode lnv_next

// Validate parameter.
if IsNull(anv_removenode) or Not IsValid(anv_removenode) then 
	return -1 
end if

// Determine if there is only one node in the list.
if inv_tail = inv_head then
	If anv_removenode = inv_head then 
		// -- Removing the only node. --
		// Clear its pointers.
		anv_removenode.of_SetNext(inv_nil)
		anv_removenode.of_SetPrev(inv_nil)
		// Clear the Head and Tail pointers.
		inv_head = inv_nil
		inv_tail = inv_nil
		return 1
	End If
	// Node not found.
	return -1
end if

// Check to see if it is the current Head node.
if anv_removenode = inv_head then 
	anv_removenode.of_getnext(lnv_next)
	if isnull(lnv_next) or not isvalid(lnv_next) then 
		// Pointer should be pointing at a valid node.
		return -1
	end if 
	// Clear its pointers.
	anv_removenode.of_SetNext(inv_nil)
	anv_removenode.of_SetPrev(inv_nil)	
	// Set the reference to the new Head node.
	inv_head = lnv_next
	inv_head.of_setprev(inv_nil)
	return 1
end if

// Check to see if it is the Tail node.
if anv_removenode = inv_tail then 
	anv_removenode.of_getprev(lnv_previous)
	if isnull(lnv_previous) or not isvalid(lnv_previous) then 
		// Pointer should be pointing at a valid node.
		return -1 
	end if
	// Clear its pointers.
	anv_removenode.of_SetNext(inv_nil)
	anv_removenode.of_SetPrev(inv_nil)	
	// Set the reference to the new Head node.	
	inv_tail = lnv_previous
	inv_tail.of_setnext(inv_nil)
	return 1
end if

// -- It is not the Head nor the Tail node. --
// -- There should be a previous and a next node. --

// Get the previous node.
anv_removenode.of_getprev(lnv_previous)
if isnull(lnv_previous) or not isvalid(lnv_previous) then 
	// Pointer should be pointing at a valid node.
	return -1 
end if

// Get the next node.
anv_removenode.of_getnext(lnv_next)
if isnull(lnv_next) or not isvalid(lnv_next) then 
	// Pointer should be pointing at a valid node.
	return -1 
end if

// Set the valid pointers to the previous and next pointers to remove the 
// passed in node.
lnv_previous.of_setnext(lnv_next)
lnv_next.of_setprev(lnv_previous)

// Clear its pointers.
anv_removenode.of_SetNext(inv_nil)
anv_removenode.of_SetPrev(inv_nil)	
return 1
end function

public function boolean of_iscompareobjectassigned ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_IsCompareObjectAssigned
//
//	Access:  public
//
//	Arguments : None

//	Returns:  boolean
//	True - The compare object has already been assigned.
// False - The compare object has not been assigned.
//
//	Description:  
//	Determins if the compare object has already been assigned.
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

// Determine if the object has already been assigned.
Return IsValid(inv_compare)
end function

public function boolean of_isempty ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_IsEmpty
//
//	Access:  public
//
//	Arguments : None
//
//	Returns:  boolean
//	True - The List is empty.
// False - The List has at least one node.
//
//	Description:  
//	Determines if the list is currently empty.
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

n_cst_linkedlistnode lnv_temp

// Look at the list to determine if the list has any entries.
If IsValid(inv_head) Then
	// The list is Not Empty.
	Return False
End If

// The list is Empty.
Return True
end function

public function integer of_setcompare (n_cst_linkedlistnodecompare anv_compare);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetCompare
//
//	Access:  public
//
//	Arguments : 
//	anv_compare   the object to be used to compare two nodes
//
//	Returns:  integer
//	1 = success
// -1 = failure
// -2 = failure, the compare object has already been set
//
//	Description:  
//	Allows the specification of a different comparison object.
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

// Validate the passed in comparison object.
if IsNull(anv_compare) Or Not IsValid(anv_compare) then 
	return -1 
end if

// Confirm the compare object has not already been assigned.
If of_IsCompareObjectAssigned() Then
	// Cannot reset comparison object.
	return -2
end If

// Reset the comparison object.
inv_compare = anv_compare
return 1
end function

on pfc_n_cst_linkedlistbase.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_linkedlistbase.destroy
TriggerEvent( this, "destructor" )
end on

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  destructor
//
//	Arguments : 
//	None
//
//	Returns:  
//	None
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

// Destroy the compare object.
If IsValid(inv_compare) Then
	Destroy inv_compare
End If

// Destroy any outstanding nodes.
of_Destroy() 


end event


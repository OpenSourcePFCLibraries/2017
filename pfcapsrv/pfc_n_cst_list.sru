HA$PBExportHeader$pfc_n_cst_list.sru
$PBExportComments$PFC List service
forward
global type pfc_n_cst_list from n_cst_linkedlistbase
end type
end forward

global type pfc_n_cst_list from n_cst_linkedlistbase
end type

type variables
Protected:

boolean 		ib_duplicatesallowed = True
boolean		ib_sorted = False
end variables

forward prototypes
public function integer of_setduplicatesallowed (boolean ab_switch)
public function boolean of_isduplicatesallowed ()
public function integer of_setsorted (boolean ab_switch)
public function boolean of_issorted ()
public function integer of_find (ref n_cst_linkedlistnode anv_returningnode, n_cst_linkedlistnode anv_keynode)
public function integer of_find (ref n_cst_linkedlistnode anv_returningnode, n_cst_linkedlistnode anv_keynode, n_cst_linkedlistnode anv_startnode)
public function integer of_removetail (ref n_cst_linkedlistnode anv_tailnode)
public function integer of_removehead (ref n_cst_linkedlistnode anv_headnode)
public function integer of_remove (ref n_cst_linkedlistnode anv_removenode)
public function integer of_addhead (n_cst_linkedlistnode anv_newheadnode)
public function integer of_addtail (n_cst_linkedlistnode anv_newtailnode)
public function boolean of_isinlist (n_cst_linkedlistnode anv_node)
public function integer of_add (n_cst_linkedlistnode anv_newnode)
end prototypes

public function integer of_setduplicatesallowed (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_SetDuplicatesAllowed
//
//	Access:
//	Public
//
//	Arguments:
//	ab_switch  State of option
//
//	Returns: integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Called to make list not allow nodes that have duplicate keys.
//	Only applicable to empty lists.
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

// Validate parameters.
if IsNull(ab_switch) then
	return -1
end if

If ib_duplicatesallowed = ab_switch Then
	Return 1
End If

//	Only applicable to empty lists.
If of_IsEmpty() Then 
	ib_duplicatesallowed = ab_switch
	Return 1
End If

Return -1
end function

public function boolean of_isduplicatesallowed ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_IsDuplicatesAllowed
//
//	Access:
//	Public
//
//	Arguments:	None
//
//	Returns: boolean
//	State of option
//
//	Description:
//	Returns the state of the ib_duplicatesallowed instance variable.
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

return ib_duplicatesallowed
end function

public function integer of_setsorted (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_SetSorted
//
//	Access:
//	Public
//
//	Arguments:
//	ab_switch  State of option
//
//	Returns: integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Called to make list sorted or not sorted.
//	Only applicable to empty lists.
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

// Validate parameters.
if IsNull(ab_switch) then
	return -1
end if

If ib_sorted = ab_switch Then
	Return 1
End If

//	Only applicable to empty lists.
If of_IsEmpty() Then 
	ib_sorted = ab_switch
	Return 1
End If

Return -1
end function

public function boolean of_issorted ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_IsSorted
//
//	Access:
//	Public
//
//	Arguments: None
//
//	Returns: boolean
//	State of option
//
//	Description:
//	Returns the state of the ib_sorted instance variable.
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

return ib_sorted
end function

public function integer of_find (ref n_cst_linkedlistnode anv_returningnode, n_cst_linkedlistnode anv_keynode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_find
//
//	Access:  public
//
//	Arguments : 
//	anv_returningnode (by reference) node found and returned from the list.
//	anv_keynode	 Node containing the key to be used to lookup the requested node.
//
//	Returns:  integer
//	 1 : found
//	 0 : not found
//	-1 : failure
//
//	Description:  
//	Finds and returns reference of the next node in the list in which the key
//	meets a specified condition.  The search starts at the Head node.
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

// Pass an invalid startnode reference to signify to start from the Head node.
n_cst_linkedlistnode lnv_startnode
Return of_find(anv_returningnode, anv_keynode, lnv_startnode)
end function

public function integer of_find (ref n_cst_linkedlistnode anv_returningnode, n_cst_linkedlistnode anv_keynode, n_cst_linkedlistnode anv_startnode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_find
//
//	Access:  public
//
//	Arguments : 
//	anv_returningnode (by reference) node found and returned from the list.
//	anv_keynode	 Node containing the key to be used to lookup the requested node.
//	anv_startnode	The node to start the searching.
//
//	Returns:  integer
//	 1 : found
//	 0 : not found
//	-1 : failure
//
//	Description:  
//	Finds and returns reference of the next node in the list in which the key
//	meets a specified condition.
//
//	Note:
//	The find operation will not include the valid startnode.  The search starts
//	on the next node.
//	To start a search begining on the Head node call the function with an invalid
//	startnode.
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

constant integer FOUND = 1
constant integer NOT_FOUND = 0
n_cst_linkedlistnode lnv_node
n_cst_linkedlistnode lnv_nonvalid

// Clear return reference.
anv_returningnode = lnv_nonvalid

// Validate required references.
// Validation of anv_startnode is not desired. (an invalid ref means to start at top(head))
if IsNull(anv_keynode) or Not IsValid(anv_keynode) then return FAILURE

// See if this is an empty list.
If of_IsEmpty() Then
	Return NOT_FOUND
End If

// Since the list is not empty, validate the Head node.
if IsNull(inv_head) or Not IsValid(inv_head) then return FAILURE

// Determine the first node to search in.
If IsValid(anv_startnode) Then
	// Start looking in the next node. (skip the startnode)
	anv_startnode.of_getnext(lnv_node)
Else
	lnv_node = inv_head
End If

// if necessary, create the compare object.
if IsNull(inv_compare) or Not IsValid(inv_compare) then
	inv_compare = create n_cst_linkedlistnodecompare
end if

// Loop looking for the node.
do while IsValid(lnv_node)
	choose case inv_compare.of_compare(anv_keynode, lnv_node)
		case inv_compare.EQUAL 
			// Entry has been found.
			anv_returningnode = lnv_node 
			return FOUND
		case inv_compare.LESSTHAN
			// Depending on sort attribute.
			If ib_sorted Then
				// No nodes after the current entry could be a match.
				return NOT_FOUND
			Else
				// Look at next node.				
			End If
		case inv_compare.GREATERTHAN
			// Look at next node.
	end choose

	lnv_node.of_getnext(lnv_node)
loop

Return NOT_FOUND

end function

public function integer of_removetail (ref n_cst_linkedlistnode anv_tailnode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RemoveTail
//
//	Access:  Public
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

Return Super::of_RemoveTail(anv_tailnode)

end function

public function integer of_removehead (ref n_cst_linkedlistnode anv_headnode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RemoveHead
//
//	Access:  Public
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

Return Super::of_RemoveHead(anv_headnode)

end function

public function integer of_remove (ref n_cst_linkedlistnode anv_removenode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Remove
//
//	Access:  Public
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
//	and after that point to it. 
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

Return Super::of_Remove(anv_removenode)

end function

public function integer of_addhead (n_cst_linkedlistnode anv_newheadnode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddHead
//
//	Access:  Public
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
// Note:
//	Duplicates may not be allowed.
// Not a valid action for sorted lists.
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
n_cst_linkedlistnode lnv_locatenode

// Not a valid request when the list is sorted.
If ib_sorted Then Return FAILURE

// If duplicates are not allowed, check for duplicates.
If Not ib_duplicatesallowed Then
	If of_IsInList(anv_newheadnode) Then
		// A duplicate was encountered.
		Return FAILURE
	End If
End If

Return Super::of_AddHead(anv_newheadnode)
end function

public function integer of_addtail (n_cst_linkedlistnode anv_newtailnode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddTail
//
//	Access:  Public
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
// Note:
//	Duplicates may not be allowed.
// Not a valid action for sorted lists.
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
n_cst_linkedlistnode lnv_locatenode

// Not a valid request when the list is sorted.
If ib_sorted Then Return FAILURE

// If duplicates are not allowed, check for duplicates.
If Not ib_duplicatesallowed Then
	If of_IsInList(anv_newtailnode) Then
		// A duplicate was encountered.
		Return FAILURE
	End If
End If

Return Super::of_AddTail(anv_newtailnode)
end function

public function boolean of_isinlist (n_cst_linkedlistnode anv_node);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_IsInList
//
//	Access:  public
//
//	Arguments : 
//	anv_node  Node contain data to search for.
//
//	Returns:  Boolean
//	True - Yes in list.
// False - Not found.
//
//	Description:  
//	Determines if the Key Values in the node passed in are already in the list.
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

n_cst_linkedlistnode lnv_locatenode

// Validate arguments.
If IsNull(anv_node) Or Not IsValid(anv_node) Then Return	False

// If necessary, create the default comparison object.
if isnull(inv_compare) or not isvalid(inv_compare) then
	inv_compare = create n_cst_linkedlistnodecompare
end if

If of_find(lnv_locatenode, anv_node) = 1 Then
	// Node was found in list.
	Return True
End If

Return False
end function

public function integer of_add (n_cst_linkedlistnode anv_newnode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Add
//
//	Access:  public
//
//	Arguments :  
//	anv_newnode n_cst_linkedlistnode
//
//	Returns:  integer
//	1 = success
//	-1 = failure (could be duplicate on list that does not allow duplicates)
//
//	Description:  
//	Put a node on list.
//
//	Note:
//	Depending on attributes lists can allow duplicates.
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
n_cst_linkedlistnode	lnv_locatenode
n_cst_linkedlistnode	lnv_insertpointnode
n_cst_linkedlistnode	lnv_temp

// Validate arguments.
if isnull(anv_newnode) or not isvalid(anv_newnode) then 
	return FAILURE
end if

// See if this is the first entry.
if isnull(inv_head) or not isvalid(inv_head) then
	// Add it as the new Head.  Use ancestor of_AddHead().
	Return Super::of_AddHead(anv_newnode)
end if

// If duplicates are not allowed, check for duplicates.
If Not ib_duplicatesallowed Then
	If of_IsInList(anv_newnode) Then
		// A duplicate was encountered.
		return FAILURE
	End If
end if

// Check if the list is not sorted.
If Not ib_sorted Then
	// Add it as the new Tail.  Use ancestor of_AddTail().
	Return Super::of_AddTail(anv_newnode)
End If

// -- The list is sorted, Need to find the slot for the new entry. --

// There should be a Valid Head and Tail nodes.
If IsNull(inv_head) or Not IsValid(inv_head) Then return FAILURE
If IsNull(inv_tail) or Not IsValid(inv_tail) Then return FAILURE

// If necessary, create the default comparison object.
if isnull(inv_compare) or not isvalid(inv_compare) then
	inv_compare = create n_cst_linkedlistnodecompare
end if

// Check if the new key is Less than the current low key (Head node).
li_rc = inv_compare.of_compare(anv_newnode, inv_head)
If li_rc = inv_compare.FAILURE Then Return FAILURE
If li_rc = inv_compare.LESSTHAN Then
	// Add it as the new Head node.  Use ancestor of_AddHead().
	Return Super::of_AddHead(anv_newnode)
End If

// Check if the new key is Greater than the current High key (Tail node).
li_rc = inv_compare.of_compare(anv_newnode, inv_tail)
If li_rc = inv_compare.FAILURE Then Return FAILURE
If li_rc = inv_compare.GREATERTHAN or li_rc = inv_compare.EQUAL Then  // #11016  check for equal to insert two identical items to an empty list
	// Add it as the new Tail node.  Use the ancestor of_AddTail().
	Return Super::of_AddTail(anv_newnode)
End If

// -- The desired slot is somewhere between the Head and the Tail nodes. --

// Set the initial insertion point candidate.
lnv_insertpointnode = inv_head

lnv_insertpointnode.of_GetNext(lnv_temp)
Do While IsValid(lnv_temp)
	li_rc = inv_compare.of_compare(lnv_temp, anv_newnode)
	Choose Case li_rc
		Case inv_compare.EQUAL
			// New insertion point candidate, go get the next node.
			lnv_insertpointnode = lnv_temp
		Case inv_compare.LESSTHAN
			// New insertion point candidate, go get the next node.
			lnv_insertpointnode = lnv_temp
		Case inv_compare.GREATERTHAN
			// The current insertion point is the one.
			Exit
		CASE Else
			Return FAILURE	
	End Choose
	lnv_temp.of_GetNext(lnv_temp)
Loop

Return of_Add(anv_newnode, lnv_insertpointnode)

end function

on pfc_n_cst_list.create
call super::create
end on

on pfc_n_cst_list.destroy
call super::destroy
end on


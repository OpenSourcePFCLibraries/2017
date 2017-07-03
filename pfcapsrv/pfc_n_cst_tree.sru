HA$PBExportHeader$pfc_n_cst_tree.sru
$PBExportComments$PFC Tree List service
forward
global type pfc_n_cst_tree from n_base
end type
end forward

global type pfc_n_cst_tree from n_base autoinstantiate
end type

type variables
protected:

n_cst_treenode 		inv_root
n_cst_treenode 		inv_shiftnode
n_cst_treenode 		inv_removednode
n_cst_treenodecompare	inv_compare


end variables

forward prototypes
public function integer of_create (ref n_cst_treenode anv_currentnode)
public function integer of_destroy (n_cst_treenode anv_currentnode)
protected function integer of_search (ref n_cst_treenode anv_currentnode, n_cst_treenode anv_keynode)
protected function integer of_addnode (n_cst_treenode anv_newnode, ref n_cst_treenode anv_currentnode, ref boolean ab_height)
protected function integer of_balanceleft (ref n_cst_treenode anv_currentnode, ref boolean ab_height)
protected function integer of_balanceright (ref n_cst_treenode anv_currentnode, ref boolean ab_height)
protected function integer of_delnode (n_cst_treenode anv_keynode, ref n_cst_treenode anv_currentnode, ref boolean ab_height)
public function integer of_getroot (ref n_cst_treenode anv_node)
protected function integer of_balance (ref n_cst_treenode anv_delnode, ref boolean ab_height)
public function long of_count ()
public function integer of_get (ref n_cst_treenode anv_list[])
public function long of_destroy ()
protected function integer of_traverse (n_cst_treenode anv_currentnode, ref n_cst_treenode anv_list[], ref long al_cnt)
public function integer of_remove (ref n_cst_treenode anv_currentnode)
public function integer of_find (ref n_cst_treenode anv_currentnode, n_cst_treenode anv_keynode)
public function integer of_setcompare (n_cst_treenodecompare anv_compare)
public function integer of_add (n_cst_treenode anv_currentnode)
end prototypes

public function integer of_create (ref n_cst_treenode anv_currentnode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_create
//
//	Access:  public
//
//	Arguments : 
//	anv_currentnode   n_cst_treenode : pointer to a node
//
//	Returns:  integer
//	1 = success
//	-1 = failure
//
//	Description:  Creates a node and passes back a pointer to the node
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

anv_currentnode = create n_cst_treenode
return 1
end function

public function integer of_destroy (n_cst_treenode anv_currentnode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_destroy
//
//	Access:  public
//
//	Arguments : 
//	anv_currentnode   n_cst_treenode : pointer to a node
//
//	Returns:  integer
//	1 = success
//	-1 = failure, usually because the node is not found
//	-2 = failure, the node passed in is invalid
//
//	Description:  
// Destroys the passed node, resets the pointers of any nodes that are linked to it.
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

integer li_rc

if isnull(anv_currentnode) or not isvalid(anv_currentnode) then return -2

li_rc = of_remove(anv_currentnode)
if li_rc = 1 then 
	destroy anv_currentnode
end if
return li_rc
end function

protected function integer of_search (ref n_cst_treenode anv_currentnode, n_cst_treenode anv_keynode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_search
//
//	Access:  protected
//
//	Arguments : 
//	anv_currentnode n_cst_treenode : node to be examined, also used to return the 
//											node that was found
//	anv_keynode n_cst_treenode : contains the key information to be searched for
//
//	Returns:  integer
//	1 : success, node was found
//	-1 : failure, node was not found
//
//	Description:  
//	Recursively search the tree until the node is found (success) or the 
//	end of a branch is found (failure)
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

choose case inv_compare.of_compare(anv_keynode,anv_currentnode)
	case inv_compare.LESSTHAN 
		// anv_keynode < anv_currentnode
		anv_currentnode.of_getprev(anv_currentnode)
		if isvalid(anv_currentnode) then 
			return of_search(anv_currentnode,anv_keynode)
		end if
		
	case inv_compare.EQUAL
		// anv_keynode = anv_currentnode
		return 1
		
	case inv_compare.GREATERTHAN 
		// anv_keynode > anv_currentnode
		anv_currentnode.of_getnext(anv_currentnode)
		if isvalid(anv_currentnode) then 
			return of_search(anv_currentnode,anv_keynode)
		end if
		
end choose

return -1

end function

protected function integer of_addnode (n_cst_treenode anv_newnode, ref n_cst_treenode anv_currentnode, ref boolean ab_height);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_addnode
//
//	Access:  protected
//
//	Arguments : 
//	anv_newnode n_cst_treenode : node to be added
//	anv_currentnode n_cst_treenode : current node of the tree
//	ab_height boolean : indicates whether the 'height; of the tree has changed or not
//
//	Returns:  integer
//	1 : node was added
//	0 : node with this key already exists in the tree, so node was not added
//	-1 : node was not added due to some error
//
//	Description:  
//	Recursive function finds the properlocation for the new node and 
//	then inserts it into the tree. It also 'balances' the tree if the resulting
//	height of the branch is more that one level different than neighboring 
//	branches
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
n_cst_treenode lnv_pivot1
n_cst_treenode lnv_pivot2
n_cst_treenode lnv_temp
integer li_compare
integer li_rc

if not isvalid(anv_currentnode) then 
	// node not in tree so insert it
	ab_height = true
	anv_newnode.of_setnext(lnv_pivot1) // force left and right pointers to nil
	anv_newnode.of_setprev(lnv_pivot1) // force left and right pointers to nil
	anv_newnode.of_setbalance(0)
	anv_currentnode = anv_newnode // return the node
else
	li_compare = inv_compare.of_compare(anv_newnode,anv_currentnode)
	choose case li_compare
		case  inv_compare.LESSTHAN  
			// anv_newnode < anv_currentnode
			anv_currentnode.of_getprev(lnv_temp)
			li_rc = of_addnode(anv_newnode,lnv_temp,ab_height)
			if li_rc <= 0 then return li_rc
			anv_currentnode.of_setprev(lnv_temp)
			if ab_height then 
				// left branch has grown higher
				choose case anv_currentnode.of_getbalance()
					case 1
						anv_currentnode.of_setbalance(0)
						ab_height = false
					case 0
						anv_currentnode.of_setbalance(-1)
					case -1  
						// rebalance
						anv_currentnode.of_getprev(lnv_pivot1)
						if lnv_pivot1.of_getbalance() = -1 then // single LL rotation						
							lnv_pivot1.of_getnext(lnv_temp)
							anv_currentnode.of_setprev(lnv_temp)
							lnv_pivot1.of_setnext(anv_currentnode)
							anv_currentnode.of_setbalance(0)
							anv_currentnode = lnv_pivot1
						else 
							// double LR rotation
							lnv_pivot1.of_getnext(lnv_pivot2)
							lnv_pivot2.of_getprev(lnv_temp)
							lnv_pivot1.of_setnext(lnv_temp)
							lnv_pivot2.of_setprev(lnv_pivot1)
							
							lnv_pivot2.of_getnext(lnv_temp)
							anv_currentnode.of_setprev(lnv_temp)
							lnv_pivot2.of_setnext(anv_currentnode)
							if lnv_pivot2.of_getbalance() = -1 then
								anv_currentnode.of_setbalance(1)
							else
								anv_currentnode.of_setbalance(0)
							end if
							if lnv_pivot2.of_getbalance() = 1 then

								lnv_pivot1.of_setbalance(-1)
							else
								lnv_pivot1.of_setbalance(0)
							end if
							anv_currentnode = lnv_pivot2
						end if
						anv_currentnode.of_setbalance(0)
						ab_height = false
				end choose
			end if		
		case inv_compare.GREATERTHAN 
			// anv_newnode > anv_currentnode
			anv_currentnode.of_getnext(lnv_temp)
			li_rc = of_addnode(anv_newnode,lnv_temp,ab_height)
			if li_rc <= 0 then return li_rc
			anv_currentnode.of_setnext(lnv_temp)
			if ab_height then // Right branch has grown higher
				choose case anv_currentnode.of_getbalance()
					case -1
						anv_currentnode.of_setbalance(0)
						ab_height = false
					case 0
						anv_currentnode.of_setbalance(+1)
					case 1  
						// rebalance
						anv_currentnode.of_getnext(lnv_pivot1)
						if lnv_pivot1.of_getbalance() = 1 then // single RR rotation
							lnv_pivot1.of_getprev(lnv_temp)
							anv_currentnode.of_setnext(lnv_temp)
							lnv_pivot1.of_setprev(anv_currentnode)
							anv_currentnode.of_setbalance(0)
							anv_currentnode = lnv_pivot1
						else 
							// double RL rotation
							lnv_pivot1.of_getprev(lnv_pivot2)
							lnv_pivot2.of_getnext(lnv_temp)
							lnv_pivot1.of_setprev(lnv_temp)
							lnv_pivot2.of_setnext(lnv_pivot1)
							
							lnv_pivot2.of_getprev(lnv_temp)
							anv_currentnode.of_setnext(lnv_temp)
							lnv_pivot2.of_setprev(anv_currentnode)
							if lnv_pivot2.of_getbalance() = 1 then
								anv_currentnode.of_setbalance(-1)
							else
								anv_currentnode.of_setbalance(0)
							end if
							if lnv_pivot2.of_getbalance() = -1 then
								lnv_pivot1.of_setbalance(1)
							else
								lnv_pivot1.of_setbalance(0)
							end if
							anv_currentnode = lnv_pivot2
						end if
						anv_currentnode.of_setbalance(0)
						ab_height = false
				end choose				
			end if			
		case inv_compare.EQUAL
			// return an error (do not allow nodes with the same key)
			ab_height = false
			return 0
	end choose
end if

return 1


end function

protected function integer of_balanceleft (ref n_cst_treenode anv_currentnode, ref boolean ab_height);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_balanceleft
//
//	Access:  protected
//
//	Arguments : 
//	anv_currentnode n_cst_treenode : node to be balanced
//	ab_height boolean : indicates whether the 'height; of the tree has changed or not
//
//	Returns:  integer
//	1 : success (always)
//
//	Description:  Balances the left side of a node
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
n_cst_treenode lnv_pivot1,lnv_pivot2,lnv_temp
integer li_b1,li_b2

choose case anv_currentnode.of_getbalance() // left branch has become less high
	case -1
		anv_currentnode.of_setbalance(0)
	case 0
		anv_currentnode.of_setbalance(1)
		ab_height = false		
	case 1 // rebalance
		anv_currentnode.of_getnext(lnv_pivot1)

		li_b1 = lnv_pivot1.of_getbalance()
		if li_b1 >= 0 then // single RR rotation
			lnv_pivot1.of_getprev(lnv_temp)
			anv_currentnode.of_setnext(lnv_temp)
			lnv_pivot1.of_setprev(anv_currentnode)
			if li_b1 = 0 then
				anv_currentnode.of_setbalance(1)
				lnv_pivot1.of_setbalance(-1)
				ab_height = false		
			else
				anv_currentnode.of_setbalance(0)
				lnv_pivot1.of_setbalance(0)
			end if			
			anv_currentnode = lnv_pivot1
		else // double RL rotation
			lnv_pivot1.of_getprev(lnv_pivot2)
			li_b2 = lnv_pivot2.of_getbalance()
			
			lnv_pivot2.of_getnext(lnv_temp)
			lnv_pivot1.of_setprev(lnv_temp)
			lnv_pivot2.of_setnext(lnv_pivot1)
			
			lnv_pivot2.of_getprev(lnv_temp)
			anv_currentnode.of_setnext(lnv_temp)
			lnv_pivot2.of_setprev(anv_currentnode)
			if li_b2 = 1 then
				anv_currentnode.of_setbalance(-1)
			else
				anv_currentnode.of_setbalance(0)
			end if
			if li_b2 = -1 then
				lnv_pivot1.of_setbalance(1)
			else
				lnv_pivot1.of_setbalance(0)
			end if
			anv_currentnode = lnv_pivot2
			lnv_pivot2.of_setbalance(0)
		end if
end choose
return 1

end function

protected function integer of_balanceright (ref n_cst_treenode anv_currentnode, ref boolean ab_height);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_balanceright
//
//	Access:  protected
//
//	Arguments : 
//	anv_currentnode n_cst_treenode : node to be balanced
//	ab_height boolean : indicates whether the 'height; of the tree has changed or not
//
//	Returns:  integer
//	1 : success (always)
//
//	Description:  Balances the right side of a node
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
n_cst_treenode lnv_pivot1,lnv_pivot2,lnv_temp
integer li_b1,li_b2

choose case anv_currentnode.of_getbalance() // right branch has become less high
	case 1
		anv_currentnode.of_setbalance(0)
	case 0
		anv_currentnode.of_setbalance(-1)
		ab_height = false		
	case -1 // rebalance
		anv_currentnode.of_getprev(lnv_pivot1)

		li_b1 = lnv_pivot1.of_getbalance()
		if li_b1 <= 0 then // single LL rotation
			lnv_pivot1.of_getnext(lnv_temp)
			anv_currentnode.of_setprev(lnv_temp)
			lnv_pivot1.of_setnext(anv_currentnode)
			if li_b1 = 0 then
				anv_currentnode.of_setbalance(-1)
				lnv_pivot1.of_setbalance(1)
				ab_height = false		
			else
				anv_currentnode.of_setbalance(0)
				lnv_pivot1.of_setbalance(0)
			end if			
			anv_currentnode = lnv_pivot1
		else // double LR rotation
			lnv_pivot1.of_getnext(lnv_pivot2)
			li_b2 = lnv_pivot2.of_getbalance()
			
			lnv_pivot2.of_getprev(lnv_temp)
			lnv_pivot1.of_setnext(lnv_temp)
			lnv_pivot2.of_setprev(lnv_pivot1)
			
			lnv_pivot2.of_getnext(lnv_temp)
			anv_currentnode.of_setprev(lnv_temp)
			lnv_pivot2.of_setnext(anv_currentnode)
			if li_b2 = -1 then
				anv_currentnode.of_setbalance(1)
			else
				anv_currentnode.of_setbalance(0)
			end if
			if li_b2 = 1 then
				lnv_pivot1.of_setbalance(-1)
			else
				lnv_pivot1.of_setbalance(0)
			end if
			anv_currentnode = lnv_pivot2
			lnv_pivot2.of_setbalance(0)
		end if
end choose
return 1

end function

protected function integer of_delnode (n_cst_treenode anv_keynode, ref n_cst_treenode anv_currentnode, ref boolean ab_height);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_delnode
//
//	Access:  protected
//
//	Arguments : 
//	anv_keynode n_cst_treenode : contains the node to be deleted
//	anv_currentnode n_cst_treenode : Node to be examined
//	ab_height boolean : indicates whether the 'height; of the tree has changed or not
//
//	Returns:  integer
//	1 : Node was deleted
//	-1 : invalid node passed in or node not found
//
//	Description: 
//	Delete the node from the tree whose key matched the node passed
//	in the anv_keynode parameter. Deletion of the node may cause
//	the tree to be re-balanced.
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

integer li_compare
n_cst_treenode lnv_temp
n_cst_treenode lnv_right
n_cst_treenode lnv_left

if not isvalid(anv_currentnode) then
	ab_height = false
	return -1
else
	li_compare = inv_compare.of_compare(anv_keynode,anv_currentnode)
	if li_compare = inv_compare.LESSTHAN then
		anv_currentnode.of_getprev(lnv_temp)
		of_delnode(anv_keynode,lnv_temp,ab_height)
		anv_currentnode.of_setprev(lnv_temp)
		if ab_height then of_balanceleft(anv_currentnode,ab_height)
	elseif li_compare = inv_compare.GREATERTHAN  then
		anv_currentnode.of_getnext(lnv_temp)
		of_delnode(anv_keynode,lnv_temp,ab_height)
		anv_currentnode.of_setnext(lnv_temp)
		if ab_height then of_balanceright(anv_currentnode,ab_height)
	else // delete anv_currentnode
		inv_shiftnode = anv_currentnode
		inv_shiftnode.of_getnext(lnv_right)
		inv_shiftnode.of_getprev(lnv_left)
		if not isvalid(lnv_right) then
			anv_currentnode = lnv_left
			ab_height = true
		elseif not isvalid(lnv_left) then
			anv_currentnode = lnv_right
			ab_height = true
		else
			of_balance(lnv_left,ab_height)
			inv_shiftnode.of_setprev(lnv_left)
			if ab_height then of_balanceleft(anv_currentnode,ab_height)
		end if
	end if
end if
return 1

end function

public function integer of_getroot (ref n_cst_treenode anv_node);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_getroot
//
//	Access:  public
//
//	Arguments : 
//	anv_node n_cst_treenode : Returns the root node
//
//	Returns:  integer
//	1 : success
// -1 : failure, root node is invalid
//
//	Description:  
//	Get a pointer to the root node of the tree
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

// Make sure there is something to return.
if isnull(inv_root) or not isvalid(inv_root) then 
	return -1
end if

anv_node = inv_root
return 1

end function

protected function integer of_balance (ref n_cst_treenode anv_delnode, ref boolean ab_height);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_balance
//
//	Access:  protected
//
//	Arguments : 
//	anv_delnode n_cst_treenode : node to be searched
//	ab_height boolean : indicates whether the 'height; of the tree has changed or not
//
//	Returns:  integer
//	1 : success
//
//	Description:  
//	Recursively searches the tree to balance it after a deletion
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

n_cst_treenode lnv_temp

anv_delnode.of_getnext(lnv_temp)

if isvalid(lnv_temp) then
	of_balance(lnv_temp,ab_height)
	anv_delnode.of_setnext(lnv_temp)
	if ab_height then of_balanceright(anv_delnode,ab_height)
else
	anv_delnode.of_copyto(inv_shiftnode)
	inv_removednode = anv_delnode
	anv_delnode.of_getprev(lnv_temp)
	anv_delnode =lnv_temp
	ab_height = true
end if

return 1
end function

public function long of_count ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_count
//
//	Access:  public
//
//	Arguments : None
//
//	Returns:  long
//	the number of nodes in the list
//
//	Description:  
//	Counts the number of nodes in the list. Rather than reinvent the
//	traversal process we just call the of_list function which returns the
//	number of nodes in the tree.
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

n_cst_treenode ln_node[]

setpointer(hourglass!)
return of_get(ln_node)
end function

public function integer of_get (ref n_cst_treenode anv_list[]);//////////////////////////////////////////////////////////////////////////////
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
//	 -1 : Error
//
//	Description:  
//	Returns an unbounded array of nodes. In left node first order
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

long ll_cnt = 0
integer li_rc

setpointer(hourglass!)
if isvalid(inv_root) then 
	of_traverse(inv_root,anv_list,ll_cnt)
end if

return ll_cnt

end function

public function long of_destroy ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_destroy
//
//	Access:  public
//
//	Arguments: None
//
//	Returns:  Long
//	The number of nodes destroyed.
// -1 : error
//
//	Description:  
//	Delete and destroy all the nodes in the tree
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

n_cst_treenode lnv_list[]
long 		ll_cnt
long		ll_index
integer  li_rc

ll_cnt = of_get(lnv_list)

for ll_index = 1 to ll_cnt
	li_rc = of_destroy(lnv_list[ll_index])
	if li_rc = -1 then 
		return -1
	end if
next

return ll_cnt
end function

protected function integer of_traverse (n_cst_treenode anv_currentnode, ref n_cst_treenode anv_list[], ref long al_cnt);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_traverse
//
//	Access:  protected
//
//	Arguments : 
//	anv_currentnode  Node to be examined
//	anv_list[] (by reference) list of nodes found
//	al_cnt long (by reference) count of nodes in anv_list
//
//	Returns:  integer
//	1 : Success, it was passed a valid node
// -1 : failure, it was passed an invalid node
//
//	Description: 
//	Traverse the tree, adding the nodes visited to the anv_list after the 
//	left node has been visited but before the right node has been visited.
//	This gives a list of all of the nodes in the tree in sorted order.
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

n_cst_treenode lnv_temp

// Validate arguments.
if isnull(anv_currentnode) or not isvalid(anv_currentnode) then return -1

// Get the previous node.
anv_currentnode.of_getprev(lnv_temp)

// Recursive call to traverse.
if isvalid(lnv_temp) then of_traverse(lnv_temp,anv_list,al_cnt)

// Add entry into array.
al_cnt++
anv_list[al_cnt] = anv_currentnode

// Get the next node.
anv_currentnode.of_getnext(lnv_temp)

// Recursive call to traverse.
if isvalid(lnv_temp) then of_traverse(lnv_temp,anv_list,al_cnt)

return 1
end function

public function integer of_remove (ref n_cst_treenode anv_currentnode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_remove
//
//	Access:  public
//
//	Arguments : 
//	anv_currentnode (by ref) : pointer to the node that contains 
//			the key/data that is to be removed
//
//	Returns:  integer
// 1 : Success, the node was removed
//	-1 : Failure, the node was not found
// -2 : Failure, the node passed in is invalid
//
//	Description: 
//	Removes the node that anv_currentnode identifies. However due to
//	the rotations that may have occurred while rebalancing the tree after 
//	the deletion occurs, the data in the original node may have been 
//	moved. This function does return the node that was actually 
//	removed but it may not be the same node that was requested to be 
//	removed. So be careful and if you need the contents of the node 
//	after removing it make a copy before removal or use a dummy node 
//	to identify the node to be deleted. We suggest that you not call this 
//	function yourself, but use the destroy function to remove and 
//	destroy the node.
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

boolean 		lb_height = false
n_cst_treenode 	lnv_keynode
integer 		li_rc

// Validate arguments.
if isnull(anv_currentnode) or not isvalid(anv_currentnode) then 
	return -2
end if

setpointer(hourglass!)

// make a copy of the node so that it contains the key and data information
of_create(lnv_keynode)
anv_currentnode.of_copyto(lnv_keynode)

// use the copy to specify the search for the node
li_rc = of_delnode(lnv_keynode,inv_root,lb_height)
anv_currentnode = inv_removednode
destroy lnv_keynode

return li_rc

end function

public function integer of_find (ref n_cst_treenode anv_currentnode, n_cst_treenode anv_keynode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_find
//
//	Access:  public
//
//	Arguments : 
//	anv_currentnode (by ref) : Returns a pointer to the node that was found
//	anv_keynode  : Node that contains the key information to be found
//
//	Returns:  integer
//	1 : Success, node was found
//	-1 : Failure
//
//	Description:  
//	Returns a pointer to the node that matches the key node.
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
If IsNull(anv_keynode) or Not IsValid(anv_keynode) Then Return -1

// Validate required references.
If IsNull(inv_Root) or Not IsValid(inv_Root) Then Return -1

setpointer(hourglass!)
anv_currentnode = inv_root
return of_search(anv_currentnode,anv_keynode)
end function

public function integer of_setcompare (n_cst_treenodecompare anv_compare);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_setcompare
//
//	Access:  public
//
//	Arguments : 
//	anv_compare   n_cst_nodecompare : the object to be used to compare two nodes
//
//	Returns:  integer
//	1 = success
// -1 = failure
// -2 = failure, the compare object has already been set
//
//	Description:  
//	Allows the specification of a different comparison object
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

// Validate the comparison object.
if not isvalid(anv_compare) then 
	return -1 
end if

// Validate the comparison object.
if isvalid(inv_compare) then
	// Cannot reset comparison object
	return -2
end If

// Reset the comparison object.
inv_compare = anv_compare
return 1
end function

public function integer of_add (n_cst_treenode anv_currentnode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_add
//
//	Access:  public
//
//	Arguments : 
//	anv_currentnode the node to be added to the tree
//
//	Returns:  integer
//	1 : node was added
//	0 : node with this key already exists in the tree, so node was not added
//	-1 : node was not added due to an error
//	-2 : node to be added is invalid
//
//	Description:  
//	Adds the passed node to the tree
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

boolean lb_height
setpointer(hourglass!)

// Validate parameters.
if isnull(anv_currentnode) or not isvalid(anv_currentnode) then return -2 

// If necessarey, create the comparison object.
if isnull(inv_compare) or not isvalid(inv_compare) then 
	// take the default comparision service
	inv_compare = create n_cst_treenodecompare
end if

// call the recursive function of_addnode
lb_height = false
return of_addnode(anv_currentnode,inv_root,lb_height) 

end function

on pfc_n_cst_tree.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_tree.destroy
TriggerEvent( this, "destructor" )
end on


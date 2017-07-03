HA$PBExportHeader$pfc_n_cst_nodebase.sru
$PBExportComments$PFC node base class
forward
global type pfc_n_cst_nodebase from n_base
end type
end forward

global type pfc_n_cst_nodebase from n_base
end type
global pfc_n_cst_nodebase pfc_n_cst_nodebase

type variables
protected:

// Pointers
n_cst_nodebase	inv_prev
n_cst_nodebase 	inv_next

// Data Structure
any 		ia_Key
any 		ia_Data

end variables

forward prototypes
public function integer of_getdata (ref any aa_data)
public function integer of_getkey (ref any aa_key)
public function integer of_setdata (any aa_data)
public function integer of_setkey (any aa_key)
public function integer of_setprev (n_cst_nodebase anv_node)
public function integer of_setnext (n_cst_nodebase anv_node)
public function integer of_getnext (ref n_cst_nodebase anv_node)
public function integer of_getprev (ref n_cst_nodebase anv_node)
public function integer of_copyto (ref n_cst_nodebase anv_copy)
end prototypes

public function integer of_getdata (ref any aa_data);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_getdata
//
//	Access:  public
//
//	Arguments : 
//	ref aa_data  data to be retrieved
//
//	Returns:  integer
//	1 = success
//	-1 = Failure
//
//	Description: 
// Returns the ia_data property
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

aa_data = ia_data
return 1
end function

public function integer of_getkey (ref any aa_key);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_getkey
//
//	Access:  public
//
//	Arguments : 
//	ref aa_key  key to be retrieved
//
//	Returns:  integer
//	1 = success
//	-1 = Failure
//
//	Description:  
//	Returns the ia_key property
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

aa_key = ia_key
return 1
end function

public function integer of_setdata (any aa_data);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_setdata
//
//	Access:  public
//
//	Arguments : 
//	aa_data   any : data to be set
//
//	Returns:  integer
//	1 = success
//	-1 = Failure
//
//	Description:  
//	Sets the ia_data property
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

ia_data = aa_data
return 1
end function

public function integer of_setkey (any aa_key);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_setkey
//
//	Access:  public
//
//	Arguments : 
//	aa_key   key to be set
//
//	Returns:  integer
//	1 = success
//	-1 = Failure
//
//	Description:  
//	Sets the Key property
//
// Note:
// In certain situations changing the key values after the node is in the list
// will cause errors.  For instance, cases where the keys are 'sorted' or 
// 'duplicates' are not allowed.
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

ia_key = aa_key
return 1
end function

public function integer of_setprev (n_cst_nodebase anv_node);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_setprev
//
//	Access:  public
//
//	Arguments : 
//	anv_node   pointer to previous node
//
//	Returns:  integer
//	1 = success
//	-1 = Failure
//
//	Description:  
//	Sets the inv_prev pointer to the previous node
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

inv_prev = anv_node
return 1
end function

public function integer of_setnext (n_cst_nodebase anv_node);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_setnext
//
//	Access:  public
//
//	Arguments : 
//	anv_node    pointer to next node
//
//	Returns:  integer
//	1 = success
//	-1 = Failure
//
//	Description:  
//	Sets the inv_next pointer to the next node
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

inv_next = anv_node
return 1
end function

public function integer of_getnext (ref n_cst_nodebase anv_node);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_getnext
//
//	Access:  public
//
//	Arguments : 
//	anv_node   (by reference) node to be retrieved from the list
//
//	Returns:  integer
//	1 = success
//	-1 = Failure, No next node
//
//	Description:  
//	Retrieves the next node after the current node
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

n_cst_nodebase lnv_nil

// Validate that there is a valid next.
If IsNull(inv_next) or Not IsValid(inv_next) Then
	anv_node = lnv_nil
	Return -1
End If

anv_node = inv_next
return 1

end function

public function integer of_getprev (ref n_cst_nodebase anv_node);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_getprev
//
//	Access:  public
//
//	Arguments : 
//	anv_node   (by reference) node to be retrieved from the list
//
//	Returns:  integer
//	1 = success
//	-1 = Failure, No next node
//
//	Description:  
//	Retrieves the node before the current node.
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

n_cst_nodebase lnv_nil

// Validate that there is a valid previous.
If IsNull(inv_prev) or Not IsValid(inv_prev) Then
	anv_node = lnv_nil
	Return -1
End If

anv_node = inv_prev
return 1
end function

public function integer of_copyto (ref n_cst_nodebase anv_copy);//////////////////////////////////////////////////////////////////////////////
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

if IsNull(anv_copy) or not isvalid(anv_copy) then return -1

anv_copy.of_SetKey(ia_key)
anv_copy.of_SetData(ia_data)
anv_copy.of_SetNext(inv_next)
anv_copy.of_SetPrev(inv_prev)
return 1
end function

on pfc_n_cst_nodebase.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_nodebase.destroy
TriggerEvent( this, "destructor" )
end on


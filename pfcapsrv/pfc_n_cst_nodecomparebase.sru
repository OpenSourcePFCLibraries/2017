HA$PBExportHeader$pfc_n_cst_nodecomparebase.sru
$PBExportComments$PFC node compare base class
forward
global type pfc_n_cst_nodecomparebase from n_base
end type
end forward

global type pfc_n_cst_nodecomparebase from n_base
end type
global pfc_n_cst_nodecomparebase pfc_n_cst_nodecomparebase

type variables
Public:

// Comparison return value constants.
constant integer EQUAL = 0
constant integer LESSTHAN = 1
constant integer GREATERTHAN = 2

end variables

forward prototypes
public function integer of_compare (any aa_value1, any aa_value2)
public function integer of_compare (n_cst_nodebase anv_node1, n_cst_nodebase anv_node2)
end prototypes

public function integer of_compare (any aa_value1, any aa_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Compare
//
//	Access:  public
//
//	Arguments : 
//	aa_value1  first value
//	aa_value2  second value
//
//	Returns:  integer
//	0 : EQUAL  -  if aa_value1 = aa_value2
// 1 : LESSTHAN - if aa_value1 < aa_value2
//	2 : GREATERTHAN - if aa_value1 > aa_value2
// -1 : FAILURE (could be datatypes of values do not match, 
//						one of the values is null,
// 					one of the values is not a simple type, ...)
//
//	Description:  
//	Performs a simple comparision of the values.
//
// Note:
//	If a more complicated comparision is needed, 
//	recommend that the developer inherit and override this function and 
//	perform the test there. If you do override, MAKE SURE that you 
//	continue to provide the same return codes as this function does
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

string ls_keytype1
string ls_keytype2

// Validate the parameters.
If IsNull(aa_value1) Then return FAILURE
If IsNull(aa_value2) Then return FAILURE

// Get the values type.
ls_keytype1 = classname(aa_value1)
ls_keytype2 = classname(aa_value2)

// Comfirm keytypes are comparable.
if ls_keytype1 <> ls_keytype2 then 
	// key class types are different so we cannot perform a compare
	return FAILURE
end if

// Validate keytypes.
if ls_keytype1 = "" or isnull(ls_keytype1) then return FAILURE
if ls_keytype2 = "" or isnull(ls_keytype2) then return FAILURE

// -- Values are comparable.  --
if aa_value1 < aa_value2 then
	return LESSTHAN
elseif aa_value1 = aa_value2 then
	return EQUAL
else
	return GREATERTHAN
end if
end function

public function integer of_compare (n_cst_nodebase anv_node1, n_cst_nodebase anv_node2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Compare
//
//	Access:  public
//
//	Arguments : 
//	anv_node1  first node
//	anv_node2  second node
//
//	Returns:  integer
//	0 : EQUAL  -  if anv_node1 = anv_node2
// 1 : LESSTHAN - if av_node1 < anv_node2
//	2 : GREATERTHAN - if anv_node1 > anv_node2
// -1 : FAILURE (could be datatypes of keys do not match, 
//						one of the nodes is invalid, one of the keys is null,
// 					one of the keys is not a simple type, ...)
//
//	Description:  
//	Performs a simple comparision of the keys from each of the passed 
//	nodes. 
//
// Note:
//	If a more complicated comparision is needed, 
//	recommend that the developer inherit and override this function and 
//	perform the test there. If you do override, MAKE SURE that you 
//	continue to provide the same return codes as this function does
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

any	 	la_key1
any	 	la_key2
integer	li_rc

// Validate the parameters.
if Isnull(anv_node1) or Not IsValid(anv_node1) then return FAILURE
if Isnull(anv_node2) or Not IsValid(anv_node2) then return FAILURE

// Get the keys.
anv_node1.of_getkey(la_key1)
anv_node2.of_getkey(la_key2)

// Compare the values.
li_rc = of_Compare(la_key1, la_key2)

Return li_rc
end function

on pfc_n_cst_nodecomparebase.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_nodecomparebase.destroy
TriggerEvent( this, "destructor" )
end on


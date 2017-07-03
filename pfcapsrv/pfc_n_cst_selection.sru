HA$PBExportHeader$pfc_n_cst_selection.sru
$PBExportComments$PFC Selection service
forward
global type pfc_n_cst_selection from n_base
end type
end forward

global type pfc_n_cst_selection from n_base autoinstantiate
end type

type variables
protected:
string	is_defaulttitle = "Open"
end variables

forward prototypes
public function integer of_open (string as_dataobject, ref any aa_returnval[], ref n_tr atr_object, string as_colreturn[], any aa_argument[20], string as_title)
public function integer of_open (string as_dataobject, ref any aa_returnval[])
public function integer of_open (string as_dataobject, ref any aa_returnval[], ref n_tr atr_object)
public function integer of_open (string as_dataobject, ref any aa_returnval[], ref n_tr atr_object, string as_colreturn[])
public function integer of_open (string as_dataobject, ref any aa_returnval[], ref n_tr atr_object, string as_colreturn[], any aa_argument[20])
public function integer of_open (string as_dataobject, ref any aa_returnval[], string as_colreturn[])
public function integer of_open (string as_dataobject, ref any aa_returnval[], string as_colreturn[], string as_title)
public function integer of_open (string as_dataobject, ref any aa_returnval[], readonly powerobject apo_object[])
public function integer of_open (string as_dataobject, ref any aa_returnval[], readonly powerobject apo_object[], string as_colreturn[])
public function integer of_open (string as_dataobject, ref any aa_returnval[], readonly powerobject apo_object[], string as_colreturn[], string as_title)
end prototypes

public function integer of_open (string as_dataobject, ref any aa_returnval[], ref n_tr atr_object, string as_colreturn[], any aa_argument[20], string as_title);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Open
//
//	Access:  public
//
//	Arguments:
//	as_dataobject   DataWindow object to use for selection
//	aa_returnval[]   Return values from the columns on the row selected (by REF)
//	atr_object   Transaction object to use to populate the selection DW
//	as_colreturn[]   Column names on the selection DW to return the values for
//	aa_argument[20]   Retrieval argument values for the selection DW
//	as_title   Title of the selection window
//
//	Returns:  integer
//	# of values returned
//	-1 = error
//
//	Description:  Opens the selection window
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

integer	li_rc
n_cst_selectionattrib	lnv_sel

lnv_sel.is_dataobject = as_dataobject
lnv_sel.itr_object = atr_object
lnv_sel.is_columnreturn = as_colreturn
lnv_sel.ia_argument = aa_argument
lnv_sel.is_title = as_title

OpenWithParm (w_selection, lnv_sel)

lnv_sel = message.powerobjectparm
li_rc = UpperBound (lnv_sel.ia_returnval)
aa_returnval = lnv_sel.ia_returnval

return li_rc
end function

public function integer of_open (string as_dataobject, ref any aa_returnval[]);n_tr	ltr_object
string	ls_colreturn[]
any	la_argument[]

SetNull (ltr_object)
return of_open (as_dataobject, aa_returnval[], ltr_object, ls_colreturn[], la_argument[], is_defaulttitle)
end function

public function integer of_open (string as_dataobject, ref any aa_returnval[], ref n_tr atr_object);string	ls_colreturn[]
any	la_argument[]

return of_open (as_dataobject, aa_returnval[], atr_object, ls_colreturn[], la_argument[], is_defaulttitle)
end function

public function integer of_open (string as_dataobject, ref any aa_returnval[], ref n_tr atr_object, string as_colreturn[]);any	la_argument[]

return of_open (as_dataobject, aa_returnval[], atr_object, as_colreturn[], la_argument[], is_defaulttitle)
end function

public function integer of_open (string as_dataobject, ref any aa_returnval[], ref n_tr atr_object, string as_colreturn[], any aa_argument[20]);return of_open (as_dataobject, aa_returnval[], atr_object, as_colreturn[], aa_argument[], is_defaulttitle)
end function

public function integer of_open (string as_dataobject, ref any aa_returnval[], string as_colreturn[]);any	la_argument[]
n_tr	ltr_object

SetNull (ltr_object)
return of_open (as_dataobject, aa_returnval[], ltr_object, as_colreturn[], la_argument[], is_defaulttitle)
end function

public function integer of_open (string as_dataobject, ref any aa_returnval[], string as_colreturn[], string as_title);any	la_argument[]
n_tr	ltr_object

SetNull (ltr_object)
return of_open (as_dataobject, aa_returnval[], ltr_object, as_colreturn[], la_argument[], as_title)
end function

public function integer of_open (string as_dataobject, ref any aa_returnval[], readonly powerobject apo_object[]);string	ls_colreturn[]

return of_open (as_dataobject, aa_returnval[], apo_object, ls_colreturn[], is_defaulttitle)
end function

public function integer of_open (string as_dataobject, ref any aa_returnval[], readonly powerobject apo_object[], string as_colreturn[]);return of_open (as_dataobject, aa_returnval[], apo_object, as_colreturn[], is_defaulttitle)

end function

public function integer of_open (string as_dataobject, ref any aa_returnval[], readonly powerobject apo_object[], string as_colreturn[], string as_title);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Open
//
//	Access:  public
//
//	Arguments:
//	as_dataobject   DataWindow object to use for selection
//	aa_returnval[]   Return values that were selected
//	apo_object[]   Array of data to be used to populate the DW
//	as_colreturn[]   Column names to return the values for
//	as_title   Title of the selection window
//
//	Returns:  integer
//	# of values returned
//
//	Description:  Opens the selection window
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

integer	li_rc
n_cst_selectionattrib	lnv_sel

lnv_sel.is_dataobject = as_dataobject
lnv_sel.ipo_data = apo_object
lnv_sel.is_columnreturn = as_colreturn
lnv_sel.is_title = as_title

OpenWithParm (w_selection, lnv_sel)

lnv_sel = message.powerobjectparm
li_rc = UpperBound (lnv_sel.ia_returnval)
aa_returnval = lnv_sel.ia_returnval

return li_rc
end function

on pfc_n_cst_selection.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_selection.destroy
TriggerEvent( this, "destructor" )
end on


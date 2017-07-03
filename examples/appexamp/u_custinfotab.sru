HA$PBExportHeader$u_custinfotab.sru
$PBExportComments$From u_tagpg for w_tablink; dw_1 is linked to u_master's dw_1 by scrolling; presents customer info for a selected sales order.
forward
global type u_custinfotab from u_tabpg
end type
type dw_1 from u_dw within u_custinfotab
end type
end forward

global type u_custinfotab from u_tabpg
int Width=2528
int Height=612
long BackColor=77633680
long PictureMaskColor=12632256
long TabBackColor=77633680
string PictureName="picture!"
string PowerTipText="Scrolls to the customer information for selected sales order"
string Text="Scroll to Customer Information"
dw_1 dw_1
end type
global u_custinfotab u_custinfotab

type variables
Protected:
boolean           ib_constructor
u_tab               itab_parent 
w_tablink         iw_parentwindow



end variables

on u_custinfotab.create
int iCurrent
call u_tabpg::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=dw_1
end on

on u_custinfotab.destroy
call u_tabpg::destroy
destroy(this.dw_1)
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Inserts a reference of itself into its parent's control array.
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

integer   li_upperbound
tab       ltab_parent

if ib_constructor then return

of_GetParentWindow(iw_parentwindow)
ltab_parent = GetParent()

if IsNull(ltab_parent) or not IsValid(ltab_parent) then
	return -1
end if

itab_parent = ltab_parent 

li_upperbound = UpperBound(ltab_parent.control)
li_upperbound++
ltab_parent.control[li_upperbound] = this

ib_constructor =  true
end event

type dw_1 from u_dw within u_custinfotab
int X=32
int Y=24
int Width=2455
int Height=560
string DataObject="d_custtab"
boolean VScrollBar=false
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Initializes linkage in the detail datawindow.
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

// Start the linkage service.
of_SetLinkage(true)

// Identify the u_dw descendent that will act as the 'master'
// for this linkage relationship.
if inv_linkage.of_SetMaster(iw_parentwindow.dw_1) <> 1 then
	MessageBox("Linkage Error","Master does not exist.")
end if

// Define the columns to be linked together by the
// linkage service.
inv_linkage.of_Register("cust_id","cust_id")

// Define the linkage type that will be used to align the 
// DataWindows.  (FILTER, RETRIEVE, or SCROLL)
inv_linkage.of_SetStyle(inv_linkage.SCROLL)

// Set up visual confirmation of saves and deletes.
// This will be the initial setting for the example.
//inv_linkage.of_SetUpdateRowOnChange(true)
//inv_linkage.of_SetConfirmOnRowChange(false)

// Set the Update Style for this relationship.
inv_linkage.of_SetUpdateStyle(inv_linkage.BOTTOMUP)

end event

event pfc_retrieve;call super::pfc_retrieve;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_retrieve
//
//	Arguments:
//	None
//
//	Returns:
//	long
//	The number of rows retrieved from the database
// -1 if it fails
// If any argument's value is NULL, pfc_retrieve returns NULL
//
//	Description:
//	Retrieves data into the DataWindow.
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

return this.Retrieve()
end event


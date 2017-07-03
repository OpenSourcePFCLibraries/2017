HA$PBExportHeader$u_prodlinetab.sru
$PBExportComments$From u_tagpg for w_tablink; dw_1 is linked to u_master's dw_1 by retrieval argument; presents line items for a selected sales order.
forward
global type u_prodlinetab from u_tabpg
end type
type dw_1 from u_dw within u_prodlinetab
end type
type p_1 from u_p within u_prodlinetab
end type
end forward

global type u_prodlinetab from u_tabpg
int Width=2519
int Height=612
long BackColor=77633680
long PictureMaskColor=12632256
long TabBackColor=77633680
string PictureName="arrangeicons!"
string PowerTipText="Selected items ordered by retrieval argument for selected sales order"
string Text="Items Ordered (by Retrieval Argument)"
dw_1 dw_1
p_1 p_1
end type
global u_prodlinetab u_prodlinetab

type variables
Protected:
boolean            ib_constructor
u_tab                itab_parent
w_tablink          iw_parentwindow


end variables

on u_prodlinetab.create
int iCurrent
call u_tabpg::create
this.dw_1=create dw_1
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=dw_1
this.Control[iCurrent+2]=p_1
end on

on u_prodlinetab.destroy
call u_tabpg::destroy
destroy(this.dw_1)
destroy(this.p_1)
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Inserts a reference of itself into the parentwindow's control array.
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

type dw_1 from u_dw within u_prodlinetab
int X=32
int Y=24
int Width=2455
int Height=560
string DataObject="d_lineitemstab"
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
// Initialize the Linkage Service in the detail datawindow.
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
inv_linkage.of_Register("sales_id","sales_id")

// Define the linkage type that will be used to align the 
// DataWindows.  (FILTER, RETRIEVE, or SCROLL)
inv_linkage.of_SetStyle(inv_linkage.RETRIEVE)

// Set up visual confirmation of saves and deletes.
// This will be the initial setting for the example.
inv_linkage.of_SetUpdateOnRowChange(true)
inv_linkage.of_SetConfirmOnRowChange(false)

// Set the Update Style for this relationship.
inv_linkage.of_SetUpdateStyle(inv_linkage.BOTTOMUP)

SetRowFocusIndicator(p_1)
end event

type p_1 from u_p within u_prodlinetab
int X=2674
int Y=224
int Width=73
int Height=64
string PictureName="rowind.bmp"
boolean OriginalSize=true
end type


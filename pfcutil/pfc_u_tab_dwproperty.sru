HA$PBExportHeader$pfc_u_tab_dwproperty.sru
$PBExportComments$PFC DataWindow Property - The main tab object
forward
global type pfc_u_tab_dwproperty from u_tab
end type
type tabpage_services from u_tabpg_dwproperty_services within pfc_u_tab_dwproperty
end type
type tabpage_services from u_tabpg_dwproperty_services within pfc_u_tab_dwproperty
end type
type tabpage_buffers from u_tabpg_dwproperty_buffers within pfc_u_tab_dwproperty
end type
type tabpage_buffers from u_tabpg_dwproperty_buffers within pfc_u_tab_dwproperty
end type
type tabpage_status from u_tabpg_dwproperty_status within pfc_u_tab_dwproperty
end type
type tabpage_status from u_tabpg_dwproperty_status within pfc_u_tab_dwproperty
end type
end forward

global type pfc_u_tab_dwproperty from u_tab
integer width = 1824
integer height = 1656
tabpage_services tabpage_services
tabpage_buffers tabpage_buffers
tabpage_status tabpage_status
event type integer pfc_propertyopen ( )
event type integer pfc_propertyapply ( )
event type integer pfc_propertystart ( n_cst_dwpropertyattrib anv_attrib )
event type integer pfc_propertyinitialize ( n_cst_dwpropertyattrib anv_attrib )
end type
global pfc_u_tab_dwproperty pfc_u_tab_dwproperty

type variables
Protected:
u_dw	idw_Requestor
n_cst_dwpropertyattrib inv_attrib
end variables

event pfc_propertyopen;call super::pfc_propertyopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyOpen
//
//	Arguments: None
//
//	Returns: Integer
//	 1 = successful
// -1 = Error
//
//	Description:
//	 Perform Open functionality.
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

Integer 	li_rc
Any		la_rc
Integer	li_upper
Integer	li_cnt

// Loop through all the tab pages.
li_upper = Upperbound(this.Control)
For li_cnt = 1 to li_upper
	la_rc = this.Control[li_cnt].Dynamic Event pfc_PropertyOpen()
	If ClassName(la_rc) = 'integer' or ClassName(la_rc)='long' Then
		// The pfc_PropertyOpen was found, validate the return code.
		If la_rc < 0 Then Return -1
	End If
Next

Return 1

end event

event pfc_propertyapply;call super::pfc_propertyapply;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyApply
//
//	Arguments: None
//
//	Returns: Integer
//	 1 = successful
// -1 = Error
//
//	Description:
//	 Perform Apply functionality.
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

Integer 	li_rc
Any		la_rc
Integer	li_upper
Integer	li_cnt

// Loop through all the tab pages.
li_upper = Upperbound(this.Control)
For li_cnt = 1 to li_upper
	la_rc = this.Control[li_cnt].Dynamic Event pfc_PropertyApply()
	If ClassName(la_rc) = 'integer' or ClassName(la_rc)='long' Then
		// The pfc_PropertyApply was found, validate the return code.
		If la_rc < 0 Then Return -1
	End If
Next

Return 1
end event

event pfc_propertystart;call super::pfc_propertystart;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyStart
//
//	Arguments:  
//	 anv_attrib   The datawindow property attributes.
//
//	Returns: Integer
//	 1 = successful
// -1 = Error
//
//	Description:
//	 Start the object And call the 'Initialize' process for the specific 
//	 functionality.
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

Integer 	li_rc
Any		la_rc
Integer	li_upper
Integer	li_cnt

// Validate.
If IsNull(anv_attrib) or Not IsValid(anv_attrib) Then
	Return -1
End If
If IsNull(anv_attrib.idw_requestor) or Not IsValid(anv_attrib.idw_requestor) Then
	Return -1
End If

// Store the Attributes.
inv_attrib = anv_attrib

// Get the Requestor reference.
idw_requestor = inv_attrib.idw_requestor

// Loop through all the tab pages.
li_upper = Upperbound(this.Control)
For li_cnt = 1 to li_upper
	la_rc = this.Control[li_cnt].Dynamic Event pfc_PropertyStart(inv_attrib)
	If ClassName(la_rc) = 'integer' or ClassName(la_rc)='long' Then
		// The pfc_PropertyStart was found, validate the return code.
		If la_rc < 0 Then Return -1
	End If
Next

// Call the 'Initialize process'.
li_rc = this.Event pfc_propertyInitialize(inv_attrib)

Return li_rc
end event

on pfc_u_tab_dwproperty.create
this.tabpage_services=create tabpage_services
this.tabpage_buffers=create tabpage_buffers
this.tabpage_status=create tabpage_status
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tabpage_services
this.Control[iCurrent+2]=this.tabpage_buffers
this.Control[iCurrent+3]=this.tabpage_status
end on

on pfc_u_tab_dwproperty.destroy
call super::destroy
destroy(this.tabpage_services)
destroy(this.tabpage_buffers)
destroy(this.tabpage_status)
end on

type tabpage_services from u_tabpg_dwproperty_services within pfc_u_tab_dwproperty
integer x = 18
integer y = 100
integer width = 1787
integer height = 1540
string text = " Services "
end type

type tabpage_buffers from u_tabpg_dwproperty_buffers within pfc_u_tab_dwproperty
integer x = 18
integer y = 100
integer width = 1787
integer height = 1540
string text = "    Buffers    "
end type

type tabpage_status from u_tabpg_dwproperty_status within pfc_u_tab_dwproperty
integer x = 18
integer y = 100
integer width = 1787
integer height = 1540
string text = "StatusFlags"
end type


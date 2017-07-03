HA$PBExportHeader$pfc_w_dwproperty.srw
$PBExportComments$PFC DataWindow Property - The main window
forward
global type pfc_w_dwproperty from w_response
end type
type cb_ok from u_cb within pfc_w_dwproperty
end type
type tab_property from u_tab_dwproperty within pfc_w_dwproperty
end type
type tab_property from u_tab_dwproperty within pfc_w_dwproperty
end type
type cb_dlghelp from u_cb within pfc_w_dwproperty
end type
end forward

global type pfc_w_dwproperty from w_response
integer width = 1851
integer height = 1768
string title = "DataWindow Properties - "
boolean controlmenu = false
long backcolor = 80263328
event type integer pfc_applyothers ( string as_servicename,  boolean ab_desiredstate )
cb_ok cb_ok
tab_property tab_property
cb_dlghelp cb_dlghelp
end type
global pfc_w_dwproperty pfc_w_dwproperty

type variables
Protected:

n_cst_dwpropertyattrib inv_attrib

end variables

on pfc_w_dwproperty.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.tab_property=create tab_property
this.cb_dlghelp=create cb_dlghelp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.tab_property
this.Control[iCurrent+3]=this.cb_dlghelp
end on

on pfc_w_dwproperty.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.tab_property)
destroy(this.cb_dlghelp)
end on

event open;integer 	li_rc
integer	li_row
u_dw		ldw_obj
string	ls_dataobject

SetPointer (HourGlass!)

// Get the Message.
If IsValid(Message.PowerObjectParm) Then
	If Message.PowerObjectParm.ClassName() = inv_attrib.ClassName() Then
		inv_attrib = Message.PowerObjectParm
	End If
End If

// There is nothing to update.
ib_disableclosequery = True
of_SetUpdateable(False)

// Validate.
If IsNull(inv_attrib) Or Not IsValid(inv_attrib) Then
	Close (this)
End If
If IsNull(inv_attrib.idw_requestor) or Not IsValid(inv_attrib.idw_requestor) Then 
	Close(this)
End If
// If not type u_dw Then Close(This)

// Update the title to include the databoject name.
this.Title += ' ' + inv_attrib.idw_requestor.DataObject

// Perform Initialize.
li_rc = tab_property.Event pfc_PropertyStart(inv_attrib)
If li_rc <= 0 Then 
	Close(This)
	Return
End If

// Reset the information on the tab/tabpages.
li_rc = tab_property.Event pfc_PropertyOpen()

Return

end event

event pfc_default;call super::pfc_default;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_default
//
//	Description:
//	 Perform all requested changes.
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

// Apply the changes.
this.Event pfc_apply()

// Close the window.
Close(this)
end event

event pfc_apply;call super::pfc_apply;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_apply
//
//	Description:
//	 Apply all requested changes.
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

tab_property.Event pfc_PropertyApply()
end event

event pfc_cancel;call super::pfc_cancel;Close(This)
end event

type cb_ok from u_cb within pfc_w_dwproperty
integer x = 978
integer y = 1556
integer taborder = 20
string text = "OK"
boolean default = true
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked
//
//	Description:
//	 Perform all requested changes.
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

Parent.Event pfc_default()
end event

type tab_property from u_tab_dwproperty within pfc_w_dwproperty
integer x = 18
integer y = 28
integer width = 1792
integer height = 1504
integer taborder = 10
end type

type cb_dlghelp from u_cb within pfc_w_dwproperty
integer x = 1349
integer y = 1556
integer taborder = 30
string text = "&Help"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Display PFC dialog help
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

int	li_helpindex

// Determine help index based on selected tab
li_helpindex = (tab_property.selectedTab * 100) + 10000

showHelp ("pfcdlg.hlp", topic!, li_helpindex)
end event


HA$PBExportHeader$pfc_w_dwpropertyservices.srw
$PBExportComments$PFC DataWindow Property - The service window
forward
global type pfc_w_dwpropertyservices from w_response
end type
type cb_ok from u_cb within pfc_w_dwpropertyservices
end type
type tab_property from u_tab_dwproperty_srv within pfc_w_dwpropertyservices
end type
type tab_property from u_tab_dwproperty_srv within pfc_w_dwpropertyservices
end type
type cb_dlghelp from u_cb within pfc_w_dwpropertyservices
end type
type cb_cancel from u_cb within pfc_w_dwpropertyservices
end type
end forward

global type pfc_w_dwpropertyservices from w_response
integer x = 1445
integer y = 452
integer width = 1851
integer height = 1768
long backcolor = 80263328
cb_ok cb_ok
tab_property tab_property
cb_dlghelp cb_dlghelp
cb_cancel cb_cancel
end type
global pfc_w_dwpropertyservices pfc_w_dwpropertyservices

type variables
Protected:

n_cst_dwpropertyattrib inv_attrib

end variables

on pfc_w_dwpropertyservices.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.tab_property=create tab_property
this.cb_dlghelp=create cb_dlghelp
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.tab_property
this.Control[iCurrent+3]=this.cb_dlghelp
this.Control[iCurrent+4]=this.cb_cancel
end on

on pfc_w_dwpropertyservices.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.tab_property)
destroy(this.cb_dlghelp)
destroy(this.cb_cancel)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  open
//
//	Description:
//	 Open the Property window.
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

integer 	li_rc
integer	li_row
u_dw		ldw_obj
string	ls_dataobject

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

// Place the window.
If IsValid(inv_attrib.iw_main) Then
	this.Move (inv_attrib.iw_main.X + 200, inv_attrib.iw_main.Y + 250)
End If

tab_property.Event pfc_PropertyStart(inv_attrib)

tab_property.Event pfc_PropertyOpen()
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

// Validate all data.
If tab_property.Event pfc_PropertyValidation() <= 0 Then
	// Do not close.
	Return
End If

// Apply the changes.
this.Event pfc_apply()

// Close the window.
Close(this)
end event

event pfc_cancel;call super::pfc_cancel;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_Cancel
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:
//	Close the window.
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

Close(this)

end event

type cb_ok from u_cb within pfc_w_dwpropertyservices
integer x = 709
integer y = 1564
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

type tab_property from u_tab_dwproperty_srv within pfc_w_dwpropertyservices
integer x = 18
integer y = 28
integer width = 1792
integer height = 1504
integer taborder = 10
end type

type cb_dlghelp from u_cb within pfc_w_dwpropertyservices
integer x = 1458
integer y = 1564
integer taborder = 30
boolean bringtotop = true
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

showHelp ("pfcdlg.hlp", topic!, 10400)
end event

type cb_cancel from u_cb within pfc_w_dwpropertyservices
integer x = 1083
integer y = 1564
integer taborder = 2
boolean bringtotop = true
string text = "Cancel"
boolean cancel = true
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked
//
//	Description:
//	 Cancel the operation.
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

Parent.Event pfc_cancel()
end event


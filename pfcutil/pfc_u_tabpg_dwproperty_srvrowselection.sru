HA$PBExportHeader$pfc_u_tabpg_dwproperty_srvrowselection.sru
$PBExportComments$PFC DataWindow Property - The RowSelection service tabpage
forward
global type pfc_u_tabpg_dwproperty_srvrowselection from u_tabpg_dwproperty_base
end type
type st_style from u_st within pfc_u_tabpg_dwproperty_srvrowselection
end type
type cbx_keyboard from u_cbx within pfc_u_tabpg_dwproperty_srvrowselection
end type
type ddlb_style from u_ddlb within pfc_u_tabpg_dwproperty_srvrowselection
end type
end forward

global type pfc_u_tabpg_dwproperty_srvrowselection from u_tabpg_dwproperty_base
event type integer pfc_propertypopulate ( )
st_style st_style
cbx_keyboard cbx_keyboard
ddlb_style ddlb_style
end type
global pfc_u_tabpg_dwproperty_srvrowselection pfc_u_tabpg_dwproperty_srvrowselection

type variables
Protected:
integer	ii_style = -1
end variables

forward prototypes
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
end prototypes

event pfc_propertypopulate;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		pfc_properypopulate
//
//	Access:    		Public
//
//	Arguments:  	None
//
//	Returns:   		Integer
//   1 if it succeeds.
//	 -1 if an error occurs.
//
//	Description:  	
//	Populate the screen edit controls with the current service values.
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
integer	li_style

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_rowselect) or Not IsValid(idw_requestor.inv_rowselect) Then
	Return -1
End If

// Get the current dialog style.
li_style = idw_requestor.inv_rowselect.of_GetStyle()
ii_style = li_style + 1
li_rc = ddlb_style.SelectItem(ii_style)

// Determine if KeyBoard support is enabled.
cbx_keyboard.Checked = idw_requestor.inv_rowselect.of_IsKeyBoard()

Return 1

end event

public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetInfo
//
//	Access:   		Public
//
//	Arguments:		
//		anv_infoattrib	(By reference) The Information attributes.
//
//	Returns:  		Integer
//	 1 for success.
//	-1 for error.
//
//	Description:  
//	 Gets the Object Information.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0    Initial version
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

// Populate Information.
anv_infoattrib.is_name = 'DW Property RowSelection Service'
anv_infoattrib.is_description = 'DW Property RowSelection Service'

Return 1
end function

public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetPropertyInfo
//
//	Access:   		Public
//
//	Arguments:		
//		anv_attrib	(By ref.) The Property Information attributes.
//
//	Returns:  		Integer
//	 1 for success.
//	-1 for error.
//
//	Description:  
//	 Gets the Service Property Information.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0    Initial version
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

n_cst_infoattrib lnv_infoattrib

// Get the first two attributes from the Main Information attributes.
of_GetInfo(lnv_infoattrib)
anv_attrib.is_name = lnv_infoattrib.is_name
anv_attrib.is_description = lnv_infoattrib.is_description

// The Property Tab Text.
anv_attrib.is_propertytabtext ='General'

Return 1
end function

on pfc_u_tabpg_dwproperty_srvrowselection.create
int iCurrent
call super::create
this.st_style=create st_style
this.cbx_keyboard=create cbx_keyboard
this.ddlb_style=create ddlb_style
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_style
this.Control[iCurrent+2]=this.cbx_keyboard
this.Control[iCurrent+3]=this.ddlb_style
end on

on pfc_u_tabpg_dwproperty_srvrowselection.destroy
call super::destroy
destroy(this.st_style)
destroy(this.cbx_keyboard)
destroy(this.ddlb_style)
end on

event pfc_propertyapply;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		pfc_PropertyApply
//
//	Access:    		Public
//
//	Arguments:  	None
//
//	Returns:   		Integer
//   1 if it succeeds.
//	 -1 if an error occurs.
//
//	Description:  		
//	 Apply the requested changes.
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
integer	li_stylecurrent, li_styledesired
integer	li_index
boolean	lb_current, lb_desired

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_rowselect) or Not IsValid(idw_requestor.inv_rowselect) Then
	Return -1
End If

// -- Style. --
li_stylecurrent = idw_requestor.inv_rowselect.of_GetStyle()
li_styledesired = ii_style - 1
// If the desired value differs from the current value.
If li_styledesired >= 0 And li_stylecurrent <> li_styledesired Then
	li_rc = idw_requestor.inv_rowselect.of_SetStyle(li_styledesired)
End If

// -- Keyboard. --
lb_current = idw_requestor.inv_rowselect.of_IsKeyBoard()
lb_desired = cbx_keyboard.Checked
// If the desired value differs from the current value.
If  lb_current<> lb_desired Then
	li_rc = idw_requestor.inv_rowselect.of_SetKeyBoard(lb_desired)
End If

Return 1

end event

event pfc_propertysyntax;call super::pfc_propertysyntax;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		pfc_propertysyntax
//
//	Access:    		Public
//
//	Arguments:  	None
//
//	Returns:   		String
//	  The syntax required to create the currently selections.
//   '!' in error
//
//	Description:  
//	Create the required syntax to match the current selections.
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

integer	li_upper
integer	li_cnt
integer 	li_rc
integer	li_styledesired
integer	li_index
integer	li_excludecount=0
string	ls_excludecols[]
string	ls_exclude
string	ls_syntax
boolean	lb_desired
n_cst_conversion lnv_conversion

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return '!'
End If
If IsNull(idw_requestor.inv_rowselect) or Not IsValid(idw_requestor.inv_rowselect) Then
	Return '!'
End If


// -- Start the service. --
ls_syntax += 'This.of_SetRowSelect(True)~r~n'

// -- Style. --
li_styledesired = ii_style - 1
Choose Case li_styledesired
	Case idw_requestor.inv_rowselect.SINGLE
		ls_syntax += '~r~nThis.inv_rowselect.of_SetStyle(inv_rowselect.SINGLE)'
	Case idw_requestor.inv_rowselect.MULTIPLE
		ls_syntax += '~r~nThis.inv_rowselect.of_SetStyle(inv_rowselect.MULTIPLE)'
	Case idw_requestor.inv_rowselect.EXTENDED
		ls_syntax += '~r~nThis.inv_rowselect.of_SetStyle(inv_rowselect.EXTENDED)'
	Case Else
		ls_syntax += '~r~nThis.inv_rowselect.of_SetStyle('+String(li_styledesired)+')'
End Choose

// -- Keyboard. --
lb_desired = cbx_keyboard.Checked
ls_syntax += '~r~nThis.inv_rowselect.of_SetKeyBoard('+lnv_conversion.of_String(lb_desired)+')'

Return ls_syntax

end event

type st_style from u_st within pfc_u_tabpg_dwproperty_srvrowselection
integer x = 27
integer y = 36
integer width = 503
string text = "&Style"
end type

type cbx_keyboard from u_cbx within pfc_u_tabpg_dwproperty_srvrowselection
integer x = 27
integer y = 164
integer width = 1641
integer height = 68
integer taborder = 20
boolean bringtotop = true
string text = "&Keyboard selection"
end type

type ddlb_style from u_ddlb within pfc_u_tabpg_dwproperty_srvrowselection
integer x = 562
integer y = 36
integer width = 1138
integer height = 308
integer taborder = 10
boolean sorted = false
string item[] = {"Single Row Selection","Multiple Row Selection","Extended Row Selection"}
integer accelerator = 115
end type

event selectionchanged;call super::selectionchanged;// Store the last selected style.

ii_style = index
end event


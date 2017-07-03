HA$PBExportHeader$pfc_u_tabpg_dwproperty_srvrowmanager.sru
$PBExportComments$PFC DataWindow Property - The RowManager service tabpage
forward
global type pfc_u_tabpg_dwproperty_srvrowmanager from u_tabpg_dwproperty_base
end type
type cbx_confirmondelete from u_cbx within pfc_u_tabpg_dwproperty_srvrowmanager
end type
type cbx_restorerow from u_cbx within pfc_u_tabpg_dwproperty_srvrowmanager
end type
end forward

global type pfc_u_tabpg_dwproperty_srvrowmanager from u_tabpg_dwproperty_base
event type integer pfc_propertypopulate ( )
cbx_confirmondelete cbx_confirmondelete
cbx_restorerow cbx_restorerow
end type
global pfc_u_tabpg_dwproperty_srvrowmanager pfc_u_tabpg_dwproperty_srvrowmanager

type variables

end variables

forward prototypes
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_getpropertyinto (ref n_cst_propertyattrib anv_attrib)
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

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_rowmanager) or Not IsValid(idw_requestor.inv_rowmanager) Then
	Return -1
End If

// Determine if Confirm On Delete is enabled.
cbx_confirmondelete.Checked = idw_requestor.inv_rowmanager.of_GetConfirmOnDelete()

// Determine if Restore Row(s) is enabled.
cbx_restorerow.Checked = idw_requestor.inv_rowmanager.of_IsRestoreRow()

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
anv_infoattrib.is_name = 'DW Property RowManager Service'
anv_infoattrib.is_description = 'DW Property RowManager Service'

Return 1
end function

public function integer of_getpropertyinto (ref n_cst_propertyattrib anv_attrib);//////////////////////////////////////////////////////////////////////////////
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

on pfc_u_tabpg_dwproperty_srvrowmanager.create
int iCurrent
call super::create
this.cbx_confirmondelete=create cbx_confirmondelete
this.cbx_restorerow=create cbx_restorerow
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_confirmondelete
this.Control[iCurrent+2]=this.cbx_restorerow
end on

on pfc_u_tabpg_dwproperty_srvrowmanager.destroy
call super::destroy
destroy(this.cbx_confirmondelete)
destroy(this.cbx_restorerow)
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
boolean	lb_current, lb_desired

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_rowmanager) or Not IsValid(idw_requestor.inv_rowmanager) Then
	Return -1
End If

// -- Confirm on Delete. --
lb_current = idw_requestor.inv_rowmanager.of_GetConfirmOnDelete()
lb_desired = cbx_confirmondelete.Checked
// If the desired value differs from the current value.
If  lb_current<> lb_desired Then
	li_rc = idw_requestor.inv_rowmanager.of_SetConfirmOnDelete(lb_desired)
End If

// -- Restore Row. --
lb_current = idw_requestor.inv_rowmanager.of_IsRestoreRow()
lb_desired = cbx_restorerow.Checked
// If the desired value differs from the current value.
If  lb_current<> lb_desired Then
	li_rc = idw_requestor.inv_rowmanager.of_SetRestoreRow(lb_desired)
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
If IsNull(idw_requestor.inv_rowmanager) or Not IsValid(idw_requestor.inv_rowmanager) Then
	Return '!'
End If


// -- Start the service. --
ls_syntax += 'This.of_SetRowManager(True)~r~n'

// -- Confirm on Delete. --
lb_desired = cbx_confirmondelete.Checked
ls_syntax += '~r~nThis.inv_rowmanager.of_SetConfirmOnDelete('+lnv_conversion.of_String(lb_desired)+')'

// -- Restore Row. --
lb_desired = cbx_restorerow.Checked
ls_syntax += '~r~nThis.inv_rowmanager.of_SetRestoreRow('+lnv_conversion.of_String(lb_desired)+')'

Return ls_syntax

end event

type cbx_confirmondelete from u_cbx within pfc_u_tabpg_dwproperty_srvrowmanager
integer x = 27
integer y = 36
integer width = 1705
integer height = 68
integer taborder = 10
boolean bringtotop = true
string text = "Confirm on &delete"
end type

type cbx_restorerow from u_cbx within pfc_u_tabpg_dwproperty_srvrowmanager
integer x = 27
integer y = 124
integer width = 1705
integer height = 68
boolean bringtotop = true
string text = "Allow &undeletes"
end type


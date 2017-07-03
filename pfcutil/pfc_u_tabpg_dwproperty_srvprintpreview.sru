HA$PBExportHeader$pfc_u_tabpg_dwproperty_srvprintpreview.sru
$PBExportComments$PFC DataWindow Property - The PrintPreview service tabpage
forward
global type pfc_u_tabpg_dwproperty_srvprintpreview from u_tabpg_dwproperty_base
end type
type cbx_enabled from u_cbx within pfc_u_tabpg_dwproperty_srvprintpreview
end type
type cbx_ruler from u_cbx within pfc_u_tabpg_dwproperty_srvprintpreview
end type
type st_zoom from u_st within pfc_u_tabpg_dwproperty_srvprintpreview
end type
type em_zoom from u_em within pfc_u_tabpg_dwproperty_srvprintpreview
end type
end forward

global type pfc_u_tabpg_dwproperty_srvprintpreview from u_tabpg_dwproperty_base
event type integer pfc_propertypopulate ( )
cbx_enabled cbx_enabled
cbx_ruler cbx_ruler
st_zoom st_zoom
em_zoom em_zoom
end type
global pfc_u_tabpg_dwproperty_srvprintpreview pfc_u_tabpg_dwproperty_srvprintpreview

type variables

end variables

forward prototypes
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
end prototypes

event pfc_propertypopulate;call super::pfc_propertypopulate;//////////////////////////////////////////////////////////////////////////////
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
If IsNull(idw_requestor.inv_printpreview) or Not IsValid(idw_requestor.inv_printpreview) Then
	Return -1
End If

// Determine if PrintPreview is enabled.
cbx_enabled.Checked = idw_requestor.inv_printpreview.of_GetEnabled()

// Determine if Ruler is enabled.
cbx_ruler.Checked = idw_requestor.inv_printpreview.of_GetRuler()

// Determine the current zoom level.
em_zoom.Text = string(idw_requestor.inv_printpreview.of_GetZoom())

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
anv_infoattrib.is_name = 'DW Property PrintPreview Service'
anv_infoattrib.is_description = 'DW Property PrintPreview Service'

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

on pfc_u_tabpg_dwproperty_srvprintpreview.create
int iCurrent
call super::create
this.cbx_enabled=create cbx_enabled
this.cbx_ruler=create cbx_ruler
this.st_zoom=create st_zoom
this.em_zoom=create em_zoom
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_enabled
this.Control[iCurrent+2]=this.cbx_ruler
this.Control[iCurrent+3]=this.st_zoom
this.Control[iCurrent+4]=this.em_zoom
end on

on pfc_u_tabpg_dwproperty_srvprintpreview.destroy
call super::destroy
destroy(this.cbx_enabled)
destroy(this.cbx_ruler)
destroy(this.st_zoom)
destroy(this.em_zoom)
end on

event pfc_propertyapply;call super::pfc_propertyapply;//////////////////////////////////////////////////////////////////////////////
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
integer	li_zoomcurrent, li_zoomdesired
boolean	lb_current, lb_desired

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_printpreview) or Not IsValid(idw_requestor.inv_printpreview) Then
	Return -1
End If

// -- Enabled. -- 
lb_current = idw_requestor.inv_printpreview.of_GetEnabled()
lb_desired = cbx_enabled.Checked
// If the desired value differs from the current value.
If  lb_current<> lb_desired Then
	li_rc = idw_requestor.inv_printpreview.of_SetEnabled(lb_desired)
End If

// Determine if Ruler is enabled.
lb_current = idw_requestor.inv_printpreview.of_GetRuler()
lb_desired = cbx_ruler.Checked
// If the desired value differs from the current value.
If  lb_current<> lb_desired Then
	li_rc = idw_requestor.inv_printpreview.of_SetRuler(lb_desired)
End If

// Determine the current zoom level.
li_zoomcurrent = idw_requestor.inv_printpreview.of_GetZoom()
li_zoomdesired = Integer(em_zoom.Text)
// If the desired value differs from the current value.
If  li_zoomcurrent<> li_zoomdesired Then
	li_rc = idw_requestor.inv_printpreview.of_SetZoom(li_zoomdesired)
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

string	ls_syntax
boolean	lb_desired
n_cst_conversion lnv_conversion

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return '!'
End If
If IsNull(idw_requestor.inv_printpreview) or Not IsValid(idw_requestor.inv_printpreview) Then
	Return '!'
End If


// -- Start the service. --
ls_syntax += 'This.of_SetPrintPreview(True)~r~n'

// -- Enabled. -- 
lb_desired = cbx_enabled.Checked
ls_syntax += '~r~nThis.inv_printpreview.of_SetEnabled('+lnv_conversion.of_String(lb_desired)+')'

// -- Ruler. --
lb_desired = cbx_ruler.Checked
ls_syntax += '~r~nThis.inv_printpreview.of_SetRuler('+lnv_conversion.of_String(lb_desired)+')'

// -- Zoom. --
If Len(Trim(em_zoom.Text)) > 0 Then
	ls_syntax += '~r~nThis.inv_printpreview.of_SetZoom('+em_zoom.Text+')'
End If

Return ls_syntax

end event

type cbx_enabled from u_cbx within pfc_u_tabpg_dwproperty_srvprintpreview
integer x = 27
integer y = 36
integer width = 1646
integer height = 68
integer taborder = 20
boolean bringtotop = true
string text = "PrintPreview &enabled"
end type

type cbx_ruler from u_cbx within pfc_u_tabpg_dwproperty_srvprintpreview
integer x = 27
integer y = 128
integer width = 1605
integer height = 68
boolean bringtotop = true
string text = "&Ruler visible"
end type

type st_zoom from u_st within pfc_u_tabpg_dwproperty_srvprintpreview
integer x = 27
integer y = 240
integer width = 937
string text = "&Zoom level"
end type

type em_zoom from u_em within pfc_u_tabpg_dwproperty_srvprintpreview
integer x = 27
integer y = 308
integer width = 279
integer height = 84
integer taborder = 10
integer accelerator = 122
string mask = "###"
boolean spin = true
string displaydata = ""
string minmax = ""
end type


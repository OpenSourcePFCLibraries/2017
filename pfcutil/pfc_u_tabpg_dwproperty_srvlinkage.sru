HA$PBExportHeader$pfc_u_tabpg_dwproperty_srvlinkage.sru
$PBExportComments$PFC DataWindow Property - The Linkage service tabpage 1
forward
global type pfc_u_tabpg_dwproperty_srvlinkage from u_tabpg_dwproperty_base
end type
type st_label_masterdw from u_st within pfc_u_tabpg_dwproperty_srvlinkage
end type
type st_masterdw from u_st within pfc_u_tabpg_dwproperty_srvlinkage
end type
type st_label_detaldw from u_st within pfc_u_tabpg_dwproperty_srvlinkage
end type
type st_label_style from u_st within pfc_u_tabpg_dwproperty_srvlinkage
end type
type st_style from u_st within pfc_u_tabpg_dwproperty_srvlinkage
end type
type st_label_masterarg from u_st within pfc_u_tabpg_dwproperty_srvlinkage
end type
type dw_arguments from u_dw within pfc_u_tabpg_dwproperty_srvlinkage
end type
type st_label_rootdw from u_st within pfc_u_tabpg_dwproperty_srvlinkage
end type
type st_rootdw from u_st within pfc_u_tabpg_dwproperty_srvlinkage
end type
type mle_detaildw from u_mle within pfc_u_tabpg_dwproperty_srvlinkage
end type
type st_label_currentdw from u_st within pfc_u_tabpg_dwproperty_srvlinkage
end type
type st_currentdw from u_st within pfc_u_tabpg_dwproperty_srvlinkage
end type
end forward

global type pfc_u_tabpg_dwproperty_srvlinkage from u_tabpg_dwproperty_base
st_label_masterdw st_label_masterdw
st_masterdw st_masterdw
st_label_detaldw st_label_detaldw
st_label_style st_label_style
st_style st_style
st_label_masterarg st_label_masterarg
dw_arguments dw_arguments
st_label_rootdw st_label_rootdw
st_rootdw st_rootdw
mle_detaildw mle_detaildw
st_label_currentdw st_label_currentdw
st_currentdw st_currentdw
end type
global pfc_u_tabpg_dwproperty_srvlinkage pfc_u_tabpg_dwproperty_srvlinkage

forward prototypes
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
end prototypes

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
anv_infoattrib.is_name = 'DW Property Linkage Service'
anv_infoattrib.is_description = 'DW Property Linkage Service'

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

on pfc_u_tabpg_dwproperty_srvlinkage.create
int iCurrent
call super::create
this.st_label_masterdw=create st_label_masterdw
this.st_masterdw=create st_masterdw
this.st_label_detaldw=create st_label_detaldw
this.st_label_style=create st_label_style
this.st_style=create st_style
this.st_label_masterarg=create st_label_masterarg
this.dw_arguments=create dw_arguments
this.st_label_rootdw=create st_label_rootdw
this.st_rootdw=create st_rootdw
this.mle_detaildw=create mle_detaildw
this.st_label_currentdw=create st_label_currentdw
this.st_currentdw=create st_currentdw
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_label_masterdw
this.Control[iCurrent+2]=this.st_masterdw
this.Control[iCurrent+3]=this.st_label_detaldw
this.Control[iCurrent+4]=this.st_label_style
this.Control[iCurrent+5]=this.st_style
this.Control[iCurrent+6]=this.st_label_masterarg
this.Control[iCurrent+7]=this.dw_arguments
this.Control[iCurrent+8]=this.st_label_rootdw
this.Control[iCurrent+9]=this.st_rootdw
this.Control[iCurrent+10]=this.mle_detaildw
this.Control[iCurrent+11]=this.st_label_currentdw
this.Control[iCurrent+12]=this.st_currentdw
end on

on pfc_u_tabpg_dwproperty_srvlinkage.destroy
call super::destroy
destroy(this.st_label_masterdw)
destroy(this.st_masterdw)
destroy(this.st_label_detaldw)
destroy(this.st_label_style)
destroy(this.st_style)
destroy(this.st_label_masterarg)
destroy(this.dw_arguments)
destroy(this.st_label_rootdw)
destroy(this.st_rootdw)
destroy(this.mle_detaildw)
destroy(this.st_label_currentdw)
destroy(this.st_currentdw)
end on

event pfc_propertypopulate;call super::pfc_propertypopulate;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		pfc_propertypopulate
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

integer	li_row
integer	li_upper
integer	li_cnt
integer 	li_rc
integer	li_index
integer	li_style
string	ls_details
u_dw		ldw_temp
u_dw		ldw_details[]
n_cst_linkageattrib lnv_linkageattrib

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_linkage) or Not IsValid(idw_requestor.inv_linkage) Then
	Return -1
End If

// Get the Current datawindow.
st_currentdw.Text = idw_requestor.ClassName()

// Get the Root datawindow.
li_rc = idw_requestor.inv_linkage.of_FindRoot(ldw_temp)
If IsValid(ldw_temp) Then
	st_rootdw.Text = ldw_temp.ClassName()
End If

// Get the Master datawindow.
li_rc = idw_requestor.inv_linkage.of_GetMaster(ldw_temp)
If IsValid(ldw_temp) Then
	st_masterdw.Text = ldw_temp.ClassName()
End If

// Get the Detail datawindow(s).
li_rc = idw_requestor.inv_linkage.of_GetDetails(ldw_details)
li_upper = Upperbound(ldw_details)
For li_cnt = 1 to li_upper
	If IsValid(ldw_details[li_cnt]) Then
		If Len(ls_details) > 0 Then ls_details += '~r~n'
		ls_details += ldw_details[li_cnt].ClassName()
	End If
Next
If Len(ls_details) > 0 Then
	mle_detaildw.Text = ls_details
End If

// Get the Style.
li_style = idw_requestor.inv_linkage.of_GetStyle()
Choose Case li_style
	Case idw_requestor.inv_linkage.FILTER
		st_style.Text = 'Filter'
	Case idw_requestor.inv_linkage.RETRIEVE
		st_style.Text = 'Retrieve'
	Case idw_requestor.inv_linkage.SCROLL
		st_style.Text = 'Scroll'
	Case Else
		st_style.Text = String(li_style)
End Choose

// Get the Registered arguments.
li_rc = idw_requestor.inv_linkage.of_GetRegistered(lnv_linkageattrib)
If IsValid(lnv_linkageattrib) Then
	li_upper = UpperBound(lnv_linkageattrib.is_mastercolarg)
	For li_cnt = 1 to li_upper
		If Len(Trim(lnv_linkageattrib.is_mastercolarg[li_cnt])) > 0 Then
			li_row = dw_arguments.Event pfc_addrow()
			If li_row > 0 Then
				dw_arguments.object.mastercolumn.primary[li_row] = &
					Trim(lnv_linkageattrib.is_mastercolarg[li_cnt])
				dw_arguments.object.detailcolumn.primary[li_row] = &
					Trim(lnv_linkageattrib.is_detailcolarg[li_cnt])					
			End If
		End If
	Next
End If

Return 1
end event

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

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_linkage) or Not IsValid(idw_requestor.inv_linkage) Then
	Return -1
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

integer	li_rowcount
integer	li_row
integer	li_cnt
integer 	li_rc
string	ls_syntax
string	ls_mastercol
string	ls_detailcol

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return '!'
End If
If IsNull(idw_requestor.inv_linkage) or Not IsValid(idw_requestor.inv_linkage) Then
	Return '!'
End If

// -- Start the service. --
ls_syntax += 'This.of_SetLinkage(True)~r~n'

// -- Style. --
If IsNumber(st_style.Text) Then
	ls_syntax += '~r~nThis.inv_linkage.of_SetStyle('+st_style.Text+')'	
Else
	ls_syntax += '~r~nThis.inv_linkage.of_SetStyle(inv_linkage.'+Upper(st_style.Text)+')'
End If

// -- Master DataWindow. -- 
If Upper(st_masterdw.Text) <> 'NONE' Then
	ls_syntax += '~r~nThis.inv_linkage.of_SetMaster('+st_masterdw.Text+')'
End If

// -- Arguments. -- 
li_rowcount = dw_arguments.RowCount()
For li_row = 1 to li_rowcount
	ls_mastercol = dw_arguments.object.mastercolumn.primary[li_row]
	ls_detailcol = dw_arguments.object.detailcolumn.primary[li_row]
	ls_syntax += '~r~nThis.inv_linkage.of_Register("'+ls_mastercol+'","'+ls_detailcol+'")'
Next

Return ls_syntax

end event

type st_label_masterdw from u_st within pfc_u_tabpg_dwproperty_srvlinkage
integer x = 27
integer y = 116
integer width = 462
string text = "Master: "
end type

type st_masterdw from u_st within pfc_u_tabpg_dwproperty_srvlinkage
integer x = 521
integer y = 116
integer width = 1221
boolean bringtotop = true
string text = "None"
end type

type st_label_detaldw from u_st within pfc_u_tabpg_dwproperty_srvlinkage
integer x = 27
integer y = 356
integer width = 462
boolean bringtotop = true
string text = "Detail(s):"
end type

type st_label_style from u_st within pfc_u_tabpg_dwproperty_srvlinkage
integer x = 27
integer y = 276
integer width = 462
boolean bringtotop = true
string text = "Style:"
end type

type st_style from u_st within pfc_u_tabpg_dwproperty_srvlinkage
integer x = 521
integer y = 276
integer width = 1221
boolean bringtotop = true
string text = "None"
end type

type st_label_masterarg from u_st within pfc_u_tabpg_dwproperty_srvlinkage
integer x = 27
integer y = 608
integer width = 462
boolean bringtotop = true
string text = "Arguments:"
end type

type dw_arguments from u_dw within pfc_u_tabpg_dwproperty_srvlinkage
integer x = 521
integer y = 608
integer width = 1175
integer height = 376
integer taborder = 20
string dataobject = "d_dwproperty_linkageargs"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;this.of_SetUpdateable(False)
end event

type st_label_rootdw from u_st within pfc_u_tabpg_dwproperty_srvlinkage
integer x = 27
integer y = 36
integer width = 462
boolean bringtotop = true
string text = "Root:"
end type

type st_rootdw from u_st within pfc_u_tabpg_dwproperty_srvlinkage
integer x = 521
integer y = 36
integer width = 1221
boolean bringtotop = true
string text = "None"
end type

type mle_detaildw from u_mle within pfc_u_tabpg_dwproperty_srvlinkage
integer x = 521
integer y = 356
integer width = 1175
integer height = 212
integer taborder = 10
long backcolor = 80263581
boolean border = false
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylebox!
end type

type st_label_currentdw from u_st within pfc_u_tabpg_dwproperty_srvlinkage
integer x = 27
integer y = 196
integer width = 462
boolean bringtotop = true
string text = "Current:"
end type

type st_currentdw from u_st within pfc_u_tabpg_dwproperty_srvlinkage
integer x = 521
integer y = 196
integer width = 1221
boolean bringtotop = true
string text = "None"
end type


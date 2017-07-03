HA$PBExportHeader$pfc_u_tabpg_dwproperty_srvfilter.sru
$PBExportComments$PFC DataWindow Property - The Filter service tabpage
forward
global type pfc_u_tabpg_dwproperty_srvfilter from u_tabpg_dwproperty_base
end type
type st_style from u_st within pfc_u_tabpg_dwproperty_srvfilter
end type
type cbx_visibleonly from u_cbx within pfc_u_tabpg_dwproperty_srvfilter
end type
type st_excludecols from u_st within pfc_u_tabpg_dwproperty_srvfilter
end type
type ddlb_style from u_ddlb within pfc_u_tabpg_dwproperty_srvfilter
end type
type lb_excludecols from u_lb within pfc_u_tabpg_dwproperty_srvfilter
end type
end forward

global type pfc_u_tabpg_dwproperty_srvfilter from u_tabpg_dwproperty_base
event type integer pfc_propertypopulate ( )
st_style st_style
cbx_visibleonly cbx_visibleonly
st_excludecols st_excludecols
ddlb_style ddlb_style
lb_excludecols lb_excludecols
end type
global pfc_u_tabpg_dwproperty_srvfilter pfc_u_tabpg_dwproperty_srvfilter

type variables
Protected:
integer	ii_style = -1
end variables

forward prototypes
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
end prototypes

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

integer	li_upperall, li_upperexc
integer	li_cntall, li_cntexc
integer 	li_rc
integer	li_style
integer	li_index
string	ls_allcols[]
string	ls_excludecols[]

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_filter) or Not IsValid(idw_requestor.inv_filter) Then
	Return -1
End If

// Get the current dialog style.
li_style = idw_requestor.inv_filter.of_GetStyle()
// The style attributes start at 0, the ddlb index start at 1.
ii_style = li_style + 1
li_rc = ddlb_style.SelectItem(ii_style)

// Determine if Visible Only columns is enabled.
cbx_visibleonly.Checked = idw_requestor.inv_filter.of_GetVisibleOnly()

// Get all the columns from which the filter service could filter.
li_rc = idw_requestor.inv_filter.of_GetRegisterable(ls_allcols)
// Get all the exclude columns.
li_rc = idw_requestor.inv_filter.of_GetExclude(ls_excludecols)
// Add All of the columns and Select the Excluded columns
li_upperall = UpperBound(ls_allcols)
li_upperexc = UpperBound(ls_excludecols)
For li_cntall = 1 to li_upperall
	li_index = lb_excludecols.AddItem(ls_allcols[li_cntall])
	// Determine if this is an exclude column.
	For li_cntexc = 1 to li_upperexc
		If ls_allcols[li_cntall] = ls_excludecols[li_cntexc] Then
			lb_excludecols.SetState ( li_index, True )
			Exit
		End If
	Next
Next

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
anv_infoattrib.is_name = 'DW Property Filter Service'
anv_infoattrib.is_description = 'DW Property Filter Service'

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

on pfc_u_tabpg_dwproperty_srvfilter.create
int iCurrent
call super::create
this.st_style=create st_style
this.cbx_visibleonly=create cbx_visibleonly
this.st_excludecols=create st_excludecols
this.ddlb_style=create ddlb_style
this.lb_excludecols=create lb_excludecols
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_style
this.Control[iCurrent+2]=this.cbx_visibleonly
this.Control[iCurrent+3]=this.st_excludecols
this.Control[iCurrent+4]=this.ddlb_style
this.Control[iCurrent+5]=this.lb_excludecols
end on

on pfc_u_tabpg_dwproperty_srvfilter.destroy
call super::destroy
destroy(this.st_style)
destroy(this.cbx_visibleonly)
destroy(this.st_excludecols)
destroy(this.ddlb_style)
destroy(this.lb_excludecols)
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

integer	li_upper
integer	li_cnt
integer 	li_rc
integer	li_stylecurrent, li_styledesired
integer	li_index
integer	li_excludecount=0
string	ls_excludecols[]
boolean	lb_current, lb_desired

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_filter) or Not IsValid(idw_requestor.inv_filter) Then
	Return -1
End If

// -- Style. --
li_stylecurrent = idw_requestor.inv_filter.of_GetStyle()
li_styledesired = ii_style - 1
// If the desired value differs from the current value.
If li_styledesired >= 0 And li_stylecurrent <> li_styledesired Then
	li_rc = idw_requestor.inv_filter.of_SetStyle(li_styledesired)
End If

// -- Visible Only. --
lb_current = idw_requestor.inv_filter.of_GetVisibleOnly()
lb_desired = cbx_visibleonly.Checked
// If the desired value differs from the current value.
If  lb_current<> lb_desired Then
	li_rc = idw_requestor.inv_filter.of_SetVisibleOnly(lb_desired)
End If

// -- Exclude Columns. --
// Get the number of items in the ListBox.
li_upper = lb_excludecols.TotalItems( )
For li_cnt = 1 to li_upper
	// Is the item selected?
	If lb_excludecols.State(li_cnt) = 1 THEN  
		li_excludecount ++
		ls_excludecols[li_excludecount] = lb_excludecols.text(li_cnt)
	End If
Next
li_rc = idw_requestor.inv_filter.of_SetExclude(ls_excludecols)

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
If IsNull(idw_requestor.inv_filter) or Not IsValid(idw_requestor.inv_filter) Then
	Return '!'
End If


// -- Start the service. --
ls_syntax += 'This.of_SetFilter(True)~r~n'

// -- Style. --
li_styledesired = ii_style - 1
Choose Case li_styledesired
	Case idw_requestor.inv_filter.DEFAULT
		ls_syntax += '~r~nThis.inv_filter.of_SetStyle(inv_filter.DEFAULT)'
	Case idw_requestor.inv_filter.EXTENDED
		ls_syntax += '~r~nThis.inv_filter.of_SetStyle(inv_filter.EXTENDED)'
	Case idw_requestor.inv_filter.SIMPLE
		ls_syntax += '~r~nThis.inv_filter.of_SetStyle(inv_filter.SIMPLE)'
	Case Else
	ls_syntax += '~r~nThis.inv_filter.of_SetStyle('+String(li_styledesired)+')'
End Choose

// -- Visible Only. --
lb_desired = cbx_visibleonly.Checked
ls_syntax += '~r~nThis.inv_filter.of_SetVisibleOnly('+lnv_conversion.of_String(lb_desired)+')'

// -- Exclude Columns. --
// Get the number of items in the ListBox.
li_upper = lb_excludecols.TotalItems( )
For li_cnt = 1 to li_upper
	// Is the item selected?
	If lb_excludecols.State(li_cnt) = 1 THEN  
		li_excludecount ++
		ls_exclude += '~r~nls_exclude['+string(li_excludecount)+'] = "'+ &
							lb_excludecols.text(li_cnt)+'"'
	End If
Next
If li_excludecount > 0 Then
	// -- Defined required variables.  -- 
	ls_syntax = 'String	ls_exclude[]~r~n~r~n' + ls_syntax
	ls_syntax += ls_exclude
	ls_syntax += '~r~nThis.inv_filter.of_SetExclude(ls_exclude)'
End If

Return ls_syntax

end event

type st_style from u_st within pfc_u_tabpg_dwproperty_srvfilter
integer x = 27
integer y = 36
integer width = 1243
string text = "&Style"
end type

type cbx_visibleonly from u_cbx within pfc_u_tabpg_dwproperty_srvfilter
integer x = 23
integer y = 264
integer width = 1664
integer height = 68
integer taborder = 20
boolean bringtotop = true
string text = "&Visible only columns"
end type

type st_excludecols from u_st within pfc_u_tabpg_dwproperty_srvfilter
integer x = 23
integer y = 376
integer width = 1705
boolean bringtotop = true
string text = "Highlight columns to exclude"
end type

type ddlb_style from u_ddlb within pfc_u_tabpg_dwproperty_srvfilter
integer x = 27
integer y = 120
integer width = 1102
integer height = 296
integer taborder = 10
boolean sorted = false
string item[] = {"Default Dialog","Extended Dialog","Simple Dialog"}
integer accelerator = 115
end type

event selectionchanged;call super::selectionchanged;// Store the last selected style.

ii_style = index
end event

type lb_excludecols from u_lb within pfc_u_tabpg_dwproperty_srvfilter
integer x = 23
integer y = 456
integer width = 1714
integer height = 896
integer taborder = 30
boolean multiselect = true
end type


HA$PBExportHeader$pfc_u_tabpg_dwproperty_srvsort.sru
$PBExportComments$PFC DataWindow Property - The Sort service tabpage
forward
global type pfc_u_tabpg_dwproperty_srvsort from u_tabpg_dwproperty_base
end type
type st_style from u_st within pfc_u_tabpg_dwproperty_srvsort
end type
type cbx_columnheader from u_cbx within pfc_u_tabpg_dwproperty_srvsort
end type
type cbx_visibleonly from u_cbx within pfc_u_tabpg_dwproperty_srvsort
end type
type cbx_usedisplayvalue from u_cbx within pfc_u_tabpg_dwproperty_srvsort
end type
type st_excludecols from u_st within pfc_u_tabpg_dwproperty_srvsort
end type
type ddlb_style from u_ddlb within pfc_u_tabpg_dwproperty_srvsort
end type
type lb_excludecols from u_lb within pfc_u_tabpg_dwproperty_srvsort
end type
type st_headersuffix from u_st within pfc_u_tabpg_dwproperty_srvsort
end type
type sle_headersuffix from u_sle within pfc_u_tabpg_dwproperty_srvsort
end type
end forward

global type pfc_u_tabpg_dwproperty_srvsort from u_tabpg_dwproperty_base
event type integer pfc_propertypopulate ( )
st_style st_style
cbx_columnheader cbx_columnheader
cbx_visibleonly cbx_visibleonly
cbx_usedisplayvalue cbx_usedisplayvalue
st_excludecols st_excludecols
ddlb_style ddlb_style
lb_excludecols lb_excludecols
st_headersuffix st_headersuffix
sle_headersuffix sle_headersuffix
end type
global pfc_u_tabpg_dwproperty_srvsort pfc_u_tabpg_dwproperty_srvsort

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
If IsNull(idw_requestor.inv_sort) or Not IsValid(idw_requestor.inv_sort) Then
	Return -1
End If

// Get the current dialog style.
li_style = idw_requestor.inv_sort.of_GetStyle()
// The style attributes start at 0, the ddlb index start at 1.
ii_style = li_style + 1
li_rc = ddlb_style.SelectItem(ii_style)

// Determine if column header is enabled.
cbx_columnheader.Checked = idw_requestor.inv_sort.of_GetColumnHeader()

// Determine the Header suffix.
sle_headersuffix.Text = idw_requestor.inv_sort.of_GetDefaultHeaderSuffix()

// Determine if Visible Only columns is enabled.
cbx_visibleonly.Checked = idw_requestor.inv_sort.of_GetVisibleOnly()

// Determine if Use Display Values for Sorting is enabled.
cbx_usedisplayvalue.Checked = idw_requestor.inv_sort.of_GetUseDisplay()

// Get all the columns from which the sort service could sort.
li_rc = idw_requestor.inv_sort.of_GetRegisterable(ls_allcols)
// Get all the exclude columns.
li_rc = idw_requestor.inv_sort.of_GetExclude(ls_excludecols)
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
anv_infoattrib.is_name = 'DW Property Sort Service'
anv_infoattrib.is_description = 'DW Property Sort Service'

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

on pfc_u_tabpg_dwproperty_srvsort.create
int iCurrent
call super::create
this.st_style=create st_style
this.cbx_columnheader=create cbx_columnheader
this.cbx_visibleonly=create cbx_visibleonly
this.cbx_usedisplayvalue=create cbx_usedisplayvalue
this.st_excludecols=create st_excludecols
this.ddlb_style=create ddlb_style
this.lb_excludecols=create lb_excludecols
this.st_headersuffix=create st_headersuffix
this.sle_headersuffix=create sle_headersuffix
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_style
this.Control[iCurrent+2]=this.cbx_columnheader
this.Control[iCurrent+3]=this.cbx_visibleonly
this.Control[iCurrent+4]=this.cbx_usedisplayvalue
this.Control[iCurrent+5]=this.st_excludecols
this.Control[iCurrent+6]=this.ddlb_style
this.Control[iCurrent+7]=this.lb_excludecols
this.Control[iCurrent+8]=this.st_headersuffix
this.Control[iCurrent+9]=this.sle_headersuffix
end on

on pfc_u_tabpg_dwproperty_srvsort.destroy
call super::destroy
destroy(this.st_style)
destroy(this.cbx_columnheader)
destroy(this.cbx_visibleonly)
destroy(this.cbx_usedisplayvalue)
destroy(this.st_excludecols)
destroy(this.ddlb_style)
destroy(this.lb_excludecols)
destroy(this.st_headersuffix)
destroy(this.sle_headersuffix)
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
string	ls_headersuffixcurrent, ls_headersuffixdesired
boolean	lb_current, lb_desired

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_sort) or Not IsValid(idw_requestor.inv_sort) Then
	Return -1
End If

// -- Style. --
li_stylecurrent = idw_requestor.inv_sort.of_GetStyle()
li_styledesired = ii_style - 1
// If the desired value differs from the current value, set the new style.
If li_styledesired >= 0 And li_stylecurrent <> li_styledesired Then
	li_rc = idw_requestor.inv_sort.of_SetStyle(li_styledesired)
End If

// -- Column header. --
lb_current = idw_requestor.inv_sort.of_GetColumnHeader()
lb_desired = cbx_columnheader.Checked
// If the desired value differs from the current value.
If  lb_current<> lb_desired Then
	li_rc = idw_requestor.inv_sort.of_SetColumnHeader(lb_desired)
End If

// -- Header suffix. --
ls_headersuffixcurrent =  idw_requestor.inv_sort.of_GetDefaultHeaderSuffix()
ls_headersuffixdesired = sle_headersuffix.Text
// If the desired value differs from the current value.
If  ls_headersuffixcurrent<> ls_headersuffixdesired Then
	li_rc = idw_requestor.inv_sort.of_SetDefaultHeaderSuffix(ls_headersuffixdesired)
End If

// -- Visible Only. --
lb_current = idw_requestor.inv_sort.of_GetVisibleOnly()
lb_desired = cbx_visibleonly.Checked
// If the desired value differs from the current value.
If  lb_current<> lb_desired Then
	li_rc = idw_requestor.inv_sort.of_SetVisibleOnly(lb_desired)
End If

// -- Display Values. --
lb_current = idw_requestor.inv_sort.of_GetUseDisplay()
lb_desired = cbx_usedisplayvalue.Checked
// If the desired value differs from the current value.
If  lb_current <> lb_desired Then
	li_rc = idw_requestor.inv_sort.of_SetUseDisplay(lb_desired)
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
li_rc = idw_requestor.inv_sort.of_SetExclude(ls_excludecols)

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
If IsNull(idw_requestor.inv_sort) or Not IsValid(idw_requestor.inv_sort) Then
	Return '!'
End If


// -- Start the service. --
ls_syntax += 'This.of_SetSort(True)~r~n'

// -- Style. --
li_styledesired = ii_style - 1
Choose Case li_styledesired
	Case idw_requestor.inv_sort.DEFAULT
		ls_syntax += '~r~nThis.inv_sort.of_SetStyle(inv_sort.DEFAULT)'
	Case idw_requestor.inv_sort.DRAGDROP
		ls_syntax += '~r~nThis.inv_sort.of_SetStyle(inv_sort.DRAGDROP)'		
	Case idw_requestor.inv_sort.SIMPLE
		ls_syntax += '~r~nThis.inv_sort.of_SetStyle(inv_sort.SIMPLE)'
	Case idw_requestor.inv_sort.DROPDOWNLISTBOX
		ls_syntax += '~r~nThis.inv_sort.of_SetStyle(inv_sort.DROPDOWNLISTBOX)'	
	Case Else
		ls_syntax += '~r~nThis.inv_sort.of_SetStyle('+String(li_styledesired)+')'
End Choose

// -- Column header. --
lb_desired = cbx_columnheader.Checked
ls_syntax += '~r~nThis.inv_sort.of_SetColumnHeader('+lnv_conversion.of_String(lb_desired)+')'

// -- Header suffix. --
If Len(Trim(sle_headersuffix.Text)) > 0 Then
	ls_syntax += '~r~nThis.inv_sort.of_SetDefaultHeaderSuffix("'+sle_headersuffix.Text+'")'
End If

// -- Visible Only. --
lb_desired = cbx_visibleonly.Checked
ls_syntax += '~r~nThis.inv_sort.of_SetVisibleOnly('+lnv_conversion.of_String(lb_desired)+')'

// -- Display Values. --
lb_desired = cbx_usedisplayvalue.Checked
ls_syntax += '~r~nThis.inv_sort.of_SetUseDisplay('+lnv_conversion.of_String(lb_desired)+')'

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
	ls_syntax += '~r~nThis.inv_sort.of_SetExclude(ls_exclude)'
End If

Return ls_syntax

end event

type st_style from u_st within pfc_u_tabpg_dwproperty_srvsort
integer x = 27
integer y = 36
integer width = 594
string text = "&Style"
end type

type cbx_columnheader from u_cbx within pfc_u_tabpg_dwproperty_srvsort
integer x = 27
integer y = 160
integer width = 1678
integer height = 68
integer taborder = 20
string text = "Column &header sorting"
end type

type cbx_visibleonly from u_cbx within pfc_u_tabpg_dwproperty_srvsort
integer x = 27
integer y = 332
integer width = 1678
integer height = 68
integer taborder = 40
boolean bringtotop = true
string text = "&Visible only columns"
end type

type cbx_usedisplayvalue from u_cbx within pfc_u_tabpg_dwproperty_srvsort
integer x = 27
integer y = 420
integer width = 1678
integer height = 68
integer taborder = 50
boolean bringtotop = true
string text = "Use &display values for sorting"
end type

type st_excludecols from u_st within pfc_u_tabpg_dwproperty_srvsort
integer x = 27
integer y = 544
integer width = 1678
boolean bringtotop = true
string text = "Highlight columns to exclude"
end type

type ddlb_style from u_ddlb within pfc_u_tabpg_dwproperty_srvsort
integer x = 677
integer y = 28
integer width = 1024
integer height = 324
integer taborder = 10
boolean sorted = false
string item[] = {"PowerScript Dialog","Drag and Drop Dialog","Simple Dialog","DropDownListBox Dialog"}
integer accelerator = 115
end type

event selectionchanged;call super::selectionchanged;// Store the last selected style.

ii_style = index
end event

type lb_excludecols from u_lb within pfc_u_tabpg_dwproperty_srvsort
integer x = 27
integer y = 624
integer width = 1682
integer height = 728
integer taborder = 60
boolean multiselect = true
end type

type st_headersuffix from u_st within pfc_u_tabpg_dwproperty_srvsort
integer x = 27
integer y = 248
integer width = 594
string text = "Header suffi&x"
end type

type sle_headersuffix from u_sle within pfc_u_tabpg_dwproperty_srvsort
integer x = 677
integer y = 240
integer width = 873
integer height = 76
integer taborder = 30
integer accelerator = 120
end type


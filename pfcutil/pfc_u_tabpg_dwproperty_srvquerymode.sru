HA$PBExportHeader$pfc_u_tabpg_dwproperty_srvquerymode.sru
$PBExportComments$PFC DataWindow Property - The QueryMode service tabpage
forward
global type pfc_u_tabpg_dwproperty_srvquerymode from u_tabpg_dwproperty_base
end type
type cbx_enabled from u_cbx within pfc_u_tabpg_dwproperty_srvquerymode
end type
type st_columns from u_st within pfc_u_tabpg_dwproperty_srvquerymode
end type
type lb_cols from u_lb within pfc_u_tabpg_dwproperty_srvquerymode
end type
type cbx_resetcriteria from u_cbx within pfc_u_tabpg_dwproperty_srvquerymode
end type
type cbx_retrieveondisabled from u_cbx within pfc_u_tabpg_dwproperty_srvquerymode
end type
end forward

global type pfc_u_tabpg_dwproperty_srvquerymode from u_tabpg_dwproperty_base
event type integer pfc_propertypopulate ( )
cbx_enabled cbx_enabled
st_columns st_columns
lb_cols lb_cols
cbx_resetcriteria cbx_resetcriteria
cbx_retrieveondisabled cbx_retrieveondisabled
end type
global pfc_u_tabpg_dwproperty_srvquerymode pfc_u_tabpg_dwproperty_srvquerymode

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

integer	li_upperall, li_upperquery
integer	li_cntall, li_cntquery
integer 	li_rc
integer	li_index
string	ls_allcols[]
string	ls_querycols[]

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_querymode) or Not IsValid(idw_requestor.inv_querymode) Then
	Return -1
End If

// Determine if QueryMode is enabled.
cbx_enabled.Checked = idw_requestor.inv_querymode.of_GetEnabled()

// Determine if ResetQueryCriteria is enabled.
cbx_resetcriteria.Checked = idw_requestor.inv_querymode.of_GetResetCriteria()

// Determine if Retrieve on Disabled is enabled.
cbx_retrieveondisabled.Checked = idw_requestor.inv_querymode.of_GetRetrieveOnDisabled()

// Get all the columns from which the querymode service could querymode.
li_rc = idw_requestor.inv_querymode.of_GetObjects (ls_allcols, "column", "*", true) 

// Get all the QueryColumns columns.
li_rc = idw_requestor.inv_querymode.of_GetQueryCols(ls_querycols)

// Add All of the columns and Select the Query Columns
li_upperall = UpperBound(ls_allcols)
li_upperquery = UpperBound(ls_querycols)
For li_cntall = 1 to li_upperall
	li_index = lb_cols.AddItem(ls_allcols[li_cntall])
	// Determine if this is an Query column.
	For li_cntquery = 1 to li_upperquery
		If ls_allcols[li_cntall] = ls_querycols[li_cntquery] Then
			lb_cols.SetState ( li_index, True )
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
anv_infoattrib.is_name = 'DW Property QueryMode Service'
anv_infoattrib.is_description = 'DW Property QueryMode Service'

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

on pfc_u_tabpg_dwproperty_srvquerymode.create
int iCurrent
call super::create
this.cbx_enabled=create cbx_enabled
this.st_columns=create st_columns
this.lb_cols=create lb_cols
this.cbx_resetcriteria=create cbx_resetcriteria
this.cbx_retrieveondisabled=create cbx_retrieveondisabled
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_enabled
this.Control[iCurrent+2]=this.st_columns
this.Control[iCurrent+3]=this.lb_cols
this.Control[iCurrent+4]=this.cbx_resetcriteria
this.Control[iCurrent+5]=this.cbx_retrieveondisabled
end on

on pfc_u_tabpg_dwproperty_srvquerymode.destroy
call super::destroy
destroy(this.cbx_enabled)
destroy(this.st_columns)
destroy(this.lb_cols)
destroy(this.cbx_resetcriteria)
destroy(this.cbx_retrieveondisabled)
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
integer	li_index
integer	li_querycnt = 0
string	ls_allcols[]
string	ls_querycols[]
boolean	lb_current
boolean	lb_desired

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_querymode) or Not IsValid(idw_requestor.inv_querymode) Then
	Return -1
End If

// -- QueryMode. --
lb_current = idw_requestor.inv_querymode.of_GetEnabled()
lb_desired = cbx_enabled.Checked
// If the desired value differs from the current value, set the new style.
If  lb_current<> lb_desired Then
	li_rc = idw_requestor.inv_querymode.of_SetEnabled(lb_desired)
End If

// -- ResetQueryCriteria. --
lb_current = idw_requestor.inv_querymode.of_GetResetCriteria()
lb_desired = cbx_resetcriteria.Checked
// If the desired value differs from the current value, set the new style.
If  lb_current<> lb_desired Then
	li_rc = idw_requestor.inv_querymode.of_SetResetCriteria(lb_desired)
End If

// -- Retrieve on Disabled. --
lb_current = idw_requestor.inv_querymode.of_GetRetrieveOnDisabled()
lb_desired = cbx_retrieveondisabled.Checked
// If the desired value differs from the current value, set the new style.
If  lb_current<> lb_desired Then
	li_rc = idw_requestor.inv_querymode.of_SetRetrieveOnDisabled(lb_desired)
End If

// -- Query Columns. --
// Get the number of items in the ListBox.
li_upper = lb_cols.TotalItems( )
For li_cnt = 1 to li_upper
	// Is the item selected?  If so, display the text
	If lb_cols.State(li_cnt) = 1 THEN  
		li_querycnt ++
		ls_querycols[li_querycnt] = lb_cols.text(li_cnt)
	End If
Next
li_rc = idw_requestor.inv_querymode.of_SetQueryCols(ls_querycols)

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
integer	li_columncount=0
string	ls_columnscols[]
string	ls_columns
string	ls_syntax
boolean	lb_desired
n_cst_conversion lnv_conversion

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return '!'
End If
If IsNull(idw_requestor.inv_querymode) or Not IsValid(idw_requestor.inv_querymode) Then
	Return '!'
End If


// -- Start the service. --
ls_syntax += 'This.of_SetQueryMode(True)~r~n'

// -- QueryMode. --
lb_desired = cbx_enabled.Checked
ls_syntax += '~r~nThis.inv_querymode.of_SetEnabled('+lnv_conversion.of_String(lb_desired)+')'

// -- ResetQueryCriteria. --
lb_desired = cbx_resetcriteria.Checked
ls_syntax += '~r~nThis.inv_querymode.of_SetResetCriteria('+lnv_conversion.of_String(lb_desired)+')'

// -- Retrieve on Disabled. --
lb_desired = cbx_retrieveondisabled.Checked
ls_syntax += '~r~nThis.inv_querymode.of_SetRetrieveOnDisabled('+lnv_conversion.of_String(lb_desired)+')'

// -- Query Columns. --
// Get the number of items in the ListBox.
li_upper = lb_cols.TotalItems( )
For li_cnt = 1 to li_upper
	// Is the item selected?
	If lb_cols.State(li_cnt) = 1 THEN  
		li_columncount ++
		ls_columns += '~r~nls_columns['+string(li_columncount)+'] = "'+ &
							lb_cols.text(li_cnt)+'"'
	End If
Next
If li_columncount > 0 Then
	// -- Defined required variables.  -- 
	ls_syntax = 'String	ls_columns[]~r~n~r~n' + ls_syntax
	ls_syntax += ls_columns
	ls_syntax += '~r~nThis.inv_querymode.of_SetQueryCols(ls_columns)'
End If

Return ls_syntax
end event

type cbx_enabled from u_cbx within pfc_u_tabpg_dwproperty_srvquerymode
integer x = 27
integer y = 36
integer width = 1737
integer height = 68
integer taborder = 10
boolean bringtotop = true
string text = "QueryMode &enabled"
end type

type st_columns from u_st within pfc_u_tabpg_dwproperty_srvquerymode
integer x = 27
integer y = 348
integer width = 1737
integer height = 60
boolean bringtotop = true
string text = "Highlight columns which allow entry in QueryMode"
end type

type lb_cols from u_lb within pfc_u_tabpg_dwproperty_srvquerymode
integer x = 27
integer y = 412
integer width = 1682
integer height = 940
integer taborder = 20
boolean multiselect = true
end type

type cbx_resetcriteria from u_cbx within pfc_u_tabpg_dwproperty_srvquerymode
integer x = 27
integer y = 120
integer width = 1737
integer height = 68
boolean bringtotop = true
string text = "Reset query criteria in-between QueryMode &toggles"
end type

type cbx_retrieveondisabled from u_cbx within pfc_u_tabpg_dwproperty_srvquerymode
integer x = 27
integer y = 204
integer width = 1737
integer height = 68
boolean bringtotop = true
string text = "&Retrieve when QueryMode is disabled"
end type


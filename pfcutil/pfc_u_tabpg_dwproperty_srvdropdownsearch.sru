HA$PBExportHeader$pfc_u_tabpg_dwproperty_srvdropdownsearch.sru
$PBExportComments$PFC DataWindow Property - The DropDownSearch service tabpage
forward
global type pfc_u_tabpg_dwproperty_srvdropdownsearch from u_tabpg_dwproperty_base
end type
type st_registeredcolumns from u_st within pfc_u_tabpg_dwproperty_srvdropdownsearch
end type
type lb_registeredcolumns from u_lb within pfc_u_tabpg_dwproperty_srvdropdownsearch
end type
end forward

global type pfc_u_tabpg_dwproperty_srvdropdownsearch from u_tabpg_dwproperty_base
event type integer pfc_propertypopulate ( )
st_registeredcolumns st_registeredcolumns
lb_registeredcolumns lb_registeredcolumns
end type
global pfc_u_tabpg_dwproperty_srvdropdownsearch pfc_u_tabpg_dwproperty_srvdropdownsearch

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

integer	li_upperall, li_upperreg
integer	li_cntall, li_cntreg
integer 	li_rc
integer	li_index
string	ls_allcols[]
string	ls_registeredcols[]

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_dropdownsearch) or &
	Not IsValid(idw_requestor.inv_dropdownsearch) Then
	Return -1
End If

// Get all the columns from which the dropdownsearch service could 
// perform its functionality.
li_rc = idw_requestor.inv_dropdownsearch.of_GetRegisterable(ls_allcols)
// Get all the registered columns.
li_rc = idw_requestor.inv_dropdownsearch.of_GetRegistered(ls_registeredcols)
// Add All of the columns and Select the Registered columns
li_upperall = UpperBound(ls_allcols)
li_upperreg = UpperBound(ls_registeredcols)
For li_cntall = 1 to li_upperall
	li_index = lb_registeredcolumns.AddItem(ls_allcols[li_cntall])
	// Determine if this is a Registered column.
	For li_cntreg = 1 to li_upperreg
		If ls_allcols[li_cntall] = ls_registeredcols[li_cntreg] Then
			lb_registeredcolumns.SetState ( li_index, True )
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
anv_infoattrib.is_name = 'DW Property DropDown Search Service'
anv_infoattrib.is_description = 'DW Property DropDown Search Service'

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

on pfc_u_tabpg_dwproperty_srvdropdownsearch.create
int iCurrent
call super::create
this.st_registeredcolumns=create st_registeredcolumns
this.lb_registeredcolumns=create lb_registeredcolumns
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_registeredcolumns
this.Control[iCurrent+2]=this.lb_registeredcolumns
end on

on pfc_u_tabpg_dwproperty_srvdropdownsearch.destroy
call super::destroy
destroy(this.st_registeredcolumns)
destroy(this.lb_registeredcolumns)
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
string	ls_column

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_dropdownsearch) or Not IsValid(idw_requestor.inv_dropdownsearch) Then
	Return -1
End If

// -- Register or Unregister Columns. --
// Get the number of items in the ListBox.
li_upper = lb_registeredcolumns.TotalItems()
For li_cnt = 1 to li_upper
	// Get the column name.
	ls_column = lb_registeredcolumns.text(li_cnt)
	// Is the column name selected?
	If lb_registeredcolumns.State(li_cnt) = 1 THEN  
		// Want this current column to be registered.
		If Not idw_requestor.inv_dropdownsearch.of_IsRegistered(ls_column) Then
			li_rc = idw_requestor.inv_dropdownsearch.of_Register(ls_column)
		End If
	Else
		// Want this current column to Not be registed.
		If idw_requestor.inv_dropdownsearch.of_IsRegistered(ls_column) Then
			li_rc = idw_requestor.inv_dropdownsearch.of_UnRegister(ls_column)
		End If		
	End If
Next

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
If IsNull(idw_requestor.inv_dropdownsearch) or Not IsValid(idw_requestor.inv_dropdownsearch) Then
	Return '!'
End If


// -- Start the service. --
ls_syntax += 'This.of_SetDropDownSearch(True)~r~n'

// -- Register Columns. --
// Get the number of items in the ListBox.
li_upper = lb_registeredcolumns.TotalItems( )
For li_cnt = 1 to li_upper
	// Is the item selected?
	If lb_registeredcolumns.State(li_cnt) = 1 THEN  
		ls_syntax += '~r~nThis.inv_dropdownsearch.of_Register("'+ &
							lb_registeredcolumns.text(li_cnt)+'")'
	End If
Next

Return ls_syntax

end event

type st_registeredcolumns from u_st within pfc_u_tabpg_dwproperty_srvdropdownsearch
integer x = 27
integer y = 36
integer width = 1701
boolean bringtotop = true
string text = "Highlight registered columns"
end type

type lb_registeredcolumns from u_lb within pfc_u_tabpg_dwproperty_srvdropdownsearch
integer x = 27
integer y = 120
integer width = 1696
integer height = 1236
integer taborder = 20
boolean multiselect = true
end type


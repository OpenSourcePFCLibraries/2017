HA$PBExportHeader$pfc_u_tabpg_dwproperty_srvreqcolumn.sru
$PBExportComments$PFC DataWindow Property - The ReqColumn service tabpage
forward
global type pfc_u_tabpg_dwproperty_srvreqcolumn from u_tabpg_dwproperty_base
end type
type st_registeredcolumns from u_st within pfc_u_tabpg_dwproperty_srvreqcolumn
end type
type lb_registeredskipcolumns from u_lb within pfc_u_tabpg_dwproperty_srvreqcolumn
end type
end forward

global type pfc_u_tabpg_dwproperty_srvreqcolumn from u_tabpg_dwproperty_base
event type integer pfc_propertypopulate ( )
st_registeredcolumns st_registeredcolumns
lb_registeredskipcolumns lb_registeredskipcolumns
end type
global pfc_u_tabpg_dwproperty_srvreqcolumn pfc_u_tabpg_dwproperty_srvreqcolumn

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
string	ls_registeredskipcols[]

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_reqcolumn) or &
	Not IsValid(idw_requestor.inv_reqcolumn) Then
	Return -1
End If

// Get all the columns.
li_rc = idw_requestor.inv_reqcolumn.of_GetRegisterable(ls_allcols)
// Get all the skip registered columns.
li_rc = idw_requestor.inv_reqcolumn.of_GetRegistered(ls_registeredskipcols)
// Add All of the columns and Select the skip Registered columns
li_upperall = UpperBound(ls_allcols)
li_upperreg = UpperBound(ls_registeredskipcols)
For li_cntall = 1 to li_upperall
	li_index = lb_registeredskipcolumns.AddItem(ls_allcols[li_cntall])
	// Determine if this is a skip Registered column.
	For li_cntreg = 1 to li_upperreg
		If ls_allcols[li_cntall] = ls_registeredskipcols[li_cntreg] Then
			lb_registeredskipcolumns.SetState ( li_index, True )
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

on pfc_u_tabpg_dwproperty_srvreqcolumn.create
int iCurrent
call super::create
this.st_registeredcolumns=create st_registeredcolumns
this.lb_registeredskipcolumns=create lb_registeredskipcolumns
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_registeredcolumns
this.Control[iCurrent+2]=this.lb_registeredskipcolumns
end on

on pfc_u_tabpg_dwproperty_srvreqcolumn.destroy
call super::destroy
destroy(this.st_registeredcolumns)
destroy(this.lb_registeredskipcolumns)
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
If IsNull(idw_requestor.inv_reqcolumn) or Not IsValid(idw_requestor.inv_reqcolumn) Then
	Return -1
End If

// -- Register or Unregister skip Columns. --
// Get the number of items in the ListBox.
li_upper = lb_registeredskipcolumns.TotalItems()
For li_cnt = 1 to li_upper
	// Get the column name.
	ls_column = lb_registeredskipcolumns.text(li_cnt)
	// Is the column name selected?
	If lb_registeredskipcolumns.State(li_cnt) = 1 THEN  
		// Want this current column to be registered.
		If Not idw_requestor.inv_reqcolumn.of_IsRegistered(ls_column) Then
			li_rc = idw_requestor.inv_reqcolumn.of_RegisterSkipColumn(ls_column)
		End If
	Else
		// Want this current column to Not be registed.
		If idw_requestor.inv_reqcolumn.of_IsRegistered(ls_column) Then
			li_rc = idw_requestor.inv_reqcolumn.of_UnRegister(ls_column)
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

integer	li_cnt
integer	li_upper
string	ls_syntax

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return '!'
End If
If IsNull(idw_requestor.inv_reqcolumn) or Not IsValid(idw_requestor.inv_reqcolumn) Then
	Return '!'
End If


// -- Start the service. --
ls_syntax += 'This.of_SetReqColumn(TRUE)~r~n'

// -- Register Skip Columns. --
// Get the number of items in the ListBox.
li_upper = lb_registeredskipcolumns.TotalItems( )
For li_cnt = 1 to li_upper
	// Is the item selected?
	If lb_registeredskipcolumns.State(li_cnt) = 1 THEN  
		ls_syntax += 'This.inv_reqcolumn.of_RegisterSkipColumn('+ &
					lb_registeredskipcolumns.text(li_cnt)+')~r~n'
	End If
Next

Return ls_syntax

end event

type st_registeredcolumns from u_st within pfc_u_tabpg_dwproperty_srvreqcolumn
integer x = 27
integer y = 36
integer width = 1701
boolean bringtotop = true
string text = "Highlight columns to &skip checking on"
end type

type lb_registeredskipcolumns from u_lb within pfc_u_tabpg_dwproperty_srvreqcolumn
integer x = 27
integer y = 104
integer width = 1696
integer height = 1252
integer taborder = 20
boolean multiselect = true
integer accelerator = 115
end type


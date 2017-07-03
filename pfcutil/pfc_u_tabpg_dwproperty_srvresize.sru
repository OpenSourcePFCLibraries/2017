HA$PBExportHeader$pfc_u_tabpg_dwproperty_srvresize.sru
$PBExportComments$PFC DataWindow Property - The Resize service tabpage
forward
global type pfc_u_tabpg_dwproperty_srvresize from u_tabpg_dwproperty_base
end type
type dw_register from u_dw within pfc_u_tabpg_dwproperty_srvresize
end type
end forward

global type pfc_u_tabpg_dwproperty_srvresize from u_tabpg_dwproperty_base
dw_register dw_register
end type
global pfc_u_tabpg_dwproperty_srvresize pfc_u_tabpg_dwproperty_srvresize

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
anv_infoattrib.is_name = 'DW Property Resize Service'
anv_infoattrib.is_description = 'DW Property Resize Service'

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

on pfc_u_tabpg_dwproperty_srvresize.create
int iCurrent
call super::create
this.dw_register=create dw_register
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_register
end on

on pfc_u_tabpg_dwproperty_srvresize.destroy
call super::destroy
destroy(this.dw_register)
end on

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
integer	li_style
integer	li_index
integer	li_row
string	ls_allobjects[]
string	ls_registeredobjects[]
string	ls_method
boolean	lb_registeredscale[]
integer	li_registeredmovex[]
integer	li_registeredmovey[]
integer	li_registeredscalex[]
integer	li_registeredscaley[]

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_resize) or Not IsValid(idw_requestor.inv_resize) Then
	Return -1
End If

// Make sure there are no rows.
dw_register.Reset()

// Get all the columns the calculator object could sevice.
li_rc = idw_requestor.inv_resize.of_GetRegisterable(ls_allobjects)
// Get all the registered columns.
li_rc = idw_requestor.inv_resize.of_GetRegistered(ls_registeredobjects, lb_registeredscale, &
	li_registeredmovex, li_registeredmovey, li_registeredscalex, li_registeredscaley)
// Add All of the columns and Select the Registered columns
li_upperall = UpperBound(ls_allobjects)
li_upperreg = UpperBound(ls_registeredobjects)
For li_cntall = 1 to li_upperall
	li_row = dw_register.InsertRow(0)
	If li_row > 0 Then
		// Initilize the new row (the dw object has other initial values).
		dw_register.object.objectname.primary[li_row] = ls_allobjects[li_cntall]
		// Determine if this is an registered column.
		For li_cntreg = 1 to li_upperreg
			If ls_allobjects[li_cntall] = ls_registeredobjects[li_cntreg] Then
				// This is a registered row.
				
				dw_register.object.register.primary[li_row] = 'Y'
				If lb_registeredscale[li_cntreg] Then ls_method = 'S' Else ls_method = 'P'
				dw_register.object.method.primary[li_row] = ls_method
				dw_register.object.movex.primary[li_row] = li_registeredmovex[li_cntreg]
				dw_register.object.movey.primary[li_row] = li_registeredmovey[li_cntreg]
				dw_register.object.scalex.primary[li_row] = li_registeredscalex[li_cntreg]
				dw_register.object.scaley.primary[li_row] = li_registeredscaley[li_cntreg]
				Exit
			End If
		Next
	End If
Next

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

integer	li_movex, li_movey, li_scalex, li_scaley
integer	li_currmovex, li_currmovey, li_currscalex, li_currscaley
boolean	lb_scale
boolean  lb_currscale

integer	li_upper
integer	li_row
integer 	li_rc
integer	li_stylecurrent, li_styledesired
integer	li_index
integer	li_excludecount=0
string	ls_excludecols[]
string	ls_object
boolean	lb_current, lb_desired

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_resize) or Not IsValid(idw_requestor.inv_resize) Then
	Return -1
End If

// -- Register or Unregister Columns. --

// Get the number of items in the ListBox.
li_upper = dw_register.RowCount()
For li_row = 1 to li_upper
	// Get the column name.
	ls_object = dw_register.object.objectname.primary[li_row]
	
	// Is the object selected to be registered?
	If dw_register.object.register.primary[li_row] = 'Y' THEN
	
		// Get the registering parameters.
		lb_scale = (dw_register.object.method.primary[li_row] = 'S')
		If Not lb_scale Then
			li_movex = dw_register.object.movex.primary[li_row]
			li_movey = dw_register.object.movey.primary[li_row]
			li_scalex = dw_register.object.scalex.primary[li_row]
			li_scaley = dw_register.object.scaley.primary[li_row]
		End If
		
		// Want this current object to be registered.
		If Not idw_requestor.inv_resize.of_IsRegistered(ls_object) Then
			// If it was not previously registered, simply register it.
			If lb_scale Then
				li_rc = idw_requestor.inv_resize.of_Register(ls_object, inv_resize.SCALE)
			else
				li_rc = idw_requestor.inv_resize.of_Register(ls_object, li_movex, li_movey, &
					li_scalex, li_scaley)
			End If
		Else
			// The object is currently registered, we may need to change its
			// registration behavior.
			li_rc = idw_requestor.inv_resize.of_GetRegistered(ls_object, &
				lb_currscale, li_currmovex, li_currmovey, li_currscalex, li_currscaley)
			If lb_scale = lb_currscale And li_movex = li_currmovex AND &
				li_movey = li_currmovey And li_scalex = li_currscalex AND &
				li_scaley = li_currscaley Then
				// No need to take any further action.
			Else
				// Unregister it and then register it back with the new behavior.
				li_rc = idw_requestor.inv_resize.of_UnRegister(ls_object)
				If lb_scale Then
					li_rc = idw_requestor.inv_resize.of_Register(ls_object, inv_resize.SCALE)
				else
					li_rc = idw_requestor.inv_resize.of_Register(ls_object, li_movex, li_movey, &
						li_scalex, li_scaley)
				End If				
			End If
		End If
	Else
		// Want this current column to Not be registed.
		If idw_requestor.inv_resize.of_IsRegistered(ls_object) Then
			li_rc = idw_requestor.inv_resize.of_UnRegister(ls_object)
		End If		
	End If
Next

Return 1

end event

event pfc_propertyvalidation;call super::pfc_propertyvalidation;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyValidation
//
//	Arguments:  None
//
//	Returns: Integer
//	 1 = successful
// -1 = Error
//
//	Description:
//	 Validate the object.
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

Integer	li_rc

li_rc = dw_register.AcceptText() 

If li_rc < 1 Then
	dw_register.SetFocus()
	//dw_register.ScrollToRow(dw_register.GetRow())
End If

Return li_rc
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

integer	li_movex, li_movey, li_scalex, li_scaley
string	ls_object
boolean	lb_scale
integer	li_upper
integer	li_row
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
If IsNull(idw_requestor.inv_resize) or Not IsValid(idw_requestor.inv_resize) Then
	Return '!'
End If


// -- Start the service. --
ls_syntax += 'This.of_SetResize(True)~r~n'

// -- Register Objects. --

// Get the number of items in the datawindow.
li_upper = dw_register.RowCount()
For li_row = 1 to li_upper
	// Get the column name.
	ls_object = dw_register.object.objectname.primary[li_row]
	
	// Is the object selected to be registered?
	If dw_register.object.register.primary[li_row] = 'Y' THEN
	
		// Get the registering parameters.
		lb_scale = (dw_register.object.method.primary[li_row] = 'S')
		If Not lb_scale Then
			li_movex = dw_register.object.movex.primary[li_row]
			li_movey = dw_register.object.movey.primary[li_row]
			li_scalex = dw_register.object.scalex.primary[li_row]
			li_scaley = dw_register.object.scaley.primary[li_row]
		End If

		If lb_scale Then
			ls_syntax += '~r~nThis.inv_resize.of_Register("'+ &
				Trim(ls_object)+'", inv_resize.SCALE)'
		Else
			ls_syntax += '~r~nThis.inv_resize.of_Register("'+ &
				Trim(ls_object)+'", '+String(li_movex)+ ', ' +String(li_movey) + &
				', ' +String(li_scalex) + ', ' +String(li_scaley) +')'
		End If
		
	End If
Next

Return ls_syntax

end event

type dw_register from u_dw within pfc_u_tabpg_dwproperty_srvresize
integer x = 27
integer y = 36
integer width = 1737
integer height = 1320
string dataobject = "d_dwproperty_srvresize"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;of_SetUpdateable(False)
end event


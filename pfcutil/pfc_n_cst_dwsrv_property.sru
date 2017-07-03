HA$PBExportHeader$pfc_n_cst_dwsrv_property.sru
$PBExportComments$PFC DataWindow Property - The service
forward
global type pfc_n_cst_dwsrv_property from n_cst_dwsrv
end type
end forward

global type pfc_n_cst_dwsrv_property from n_cst_dwsrv
end type
global pfc_n_cst_dwsrv_property pfc_n_cst_dwsrv_property

type variables
Protected:

w_dwproperty 		iw_property
w_dwpropertyservices	iw_propertyservices
end variables

forward prototypes
public function integer of_openproperty (n_cst_dwpropertyattrib anv_attrib)
public function boolean of_ispropertyopen ()
public function integer of_openpropertyservice (powerobject apo_service)
end prototypes

public function integer of_openproperty (n_cst_dwpropertyattrib anv_attrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		
//	of_OpenProperty
//
//	Access:  		public
//
//	Parameters:
//	anv_attrib	The attributes to be passed in to the property window.
//
//	Returns:  	integer
//	Return value of OpenWithParm PowerBuilder call.
//
//	Description:	
//	Opens the Property window.
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

SetPointer(HourGlass!)

Return OpenWithParm (iw_property, anv_attrib)

end function

public function boolean of_ispropertyopen ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		
//	of_IsPropertyOpen
//
//	Access:  	public
//
//	Parameters:	None
//
//	Returns:  	Boolean
//	True if the window is currently opened.
//	False if not currently opened.
//
//	Description:	
//	Reports if the window is currently opened.
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

If IsValid(iw_property) Then Return True
If IsValid(iw_propertyservices) Then Return True
Return False
end function

public function integer of_openpropertyservice (powerobject apo_service);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		
//	of_OpenPropertyService
//
//	Access:  		public
//
//	Parameters:
//	apo_service	The valid service for which to open the Property Service window.
//
//	Returns:  	integer
//	Return value of OpenWithParm PowerBuilder call.
//	-1 In error.
//
//	Description:	
//	Opens the Property Service window for the passed in service.
//
// Note:
//	The service desired must be started.
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

integer	li_rc
integer	li_tabcnt
integer	li_uppertab
string	ls_pages
string	ls_args[]
boolean	lb_defined
window	lw_parentwindow
n_cst_propertyattrib	lnv_propertyattrib
n_cst_dwpropertyattrib	lnv_attrib
n_cst_metaclass	lnv_metaclass

SetPointer(HourGlass!)

// Validate argument
If IsNull(apo_service) Or Not IsValid(apo_service) Then
	Return -1
End If

// Validate required references.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then
	// Notice that this function is not applicable for the shared instance
	// since the idw_requestor is not set for it.
	Return -1
End If

// Determine if it is OK to call for the attributes.
//ls_args = {'ref n_cst_propertyattrib'}
//lb_defined = lnv_metaclass.of_isFunctionDefined &
//	(apo_service.ClassDefinition, "of_GetPropertyInfo", ls_args)
//If Not lb_defined Then
//	Return -1
//End If

// Make a Dynamic call to get the attributes.
li_rc = apo_service.Dynamic of_GetPropertyInfo(lnv_propertyattrib)
If li_rc < 0 Then Return -1
	
// -- Gather the attributes. --

// Set dw object.
lnv_attrib.idw_requestor = idw_requestor

// Get the service name.
lnv_attrib.is_objectname = lnv_propertyattrib.is_name
If Len(Trim(lnv_attrib.is_objectname)) = 0 Then 
	lnv_attrib.is_objectname = apo_service.ClassName()
End If		

// Create tab delimited list of desired tabpages.
li_uppertab = UpperBound(lnv_propertyattrib.is_propertypage)
For li_tabcnt = 1 to li_uppertab
	If li_tabcnt > 1 Then ls_pages += '~t'
	ls_pages += lnv_propertyattrib.is_propertypage[li_tabcnt]
Next
lnv_attrib.is_tabpages = ls_pages

// Get the parent window ref so that the new window can open in relation to it.
idw_requestor.of_GetParentWindow(lw_parentwindow)
If IsValid(lw_parentwindow) Then
	lnv_attrib.iw_main = lw_parentwindow
End If

// Allow structure to have other values set before opening dialog.
idw_requestor.Event pfc_preproperties(lnv_attrib)
		
// Open the Property window.
Return OpenWithParm (iw_propertyservices, lnv_attrib)
end function

on pfc_n_cst_dwsrv_property.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_dwsrv_property.destroy
TriggerEvent( this, "destructor" )
end on

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  destructor
//
//	Arguments: none
//	
//	Returns:  none
//
//	Description:  Perform cleanup.
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

//Close any open windows
If IsValid(iw_property) Then Close(iw_property)
If IsValid(iw_propertyservices) Then Close(iw_propertyservices)

end event

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  constructor
//
//	Arguments: none
//	
//	Returns:  none
//
//	Description:  
//	DataWindow Property Service to peek and change behavior of u_dw objects.  
//	Including start/stop services, service behaviors, service syntax, dw buffers,
//	and dw row/column status. The object can be instantiated as a shared (global
// to all application dws) or per instance (one dw at a time).  This service
// consits of this object plus the visual window(s), visual tab control(s), and
// visual tab page(s).  This collection of objects was developed so that they can
// easily be extended to include other services that may be found in u_dw other
// than the ones provided by PFC.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version - Claudio J. Quant
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

end event


HA$PBExportHeader$pfc_u_tab_dwproperty_srv.sru
$PBExportComments$PFC DataWindow Property - The services tab object
forward
global type pfc_u_tab_dwproperty_srv from u_tab
end type
end forward

global type pfc_u_tab_dwproperty_srv from u_tab
integer width = 1765
integer height = 1384
long backcolor = 80263328
event type integer pfc_propertyopen ( )
event type integer pfc_propertystart ( n_cst_dwpropertyattrib anv_attrib )
event type integer pfc_propertyinitialize ( n_cst_dwpropertyattrib anv_attrib )
event type integer pfc_propertyapply ( )
event type integer pfc_propertycreatepages ( string as_pages )
event type integer pfc_propertyvalidation ( )
end type
global pfc_u_tab_dwproperty_srv pfc_u_tab_dwproperty_srv

type variables
Protected:
string			is_syntaxtappg = 'u_tabpg_dwproperty_srvsyntax'
string			is_syntaxtext = 'Text'
u_tabpg_dwproperty_base	iuo_tappage[]
u_dw			idw_Requestor
n_cst_dwpropertyattrib 	inv_attrib

end variables

event pfc_propertyopen;call super::pfc_propertyopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyOpen
//
//	Arguments: None
//
//	Returns: Integer
//	 1 = successful
// -1 = Error
//
//	Description:
//	 Perform Open functionality.
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

Integer 	li_rc
Any		la_rc
Integer	li_upper
Integer	li_cnt

// Loop through all the tab pages.
li_upper = Upperbound(iuo_tappage)
For li_cnt = 1 to li_upper
	la_rc = iuo_tappage[li_cnt].Dynamic Event pfc_PropertyOpen()
	If ClassName(la_rc) = 'integer' or ClassName(la_rc)='long' Then
		// The pfc_PropertyOpen was found, validate the return code.
		If la_rc < 0 Then Return -1
	End If
Next

Return 1

end event

event pfc_propertystart;call super::pfc_propertystart;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyStart
//
//	Arguments:  
//	 anv_attrib   The datawindow property attributes.
//
//	Returns: Integer
//	 1 = successful
// -1 = Error
//
//	Description:
//	 Start the object, Create the appropriate pages for the service, And call 
//	 the 'Initialize' process for any specific functionality.
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

Integer 	li_rc
Any		la_rc
Integer	li_upper
Integer	li_cnt
window	lw_parent
n_cst_propertyattrib lnv_propertyattrib

// Validate.
If IsNull(anv_attrib) or Not IsValid(anv_attrib) Then
	Return -1
End If
If IsNull(anv_attrib.idw_requestor) or Not IsValid(anv_attrib.idw_requestor) Then
	Return -1
End If

// Store the Attributes.
inv_attrib = anv_attrib

// Get the Requestor reference.
idw_requestor = inv_attrib.idw_requestor

// Set the Window title.
of_GetParentWindow(lw_parent)
If IsValid(lw_parent) Then 
	lw_parent.Title = inv_attrib.is_objectname + ' Properties'
End If

// Create the appropriate page(s) for the service.
li_rc = this.Event pfc_PropertyCreatePages(inv_attrib.is_tabpages)
If li_rc <=0 Then Return -1

// Determine if the Syntax page is desired.
If Len(Trim(is_syntaxtappg)) > 0 Then
	// Create the Syntax page.
	li_upper = Upperbound(iuo_tappage)
	If li_upper > 0 Then
		li_upper ++
		li_rc = OpenTab(iuo_tappage[li_upper], is_syntaxtappg, 0)
		If li_rc <= 0 or IsNull(iuo_tappage[li_upper]) Or Not IsValid(iuo_tappage[li_upper]) Then
			Return -1
		End If
	
		// Set the Tab Text.
		li_rc = iuo_tappage[li_upper].of_GetPropertyInfo(lnv_propertyattrib)
		iuo_tappage[li_upper].Text = lnv_propertyattrib.is_propertytabtext
		If Len(iuo_tappage[li_upper].Text)=0 Then iuo_tappage[li_upper].Text = is_syntaxtext
	End If
End If

// Loop through all the tab pages.
For li_cnt = 1 to li_upper
	la_rc = iuo_tappage[li_cnt].Dynamic Event pfc_PropertyStart(inv_attrib)

	If ClassName(la_rc) = 'integer' or ClassName(la_rc)='long' Then
		// The pfc_PropertyStart was found, validate the return code.
		If la_rc < 0 Then Return -1
	End If
Next

// Call the 'Initialize process'.
li_rc = this.Event pfc_PropertyInitialize(inv_attrib)
If li_rc <=0 Then Return -1

Return 1
end event

event pfc_propertyinitialize;call super::pfc_propertyinitialize;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyInitialize
//
//	Arguments:  
//	 anv_attrib   The datawindow property attributes.
//
//	Returns: Integer
//	 1 = successful
// -1 = Error
//
//	Description:
//	 Initializes the object.
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

Return 1
end event

event pfc_propertyapply;call super::pfc_propertyapply;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyApply
//
//	Arguments: None
//
//	Returns: Integer
//	 1 = successful
// -1 = Error
//
//	Description:
//	 Perform Apply functionality.
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

Integer 	li_rc
Any		la_rc
Integer	li_upper
Integer	li_cnt

// Loop through all the tab pages.
li_upper = Upperbound(iuo_tappage)
For li_cnt = 1 to li_upper
	la_rc = iuo_tappage[li_cnt].Dynamic Event pfc_PropertyApply()
	If ClassName(la_rc) = 'integer' or ClassName(la_rc)='long' Then
		// The pfc_PropertyApply was found, validate the return code.
		If la_rc < 0 Then Return -1
	End If
Next

Return 1
end event

event pfc_propertycreatepages;call super::pfc_propertycreatepages;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyCreatePages
//
//	Arguments: 
//	 as_service	The service being serviced.
//
//	Returns: Integer
//	 1 = successful
// -1 = Error
//
//	Description:
//	 Create the pages for the current service.
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

Integer	li_page
Integer	li_rc
String	ls_page
n_cst_string lnv_string
n_cst_propertyattrib lnv_propertyattrib

// Validate that there is something to create.
as_pages = Trim(as_pages)
If IsNull(as_pages) or Len(as_pages) = 0 Then
	Return -1
End If

// Loop and create the appropriate TabPages. --
Do While Len(as_pages) > 0
	// Get a single page.
	ls_page = lnv_string.of_gettoken(as_pages, '~t')
	If Len(ls_page) > 0 Then
		
		// Create the page.
		li_page = UpperBound(iuo_tappage) + 1
		li_rc = OpenTab(iuo_tappage[li_page], ls_page, 0)
		If li_rc <= 0 or IsNull(iuo_tappage[li_page]) Or Not IsValid(iuo_tappage[li_page]) Then
			Return -1
		End If
		
		// Set the Tab Text.
		li_rc = iuo_tappage[li_page].of_GetPropertyInfo(lnv_propertyattrib)
		iuo_tappage[li_page].Text = lnv_propertyattrib.is_propertytabtext
		If Len(iuo_tappage[li_page].Text)=0 Then iuo_tappage[li_page].Text = 'UnAssigned'
		
	End If
Loop

Return UpperBound(iuo_tappage)
end event

event pfc_propertyvalidation;call super::pfc_propertyvalidation;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyValidation
//
//	Arguments: None
//
//	Returns: Integer
//	 1 = successful
// -1 = Error
//
//	Description:
//	 Perform validation functionality.
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

Integer 	li_rc
Any		la_rc
Integer	li_upper
Integer	li_cnt

// Loop through all the tab pages.
li_upper = Upperbound(iuo_tappage)
For li_cnt = 1 to li_upper
	la_rc = iuo_tappage[li_cnt].Dynamic Event pfc_PropertyValidation()
	If ClassName(la_rc) = 'integer' or ClassName(la_rc)='long' Then
		// The pfc_PropertyOpen was found, validate the return code.
		If la_rc < 0 Then Return -1
	End If
Next

Return 1

end event

event selectionchanging;call super::selectionchanging;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  selectionchanging
//
//	Arguments: 
//	oldindex	The old tabpage index.
//	newindex	The new tabpage index.
//
//	Returns: Integer
//	 1 = successful
// -1 = Error
//
//	Description:
//	Perform validation prior to allow changing of tab pages.
//	If the new tabpage is the Syntax tabpage, set the appropriate script on it.
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


Integer 	li_rc
Any		la_rc
Integer	li_upper
Integer	li_cnt
String 	ls_text
String 	ls_syntax
String	ls_tabpagesyntax

// Validate the NewIndex TabPage.
If newindex > 0 And newindex <=UpperBound(iuo_tappage) Then
	If IsNull(iuo_tappage[newindex]) Or Not IsValid(iuo_tappage[newindex]) Then
		Return 
	End If
Else
	Return
End If

// Validate the OldIndex TabPage
If oldindex > 0 Then
	If IsValid(iuo_tappage[oldindex]) Then
		la_rc = iuo_tappage[oldindex].Dynamic Event pfc_PropertyValidation()
		If ClassName(la_rc) = 'integer' or ClassName(la_rc)='long' Then
			// The pfc_PropertyValidation was found, validate the return code.
			If la_rc < 0 Then Return 1
		End If
	End If
End If

// Get the TabPage text.
ls_text = Lower(iuo_tappage[newindex].Text)
If Pos(ls_text, 'syntax') > 0 Then
	
	// Loop through all the tab pages.
	li_upper = Upperbound(iuo_tappage)
	For li_cnt = 1 to li_upper
		la_rc = iuo_tappage[li_cnt].Dynamic Event pfc_PropertySyntax()
		If ClassName(la_rc) = 'string' Then
			// The pfc_PropertySyntax was found, validate the return code.
			ls_tabpagesyntax = la_rc
			If IsNull(ls_tabpagesyntax) Then ls_tabpagesyntax = ''
			If Len(ls_syntax) > 0 And Len(ls_tabpagesyntax) > 0 Then
				ls_syntax += '~r~n'
			End If
			ls_syntax += ls_tabpagesyntax
		End If
	Next
	
	If IsNull(ls_syntax) Then ls_syntax = ''
	iuo_tappage[newindex].Dynamic of_SetSyntax(ls_syntax)
End If
end event


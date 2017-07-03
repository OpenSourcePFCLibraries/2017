HA$PBExportHeader$pfc_n_cst_rtefind.sru
$PBExportComments$PFC RTE Find/Replace service
forward
global type pfc_n_cst_rtefind from n_base
end type
end forward

global type pfc_n_cst_rtefind from n_base
event type integer pfc_findnext ( n_cst_findattrib anv_findattrib )
event type integer pfc_replace ( n_cst_findattrib anv_findattrib )
event type integer pfc_replaceall ( n_cst_findattrib anv_findattrib )
event pfc_finddlg ( )
event pfc_replacedlg ( )
end type
global pfc_n_cst_rtefind pfc_n_cst_rtefind

type variables
Protected:
boolean 		ib_ongoingfind
u_dw		idw_requestor
u_rte		irte_requestor
n_cst_findattrib	inv_findattrib
end variables

forward prototypes
public function integer of_setrequestor (u_dw adw_requestor)
public function integer of_setrequestor (u_rte arte_requestor)
protected function boolean of_compareattrib (n_cst_findattrib anv_findattrib)
protected function boolean of_isongoingfind (n_cst_findattrib anv_findattrib)
public function integer of_initialize (n_cst_findattrib anv_findattrib)
end prototypes

event pfc_findnext;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  				pfc_findnext
//
//	Arguments:
//	anv_findattrib		nvo-structure - reference of search attributes
//
//	Returns:  			long
//							search results
//
//	Description:  		This event is called dynamically to start the search
//							using the current settings.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
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
boolean	lb_forward

If (IsNull(idw_requestor) Or Not IsValid(idw_requestor)) And &
	(IsNull(irte_requestor) Or Not IsValid(irte_requestor)) Then
	Return -1
End If

If ib_ongoingfind Then
	//Determine if this continues to be an Ongoing Find. 
	ib_ongoingfind = of_IsOnGoingFind(anv_findattrib)
End If

//Get a copy of passed attributes.
inv_findattrib = anv_findattrib

//Set up direction.
lb_forward = (Not Lower(inv_findattrib.is_direction)='up')

//Determine if this is the first find or an ongoing find.
if ib_ongoingfind THEN
	//On going find.
	If IsValid(irte_requestor) Then
		li_rc = irte_requestor.findnext()
	Else
		li_rc = idw_requestor.findnext()
	End If
Else
	//First time find.
	If IsValid(irte_requestor) Then
		li_rc = irte_requestor.find (	inv_findattrib.is_find, lb_forward, &
								not inv_findattrib.ib_matchcase, &
								inv_findattrib.ib_wholeword, True)
	Else
		li_rc = idw_requestor.find (	inv_findattrib.is_find, lb_forward, &
								not inv_findattrib.ib_matchcase, &
								inv_findattrib.ib_wholeword, True)
	End If	
end if

//Determine if the next find/replace could be a FindNext operation.
ib_ongoingfind = (li_rc > 0) 

return li_rc

end event

event pfc_replace;////////////////////////////////////////////////////////////////////////////
//
//	Event:  				pfc_Replace
//
//	Arguments:
//	anv_findattrib 	nvo-structure - reference of search attributes
//
//	Returns:  			Integer
//							1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  		This event is called to search and replace
//							using the passed in settings.  It will perform a replace
//							(if applicable) followed by a Find or FindNext operation.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
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
boolean 	lb_forward
string	ls_selectedtext

If (IsNull(idw_requestor) Or Not IsValid(idw_requestor)) And &
	(IsNull(irte_requestor) Or Not IsValid(irte_requestor)) Then
	Return -1
End If

If ib_ongoingfind Then
	//Determine if this continues to be an Ongoing Find. 
	ib_ongoingfind = of_IsOnGoingFind(anv_findattrib)
End If

//Get a copy of passed attributes.
inv_findattrib = anv_findattrib

//Get the currently selected text
If IsValid(irte_requestor) Then
	ls_selectedtext = irte_requestor.SelectedText()	
Else
	ls_selectedtext = idw_requestor.SelectedText()	
End If		

//Only replace if the selected text matches the find text.
If ls_selectedtext = inv_findattrib.is_find Then
	If IsValid(irte_requestor) Then
		li_rc = irte_requestor.ReplaceText ( inv_findattrib.is_replacewith )		
	Else
		li_rc = idw_requestor.ReplaceText (	inv_findattrib.is_replacewith )		
	End If	
End If

//Set up direction.
lb_forward = (Not Lower(inv_findattrib.is_direction)='up')

//Determine if this is the first find or an ongoing find.
If ib_ongoingfind Then
	//On going find and replace.
	If IsValid(irte_requestor) Then
		li_rc = irte_requestor.FindNext()	
	Else
		li_rc = idw_requestor.FindNext()
	End If	
	
Else
	//First time find.
	If IsValid(irte_requestor) Then
		li_rc = irte_requestor.find (	inv_findattrib.is_find, lb_forward, &
								not inv_findattrib.ib_matchcase,&
								inv_findattrib.ib_wholeword, True)
	Else
		li_rc = idw_requestor.find (	inv_findattrib.is_find, lb_forward, &
								not inv_findattrib.ib_matchcase,&
								inv_findattrib.ib_wholeword, True)
	End If		
End If

//Determine if the next find/replace could be a FindNext operation.
ib_ongoingfind = (li_rc > 0) 

Return li_rc
end event

event pfc_replaceall;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_replaceall
//
//	Arguments:
//	anv_findattrib - nvo-structure - reference of search attributes
//
//	Returns:  none
//	
//
//	Description:	This event is called to search and replace all
//						instances of the text using the current settings.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
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

integer 	li_counter=0
integer 	li_rc

SetPointer(HourGlass!)
			
If (IsNull(idw_requestor) Or Not IsValid(idw_requestor)) And &
	(IsNull(irte_requestor) Or Not IsValid(irte_requestor)) Then
	Return -1
End If

If IsValid(irte_requestor) Then
	li_rc = irte_requestor.SetRedraw(False)		
Else
	li_rc = idw_requestor.SetRedraw(False)		
End If

DO
	li_rc = this.Event pfc_Replace(anv_findattrib)
	if li_rc > 0 THEN
		li_counter ++
	end if
LOOP UNTIL li_rc <= 0

If IsValid(irte_requestor) Then
	li_rc = irte_requestor.SetRedraw(True)		
Else
	li_rc = idw_requestor.SetRedraw(True)		
End If
return li_counter
end event

event pfc_finddlg;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_finddlg
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Called to begin a search based on settings of the
//						inv_findattrib with the find dialog. 
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Close existing Dialog window prior to displaying the new Dlg window.
// 5.0.02 Open the extension find window instead of the base find window.
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

//Close existing Dialog window prior to displaying the new Dlg window.
If IsValid(w_replace) Then Close(w_replace)
If IsValid(w_find) Then Close(w_find)

//Set this object as the requestor.
inv_findattrib.ipo_requestor = this

//Disable look in.
inv_findattrib.ib_lookenabled = false
inv_findattrib.ib_lookvisible = false

OpenWithParm (w_find, inv_findattrib)
return


end event

event pfc_replacedlg;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_replacedlg
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Call to begin a find and replace operation.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Close existing Dialog window prior to displaying the new Dlg window.
// 5.0.02 Open the extension replace window instead of the base replace window.
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

//Close existing Dialog window prior to displaying the new Dlg window.
If IsValid(w_replace) Then Close(w_replace)
If IsValid(w_find) Then Close(w_find)

//Set this object as the requestor.
inv_findattrib.ipo_requestor = this

//Disable look in.
inv_findattrib.ib_lookenabled = false
inv_findattrib.ib_lookvisible = false

//Open the replace window.
OpenWithParm (w_replace, inv_findattrib)

Return

end event

public function integer of_setrequestor (u_dw adw_requestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetRequestor
//
//	Access:    		Public
//
//	Arguments:
// adw_Requestor   The datawindow requesting the service
//
//	Returns: 		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Associates a datawindow control with a datawindow service NVO
//			        	by setting the idw_Requestor instance variable.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

If IsValid(irte_requestor) Then
	Return -1
End If

If IsValid(adw_requestor) Then
	idw_Requestor = adw_Requestor
	Return 1
End If

Return -1
end function

public function integer of_setrequestor (u_rte arte_requestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetRequestor
//
//	Access:    		Public
//
//	Arguments:
// adw_Requestor   The datawindow requesting the service
//
//	Returns: 		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Associates a rte control with the service NVO
//			        	by setting the irte_requestor instance variable.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

If IsValid(idw_requestor) Then
	Return -1
End If

If IsValid(arte_requestor) Then
	irte_requestor = arte_requestor
	Return 1
End If

Return -1
end function

protected function boolean of_compareattrib (n_cst_findattrib anv_findattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  			of_CompareAttrib
//
//	Access:  			protected
//
//	Arguments: 
//	anv_findattrib		nvo structure to compare
//
//
//	Returns: 			boolean 
//							true - the structures are the same
//							false - the structures are not the same
//
//	Description: 		This function is called to replace text found in search.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

//If any of the attributes do not match, return false
if anv_findattrib.is_find <> inv_findattrib.is_find then return false
if anv_findattrib.is_replacewith <> inv_findattrib.is_replacewith then return false
if anv_findattrib.ib_wholeword <> inv_findattrib.ib_wholeword then return false
if anv_findattrib.ib_matchcase <> inv_findattrib.ib_matchcase then return false
if anv_findattrib.is_direction <> inv_findattrib.is_direction then return false

//The structures match.
return true


end function

protected function boolean of_isongoingfind (n_cst_findattrib anv_findattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsOnGoingFind
//
//	Access:  		protected
//
//	Arguments:		
//	anv_findattrib	Copy of structure holding all find/replace flags.
//
//	Returns:  		Boolean
//						True - This is an ongoing find.
//						False - This is not an ongoing find.
//
//	Description:  	Determines if the current find operation is a brand new
//						Find or a FindNext operation.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

//Check if find/replace criteria was changed on visual object.
If IsValid(anv_findattrib) Then
	if NOT of_CompareAttrib(anv_findattrib) THEN
		Return False
	end if
End If

Return True
end function

public function integer of_initialize (n_cst_findattrib anv_findattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_initialize
//
//	Access:  		public
//
//	Arguments:		
//	anv_findattrib	NonVisual holding the desired initial values.
//
//	Returns:  		Integer
//
//	Description:  	Initialize the options for this service.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

//Check arguments.
If IsNull(anv_findattrib) Or Not IsValid(anv_findattrib) Then
	Return -1
End If

//Initial Find & Replace strings.
inv_findattrib.is_find = anv_findattrib.is_find
inv_findattrib.is_replacewith  = anv_findattrib.is_replacewith

//Wholeword flags.
inv_findattrib.ib_wholewordvisible =anv_findattrib.ib_wholewordvisible
inv_findattrib.ib_wholewordenabled =anv_findattrib.ib_wholewordenabled
inv_findattrib.ib_wholeword = anv_findattrib.ib_wholeword

//Matchcase flags.
inv_findattrib.ib_matchcasevisible = anv_findattrib.ib_matchcasevisible
inv_findattrib.ib_matchcaseenabled = anv_findattrib.ib_matchcaseenabled
inv_findattrib.ib_matchcase = anv_findattrib.ib_matchcase

//Direction flags.
inv_findattrib.ib_directionvisible = anv_findattrib.ib_directionvisible
inv_findattrib.ib_directionenabled = anv_findattrib.ib_directionenabled
inv_findattrib.is_direction = anv_findattrib.is_direction

//Look Options are not valid for RTE controls.
inv_findattrib.ib_lookvisible = False
inv_findattrib.ib_lookenabled = False

Return 1

end function

on pfc_n_cst_rtefind.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_rtefind.destroy
TriggerEvent( this, "destructor" )
end on


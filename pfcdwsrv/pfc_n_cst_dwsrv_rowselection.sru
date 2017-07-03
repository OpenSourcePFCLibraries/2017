HA$PBExportHeader$pfc_n_cst_dwsrv_rowselection.sru
$PBExportComments$PFC DataWindow Row Selection service
forward
global type pfc_n_cst_dwsrv_rowselection from n_cst_dwsrv
end type
end forward

global type pfc_n_cst_dwsrv_rowselection from n_cst_dwsrv
event type integer pfc_clicked ( integer ai_xpos,  integer ai_ypos,  long al_row,  ref dwobject adwo_obj )
event pfc_lbuttondown ( unsignedlong aul_flags,  integer ai_xpos,  integer ai_ypos )
event pfc_lbuttonup ( unsignedlong aul_flags,  integer ai_xpos,  integer ai_ypos )
event pfc_rbuttonup ( integer ai_xpos,  integer ai_ypos,  long al_row,  dwobject adwo_obj )
event pfc_rbuttondown ( integer ai_xpos,  integer ai_ypos,  long al_row,  dwobject dwo_obj )
event type integer pfc_rowfocuschanged ( long al_row )
end type
global pfc_n_cst_dwsrv_rowselection pfc_n_cst_dwsrv_rowselection

type variables
Public:
//Style constants:
constant integer SINGLE =0
constant integer MULTIPLE =1
constant integer EXTENDED =2

Protected:
// Service Behavior.
integer	ii_style=0			

// Previous row and keys attributes.
long	il_prevclickedrow =0  	// Previous clickedrow.
long	il_currclickedrow =0	// Currently clickedrow.
long	il_prevrow=0	// Used to determine row deletions.
long	il_prevrowcount=0	// Used to determine row deletions.
boolean	ib_prevcntrl =False	// State of the CNTRL key at the time il_prevclickedrow was captured. 
boolean	ib_prevshift =False	// State of the SHIFT key at the time il_prevclickedrow was captured. 

// Keyboard (rowfocuschanged) support
boolean	ib_keyboard=True	// Should keyboard support be active.

// Current Anchor row.
long	il_anchorrow=0		

// Is the Left Button currently pressed?
boolean	ib_lbuttonpressed=False	

// Is the Right Button currently pressed?
boolean	ib_rbuttonpressed=False	

end variables

forward prototypes
public function long of_selectedcount (ref long al_selectedrows[])
public function integer of_invertselection ()
protected function integer of_rowselectsingle (long al_row)
protected function integer of_rowselectmulti (long al_row)
protected function integer of_rowselectext (long al_row, boolean ab_cntrlpressed, boolean ab_shiftpressed)
protected function integer of_buttonup ()
public function integer of_setstyle (integer ai_style)
public function integer of_GetStyle ()
public function integer of_rowselect (long al_row)
protected function integer of_keybrowselectext (long al_row, boolean ab_cntrlpressed, boolean ab_shiftpressed)
protected function integer of_keybrowselect (long al_row)
public function integer of_setkeyboard (boolean ab_switch)
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
public function boolean of_IsKeyboard ()
end prototypes

event pfc_clicked;call super::pfc_clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_clicked
//
//	Arguments:
//	ai_xpos:  	x position clicked
//	ai_ypos:  	y position clicked
//	al_row:  	row clicked
//	adwo_obj:  	DWobject clicked
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  Clicked behavior.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Added keyboard support.
// 6.0 	Took out check for "Detail" bandpointer to allow for keyboard support.
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

// Make sure request is valid.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then Return -1
If IsNull(adwo_obj) Then Return -1
If IsNull(al_row) or al_row <=0 Then Return -1

// Keep track of the currently clicked row.
il_currclickedrow = al_row

// Process clicked behavior depending on selection option
Return of_RowSelect(al_row)

end event

event pfc_lbuttondown;call n_cst_dwsrv::pfc_lbuttondown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_lbuttondown
//
//	(Arguments:
//	aul_flags: passed from lbuttondown event in pfc_u_dw
//	ai_xpos: x-position of the mouse passed from lbuttondown event in pfc_u_dw
// ai_ypos: y-position of the mouse passed from lbuttondown event in pfc_u_dw
//
//	(Returns:  None)
//
//	Description:  Process row-selection when left-mouse button is pressed
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

//Store in service that the Left Button is Pressed.
ib_lbuttonpressed = TRUE

// Clear other button.
ib_rbuttonpressed = FALSE
end event

event pfc_lbuttonup;call super::pfc_lbuttonup;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_lbuttonup
//
//	(Arguments:
//	aul_flags: passed from lbuttonup event in pfc_u_dw
//	ai_xpos: x-position of the mouse passed from lbuttondown event in pfc_u_dw
// ai_ypos: y-position of the mouse passed from lbuttondown event in pfc_u_dw
//
//	(Returns:  None)
//
//	Description:  Process row-selection when left-mouse button is released
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

// Store in service that the Left Button is no longer Pressed.
ib_lbuttonpressed = FALSE

// Clear other button.
ib_rbuttonpressed = FALSE

// Perform the Button Up processing.
of_ButtonUp()
end event

event pfc_rbuttonup;call super::pfc_rbuttonup;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_rbuttonup
//
//	(Arguments:
//	ai_xpos:  	x position clicked
//	ai_ypos:  	y position clicked
//	al_row:  	row clicked
//	adwo_obj:  	DWobject clicked
//
//	(Returns:  None)
//
//	Description:  Process row-selection when right-mouse button is released
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

// Store in service that the Button is no longer Pressed.
ib_rbuttonpressed = FALSE

// Clear other button.
ib_lbuttonpressed = FALSE

// Perform the Button Up processing.
of_ButtonUp()
end event

event pfc_rbuttondown;call super::pfc_rbuttondown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_rbuttondown
//
//	(Arguments:
//	ai_xpos:  	x position clicked
//	ai_ypos:  	y position clicked
//	al_row:  	row clicked
//	adwo_obj:  	DWobject clicked
//
//	(Returns:  None)
//
//	Description:  Process row-selection when right-mouse button is pressed
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

//Store in service that the Button is Pressed.
ib_rbuttonpressed = TRUE

// Clear other button.
ib_lbuttonpressed = FALSE

// Make sure request is valid.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then Return
If IsNull(al_row) or al_row <=0 Then Return

// Keep track of the currently clicked row.
il_currclickedrow = al_row

// Process behavior depending on selection option
of_RowSelect(al_row)

end event

event pfc_rowfocuschanged;call super::pfc_rowfocuschanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_rowfocuschanged
//
//	Arguments:
//	al_row:  	row clicked
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  Provide Keyboard support.  Prior to performing the keyboard 
//		processing; a) check that the rowfocuschange was not caused by a 
//		rowdeletion	or b) check if the required processing was already 
//		processed on the clicked action.
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

Integer	li_rc=1
boolean	lb_rowdeletion=False
boolean	lb_rowclicked=False

// Validate required reference.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then
	Return -1
End If

// Only perform when the keyboard support is active.
If ib_keyboard Then
	// Determine if this rowchange was caused by a RowDeletion operation.
	// (Note: al_row=1 is needed for dwSharing.)
	lb_rowdeletion = ((al_row = il_prevrow -1 Or al_row=1) And &
							idw_requestor.RowCount() = il_prevrowcount -1)

	// Determine if this rowchange was caused by a Clicked operation.
	lb_rowclicked = (il_currclickedrow = al_row)

	// Process row when not a rowdeletion or rowclicked operation.
	If (Not lb_rowdeletion) And (Not lb_rowclicked) Then
		// Process keyboard behavior depending on selection option
		li_rc = of_KeybRowSelect(al_row)
	End If
End If

// Reset the currently Clicked row.
il_currclickedrow = 0

// Keep track of the previous row and previous rowcount to catch for 
// RowDeletion operations.
il_prevrow = al_row
il_prevrowcount = idw_requestor.RowCount()

Return li_rc
end event

public function long of_selectedcount (ref long al_selectedrows[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SelectedCount
//
//	Access:  		Public
//
//	Arguments:  	none
//
//	Returns:  		Long
//						The number of selected rows in the datawindow.
//						-1 if an error occurs
//
//	Description:  	Count selected rows.
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
long	ll_selected=0
long	ll_counter=0

//Check for any requirements.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then Return -1

//Loop and count the number of selected rows.
DO
	ll_selected = idw_requestor.GetSelectedRow ( ll_selected )
	IF ll_selected > 0 THEN
		ll_counter++
		al_selectedrows[ll_counter] = ll_selected
	END IF
LOOP WHILE ll_selected > 0

Return ll_counter

end function

public function integer of_invertselection ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_InvertSelection
//
//	Access:    Public
//
//	Arguments: None
//
//	Returns:   Integer
//
//	Description:  Reverses the selection (highlight) on all rows
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
long	ll_max
long	ll_i

// Validate the datawindow reference.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then Return -1

// Get the row count.
ll_max = idw_requestor.RowCount ( ) 

// Prevent flickering and improve performance.
idw_requestor.SetReDraw ( FALSE ) 

// Invert row by row.
FOR ll_i = 1 to ll_max
	idw_requestor.SelectRow ( ll_i, NOT (idw_requestor.IsSelected(ll_i)) ) 
NEXT 

// Prevent flickering and improve performance.
idw_requestor.SetReDraw ( TRUE ) 

Return 1


end function

protected function integer of_rowselectsingle (long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_RowSelectSingle
//
//	Access:   	Protected
//
//	Arguments: 	Long
// al_row  		The clicked row, passed from pfc_u_dw's Clicked event argument
//
//	Returns:   	Integer
//					1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  Selects the clicked row and de-selects any previously
//					  selected rows.
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

// Check arguments.
If IsNull(al_row) or al_row <0 Then
	Return -1
End If

// Deselect all rows.
idw_Requestor.SelectRow ( 0, FALSE ) 

// Select the one row.
idw_Requestor.SelectRow ( al_row, TRUE ) 

// Set the one row as the current row.
If idw_Requestor.GetRow() <> al_row Then
	idw_Requestor.SetRow ( al_row ) 
End If

Return 1



end function

protected function integer of_rowselectmulti (long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_RowSelectMulti
//
//	Access:    	Protected
//
//	Arguments: 	Long
//   al_row   	The clicked row, passed from pfc_u_dw's Clicked event argument
//
//	Returns:   	Integer
//					1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  Selects/De-Selects the clicked row depending on its present
//					  state.  Does not de-select previously selected rows.
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

// Check arguments.
If IsNull(al_row) or al_row <0 Then
	Return -1
End If

// Select or Deselect the row.
idw_Requestor.SelectRow ( al_row,  NOT (idw_Requestor.IsSelected(al_row)) ) 

// Make the row the current row.
If idw_Requestor.GetRow() <> al_row Then
	idw_Requestor.SetRow ( al_row ) 
End If

Return 1


end function

protected function integer of_rowselectext (long al_row, boolean ab_cntrlpressed, boolean ab_shiftpressed);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_RowSelectExt
//
//	Access:    	Protected
//
//	Arguments:
//	al_row				The row on which some action is required.
//	ab_cntrlpressed	Flag stating if the CNTRL key is pressed.
//	ab_shiftpressed	Flag stating if the SHIFT key is pressed.
//
//	Returns:  		Integer
//
//	Description:  Performs specific Extended select processing on a row.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 12.5  Use variable of type long for row number to prevent infinite loop
//       when extended row selection is used in a DW containing > 32,767 rows.
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

long     ll_i
boolean	lb_waitforbuttonup=False
boolean	lb_takenoaction=False

// Check arguments.
If IsNull(al_row) or al_row <0 Then
	Return -1
End If

// @@
// n_cst_conversion lc
// gnv_app.inv_debug.of_Message(	'Row='+string(al_row)+ &
//										'* Ctrl='+lc.of_String(ab_cntrlpressed) + &
//										'* Shift='+lc.of_String(ab_shiftpressed) + &
//										'* lbutton = '+lc.of_String(ib_lbuttonpressed)+ &
//										'* rbutton = '+lc.of_String(ib_rbuttonpressed))

//////////////////////////////////////////////////////////////////////////////
// On the first part of the 'IF' statement:
// 	If the LEFTBUTTON is pressed, the CNTRL key down, and the SHIFT is up - Then
//		according to Win95 the processing will be performed (by this same function)
//		when the Button is released.	
//	On the second part of the 'IF' statement:
// 	If the BUTTON is pressed, the CNTRL key down, and the SHIFT is up - Then
//		according to Win95 the processing will be performed (by this same function)
//		when the Button is released.	
//////////////////////////////////////////////////////////////////////////////
If ((ib_lbuttonpressed or ib_rbuttonpressed) And ab_cntrlpressed And ab_shiftpressed=False) Or &
	(idw_requestor.IsSelected(al_row) And ib_lbuttonpressed And &
	ab_cntrlpressed=False And ab_shiftpressed=False)  Then
	// Wait for the button up to process click.
	lb_waitforbuttonup = True
ElseIf idw_requestor.IsSelected(al_row) And ib_rbuttonpressed And &
	ab_cntrlpressed=False And ab_shiftpressed=False  Then
	// Right Clicking on an already Highlighted row requires a No Action process.
	lb_takenoaction = True
End If

If lb_waitforbuttonup Then
	// Handle processing when the Button is released.
	il_prevclickedrow  = al_row
	ib_prevcntrl = ab_cntrlpressed
	ib_prevshift = ab_shiftpressed
	// gnv_app.inv_debug.of_Message(	'Wait for button up process.')	
	Return 1
End If

// There is no Previous row information.
il_prevclickedrow  = 0
ib_prevcntrl = False
ib_prevshift = False

If lb_takenoaction Then
	// Take the No Action Process.
	// @@
	// gnv_app.inv_debug.of_Message(	'No Action process.')
	Return 1
End If

//////////////////////////////////////////////////////////////////////////////
// Perform now.  This is either:
//		1) Processing that does not wait for the Left Button to be released.
//		or
//		2) Processing which waited for the Left Button to be released.
//			The lbuttonup event then called this function with the following
//			variables: (il_prevclickedrow, il_prevcntrl, il_prevshift)
//////////////////////////////////////////////////////////////////////////////

If ab_cntrlpressed And ab_shiftpressed=False Then
	// Select or De-Select (as appropriate) the current row.
	idw_requestor.SelectRow ( al_row, Not idw_requestor.IsSelected(al_row) ) 

	// Store new Anchor Row.
	il_anchorrow = al_row

ElseIf ab_cntrlpressed Or ab_shiftpressed Then

	/* Note: The valid combinations here are:											*/
	/*					ab_cntrlpressed=True  and ab_shiftpressed=True				*/
	/*					ab_cntrlpressed=False and ab_shiftpressed=True				*/
	/*					ab_cntrlpressed=True  and ab_shiftpressed=False	+++++++	*/	
	/*		+++++++ Because of the "If" prior to this "ElseIf", it is 			*/
	/* 	impossible for ab_cntrlpressed=True and ab_shiftpressed=False.		*/
	
	If ab_cntrlpressed=False Then
		//Clear all previously selected rows.	
		idw_requestor.SelectRow (0, false)	
	End If
	
	// If there is no anchor row, then only select the row that was clicked.
	If il_anchorrow	= 0 Then
		idw_requestor.SelectRow ( al_row, TRUE )
	Else
		// Prevent flickering.  Improve performance.
		idw_requestor.SetReDraw ( FALSE ) 

		// Select all rows in between anchor row and current row */
		If il_anchorrow > al_row Then
			FOR ll_i = il_anchorrow to al_row STEP -1
				idw_requestor.SelectRow ( ll_i, TRUE )	
			NEXT
		Else
			FOR ll_i = il_anchorrow to al_row
				idw_requestor.SelectRow ( ll_i, TRUE )	
			NEXT 
		END If 

		// Prevent flickering.  Improve performance.
		idw_requestor.SetReDraw ( TRUE ) 
	END If
	
Else
	// Unselect all previous rows (if any) and select the current row.
	of_RowSelectSingle (al_row)

	// Store new Anchor Row.
	il_anchorrow = al_row
	
End If
	
// Make the row the current row.
If idw_Requestor.GetRow() <> al_row Then
	idw_Requestor.SetRow ( al_row ) 
End If	
		
Return 1
end function

protected function integer of_buttonup ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_ButtonUp
//
//	Access:    		Protected
//
//	Arguments: 		None
//
//	Returns:   		Integer 
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description: 	Perform the Button Up processing.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Use of constants within services.
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

integer li_rc = 1

// Make sure request is valid.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then Return -1

// Process clicked behavior depending on selection option
CHOOSE CASE ii_style
	CASE SINGLE 
		// No Action.

	CASE MULTIPLE 
		// No Action

	CASE EXTENDED 
		// Win 95 style of processing Control-clicks on Extended Selections.
		If il_prevclickedrow > 0 Then
			li_rc = of_RowSelectExt ( il_prevclickedrow ,ib_prevcntrl, ib_prevshift)
		End If		
END CHOOSE

// There is no Previous row information.
il_prevclickedrow  = 0
ib_prevcntrl = False
ib_prevshift = False

Return li_rc
end function

public function integer of_setstyle (integer ai_style);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetStyle
//
//	Access:    		Public
//
//	Arguments:
//	ai_selectoption   The style of row selection desired.
//							Values are: 
//								  0 = Single row selection
//								  1 = Multiple row selection
//								  2 = Extended row selection capabilities
//
//	Returns:  		Integer
//	 					 1 = success
//   					-1 = The selection style requested is not available
//
//	Description:  	Set an indicator in this service for the desired 
//					  	row selection style. 
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Use of constants within services.
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

//Check arguments
IF IsNull(ai_style) THEN
	Return -1
END IF

CHOOSE CASE ai_style
	CASE SINGLE, MULTIPLE, EXTENDED
		ii_style = ai_style
		Return 1
END CHOOSE

Return -1 

end function

public function integer of_GetStyle ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_GetStyle
//
//	Access:    	Public
//
//	Arguments: 	None
//
//	Returns:   	Integer 
//   				0 = Single row selection is enabled.
//				   1 = Multiple row selection is enabled.
// 				2 = Extended row selection is enabled.
//
//	Description:  To determine the type of row selection option that is set
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

Return ii_style
end function

public function integer of_rowselect (long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RowSelect
//
//	Access:    		public
//
//	Arguments:
//	al_row			The row on which some action is required.
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  Calls the appropriate specific select processing on a row.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Use of constants within services.
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

integer	li_rc=-1

CHOOSE CASE ii_style
	CASE SINGLE 
		li_rc = of_RowSelectSingle ( al_row )

	CASE MULTIPLE 
		li_rc = of_RowSelectMulti ( al_row ) 

	CASE EXTENDED 
		li_rc = of_RowSelectExt (al_row, KeyDown(KeyControl!), Keydown(KeyShift!)) 
END CHOOSE
	
Return li_rc
end function

protected function integer of_keybrowselectext (long al_row, boolean ab_cntrlpressed, boolean ab_shiftpressed);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_KeybRowSelectExt
//
//	Access:    	Protected
//
//	Arguments:
//	al_row				The row on which some action is required.
//	ab_cntrlpressed	Flag stating if the CNTRL key is pressed.
//	ab_shiftpressed	Flag stating if the SHIFT key is pressed.
//
//	Returns:  		Integer
//
//	Description:  Performs specific KeyBoard driven Extended select processing
//		on a row.
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

integer	li_i

// Check arguments.
If IsNull(al_row) or al_row <=0 Then
	Return -1
End If

// There is no Previous row information.
il_prevclickedrow  = 0
ib_prevcntrl = False
ib_prevshift = False

If ab_shiftpressed Then

	//Clear all previously selected rows.	
	idw_requestor.SelectRow (0, false)	
	
	// If there is no anchor row, then only select the row that was clicked.
	If il_anchorrow	= 0 Then
		idw_requestor.SelectRow ( al_row, TRUE )
	Else
		// Prevent flickering.  Improve performance.
		idw_requestor.SetReDraw ( FALSE ) 

		// Select all rows in between anchor row and current row */
		If il_anchorrow > al_row Then
			FOR li_i = il_anchorrow to al_row STEP -1
				idw_requestor.SelectRow ( li_i, TRUE )	
			NEXT
		Else
			FOR li_i = il_anchorrow to al_row
				idw_requestor.SelectRow ( li_i, TRUE )	
			NEXT 
		END If 

		// Prevent flickering.  Improve performance. ?
		idw_requestor.SetReDraw ( TRUE ) 
	END If

ElseIf ab_cntrlpressed Then
	// No action desired. Just let RowFocusIndicator show current row.
	
Else
	// Unselect all previous rows (if any) and select the current row.
	of_RowSelectSingle (al_row)

	// Store new Anchor Row.
	il_anchorrow = al_row
	
End If
	
// Make the row the current row.
If idw_Requestor.GetRow() <> al_row Then
	idw_Requestor.SetRow ( al_row ) 
End If	
		
Return 1
end function

protected function integer of_keybrowselect (long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_KeybRowSelect
//
//	Access:    		protected
//
//	Arguments:
//	al_row			The row on which some action is required.
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  Calls the appropriate specific select processing on a row.
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

integer	li_rc=-1

CHOOSE CASE ii_style
	CASE SINGLE 
		li_rc = of_RowSelectSingle ( al_row )

	CASE MULTIPLE 
		// No Action.

	CASE EXTENDED 
		li_rc = of_KeyBRowSelectExt (al_row, Keydown(KeyControl!), Keydown(KeyShift!)) 
END CHOOSE
	
Return li_rc
end function

public function integer of_setkeyboard (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetKeyboard
//
//	Access:    		Public
//
//	Arguments:
//	ab_switch   	Should keyboard (rowfocuschanged) support be active.
//
//	Returns:  		Integer
//	 					 1 = success
//   					-1 = error
//
//	Description:  	Should keyboard (rowfocuschanged) support be active.
//		*Note: This can be used to disable the keyboard behavior for special cases.
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

//Check arguments
IF IsNull(ab_switch) THEN
	Return -1
END IF

ib_keyboard = ab_switch
Return 1 

end function

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
//	 Gets the Service Information.
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
anv_infoattrib.is_name = 'Row Selection'
anv_infoattrib.is_description = &
	'Provides the datawindow with either Singlerow selection, '+&
	'Multirow selection, or Extendedrow selection.' 

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

// Set the rest of the attributes.
anv_attrib.is_propertypage = {'u_tabpg_dwproperty_srvrowselection'}
anv_attrib.ib_switchbuttons = True

Return 1
end function

public function boolean of_IsKeyboard ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsKeyboard
//
//	Access:    		Public
//
//	Arguments:		None
//
//	Returns:  		Boolean
//	 					True if the keyboard (rowfocuschanged) support is active.
//
//	Description:  	Reports if the keyboard (rowfocuschanged) support is active.
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

Return ib_keyboard

end function

on pfc_n_cst_dwsrv_rowselection.create
call super::create
end on

on pfc_n_cst_dwsrv_rowselection.destroy
call super::destroy
end on


HA$PBExportHeader$pfcscanner_u_dw.sru
$PBExportComments$Datawindow Object used on scanner dialogs
forward
global type pfcscanner_u_dw from datawindow
end type
end forward

global type pfcscanner_u_dw from datawindow
int Width=494
int Height=361
int TabOrder=1
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
event lbuttonup pbm_lbuttonup
event lbuttondown pbm_lbuttondown
event rbuttonup pbm_rbuttonup
end type
global pfcscanner_u_dw pfcscanner_u_dw

type variables
string is_sortcolumn = ''
string is_sortorder = ''

boolean ib_rbuttonpressed,ib_lbuttonpressed
long il_prevclickedrow,il_anchorrow
boolean ib_prevcntrl,ib_prevshift
boolean ib_extended = false
end variables

forward prototypes
public function integer of_sort (dwobject a_dwo)
public function integer of_buttonup ()
public function integer of_rowselectext (long al_row, boolean ab_cntrlpressed, boolean ab_shiftpressed)
end prototypes

event lbuttonup;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  lbuttonup
//
//	(Arguments:
//	flags: 
//	xpos: x-position of the mouse
// 	ypos: y-position of the mouse
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
 *
 * http://www.gnu.org/copyleft/lesser.html
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

event lbuttondown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  lbuttondown
//
//	(Arguments:
//	flags: 
//	xpos: x-position of the mouse 
// 	ypos: y-position of the mouse 
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
 *
 * http://www.gnu.org/copyleft/lesser.html
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

event rbuttonup;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  rbuttonup
//
//	(Arguments:
//	xpos:  	x position clicked
//	ypos:  	y position clicked
//	row:  	row clicked
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
 *
 * http://www.gnu.org/copyleft/lesser.html
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

public function integer of_sort (dwobject a_dwo);string ls_colname,ls_sortstring,ls_headername
integer li_headerlen,li_suffixlen = 2,li_rc

// Only valid on header column.
If a_dwo.Name = 'datawindow' THEN Return 0
IF a_dwo.Band <> "header" THEN Return 0

// Get column header information.
ls_headername = a_dwo.name
li_headerlen = Len(ls_headername)

// Extract the columname from the header label 
// (by taking out the header suffix).
IF Right(ls_headername, li_suffixlen) <> '_t' THEN 
	// Cannot determine the column name from the header.	
	Return -1
END IF 	
ls_colname = Left (ls_headername, li_headerlen - li_suffixlen)

// Validate the column name.
If IsNull(ls_colname) or Len(Trim(ls_colname))=0 Then 
	Return -1
End If

// Check the previous sort click.
IF is_sortcolumn = ls_colname THEN	
	// Second sort click on the same column, reverse sort order.
	IF is_sortorder = " A" THEN 	
		is_sortorder = " D"
	ELSE
		is_sortorder = " A"
	END IF 
ELSE
	// Clicked on a different column.
	is_sortcolumn = ls_colname
	is_sortorder = " A" 
END IF 

// Build the sort string.
ls_sortstring = is_sortcolumn + is_sortorder

// Perform the SetSort operation (check the rc).
li_rc = SetSort (ls_sortstring) 
If li_rc < 0 Then Return li_rc

// Perform the actual Sort operation (check the rc).
li_rc = Sort()
If li_rc < 0 Then Return li_rc	
	
Return 1


end function

public function integer of_buttonup ();//////////////////////////////////////////////////////////////////////////////
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
 *
 * http://www.gnu.org/copyleft/lesser.html
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


// Extended Select Option
// Win 95 style of processing Control-clicks on Extended Selections.
If il_prevclickedrow > 0 Then
	li_rc = of_RowSelectExt ( il_prevclickedrow ,ib_prevcntrl, ib_prevshift)
End If		

// There is no Previous row information.
il_prevclickedrow  = 0
ib_prevcntrl = False
ib_prevshift = False

Return li_rc

end function

public function integer of_rowselectext (long al_row, boolean ab_cntrlpressed, boolean ab_shiftpressed);//////////////////////////////////////////////////////////////////////////////
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
 *
 * http://www.gnu.org/copyleft/lesser.html
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
	(this.IsSelected(al_row) And ib_lbuttonpressed And &
	ab_cntrlpressed=False And ab_shiftpressed=False)  Then
	// Wait for the button up to process click.
	lb_waitforbuttonup = True
ElseIf this.IsSelected(al_row) And ib_rbuttonpressed And &
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
	this.SelectRow ( al_row, Not this.IsSelected(al_row) ) 

	// Store new Anchor Row.
	il_anchorrow = al_row

ElseIf ab_cntrlpressed Or ab_shiftpressed Then

/* Note: The valid cobinations here are:											*/
/*					ab_cntrlpressed=True  and ab_shiftpressed=True				*/
/*					ab_cntrlpressed=False and ab_shiftpressed=True				*/
/*					ab_cntrlpressed=True  and ab_shiftpressed=False	+++++++	*/	
/*		+++++++ Because of the "If" prior to this "ElseIf", it is 			*/
/* 	impossible for ab_cntrlpressed=True and ab_shiftpressed=False.		*/

	If ab_cntrlpressed=False Then
		//Clear all previously selected rows.	
		this.SelectRow (0, false)	
	End If

	// If there is no anchor row, then only select the row that was clicked.
	If il_anchorrow	= 0 Then
		this.SelectRow ( al_row, TRUE )
	Else
		// Prevent flickering.  Improve performance.
		this.SetReDraw ( FALSE ) 

		// Select all rows in between anchor row and current row */
		If il_anchorrow > al_row Then
			FOR li_i = il_anchorrow to al_row STEP -1
				this.SelectRow ( li_i, TRUE )	
			NEXT
		Else
			FOR li_i = il_anchorrow to al_row
				this.SelectRow ( li_i, TRUE )	
			NEXT 
		END If 

		// Prevent flickering.  Improve performance.
		this.SetReDraw ( TRUE ) 
	END If

Else
	// Unselect all previous rows (if any) and select the current row.
	// Deselect all rows.
	this.SelectRow ( 0, FALSE ) 

	// Select the one row.
	this.SelectRow ( al_row, TRUE ) 

	// Store new Anchor Row.
	il_anchorrow = al_row

End If

// Make the row the current row.
If this.GetRow() <> al_row Then
	this.SetRow ( al_row ) 
End If	

Return 1

end function

event clicked;// Validate the dwo reference.
IF IsNull(dwo) OR NOT IsValid(dwo) THEN	 
	Return -1
END IF 

of_sort(dwo)
If IsNull(row) or row <=0 Then Return -1
If Left (GetBandAtPointer(), 6) <> "detail" Then Return -1

// Process clicked behavior depending on selection option
if ib_extended then
	Return  of_RowSelectExt (row, KeyDown(KeyControl!), Keydown(KeyShift!)) 
else
	// Deselect all rows.
	this.SelectRow ( 0, FALSE ) 

	// Select the one row.
	this.SelectRow ( row, TRUE ) 
end if


end event

event rbuttondown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  rbuttondown
//
//	(Arguments:
//	xpos:  	x position clicked
//	ypos:  	y position clicked
//	row:  	row clicked
//	dwo:	Object clicked 
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
 *
 * http://www.gnu.org/copyleft/lesser.html
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
If IsNull(row) or row <=0 Then Return

// Process behavior depending on selection option
of_RowSelectExt (row, KeyDown(KeyControl!), Keydown(KeyShift!)) 


end event


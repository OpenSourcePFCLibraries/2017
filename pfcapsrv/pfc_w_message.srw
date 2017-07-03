HA$PBExportHeader$pfc_w_message.srw
$PBExportComments$PFC Message Box window
forward
global type pfc_w_message from w_response
end type
type gb_userinput from u_gb within pfc_w_message
end type
type mle_userinput from u_mle within pfc_w_message
end type
type st_userinput from u_st within pfc_w_message
end type
type cb_1 from u_cb within pfc_w_message
end type
type cb_2 from u_cb within pfc_w_message
end type
type cb_3 from u_cb within pfc_w_message
end type
type cb_print from u_cb within pfc_w_message
end type
type cb_userinput from u_cb within pfc_w_message
end type
type mle_message from u_mle within pfc_w_message
end type
type lv_bmp from u_lv within pfc_w_message
end type
end forward

global type pfc_w_message from w_response
integer x = 0
integer y = 804
integer width = 2702
integer height = 1072
boolean controlmenu = false
long backcolor = 80263328
toolbaralignment toolbaralignment = alignatleft!
event pfc_userinput ( )
gb_userinput gb_userinput
mle_userinput mle_userinput
st_userinput st_userinput
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_print cb_print
cb_userinput cb_userinput
mle_message mle_message
lv_bmp lv_bmp
end type
global pfc_w_message pfc_w_message

type variables
Protected:

// The original size of the window - To be used for the UserInput process.
integer		ii_winwidth
integer		ii_winheight

// Default value for the Width difference for the User Input process.
integer		ii_winwidthdelta=500

// The button clicked by the user.
integer		ii_buttonclicked

// Default value for the max number of lines in the Message portion. 
// (used for sizing and not the actual number of lines displayed)
Integer 		ii_maxlines=9

// Default value for the number of chars per line in the Message portion.
Integer 		ii_maxlinelen=60

// Default value for the number of chars to replace a tab character.
Integer		ii_tabchars=5

// Default value for the number of units each char takes.
Integer		ii_charwidth=33
Integer		ii_lineheight=65

n_cst_errorattrib	inv_errorattrib

end variables

forward prototypes
protected function integer of_paintinitialwindow ()
protected function integer of_updatefontsize ()
end prototypes

event pfc_userinput;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_userinput
//
//	(Arguments:		None) 
//
//	(Returns:  		None)
//
//	Description:	Will enlarge the window to get user input. 
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

constant Integer SEPARATOR = 50

// Make the UserInput controls visible.
gb_userinput.Visible = True
st_userinput.Visible = True
mle_userinput.Visible = True

// Resize window to make the User Input field available.
this.Height = mle_userinput.Y + mle_userinput.Height + 100 + SEPARATOR

// Set focus on the User Input field.
SetFocus(mle_userinput)



end event

protected function integer of_paintinitialwindow ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_PaintInitialWindow
//
//	Access:  		protected
//
//	Arguments:		(none)
//
//	Returns:  		integer
//						1 if it succeeds and -1 if it fails.
//	
//	Description:	Test for the validity of the SQLspy service.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Corrected code to determine longest text line.
// 5.0.02 Handle multiple font sizes.
// 5.0.02 Prevent the upper/left window coordinates from opening outside 
// 	the screen.
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

Integer	li_titlelen=0
Integer	li_textlen=0
Integer	li_longestlen=0
Integer	li_startpoint=1

constant Integer SEPARATOR =50
Integer 	li_msglinelength
Integer	li_widthmidpoint
Integer	li_msglinecount
Integer	li_msgline
Integer	li_tabcharlen
Integer	li_x, li_y
Long 		ll_counttabs, ll_pos
String 	ls_textline
Window	lw_parent
Constant String TAB='~t'

// Handle multiple font sizes.
of_UpdateFontSize()

// Get the Message Title Length (li_titlelen).
If Not IsNull(this.Title) Then
	li_titlelen = Len(this.Title)
End If

// Get the number of lines on the Message Text
li_msglinecount = mle_message.LineCount()

// Get the longest Message Text Line Length (li_textlen). 
li_tabcharlen = Len(TAB)
For li_msgline = 1 to li_msglinecount
	// Set the starting position on the next line,
	// loop until the cursor is confirmed on the next line.
	mle_message.SelectText(li_startpoint, 0)	
	Do While mle_message.selectedline() < li_msgline
		li_startpoint++
		mle_message.SelectText(li_startpoint, 0)
	LOOP
	
	// Get the text on the Current Line.
	ls_textline = mle_message.TextLine()

	// Set the starting point to the end of the current line or start of next line..
	li_startpoint += Len(ls_textline) + 1

	// Determine the number of occurrences of the Tab Character.
	ll_counttabs = 0
	ll_Pos = Pos(ls_textline, TAB)
	Do While ll_Pos > 0
		ll_counttabs ++
		ll_Pos = Pos(ls_textline, TAB, (ll_Pos + li_tabcharlen))
	Loop

	// Keep only the longest line length.
	li_msglinelength = mle_message.LineLength()+ (ll_counttabs * ii_tabchars)
	If li_msglinelength > li_textlen Then
		li_textlen = li_msglinelength
	End If
Next

// Keep the longest of the Title or Message length.
If li_titlelen > li_textlen Then
	li_longestlen = li_titlelen
Else
	li_longestlen = li_textlen
End If

// If at least one of the RightSide buttons are visible,
// prevent the window from width getting too small.
If (cb_print.Visible Or cb_userinput.Visible) Then
	If li_longestlen < 25 Then
		li_longestlen = 25
	End If
End If

// Depending on the number of BottomSide buttons visible,
// prevent the window width from getting too small.
If cb_1.Visible And cb_2.Visible=False And cb_3.Visible=False Then
	If li_longestlen < 10 Then
		li_longestlen = 10
	End If
ElseIf cb_1.Visible And cb_2.Visible And cb_3.Visible=False Then
	If li_longestlen < 20 Then
		li_longestlen = 20
	End If
Else
	If li_longestlen < 30 Then
		li_longestlen = 30
	End If
End If

// Set the appropriate attributes for the Message MLE.
If li_msglinecount > ii_maxlines Then 
	mle_message.VScrollbar = True
	li_longestlen += 4
End If

// According to the text inside the Message Text, 
// resize the Message control.  (Check for predefined min/max)
If li_msglinecount < 2 Then
	// Prevent BottomSide control from moving up too much.
	li_msglinecount = 2
End If
If li_longestlen > ii_maxlinelen Then
	// Prevent the width from going over the set max.
	li_longestlen = ii_maxlinelen
End If
If li_msglinecount > ii_maxlines Then
	// Prevent the Height from going over the set max.	
	li_msglinecount = ii_maxlines
End If
mle_message.Resize(li_longestlen * ii_charwidth + 50, &
						 li_msglinecount * ii_lineheight)

// Move the Right Hand buttons just to the right of the 
// Message.
cb_print.X = mle_message.X + mle_message.Width + SEPARATOR
cb_userinput.X = mle_message.X + mle_message.Width + SEPARATOR

// Set the width of the window according to the size of
// the Message and the RightSide buttons.
If (cb_print.Visible=False And cb_userinput.Visible=False) Then
	This.Width = mle_message.X + mle_message.Width + SEPARATOR + 30
Else
	This.Width = mle_message.X + mle_message.Width + cb_print.Width + (SEPARATOR *2) + 30
End If

// Move the BottomSide Buttons right under the Message.
cb_1.Y = mle_message.Y + mle_message.Height + SEPARATOR
cb_2.Y = mle_message.Y + mle_message.Height + SEPARATOR
cb_3.Y = mle_message.Y + mle_message.Height + SEPARATOR

// Center the BottomSide Buttton(s).  (if visible, offset some 
//	for the print and userinput buttons.)
If (cb_print.Visible Or cb_userinput.Visible) Then
	li_widthmidpoint = (This.Width - cb_print.Width  ) / 2
Else
	li_widthmidpoint = This.Width / 2
End If
If cb_1.Visible And cb_2.Visible=False And cb_3.Visible=False Then
	cb_1.x = li_widthmidpoint - (cb_1.Width / 2)
ElseIf cb_1.Visible And cb_2.Visible And cb_3.Visible=False Then
	cb_1.x = li_widthmidpoint - (cb_1.Width +20)
	cb_2.x = li_widthmidpoint +20
Else
	cb_1.x = li_widthmidpoint - ((cb_1.Width +20) + (cb_1.width/2))
	cb_2.x = li_widthmidpoint - (cb_2.width/2)
	cb_3.x = li_widthmidpoint + (cb_3.width/2 +20)
End If

// Move, Resize, Hide the UserInput controls.
gb_userinput.Move (mle_message.X, &
						 mle_message.Y + mle_message.Height + cb_1.Height + SEPARATOR)
gb_userinput.Width = mle_message.Width						 
gb_userinput.Visible = False						 
st_userinput.Move (mle_message.X, &
						 gb_userinput.Y + gb_userinput.Height + SEPARATOR)
st_userinput.Visible = False						 
mle_userinput.Move(mle_message.X, &
						 st_userinput.Y + st_userinput.Height + 5)
mle_userinput.Width = mle_message.Width
mle_userinput.Visible = False

// Adjust the Height of the window to hide the User Input space.
This.Height = cb_1.Y + cb_1.Height + 100 + SEPARATOR

// Center the window on the Parent window.
lw_parent = ParentWindow()
If IsValid (lw_parent) Then
	li_x = lw_parent.x + lw_parent.width/2  - This.width/2 - 100
	If li_x < 0 Then li_x = 0
	li_y = lw_parent.y + lw_parent.height/2 - This.height/2 - 100
	If li_y < 0 Then li_y = 0	
	This.Move(li_x, li_y)
End If

Return 1
end function

protected function integer of_updatefontsize ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UpdateFontSize
//
//	Access:  		protected
//
//	Arguments:		(none)
//
//	Returns:  		integer
//						1 if it succeeds and -1 if it fails.
//	
//	Description:	Handle multiple font sizes.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0.02   Initial version
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

Integer 	li_rc=1
Integer	li_Height
Integer	li_Width
Integer	li_FontSize
String	ls_FontFace
boolean	lb_bold
window	lw_this
n_cst_platform lnv_Platform

// Create the Platform-Specific Functions Service.
If f_SetPlatform(lnv_Platform, True) < 0 Then Return -1

// Get information required to determine the character size.
lw_this = this
lb_bold = (mle_message.Weight = 700)
li_FontSize = Abs(mle_message.TextSize)
ls_FontFace = mle_message.FaceName

// Get the font size and handle multiple font sizes.
If lnv_Platform.of_gettextsize(lw_this, "X", ls_FontFace, &
										li_FontSize, lb_bold, mle_message.Italic, &
										mle_message.Underline, li_height, li_width) > 0 Then 
										
	// If appropriate, update the character width value.
	If li_width >= 14 Then
		ii_charwidth *= 2.1		
	ElseIf li_width >= 13 Then
		ii_charwidth *= 1.7		
	ElseIf li_width >= 11 Then
		ii_charwidth *= 1.3		
	ElseIf li_width >= 10 Then
		ii_charwidth *= 1.1				
	End If			

	// If appropriate, update the line length value.
	If li_height >= 25 Then
		ii_lineheight *= 1.9	
	ElseIf li_height >= 22 Then
		ii_lineheight *= 1.7		
	ElseIf li_height >= 20 Then
		ii_lineheight *= 1.3		
	ElseIf li_height >= 16 Then
		ii_lineheight *= 1.1				
	End If		
Else
	// Set up an Error return value.
	li_rc = -1
End If	

// Destroy the Platform-Specific Functions Service.
If f_SetPlatform(lnv_Platform, False) < 0 Then Return -1

Return li_rc
end function

event pfc_close;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_close
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Return the instance structure.
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

closewithreturn(this, inv_errorattrib)

end event

on pfc_w_message.create
int iCurrent
call super::create
this.gb_userinput=create gb_userinput
this.mle_userinput=create mle_userinput
this.st_userinput=create st_userinput
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_print=create cb_print
this.cb_userinput=create cb_userinput
this.mle_message=create mle_message
this.lv_bmp=create lv_bmp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_userinput
this.Control[iCurrent+2]=this.mle_userinput
this.Control[iCurrent+3]=this.st_userinput
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.cb_3
this.Control[iCurrent+7]=this.cb_print
this.Control[iCurrent+8]=this.cb_userinput
this.Control[iCurrent+9]=this.mle_message
this.Control[iCurrent+10]=this.lv_bmp
end on

on pfc_w_message.destroy
call super::destroy
destroy(this.gb_userinput)
destroy(this.mle_userinput)
destroy(this.st_userinput)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_print)
destroy(this.cb_userinput)
destroy(this.mle_message)
destroy(this.lv_bmp)
end on

event pfc_cancel;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_Cancel
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	
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

// The window is being closed via a Cancel operation.
inv_errorattrib.ii_rc = 0

// No button was pressed.
inv_errorattrib.ii_buttonclicked = 0

// Close the window.
CloseWithReturn(This, inv_errorattrib)

end event

event timer;call w_response::timer;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_timer
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	After the specified time, Automatically close this window.
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

// The window is being by the timeout attribute.
inv_errorattrib.ii_rc = 1

// Store the default button that was passed in.
inv_errorattrib.ii_buttonclicked = inv_errorattrib.ii_default

// Store any User Input information
inv_errorattrib.is_usertext = mle_userinput.text

// Close the window.
CloseWithReturn(This, inv_errorattrib)
end event

event pfc_default;call w_response::pfc_default;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_default
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	The user has clicked one of the three main buttons to 
//						close this window.
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

// The window is being closed by one of the expected means.
inv_errorattrib.ii_rc = 1

// Store the button that was pressed.
inv_errorattrib.ii_buttonclicked = ii_buttonclicked

// Store any User Input information
inv_errorattrib.is_usertext = mle_userinput.text

// Close the window.
CloseWithReturn(This, inv_errorattrib)

end event

event pfc_print;call w_response::pfc_print;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_print
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Print the message.
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
Integer 	li_rc
n_ds		lds_printmessage

// Create the print datastore.
lds_printmessage = Create n_ds
lds_printmessage.DataObject = 'd_messageprint'

// Insert one row.
li_rc = lds_printmessage.InsertRow(0)

// Populate the row with the on-screen information.
li_rc = lds_printmessage.SetItem(1, 'title', this.Title)
li_rc = lds_printmessage.SetItem(1, 'message', mle_message.Text)
li_rc = lds_printmessage.SetItem(1, 'comments', mle_userinput.Text)

// Print the information
li_rc = lds_printmessage.Print()

return 1

end event

event open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			open
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Open the window with the appropriate information.
//						Call the function to Size and Move controls around to
//						match the window information.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0		Initial version
//	5.0.02	Move Picture Icon to left past the window border.
//	5.0.03	Code formerly in pfc_preopen event
// 5.0.04	Correct Tab Order and added focus to default button.
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

Integer			li_rc
Integer			li_index
Integer			li_bmp
ListViewItem	llvi_item

//Get the PowerObjectParm.
inv_errorattrib = Message.powerobjectparm

// Allow window to close without the CloseQuery checks being performed.
ib_disableclosequery = True

// Set the titlebar.
This.title = inv_errorattrib.is_title

// Set the Message MLE.
mle_message.Text =  inv_errorattrib.is_text

// As requested, set the Picture Icon.
Choose Case inv_errorattrib.ie_icon
	Case information!
			li_bmp = 1
	Case stopsign!
			li_bmp = 2			
	Case exclamation!
			li_bmp = 3			
	Case question!
			li_bmp = 4
	Case Else
			li_bmp = 0			
End Choose
If li_bmp > 0 Then
	lv_bmp.X = lv_bmp.X - 30
	llvi_item.PictureIndex = li_bmp
	li_Index = lv_bmp.AddItem(llvi_item)
	lv_bmp.SetItem(1, llvi_item)
	llvi_item.ItemX = -100
	llvi_item.ItemY = 5	
Else
	lv_bmp.Visible = False
End If

// As requested, Enable/Disable Print.
cb_print.enabled = inv_errorattrib.ib_print
cb_print.visible = inv_errorattrib.ib_print

// As requested, Enable/Disable User input.
cb_userinput.enabled = inv_errorattrib.ib_userinput
cb_userinput.visible = inv_errorattrib.ib_userinput

// As requested, set the timer.
If inv_errorattrib.ii_timeout > 0 Then 
	// Automatically close this response window after ii_timeout seconds.
	timer(inv_errorattrib.ii_timeout)
End If

// As requested, display/enable the appropriate button(s).
Choose Case inv_errorattrib.ie_buttonstyle
	Case ok!
			//-- An (OK) button has been requested. --
		
			// Set the text attribute(s).
			cb_1.Text = "OK"
			
			// Set the default attribute(s).			
			cb_1.Default = True
			cb_1.SetFocus()
			
			// Make button(s) visible or invisible.
			cb_1.Visible = True
			cb_2.Visible = False
			cb_3.Visible = False
			
	Case okcancel!, yesno!, retrycancel!
			//-- An (OK and Cancel) or (Yes and No) or (Retry and Cancel) --
			//-- buttons have been requested. --
		
			// Set the text attribute(s).
			If inv_errorattrib.ie_buttonstyle = okcancel! Then
				// An OK and Cancel buttons have been requested. 
				cb_1.Text = "OK"
				cb_2.Text = "Cancel"
			ElseIf inv_errorattrib.ie_buttonstyle = yesno! Then
				// A Yes and No buttons have been requested. 				
				cb_1.Text = "&Yes"
				cb_2.Text = "&No"				
			Else
				// A Retry and Cancel buttons have been requested. 		
				cb_1.Text = "Retry"
				cb_2.Text = "Cancel"				
			End If
			
			// Set the default attribute(s).						
			If inv_errorattrib.ii_default = 2 Then
				cb_2.default = True
				cb_2.SetFocus()
			Else
				// Default value.
				cb_1.default = True
				cb_1.SetFocus()				
			End If
			
			// Make button(s) visible or invisible.
			cb_1.visible = True
			cb_2.visible = True
			cb_3.Visible = False				

	Case yesnocancel!, abortretryignore!
			//-- A (Yes, No, and Cancel) or (Abort, Retry, and Ignore) --
			//-- buttons have been requested. --
				
			// Set the text attribute(s).			
			If inv_errorattrib.ie_buttonstyle = yesnocancel! Then		
				// A Yes, No, and Cancel buttons have been requested. 						
				cb_1.Text = "&Yes"
				cb_2.Text = "&No"
				cb_3.Text = "Cancel"
			Else
				// An Abort, Retry, and Ignore buttons have been requested. 	
				cb_1.Text = "Abort"
				cb_2.Text = "Retry"
				cb_3.Text = "Ignore"				
			End If
				
			// Set the default attribute(s).							
			If inv_errorattrib.ii_default = 3 Then
				cb_3.default = True
				cb_3.SetFocus()
			ElseIf inv_errorattrib.ii_default = 2 Then
				cb_2.default = True
				cb_2.SetFocus()
			Else
				// Default value.
				cb_1.default = True
				cb_1.SetFocus()
			End If			

			// Make button(s) visible or invisible.
			cb_1.visible = True
			cb_2.visible = True
			cb_3.visible = True
End Choose

// Size and Move controls around to	match the window information.
li_rc = of_PaintInitialWindow()

end event

type gb_userinput from u_gb within pfc_w_message
integer x = 261
integer y = 500
integer width = 1984
integer height = 36
integer taborder = 0
string text = ""
end type

type mle_userinput from u_mle within pfc_w_message
integer x = 261
integer y = 644
integer width = 1984
integer height = 288
integer taborder = 60
boolean vscrollbar = true
boolean autovscroll = false
boolean hideselection = false
end type

type st_userinput from u_st within pfc_w_message
integer x = 261
integer y = 576
integer width = 1984
string text = "User Input:"
end type

type cb_1 from u_cb within pfc_w_message
integer x = 581
integer y = 404
integer taborder = 10
string text = "1"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Clicked!
//
//	Description:  	Perform the default processing after getting the clicked
//						button.
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

// Determine which button this is - (1, 2, or 3)?
ii_buttonclicked = Integer(Mid(This.ClassName(), 4, 1))

Parent.Event pfc_default()
end event

type cb_2 from u_cb within pfc_w_message
integer x = 960
integer y = 404
integer taborder = 20
boolean bringtotop = true
string text = "2"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Clicked!
//
//	Description:  	Perform the default processing after getting the clicked
//						button.
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

// Determine which button this is - (1, 2, or 3)?
ii_buttonclicked = Integer(Mid(This.ClassName(), 4, 1))

Parent.Event pfc_default()
end event

type cb_3 from u_cb within pfc_w_message
integer x = 1344
integer y = 404
integer taborder = 30
boolean bringtotop = true
string text = "3"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Clicked!
//
//	Description:  	Perform the default processing after getting the clicked
//						button.
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

// Determine which button this is - (1, 2, or 3)?
ii_buttonclicked = Integer(Mid(This.ClassName(), 4, 1))

Parent.Event pfc_default()
end event

type cb_print from u_cb within pfc_w_message
integer x = 2213
integer y = 52
integer width = 453
integer taborder = 40
boolean bringtotop = true
string text = "&Print"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Clicked!
//
//	Description:  	Perform the print process.
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

Parent.Post Event pfc_print()
end event

type cb_userinput from u_cb within pfc_w_message
integer x = 2213
integer y = 164
integer width = 453
integer taborder = 50
boolean bringtotop = true
string text = "&Input >>"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Clicked!
//
//	Description:  	Perform the Input process.
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

// Disable the button.
this.Enabled = False

// Enable the User Input field.
Parent.Event pfc_userinput()

end event

type mle_message from u_mle within pfc_w_message
integer x = 334
integer y = 52
integer width = 1810
integer height = 288
integer taborder = 0
boolean bringtotop = true
long backcolor = 80263581
boolean border = false
boolean autovscroll = false
boolean displayonly = true
borderstyle borderstyle = stylebox!
boolean hideselection = false
end type

type lv_bmp from u_lv within pfc_w_message
integer x = 73
integer y = 52
integer width = 251
integer height = 164
integer taborder = 0
long textcolor = 33554432
long backcolor = 1090519039
boolean enabled = false
boolean border = false
borderstyle borderstyle = stylebox!
boolean scrolling = false
string largepicturename[] = {"info.bmp","stop.bmp","excl.bmp","quest.bmp"}
integer largepicturewidth = 0
integer largepictureheight = 0
long largepicturemaskcolor = 12632256
end type


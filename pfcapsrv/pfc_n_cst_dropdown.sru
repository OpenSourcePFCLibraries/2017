HA$PBExportHeader$pfc_n_cst_dropdown.sru
$PBExportComments$PFC DropDown Object service
forward
global type pfc_n_cst_dropdown from n_base
end type
end forward

global type pfc_n_cst_dropdown from n_base
end type
global pfc_n_cst_dropdown pfc_n_cst_dropdown

type variables
Protected:
userobject iu_requestor

Constant Integer DWSTYLE_BOX = 1
Constant Integer DWSTYLE_SHADOWBOX = 2
Constant Integer DWSTYLE_LOWERED = 3
Constant Integer DWSTYLE_RAISED = 4
Constant Integer STYLE_BOX = 5
Constant Integer STYLE_SHADOWBOX = 6
Constant Integer STYLE_LOWERED = 7
Constant Integer STYLE_RAISED = 8
Constant Integer DW_HSPLITBAR_WIDTH = 9
Constant Integer TAB_BORDER = 10
Constant Integer MISC_XPOSITION = 11
Constant Integer MISC_YPOSITION = 12
Constant Integer DWMISC_XPOSITION = 13
Constant Integer DWMISC_YPOSITION = 14
Constant Integer DWDETAIL_HEIGHT = 15
Constant Integer BORDER_CHECK = 16
end variables

forward prototypes
protected function integer of_getparentwindow (dragobject adrg_object, ref window aw_parent)
protected function integer of_getsystemsetting (integer ai_option)
public function integer of_setrequestor (userobject au_requestor)
public function integer of_position (dragobject adrg_object, boolean ab_makevisible)
public function integer of_getparentposition (dragobject adrg_object, ref integer ai_x, ref integer ai_y)
end prototypes

protected function integer of_getparentwindow (dragobject adrg_object, ref window aw_parent);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetParentWindow
//
//	Access:  protected
//
//	Arguments:
//	adrg_object	The dragobject for which to find the parent window.
//	aw_parent   The Parent window for this object (passed by reference).
//	   If a parent window is not found, aw_parent is NULL
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:	 Calculates the parent window of a window object
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

powerobject	lpo_parent

lpo_parent = adrg_object.GetParent()

// Loop getting the parent of the object until it is of type window!
do while IsValid (lpo_parent) 
	if lpo_parent.TypeOf() <> window! then
		lpo_parent = lpo_parent.GetParent()
	else
		exit
	end if
loop

if IsNull(lpo_parent) Or not IsValid (lpo_parent) then
	setnull(aw_parent)	
	return -1
end If

aw_parent = lpo_parent
return 1

end function

protected function integer of_getsystemsetting (integer ai_option);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetSystemSetting
//
//	Scope:	Protected
//
//	Arguments:
//		ai_option	The name of the desired setting.
//
//	Returns:  Integer
//		The setting.
//
//	Description:  Get the platform specific setting.
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

Environment lenv_object

GetEnvironment(lenv_object)

If lenv_object.ostype = Windows! Then

	CHOOSE CASE ai_option
		CASE DWSTYLE_BOX
			Return 3
		CASE DWSTYLE_SHADOWBOX
			Return 3			
		CASE DWSTYLE_LOWERED
			Return 6			
		CASE DWSTYLE_RAISED
			Return 6		
		CASE DWDETAIL_HEIGHT
			Return 0
			Return -1
		CASE STYLE_BOX
			Return 3			
		CASE STYLE_SHADOWBOX
			Return 3			
		CASE STYLE_LOWERED
			Return 6					
		CASE STYLE_RAISED
			Return 6			
		CASE DW_HSPLITBAR_WIDTH
			Return 12					
		CASE TAB_BORDER
			Return 0		
		CASE MISC_XPOSITION
			Return 0						
		CASE MISC_YPOSITION
			Return 0		
		CASE DWMISC_XPOSITION
			Return 0						
		CASE DWMISC_YPOSITION
			Return 3			
		CASE BORDER_CHECK 			
			Return 3
	END CHOOSE

Else
	CHOOSE CASE ai_option
		CASE DWSTYLE_BOX
			Return 3
		CASE DWSTYLE_SHADOWBOX
			Return 3			
		CASE DWSTYLE_LOWERED
			Return 6			
		CASE DWSTYLE_RAISED
			Return 6		
		CASE DWDETAIL_HEIGHT
			Return 0
			Return -1
		CASE STYLE_BOX
			Return 3			
		CASE STYLE_SHADOWBOX
			Return 3			
		CASE STYLE_LOWERED
			Return 6					
		CASE STYLE_RAISED
			Return 6			
		CASE DW_HSPLITBAR_WIDTH
			Return 12					
		CASE TAB_BORDER
			Return 0		
		CASE MISC_XPOSITION
			Return 0						
		CASE MISC_YPOSITION
			Return 0		
		CASE DWMISC_XPOSITION
			Return 0						
		CASE DWMISC_YPOSITION
			Return 3			
		CASE BORDER_CHECK 			
			Return 3
	END CHOOSE


End If

Return 0
end function

public function integer of_setrequestor (userobject au_requestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetRequestor
//
//	Access:  		public
//
//	Arguments:		
//	au_requestor	The userobject requesting this service
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Associates an userobject with this service.
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

If IsNull(au_requestor) Or Not IsValid(au_requestor) Then
	Return -1
End If

iu_requestor = au_requestor
Return 1
end function

public function integer of_position (dragobject adrg_object, boolean ab_makevisible);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Position
//
//	Access:    Public
//
//	Arguments:	
//		adrg_object 	The object that is used to calculate the new position.
//		ab_makevisible If true then the DropDown object will be made visible
//				after a valid position is calculated.
//
//	Returns:  Integer
//		1 if it succeeds.
//		-1 if an error occurs.
//		-2 if the requested functionality is not supported.
//		-3 if a valid position could not be calculated.
//
//	Description:
//		Updates the position of the requestor object based on the 
//		current location of the adrg_object.  The adrg_object is the object
// 	to which the "actual dropdown object" is associated. 
//		If adrg_object is a datawindow, it is based on the current column/row
//		within the datawindow.
//
// Note:
// Title Bar on datawindows are not supported.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
// 6.0.01 Improve calculations for Group Header and Trailer Attributes.
// 7.0 	Changed the li_rowsafterfirst to long
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

Integer	li_x, li_y
Integer	li_idx
Integer	li_objheight
Integer	li_parentx, li_parenty
integer	li_rc
Integer	li_colx, li_coly, li_colheight
Integer	li_detailheight
Integer	li_dwx, li_dwy, li_dwborder, li_dwtitlebar, li_dwtitleborder
Integer	li_headerheight
Integer	li_groupheaderheight, li_grouptrailerheight
Integer	li_groupheaderheightarray[], li_grouptrailerheightarray[]
Integer	li_groupbreakarray[]
Long		ll_groupchange
Long		ll_testrow
Integer	li_group, li_groupcnt, li_breakcnt
String	ls_colname
String	ls_headerheight, ls_trailerheight
Long		ll_rowsafterfirst	
Integer	li_counter
Integer	li_hsplit, li_hpos, li_hpos1, li_hpos2
Integer	li_pointerx, li_pointery
Integer	li_bordercheck
Long		ll_firstrowonpage
Long		ll_lastrowonpage
Long		ll_currrow
window	lw_parent
datawindow ldw_object

// Validate the references.
If IsNull(adrg_object) or Not IsValid(adrg_object) Or &
	IsNull(iu_requestor) or Not IsValid(iu_requestor) Then
	Return -1
End If

// Get the parent window.
of_GetParentWindow(adrg_object, lw_parent)
If IsNull(lw_parent) or Not IsValid(lw_parent) Then
	Return -1
End If

// Get the X/Y coordinates for the parent object holding this datawindow.
of_GetParentPosition(adrg_object, li_parentx, li_parenty)

// Determine which type of processing is needed.
If adrg_object.TypeOf() = DataWindow! Then
	// Cast to the appropriate variable type.
	ldw_object = adrg_object

	// Determine if this positioning is not supported.
	If ldw_object.Titlebar Then
		// Not supported.
		iu_requestor.Visible = False
		Return -2
		// Calculate Title Bar attributes.
		//li_dwtitlebar = ?
		//li_dwtitleborder = ?
	End If

	// Get the column name.
	ls_colname = ldw_object.GetColumnName()

	// Get exact pointers.
	li_pointerx = ldw_object.PointerX()
	li_pointery = ldw_object.PointerY()

	// Get the row values.
	ll_firstrowonpage = Long(ldw_object.Describe("DataWindow.FirstRowOnPage"))
	ll_lastrowonpage = Long(ldw_object.Describe("DataWindow.LastRowOnPage"))
	ll_currrow	= ldw_object.GetRow()

	// Get the DataWindow X/Y coordinates, Border width, and Title width. 
	li_dwx = ldw_object.X
	li_dwy = ldw_object.Y
	If ldw_object.Border Then
		CHOOSE CASE ldw_object.BorderStyle
			CASE StyleBox!
				If Not ldw_object.Titlebar Then
					li_dwborder = of_GetSystemSetting(DWSTYLE_BOX)
				End If
			CASE StyleShadowBox!
				If Not ldw_object.Titlebar Then
					li_dwborder = of_GetSystemSetting(DWSTYLE_SHADOWBOX)
				End If
			CASE StyleLowered!
				li_dwborder = of_GetSystemSetting(DWSTYLE_LOWERED)
			CASE StyleRaised!		
				li_dwborder = of_GetSystemSetting(DWSTYLE_RAISED)
		END CHOOSE
	End If

	// Get the X/Y point of the Left/Upper location for this column.
	li_colx = Integer(ldw_object.Describe(ls_colname+".X"))
	li_coly = Integer(ldw_object.Describe(ls_colname+".Y"))

	// Get the Height for this column and for the the Detail portion.
	li_colheight = Integer(ldw_object.Describe(ls_colname+".Height"))
	li_detailheight = Integer(ldw_object.Describe("DataWindow.Detail.Height")) + &
		of_GetSystemSetting(DWDETAIL_HEIGHT)

	// Get the height of the header band.
	ls_headerheight = ldw_object.Describe("DataWindow.Header.Height")
	If IsNumber(ls_headerheight) Then 
		li_headerheight += Integer(ls_headerheight)		
	End If
	
	// Get the band height(s) for group headers and trailers.
	li_idx = 0
	DO
		li_idx ++
		ls_headerheight =ldw_object.Describe("DataWindow.Header."+string(li_idx)+".Height")
		ls_trailerheight =ldw_object.Describe("DataWindow.Trailer."+string(li_idx)+".Height")
		If Pos(ls_headerheight, "!") = 0 Then
			li_groupheaderheightarray[li_idx] = Integer(ls_headerheight)
			li_grouptrailerheightarray[li_idx] = Integer(ls_trailerheight)
		End If	
	LOOP UNTIL Pos(ls_headerheight, "!") > 0

	// Attempt to determine the number of group breaks visible prior to 
	// the clicked row.
	li_groupcnt = UpperBound(li_groupheaderheightarray)
	For li_group = 1 to li_groupcnt
		ll_testrow = ll_firstrowonpage
		li_breakcnt = 0
		
		// Catch the "gap".
		ll_groupchange = ldw_object.FindGroupChange(ll_firstrowonpage, li_group)
		If ll_firstrowonpage <> ll_groupchange Then li_breakcnt ++
		
		DO WHILE ll_testrow >= 0 and ll_testrow <= ll_currrow
			ll_testrow = ldw_object.FindGroupChange(ll_testrow, li_group)
			If ll_testrow > 0 Then
				If ll_testrow <= ll_currrow Then li_breakcnt ++
			Else
				Exit
			End If
			ll_testrow ++
		LOOP
		li_groupbreakarray[li_group] = li_breakcnt
	Next

//	// Debugging - display the group header/trailer/breaks arrays.
//	string ls_temp
//	ls_temp = 'HeightArray = ' 
//	For li_idx = 1 to UpperBound(li_groupheaderheightarray)
//		ls_temp += '  ' +String(li_groupheaderheightarray[li_idx])
//	Next
//	ls_temp += '   TrailerArray = '
//	For li_idx = 1 to UpperBound(li_grouptrailerheightarray)
//		ls_temp += '  ' +String(li_grouptrailerheightarray[li_idx])
//	Next	
//	ls_temp += '   BreakArray = '
//	For li_idx = 1 to UpperBound(li_groupbreakarray)
//		ls_temp += '  ' +String(li_groupbreakarray[li_idx])
//	Next	
//	gnv_app.of_debug (ls_temp)	

	// Calculate the total Height for each Header/Trailer.
	For li_idx = 1 to UpperBound(li_groupheaderheightarray)
		li_groupheaderheight += li_groupheaderheightarray[li_idx] * li_groupbreakarray[li_idx]
		If li_groupbreakarray[li_idx] > 1 Then
			li_grouptrailerheight += li_grouptrailerheightarray[li_idx] * (li_groupbreakarray[li_idx] - 1)
		End If
	Next

	// Determine the on-screen row.
	ll_rowsafterfirst = ll_currrow - ll_firstrowonpage
	If ll_rowsafterfirst < 0 Then
		// Hide the object since the row is not visible on the screen.
		iu_requestor.Visible = False
		Return -3
	End If

	// Get Horizontal Scrollbar and Horizontal Split Scrolling variables.
	li_hsplit = Integer (ldw_object.Describe("DataWindow.HorizontalScrollSplit"))
	li_hpos1 = Integer (ldw_object.Describe("DataWindow.HorizontalScrollPosition"))
	li_hpos2 = Integer (ldw_object.Describe("DataWindow.HorizontalScrollPosition2"))
	If ldw_object.hsplitscroll Then
		If li_hsplit > 4 and li_pointerx > li_hsplit Then
			li_hpos = li_hpos2 - li_hsplit - of_GetSystemSetting(DW_HSPLITBAR_WIDTH)
		Else
			li_hpos = li_hpos1
		End If
	Else
		li_hpos = li_hpos1
	End If

	// Determine the Height of the column holding the dropdown.
	li_objheight = li_colheight
	
	// Calculate the X and Y Coordinates (check that it does not go past borders).
	li_x = li_parentx + li_dwx + li_dwborder + li_dwtitleborder + &
		li_colx - li_hpos + of_GetSystemSetting(DWMISC_XPOSITION)
	li_y = li_parenty + li_dwy + li_dwborder + li_dwtitleborder + li_dwtitlebar + &
		li_coly + li_headerheight +  &
		li_groupheaderheight + li_grouptrailerheight + &
		(li_detailheight * ll_rowsafterfirst ) + &
		li_colheight + of_GetSystemSetting(DWMISC_YPOSITION)
		
//	gnv_app.of_debug ('1Final values li_y='+string(li_y)+ &
//		' li_parenty='+string(li_parenty)+' li_dwy='+string(li_dwy)+ &
//		' li_dwborder='+string(li_dwborder)+' li_dwtitleborder='+string(li_dwtitleborder))
//	gnv_app.of_debug ('2Final values li_coly='+string(li_coly)+  &
//		' li_headerheight='+string(li_headerheight)+' li_groupheaderheight='+string(li_groupheaderheight)+&
//		' li_grouptrailerheight='+string(li_grouptrailerheight)+ &
//		' li_detailheight='+string((li_detailheight * li_rowsafterfirst )))
//	gnv_app.of_debug ('3Final values li_colheight='+string(li_colheight))
//	gnv_app.of_debug ('4Other values li_pointery='+string(li_pointery))
		
Else
	// Determine the Object Height of the control holding the dropdown.
	li_objheight = adrg_object.Height
	
	// Calculate the preffered X and Y Coordinates.
	li_x = li_parentx + adrg_object.X + of_GetSystemSetting(MISC_XPOSITION)
	li_y = li_parenty + adrg_object.Y + li_objheight + of_GetSystemSetting(MISC_YPOSITION)
End If

// Get the border check value.
li_bordercheck = of_GetSystemSetting(BORDER_CHECK)

// Make sure the coordinates will not force the calendar past the Right border.
If (lw_parent.WorkSpaceWidth() - iu_requestor.Width - li_bordercheck) > 0 Then
	If (li_x + iu_requestor.Width +li_bordercheck  > lw_parent.WorkSpaceWidth()) Then
		// Position it at the extreme right without going past border.
		li_x = lw_parent.WorkSpaceWidth() - iu_requestor.Width - li_bordercheck
	End If
End If

// Make sure this coordinates will not force the calendar past the Bottom border.
If (li_y - li_objheight - iu_requestor.Height) > 0 Then
	If (li_y + iu_requestor.Height +li_bordercheck > lw_parent.WorkSpaceHeight()) Then
		// Position on top of the field.
		li_y = li_y - li_objheight - iu_requestor.Height
	End If
End If

// Position the requestor object to the calculated coordinates.
iu_requestor.Move (li_x, li_y)

// If requested, make the dropdown object visible.
If ab_makevisible Then
	iu_requestor.Visible = True
End If
Return 1

end function

public function integer of_getparentposition (dragobject adrg_object, ref integer ai_x, ref integer ai_y);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetParentPosition
//
//	Access:  		public
//
//	Arguments:
//	adrg_object			The dragobject whose parent position is needed.
//	al_x(by reference) The x coordinate for the parent.
//	al_y(by reference) The y coordinate for the parent.
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:	Calculates the parent position in relationship to the window.
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

PowerObject	lpo_parent
UserObject	luo_parent
Tab			ltab_parent
Integer		li_parentx, li_parenty
Integer		li_x, li_y
Integer		li_border

// Validate required reference.
If IsNull(adrg_object) or Not IsValid(adrg_object) Then
	Return -1
End If

// Loop getting the parent of the object until it is of type window!
lpo_parent = adrg_object.GetParent()
do while IsValid (lpo_parent)
	If lpo_parent.TypeOf() = window! Then
		Exit
	End If
	li_border = 0
	CHOOSE CASE TypeOf(lpo_parent)
		CASE UserObject!
			luo_parent = lpo_parent
			li_parentx = luo_parent.X 
			li_parenty = luo_parent.Y 
			// Determine the Left/Upper Border.
			If luo_parent.Border Then
				CHOOSE CASE luo_parent.BorderStyle
					CASE StyleBox!
						li_border = of_GetSystemSetting(STYLE_BOX)
					CASE StyleShadowBox!
						li_border = of_GetSystemSetting(STYLE_SHADOWBOX)
					CASE StyleLowered!
						li_border = of_GetSystemSetting(STYLE_LOWERED)
					CASE StyleRaised!		
						li_border = of_GetSystemSetting(STYLE_RAISED)
				END CHOOSE				
			End If			
		CASE Tab!
			ltab_parent = lpo_parent
			li_parentx = ltab_parent.X 
			li_parenty = ltab_parent.Y 
			li_border = of_GetSystemSetting(TAB_BORDER)
	END CHOOSE
	li_x += li_parentx + li_border
	li_y += li_parenty + li_border
	lpo_parent = lpo_parent.GetParent()
loop

if not IsValid (lpo_parent) then
	Return -1
end If

ai_x = li_x
ai_y = li_y
Return 1


end function

on pfc_n_cst_dropdown.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_dropdown.destroy
TriggerEvent( this, "destructor" )
end on


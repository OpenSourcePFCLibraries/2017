HA$PBExportHeader$pfc_u_st_splitbar.sru
$PBExportComments$PFC SplitBar class
forward
global type pfc_u_st_splitbar from u_st
end type
end forward

global type pfc_u_st_splitbar from u_st
integer width = 535
integer height = 20
fontcharset fontcharset = ansi!
string facename = "System"
long backcolor = 8421504
boolean enabled = true
string text = ""
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
end type
global pfc_u_st_splitbar pfc_u_st_splitbar

type variables
Public:

//-- Define the "style" of split bar. --
constant integer VERTICAL = 1
constant integer HORIZONTAL = 2

//-- Define the "Register" type. --
constant integer LEFT=1
constant integer RIGHT=2
constant integer ABOVE=3
constant integer BELOW=4
CONSTANT Integer	LEFT_ANCHORED	= 5
CONSTANT Integer	RIGHT_ANCHORED	= 6
CONSTANT Integer	ABOVE_ANCHORED	= 7
CONSTANT Integer	BELOW_ANCHORED	= 8

Protected:

//-- Define the "Extreme points" constants. --
constant integer LEFTMOST=1
constant integer RIGHTMOST=2
constant integer TOPMOST=3
constant integer BOTTOMMOST=4

constant integer UNITIALIZED = -32000

//-- Define default icons. --
string	is_verticalpointer ='SizeWE!'
string	is_horizontalpointer ='SizeNS!'

// -- Registered information. --
integer	ii_lefttopbound
WindowObject iwo_lefttop[]
real	ir_lefttopx[]
real	ir_lefttopy[]
real	ir_lefttopwidth[]
real	ir_lefttopheight[]
Integer	ii_LeftTopPosition[]
integer	ii_rightbottombound
WindowObject iwo_rightbottom[] 
real	ir_rightbottomx[]
real	ir_rightbottomy[]
real	ir_rightbottomwidth[]
real	ir_rightbottomheight[]
Integer	ii_RightBottomPosition[]

// --Other. --
integer	ii_style = -1		// Default to negative value.
Integer	ii_barwidth = -1		// Default to negative value.
long	il_barcolor=78682240
long	il_barmovecolor=8421504
integer	ii_minobjectsize = 20
boolean	ib_performredraw=True

//-- Internal attributes. --
boolean	ib_supported = True
integer	ii_prevpositionx = UNITIALIZED
integer	ii_prevpositiony = UNITIALIZED
window	iw_parent
userobject iuo_parent
tab	itab_parent

Integer		ii_XRounding	= 5
Integer		ii_YRounding	= 4

end variables

forward prototypes
public function integer of_setbarcolor (long al_color)
public function integer of_setbarmovecolor (long al_color)
protected function integer of_lbuttonup (unsignedlong aul_flags, integer ai_xpos, integer ai_ypos)
protected function integer of_updateobjectdata ()
public function integer of_getextremepoint (integer ai_extremetype)
public function integer of_SetMinObjectSize (integer ai_minsize)
public function integer of_getminobjectsize ()
public function integer of_getbarcolor ()
public function string of_GetHorizontalPointer ()
public function string of_GetVerticalPointer ()
public function integer of_sethorizontalpointer (string as_icon)
public function integer of_setverticalpointer (string as_icon)
public function integer of_GetBarMoveColor ()
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
protected function boolean of_issupported ()
protected function integer of_mousemove (unsignedlong aul_flags, integer ai_xpos, integer ai_ypos)
protected function integer of_redraw (integer ai_prevx, integer ai_prevwidth, integer ai_prevy, integer ai_prevheight)
public function integer of_register (windowobject awo_object, integer ai_position)
public function integer of_unregister_all ()
public function integer of_unregister (windowobject awo_object)
public subroutine of_move (long al_newx, long al_newy)
private subroutine of_moved (integer ai_pointerx, integer ai_pointery)
private subroutine of_previousposition (integer ai_prevpositionx, integer ai_prevpositiony)
end prototypes

event mousemove;//////////////////////////////////////////////////////////////////////////////
//
//	Event: 			mousemove
//
//	Arguments:		
//  flags
//  xpos
//	 ypos
//
//	Returns:  		None.
//
//	Description:	Perform the Mouse Move processing.
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

If Not KeyDown(keyLeftButton!) Then
	Return
End If

of_MouseMove(flags, xpos, ypos)

end event

event lbuttonup;//////////////////////////////////////////////////////////////////////////////
//
//	Event: 			lbuttonup
//
//	Arguments:		
//  flags
//  xpos
//	 ypos
//
//	Returns:  		None.
//
//	Description:	Perform the Left Button Up processing.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//	12.5	10/16/2014			Draw issue, make sure object is always on top
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

of_lbuttonup(flags, xpos, ypos)

this.BringToTop			= TRUE
end event

public function integer of_setbarcolor (long al_color);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetBarColor
//
//	Access:  		Public
//
//	Arguments:	
//  al_color		The desired color.
//
//	Returns:  		Integer
//						Returns 1 if it succeeds and -1 if an error occurs.
//
//	Description: 	Set the Non-Moving Split Bar Color.
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

// Validate the argument.
If IsNull(al_color) Or al_color<0 Then
	Return -1
End If

// Set the color.
il_barcolor = al_color

// Start using the requested color.
this.BackColor = il_barcolor

Return 1
end function

public function integer of_setbarmovecolor (long al_color);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetBarMoveColor
//
//	Access:  		Public
//
//	Arguments:	
//  al_color		The desired color.
//
//	Returns:  		Integer
//						Returns 1 if it succeeds and -1 if an error occurs.
//
//	Description: 	Set the Moving Split Bar Color.
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

// Validate the argument.
If IsNull(al_color) Or al_color<0 Then
	Return -1
End If

il_barmovecolor = al_color
Return 1
end function

protected function integer of_lbuttonup (unsignedlong aul_flags, integer ai_xpos, integer ai_ypos);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_LButtonUp
//
//	Access:  		Protected
//
//	Arguments:		
//	 aul_flags
//  ai_xpos
//  ai_ypos
//
//	Returns:  		Integer
//						Returns 1 if it succeeds and -1 if an error occurs.
//
//	Description: 	Resize the objects according to the bar that was just moved
//						and other service attributes.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//	12.5	10/16/2014			Modified to use new of_Moved() and
//									of_PreviousPosition() methods.
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

Integer	li_cnt
Integer 	li_deltax, li_deltay
Integer	li_pointerx, li_pointery
Integer	li_minx, li_maxx, li_miny, li_maxy

// Validate required values.
If ii_style <0 or ii_barwidth <0 Then 
	Return -1
End If

// Validate that objects were registered.
If UpperBound(iwo_lefttop) =0 Or UpperBound(iwo_rightbottom) =0 Then
	Return -1
End If

this.SetPosition(ToTop!)

// Change to the base color.
this.BackColor = il_barcolor

// Validate that the bar has been moved.
If ii_prevpositionx = UNITIALIZED Or ii_prevpositiony = UNITIALIZED Then
	Return 0
End If

// Get the new position.
If IsValid(iuo_parent) Then	
	li_pointerx = iuo_parent.PointerX()
	li_pointery = iuo_parent.PointerY()	
ElseIf IsValid(itab_parent) Then
	li_pointerx = itab_parent.PointerX()
	li_pointery = itab_parent.PointerY()
ElseIf IsValid(iw_parent) Then
	li_pointerx = iw_parent.PointerX()
	li_pointery = iw_parent.PointerY()
Else
	// Reset the Previous position variables to UNITIALIZED.
	of_PreviousPosition(UNITIALIZED, UNITIALIZED)
	Return -1
End If

of_Moved(li_PointerX, li_PointerY)

Return 1
end function

protected function integer of_updateobjectdata ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UpdateObjectData
//
//	Access:  		Protected
//
//	Arguments:		None.
//
//	Returns:  		Integer
//						Returns 1 if it succeeds and -1 if an error occurs.
//
//	Description: 	Update the registered object data in order to minimize
//						rounding problems.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//	12.5	10/16/2014			Add support for rectangle, roundRectangle, oval and
//									line.
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

Integer li_cnt
Integer li_upperbound

DragObject						ldrg_Resize
Rectangle						lr_Resize
RoundRectangle					lrr_Resize
Oval								lov_Resize

li_upperbound = Upperbound (iwo_lefttop)

For li_cnt = 1 to li_upperbound
	If IsValid(iwo_lefttop[li_cnt]) Then
		
		CHOOSE CASE TypeOf(iwo_LeftTop[li_Cnt])
			CASE Line!
			CASE Oval!
					
				lov_Resize		= iwo_LeftTop[li_Cnt]

				If abs(ir_lefttopx[li_cnt] - lov_Resize.X) > ii_XRounding Then
					ir_lefttopx[li_cnt] = lov_Resize.X
				End If	
				If abs(ir_lefttopy[li_cnt] - lov_Resize.Y) > ii_YRounding Then
					ir_lefttopy[li_cnt] = lov_Resize.Y
				End If	
				If abs(ir_lefttopwidth[li_cnt] - lov_Resize.Width) > ii_XRounding Then
					ir_lefttopwidth[li_cnt] = lov_Resize.Width
				End If	
				If abs(ir_lefttopheight[li_cnt] - lov_Resize.Height) > ii_YRounding Then
					ir_lefttopheight[li_cnt] = lov_Resize.Height
				End If

			CASE RoundRectangle!
					
				lrr_Resize		= iwo_LeftTop[li_Cnt]
					
				If abs(ir_lefttopx[li_cnt] - lrr_Resize.X) > ii_XRounding Then
					ir_lefttopx[li_cnt] = lrr_Resize.X
				End If	
				If abs(ir_lefttopy[li_cnt] - lrr_Resize.Y) > ii_YRounding Then
					ir_lefttopy[li_cnt] = lrr_Resize.Y
				End If	
				If abs(ir_lefttopwidth[li_cnt] - lrr_Resize.Width) > ii_XRounding Then
					ir_lefttopwidth[li_cnt] = lrr_Resize.Width
				End If	
				If abs(ir_lefttopheight[li_cnt] - lrr_Resize.Height) > ii_YRounding Then
					ir_lefttopheight[li_cnt] = lrr_Resize.Height
				End If
		
			CASE Rectangle!
					
				lr_Resize		= iwo_LeftTop[li_Cnt]

				If abs(ir_lefttopx[li_cnt] - lr_Resize.X) > ii_XRounding Then
					ir_lefttopx[li_cnt] = lr_Resize.X
				End If	
				If abs(ir_lefttopy[li_cnt] - lr_Resize.Y) > ii_YRounding Then
					ir_lefttopy[li_cnt] = lr_Resize.Y
				End If	
				If abs(ir_lefttopwidth[li_cnt] - lr_Resize.Width) > ii_XRounding Then
					ir_lefttopwidth[li_cnt] = lr_Resize.Width
				End If	
				If abs(ir_lefttopheight[li_cnt] - lr_Resize.Height) > ii_YRounding Then
					ir_lefttopheight[li_cnt] = lr_Resize.Height
				End If

			CASE ELSE			//	Assume it's a DragObject

				ldrg_Resize		= iwo_lefttop[li_cnt]
				
				If abs(ir_lefttopx[li_cnt] - ldrg_Resize.X) > ii_XRounding Then
					ir_lefttopx[li_cnt] = ldrg_Resize.X
				End If	
				If abs(ir_lefttopy[li_cnt] - ldrg_Resize.Y) > ii_YRounding Then
					ir_lefttopy[li_cnt] = ldrg_Resize.Y
				End If	
				If abs(ir_lefttopwidth[li_cnt] - ldrg_Resize.Width) > ii_XRounding Then
					ir_lefttopwidth[li_cnt] = ldrg_Resize.Width
				End If	
				If abs(ir_lefttopheight[li_cnt] - ldrg_Resize.Height) > ii_YRounding Then
					ir_lefttopheight[li_cnt] = ldrg_Resize.Height
				End If
				
		END CHOOSE
		
	End If
Next
	
li_upperbound = Upperbound (iwo_rightbottom)	
For li_cnt = 1 to li_upperbound
	If IsValid(iwo_rightbottom[li_cnt]) Then

		CHOOSE CASE TypeOf(iwo_RightBottom[li_Cnt])
			CASE Line!
			CASE Oval!
					
				lov_Resize		= iwo_RightBottom[li_Cnt]
					
				If abs(ir_rightbottomx[li_cnt] - lov_Resize.X) > ii_XRounding Then
					ir_rightbottomx[li_cnt] = lov_Resize.X
				End If	
				If abs(ir_rightbottomy[li_cnt] - lov_Resize.Y) > ii_YRounding Then
					ir_rightbottomy[li_cnt] = lov_Resize.Y
				End If	
				If abs(ir_rightbottomwidth[li_cnt] - lov_Resize.Width) > ii_XRounding Then
					ir_rightbottomwidth[li_cnt] = lov_Resize.Width
				End If	
				If abs(ir_rightbottomheight[li_cnt] - lov_Resize.Height) > ii_YRounding Then
					ir_rightbottomheight[li_cnt] = lov_Resize.Height
				End If

			CASE RoundRectangle!
					
				lrr_Resize		= iwo_RightBottom[li_Cnt]

				If abs(ir_rightbottomx[li_cnt] - lrr_Resize.X) > ii_XRounding Then
					ir_rightbottomx[li_cnt] = lrr_Resize.X
				End If	
				If abs(ir_rightbottomy[li_cnt] - lrr_Resize.Y) > ii_YRounding Then
					ir_rightbottomy[li_cnt] = lrr_Resize.Y
				End If	
				If abs(ir_rightbottomwidth[li_cnt] - lrr_Resize.Width) > ii_XRounding Then
					ir_rightbottomwidth[li_cnt] = lrr_Resize.Width
				End If	
				If abs(ir_rightbottomheight[li_cnt] - lrr_Resize.Height) > ii_YRounding Then
					ir_rightbottomheight[li_cnt] = lrr_Resize.Height
				End If
		
			CASE Rectangle!
					
				lr_Resize		= iwo_RightBottom[li_Cnt]

				If abs(ir_rightbottomx[li_cnt] - lr_Resize.X) > ii_XRounding Then
					ir_rightbottomx[li_cnt] = lr_Resize.X
				End If	
				If abs(ir_rightbottomy[li_cnt] - lr_Resize.Y) > ii_YRounding Then
					ir_rightbottomy[li_cnt] = lr_Resize.Y
				End If	
				If abs(ir_rightbottomwidth[li_cnt] - lr_Resize.Width) > ii_XRounding Then
					ir_rightbottomwidth[li_cnt] = lr_Resize.Width
				End If	
				If abs(ir_rightbottomheight[li_cnt] - lr_Resize.Height) > ii_YRounding Then
					ir_rightbottomheight[li_cnt] = lr_Resize.Height
				End If

			CASE ELSE			//	Assume it's a DragObject

				ldrg_Resize		= iwo_rightbottom[li_cnt]
		
				If abs(ir_rightbottomx[li_cnt] - ldrg_Resize.X) > ii_XRounding Then
					ir_rightbottomx[li_cnt] = ldrg_Resize.X
				End If	
				If abs(ir_rightbottomy[li_cnt] - ldrg_Resize.Y) > ii_YRounding Then
					ir_rightbottomy[li_cnt] = ldrg_Resize.Y
				End If	
				If abs(ir_rightbottomwidth[li_cnt] - ldrg_Resize.Width) > ii_XRounding Then
					ir_rightbottomwidth[li_cnt] = ldrg_Resize.Width
				End If	
				If abs(ir_rightbottomheight[li_cnt] - ldrg_Resize.Height) > ii_YRounding Then
					ir_rightbottomheight[li_cnt] = ldrg_Resize.Height
				End If
				
		END CHOOSE
		
	End If
Next

Return 1
end function

public function integer of_getextremepoint (integer ai_extremetype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetExtremePoint
//
//	Access:  		Public
//
//	Arguments:		
//	 ai_extremetype The extreme point desired.  Valid values are:
//						LEFTMOST=1
//						RIGHTMOST=2
//						TOPMOST=3
//						BOTTOMMOST=4
//
//	Returns:  		Integer
//						Returns the desired extreme point.
//
//	Description: 	Get the desired extreme point coordinate.  The coordinate is 
//						the maximum or minimum point where the split bar can be 
//						moved to.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//	12.5	10/16/2014			Add support for rectangle, roundRectangle, oval and
//									line.
//									Add logic for "anchored" objects.
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


Integer li_Point,		li_MinPoint, 	li_MaxPoint
Integer li_extremepoint
Integer li_cnt
constant Integer LOW_VALUE = -999999
constant Integer HIGH_VALUE = 999999

DragObject						ldrg_Resize
Rectangle						lr_Resize
RoundRectangle					lrr_Resize
Oval								lov_Resize

CHOOSE CASE ai_extremetype
	CASE LEFTMOST

		// Initialize the extreme point.
		li_point = LOW_VALUE
		li_MinPoint					= HIGH_VALUE
		li_MaxPoint					= LOW_VALUE

		// Find the left most point.
		For li_cnt = 1 to UpperBound(iwo_lefttop)
			If IsValid(iwo_lefttop[li_cnt]) Then
				
				CHOOSE CASE TypeOf(iwo_LeftTop[li_Cnt])
					CASE Line!
					CASE Oval!
							
						lov_Resize		= iwo_LeftTop[li_Cnt]

						CHOOSE CASE ii_LeftTopPosition[li_Cnt]
							CASE LEFT
								If lov_Resize.X > li_point Then 
									li_point	= lov_Resize.X
								End If
							CASE LEFT_ANCHORED
								IF lov_Resize.X < li_MinPoint THEN
									li_MinPoint	= lov_Resize.X
								END IF
								IF lov_Resize.X + lov_Resize.Width > li_MaxPoint THEN
									li_MaxPoint	= lov_Resize.X + lov_Resize.Width
								END IF
						END CHOOSE
	
					CASE RoundRectangle!
							
						lrr_Resize		= iwo_LeftTop[li_Cnt]
							
						CHOOSE CASE ii_LeftTopPosition[li_Cnt]
							CASE LEFT
								If lrr_Resize.X > li_point Then 
									li_point	= lrr_Resize.X
								End If
							CASE LEFT_ANCHORED
								IF lrr_Resize.X < li_MinPoint THEN
									li_MinPoint	= lrr_Resize.X
								END IF
								IF lrr_Resize.X + lrr_Resize.Width > li_MaxPoint THEN
									li_MaxPoint	= lrr_Resize.X + lrr_Resize.Width
								END IF
						END CHOOSE
				
					CASE Rectangle!
							
						lr_Resize		= iwo_LeftTop[li_Cnt]

						CHOOSE CASE ii_LeftTopPosition[li_Cnt]
							CASE LEFT
								If lr_Resize.X > li_point Then 
									li_point	= lr_Resize.X
								End If
							CASE LEFT_ANCHORED
								IF lr_Resize.X < li_MinPoint THEN
									li_MinPoint	= lr_Resize.X
								END IF
								IF lr_Resize.X + lr_Resize.Width > li_MaxPoint THEN
									li_MaxPoint	= lr_Resize.X + lr_Resize.Width
								END IF
						END CHOOSE

					CASE ELSE			//	Assume it's a DragObject
		
						ldrg_Resize		= iwo_LeftTop[li_Cnt]
						
						CHOOSE CASE ii_LeftTopPosition[li_Cnt]
							CASE LEFT
								If ldrg_Resize.X > li_point Then 
									li_point	= ldrg_Resize.X
								End If
							CASE LEFT_ANCHORED
								IF ldrg_Resize.X < li_MinPoint THEN
									li_MinPoint	= ldrg_Resize.X
								END IF
								IF ldrg_Resize.X + ldrg_Resize.Width > li_MaxPoint THEN
									li_MaxPoint	= ldrg_Resize.X + ldrg_Resize.Width
								END IF
						END CHOOSE
					
				END CHOOSE
			
			End If
		Next

		// Take into account the the minimum object size.
		li_extremepoint = li_point + ii_minobjectsize
		
		IF li_MinPoint <> HIGH_VALUE AND li_MaxPoint <> LOW_VALUE THEN
			li_extremepoint		= li_ExtremePoint + (li_MaxPoint - li_MinPoint)
		END IF
		
	CASE RIGHTMOST		

		// Initialize the extreme point.
		li_point = HIGH_VALUE
		li_MinPoint					= HIGH_VALUE
		li_MaxPoint					= LOW_VALUE

		// Find the right most point.
		For li_cnt = 1 to UpperBound(iwo_rightbottom)
			If IsValid(iwo_rightbottom[li_cnt]) Then
				
				CHOOSE CASE TypeOf(iwo_RightBottom[li_Cnt])
					CASE Line!
					CASE Oval!
							
						lov_Resize		= iwo_RightBottom[li_Cnt]

						CHOOSE CASE ii_RightBottomPosition[li_Cnt]
							CASE RIGHT
								If lov_Resize.X + lov_Resize.Width < li_point Then 
									li_point = lov_Resize.X + lov_Resize.Width
								End If
							CASE RIGHT_ANCHORED
								IF lov_Resize.X < li_MinPoint THEN
									li_MinPoint	= lov_Resize.X
								END IF
								IF lov_Resize.X + lov_Resize.Width > li_MaxPoint THEN
									li_MaxPoint	= lov_Resize.X + lov_Resize.Width
								END IF
						END CHOOSE
	
					CASE RoundRectangle!
							
						lrr_Resize		= iwo_RightBottom[li_Cnt]
							
						CHOOSE CASE ii_RightBottomPosition[li_Cnt]
							CASE RIGHT
								If lrr_Resize.X + lrr_Resize.Width < li_point Then 
									li_point = lrr_Resize.X + lrr_Resize.Width
								End If
							CASE RIGHT_ANCHORED
								IF lrr_Resize.X < li_MinPoint THEN
									li_MinPoint	= lrr_Resize.X
								END IF
								IF lrr_Resize.X + lrr_Resize.Width > li_MaxPoint THEN
									li_MaxPoint	= lrr_Resize.X + lrr_Resize.Width
								END IF
						END CHOOSE
				
					CASE Rectangle!
							
						lr_Resize		= iwo_RightBottom[li_Cnt]

						CHOOSE CASE ii_RightBottomPosition[li_Cnt]
							CASE RIGHT
								If lr_Resize.X + lr_Resize.Width < li_point Then 
									li_point = lr_Resize.X + lr_Resize.Width
								End If
							CASE RIGHT_ANCHORED
								IF lr_Resize.X < li_MinPoint THEN
									li_MinPoint	= lr_Resize.X
								END IF
								IF lr_Resize.X + lr_Resize.Width > li_MaxPoint THEN
									li_MaxPoint	= lr_Resize.X + lr_Resize.Width
								END IF
						END CHOOSE

					CASE ELSE			//	Assume it's a DragObject

						ldrg_Resize		= iwo_RightBottom[li_Cnt]
						
						CHOOSE CASE ii_RightBottomPosition[li_Cnt]
							CASE RIGHT
								If ldrg_Resize.X + ldrg_Resize.Width < li_point Then 
									li_point = ldrg_Resize.X + ldrg_Resize.Width
								End If
							CASE RIGHT_ANCHORED
								IF ldrg_Resize.X < li_MinPoint THEN
									li_MinPoint	= ldrg_Resize.X
								END IF
								IF ldrg_Resize.X + ldrg_Resize.Width > li_MaxPoint THEN
									li_MaxPoint	= ldrg_Resize.X + ldrg_Resize.Width
								END IF
						END CHOOSE
						
				END CHOOSE
				
			End If
		Next
	
		// Take into account the split bar itself and the minimum object size.
		li_extremepoint = li_point - (ii_barwidth + ii_minobjectsize)		

		IF li_MinPoint <> HIGH_VALUE AND li_MaxPoint <> LOW_VALUE THEN
			li_extremepoint		= li_ExtremePoint - (li_MaxPoint - li_MinPoint)
		END IF
		
	CASE TOPMOST		
		
		// Initialize the extreme point.
		li_point = LOW_VALUE
		li_MinPoint					= HIGH_VALUE
		li_MaxPoint					= LOW_VALUE
		
		// Find the top most point.		
		For li_cnt = 1 to UpperBound(iwo_lefttop)
			If IsValid(iwo_lefttop[li_cnt]) Then
				
				CHOOSE CASE TypeOf(iwo_LeftTop[li_Cnt])
					CASE Line!
					CASE Oval!
							
						lov_Resize		= iwo_LeftTop[li_Cnt]

						CHOOSE CASE ii_LeftTopPosition[li_Cnt]
							CASE ABOVE
								If lov_Resize.Y > li_point Then 
									li_point = lov_Resize.Y
								End If
							CASE ABOVE_ANCHORED
								IF lov_Resize.Y < li_MinPoint THEN
									li_MinPoint	= lov_Resize.Y
								END IF
								IF lov_Resize.Y + lov_Resize.Height > li_MaxPoint THEN
									li_MaxPoint	= lov_Resize.Y + lov_Resize.Height
								END IF
						END CHOOSE
	
					CASE RoundRectangle!
							
						lrr_Resize		= iwo_LeftTop[li_Cnt]
							
						CHOOSE CASE ii_LeftTopPosition[li_Cnt]
							CASE ABOVE
								If lrr_Resize.Y > li_point Then 
									li_point = lrr_Resize.Y
								End If
							CASE ABOVE_ANCHORED
								IF lrr_Resize.Y < li_MinPoint THEN
									li_MinPoint	= lrr_Resize.Y
								END IF
								IF lrr_Resize.Y + lrr_Resize.Height > li_MaxPoint THEN
									li_MaxPoint	= lrr_Resize.Y + lrr_Resize.Height
								END IF
						END CHOOSE
				
					CASE Rectangle!
							
						lr_Resize		= iwo_LeftTop[li_Cnt]

						CHOOSE CASE ii_LeftTopPosition[li_Cnt]
							CASE ABOVE
								If lr_Resize.Y > li_point Then 
									li_point = lr_Resize.Y
								End If
							CASE ABOVE_ANCHORED
								IF lr_Resize.Y < li_MinPoint THEN
									li_MinPoint	= lr_Resize.Y
								END IF
								IF lr_Resize.Y + lr_Resize.Height > li_MaxPoint THEN
									li_MaxPoint	= lr_Resize.Y + lr_Resize.Height
								END IF
						END CHOOSE

					CASE ELSE			//	Assume it's a DragObject

						ldrg_Resize		= iwo_LeftTop[li_Cnt]
						
						CHOOSE CASE ii_LeftTopPosition[li_Cnt]
							CASE ABOVE
								If ldrg_Resize.Y > li_point Then 
									li_point = ldrg_Resize.Y
								End If
							CASE ABOVE_ANCHORED
								IF ldrg_Resize.Y < li_MinPoint THEN
									li_MinPoint	= ldrg_Resize.Y
								END IF
								IF ldrg_Resize.Y + ldrg_Resize.Height > li_MaxPoint THEN
									li_MaxPoint	= ldrg_Resize.Y + ldrg_Resize.Height
								END IF
						END CHOOSE
						
				END CHOOSE
				
			End If
		Next

		// Take into account the the minimum object size.
		li_extremepoint = li_point + ii_minobjectsize

		IF li_MinPoint <> HIGH_VALUE AND li_MaxPoint <> LOW_VALUE THEN
			li_extremepoint		= li_ExtremePoint + (li_MaxPoint - li_MinPoint)
		END IF

	CASE BOTTOMMOST	
		
		// Initialize the extreme point.
		li_point = HIGH_VALUE		
		li_MinPoint					= HIGH_VALUE
		li_MaxPoint					= LOW_VALUE
		
		// Find the bottom most point.		
		For li_cnt = 1 to UpperBound(iwo_rightbottom)
			If IsValid(iwo_rightbottom[li_cnt]) Then
				
				CHOOSE CASE TypeOf(iwo_RightBottom[li_Cnt])
					CASE Line!
					CASE Oval!
							
						lov_Resize		= iwo_RightBottom[li_Cnt]

						CHOOSE CASE ii_RightBottomPosition[li_Cnt]
							CASE BELOW
								If lov_Resize.Y + lov_Resize.Height < li_point Then 
									li_point	= lov_Resize.Y + lov_Resize.Height
								End If
							CASE BELOW_ANCHORED
								IF lov_Resize.Y < li_MinPoint THEN
									li_MinPoint	= lov_Resize.Y
								END IF
								IF lov_Resize.Y + lov_Resize.Height > li_MaxPoint THEN
									li_MaxPoint	= lov_Resize.Y + lov_Resize.Height
								END IF
						END CHOOSE
	
					CASE RoundRectangle!
							
						lrr_Resize		= iwo_RightBottom[li_Cnt]
							
						CHOOSE CASE ii_RightBottomPosition[li_Cnt]
							CASE BELOW
								If lrr_Resize.Y + lrr_Resize.Height < li_point Then 
									li_point	= lrr_Resize.Y + lrr_Resize.Height
								End If
							CASE BELOW_ANCHORED
								IF lrr_Resize.Y < li_MinPoint THEN
									li_MinPoint	= lrr_Resize.Y
								END IF
								IF lrr_Resize.Y + lrr_Resize.Height > li_MaxPoint THEN
									li_MaxPoint	= lrr_Resize.Y + lrr_Resize.Height
								END IF
						END CHOOSE
				
					CASE Rectangle!
							
						lr_Resize		= iwo_RightBottom[li_Cnt]

						CHOOSE CASE ii_RightBottomPosition[li_Cnt]
							CASE BELOW
								If lr_Resize.Y + lr_Resize.Height < li_point Then 
									li_point	= lr_Resize.Y + lr_Resize.Height
								End If
							CASE BELOW_ANCHORED
								IF lr_Resize.Y < li_MinPoint THEN
									li_MinPoint	= lr_Resize.Y
								END IF
								IF lr_Resize.Y + lr_Resize.Height > li_MaxPoint THEN
									li_MaxPoint	= lr_Resize.Y + lr_Resize.Height
								END IF
						END CHOOSE

					CASE ELSE			//	Assume it's a DragObject

						ldrg_Resize		= iwo_RightBottom[li_Cnt]
						
						CHOOSE CASE ii_RightBottomPosition[li_Cnt]
							CASE BELOW
								If ldrg_Resize.Y + ldrg_Resize.Height < li_point Then 
									li_point	= ldrg_Resize.Y + ldrg_Resize.Height
								End If
							CASE BELOW_ANCHORED
								IF ldrg_Resize.Y < li_MinPoint THEN
									li_MinPoint	= ldrg_Resize.Y
								END IF
								IF ldrg_Resize.Y + ldrg_Resize.Height > li_MaxPoint THEN
									li_MaxPoint	= ldrg_Resize.Y + ldrg_Resize.Height
								END IF
						END CHOOSE
						
				END CHOOSE
				
			End If
		Next

		// Take into account the split bar itself and the minimum object size.
		li_extremepoint = li_point - (ii_barwidth + ii_minobjectsize)		

		IF li_MinPoint <> HIGH_VALUE AND li_MaxPoint <> LOW_VALUE THEN
			li_extremepoint		= li_ExtremePoint - (li_MaxPoint - li_MinPoint)
		END IF

	CASE Else
		Return -1
END CHOOSE

// Make sure the initial value was replaced.
If li_point = LOW_VALUE or li_point = HIGH_VALUE Then 
	Return -1
End If

Return li_extremepoint
end function

public function integer of_SetMinObjectSize (integer ai_minsize);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetMinObjectSize
//
//	Access:  		Public
//
//	Arguments:	
//  ai_minsize		The desired minimum object size for all registered objects.
//
//	Returns:  		Integer
//						Returns 1 if it succeeds and -1 if an error occurs.
//
//	Description: 	
//	Set the desired minimum object size for all registered objects.
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

// Validate the argument.
If IsNull(ai_minsize) or ai_minsize < 0 Then
	Return -1
End If

ii_minobjectsize  = ai_minsize
Return 1
end function

public function integer of_getminobjectsize ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetMinObjectSize
//
//	Access:  		Public
//
//	Arguments:		None
//
//	Returns:  		Integer
//		The desired minimum object size for all registered objects.
//
//	Description: 	
//	Gets the desired minimum object size for all registered objects.
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

Return ii_minobjectsize
end function

public function integer of_getbarcolor ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetBarColor
//
//	Access:  		Public
//
//	Arguments:		None
//
//	Returns:  		Integer
//		The non-moving Split Bar color.
//
//	Description: 	
//		Gets the Non-Moving Split Bar Color.
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

Return il_barcolor
end function

public function string of_GetHorizontalPointer ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetHorizontalPointer
//
//	Access:  		Public
//
//	Arguments:		None
//
//	Returns:  		String
//		Returns the Horizontal Icon.
//
//	Description: 	
//		Reports the Horizontal Icon.
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

Return is_horizontalpointer
end function

public function string of_GetVerticalPointer ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetVerticalPointer
//
//	Access:  		Public
//
//	Arguments:		None
//
//	Returns:  		String
//		Returns the Vertical Icon.
//
//	Description: 	
//		Reports the Vertical Icon.
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

Return is_verticalpointer
end function

public function integer of_sethorizontalpointer (string as_icon);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetHorizontalPointer
//
//	Access:  		Public
//
//	Arguments:	
//  as_icon			The desired icon.
//
//	Returns:  		Integer
//						Returns 1 if it succeeds and -1 if an error occurs.
//
//	Description: 	Set the Horizontal Icon.
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

// Validate the argument.
If IsNull(as_icon) Or Len(Trim(as_icon)) = 0 Then
	Return -1
End If

// Set the icon.
is_horizontalpointer = as_icon
If ii_style = HORIZONTAL Then
	this.Pointer = as_icon
End If

Return 1
end function

public function integer of_setverticalpointer (string as_icon);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetVerticalPointer
//
//	Access:  		Public
//
//	Arguments:	
//  as_icon			The desired icon.
//
//	Returns:  		Integer
//						Returns 1 if it succeeds and -1 if an error occurs.
//
//	Description: 	Set the Vertical Icon.
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

// Validate the argument.
If IsNull(as_icon) Or Len(Trim(as_icon)) = 0 Then
	Return -1
End If

// Set the icon.
is_verticalpointer = as_icon
If ii_style = VERTICAL Then
	this.Pointer = as_icon
End If

Return 1
end function

public function integer of_GetBarMoveColor ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetBarMoveColor
//
//	Access:  		Public
//
//	Arguments:		None
//
//	Returns:  		Integer
//		The moving Split Bar color.
//
//	Description: 	
//		Gets the Moving Split Bar Color.
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

Return il_barmovecolor
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
anv_infoattrib.is_name = 'SplitBar'
anv_infoattrib.is_description = 'SplitBar'

Return 1
end function

protected function boolean of_issupported ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsSupported
//
//	Access:  		Public
//
//	Arguments:		None
//
//	Returns:  		Boolean
//	True if running in a supported environment.
//
//	Description: 	
//	Dtermines if object is running in a supported environment.
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

GetEnvironment (lenv_object)

If lenv_object.ostype = Macintosh! Then
	Return False
End If

Return True
end function

protected function integer of_mousemove (unsignedlong aul_flags, integer ai_xpos, integer ai_ypos);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_MouseMove
//
//	Access:  		Public
//
//	Arguments:		
//  aul_flags
//  ai_xpos
//  ai_ypos
//
//	Returns:  		Integer
//						Returns 1 if it succeeds and -1 if an error occurs.
//
//	Description: 	One of the split bars is being moved.  Refresh the location
//						of the appropriate splitbar(s) and perform redraws if requested.
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

Integer	li_pointerx, li_pointery
Integer	li_minx, li_maxx, li_miny, li_maxy
Integer	li_prevx
Integer	li_prevwidth
Integer	li_prevheight
Integer	li_prevy

// Validate required values.
If ii_style < 0 Then 
	Return -1
End If

// Validate that objects were registered.
If UpperBound(iwo_lefttop) =0 Or UpperBound(iwo_rightbottom) =0 Then
	Return -1
End If

// Always keep the Split Bar on top of other objects.
this.SetPosition(ToTop!)

// Store the Begin Movement information.
If ii_prevpositionx = UNITIALIZED or ii_prevpositiony = UNITIALIZED Then
	of_PreviousPosition(this.X, this.Y)
End If

// Store the previous placement information.
li_prevx = this.X
li_prevwidth = this.Width
li_prevy = this.Y 
li_prevheight = this.Height

// Get the new position.
If IsValid(iuo_parent) Then	
	li_pointerx = iuo_parent.PointerX()
	li_pointery = iuo_parent.PointerY()	
ElseIf IsValid(itab_parent) Then
	li_pointerx = itab_parent.PointerX()
	li_pointery = itab_parent.PointerY()
ElseIf IsValid(iw_parent) Then
	li_pointerx = iw_parent.PointerX()
	li_pointery = iw_parent.PointerY()
Else
	Return -1
End If

// Calculate the Extreme points the split bars can be moved.
If ii_style = HORIZONTAL Then
	li_miny = of_GetExtremePoint(TOPMOST)
	li_maxy = of_GetExtremePoint(BOTTOMMOST)
	If li_pointery < li_miny Then
		li_pointery = li_miny
	ElseIf li_pointery > li_maxy Then
		li_pointery = li_maxy
	End If	
ElseIf ii_style = VERTICAL Then
	li_minx = of_GetExtremePoint(LEFTMOST)
	li_maxx = of_GetExtremePoint(RIGHTMOST)
	If li_pointerx < li_minx Then
		li_pointerx = li_minx
	ElseIf li_pointerx > li_maxx Then
		li_pointerx = li_maxx
	End If
End If

// Change to the "Moving" color.
this.BackColor = il_barmovecolor

If ii_style = HORIZONTAL Then
		
	// Position bar on its new location.
	this.Y = li_pointery
	// Refresh the Width of the bar.
	this.Height = ii_barwidth
		
	// Perform redraws when appropriate.
	If ib_performredraw Then
		If (li_prevy <> this.Y) Then
			of_Redraw(li_prevx, li_prevwidth, li_prevy, li_prevheight)
		End If
	End If

ElseIf ii_style = VERTICAL Then
	
	// Position bar on its new location.		
	this.X = li_pointerx
	// Refresh the Width of the bar.
	this.Width = ii_barwidth	

	// Perform redraws when appropriate.
	If ib_performredraw Then
		If (li_prevx <> this.X) Then
			of_Redraw(li_prevx, li_prevwidth, li_prevy, li_prevheight)
		End If
	End If
		
End If

Return 1

end function

protected function integer of_redraw (integer ai_prevx, integer ai_prevwidth, integer ai_prevy, integer ai_prevheight);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Redraw
//
//	Access:  		protected
//
//	Arguments:		
//	 ai_prevx 		The bar previous X location.
//	 ai_prevwidth 	The bar previous Width.
//	 ai_prevy 		The bar previous Y location.
//	 ai_prevheight The bar previous Height.
//
//	Returns:  		Integer
//						1 if it succeeds and -1 if an error occurs.
//
//	Description:	Perform a Redraw on those object which may be still showing
//						the bar on its previous position.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//	12.5	10/16/2014			Add support for rectangle, roundRectangle, oval and
//									line.  Since setReDraw() is not part of drawObjects,
//									they are currently not yet implemented.  Might be
//									able to force reDraw by calling Hide()/Show(), but
//									actually haven't found the need to make them work
//									yet.
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

Integer li_cnt

// Validate required values.
If ii_style <0 or ii_barwidth <0 Then 
	Return -1
End If

DragObject					ldrg_Resize
Rectangle					lr_Resize
RoundRectangle				lrr_Resize
Oval							lov_Resize

If ii_style = HORIZONTAL Then
	// Redraw the objects above the Horizontal Split Bar.
	For li_cnt = 1 to ii_lefttopbound
		If IsValid(iwo_lefttop[li_cnt]) Then
			
			CHOOSE CASE TypeOf(iwo_LeftTop[li_Cnt])
				CASE Line!
				CASE Oval!
				CASE RoundRectangle!
				CASE Rectangle!
				CASE ELSE			//	Assume it's a DragObject
					
					ldrg_Resize		= iwo_LeftTop[li_Cnt]
					
					If (ai_prevy >= ldrg_Resize.Y Or &
						 ai_prevy + ai_prevheight >= ldrg_Resize.Y) And &
						ai_prevy < ldrg_Resize.Y + ldrg_Resize.Height Then				
						ldrg_Resize.SetRedraw(True)
					End If
			
			END CHOOSE
	
		End If
	Next

	// Redraw the objects below the Horizontal Split Bar.
	For li_cnt = 1 to ii_rightbottombound
		If IsValid(iwo_rightbottom[li_cnt]) Then

			CHOOSE CASE TypeOf(iwo_RightBottom[li_Cnt])
				CASE Line!
				CASE Oval!
				CASE RoundRectangle!
				CASE Rectangle!
				CASE ELSE			//	Assume it's a DragObject

				ldrg_Resize			= iwo_RightBottom[li_Cnt]
				
				If (ai_prevy >= ldrg_Resize.Y Or & 
					 ai_prevy + ai_prevheight >= ldrg_Resize.Y ) And &
					ai_prevy < ldrg_Resize.Y + ldrg_Resize.Height Then				
					ldrg_Resize.SetRedraw(True)
				End If
			
			END CHOOSE
	
		End If
	Next		
ElseIf ii_style = VERTICAL Then
	
	// Redraw the objects left of the Vertical Split Bar.				
	For li_cnt = 1 to ii_lefttopbound
		If IsValid(iwo_lefttop[li_cnt]) Then
			
			CHOOSE CASE TypeOf(iwo_LeftTop[li_Cnt])
				CASE Line!
				CASE Oval!
				CASE RoundRectangle!
				CASE Rectangle!
				CASE ELSE			//	Assume it's a DragObject

				ldrg_Resize			= iwo_LeftTop[li_Cnt]
	
				If (ai_prevx >= ldrg_Resize.X Or & 
					 ai_prevx + ai_prevwidth >= ldrg_Resize.X) And &
					ai_prevx < ldrg_Resize.X + ldrg_Resize.Width Then				
					ldrg_Resize.SetRedraw(True)
				End If
			
			END CHOOSE
	
		End If
	Next

	// Redraw the objects right of the Vertical Split Bar.				
	For li_cnt = 1 to ii_rightbottombound
		If IsValid(iwo_rightbottom[li_cnt]) Then
			
			CHOOSE CASE TypeOf(iwo_RightBottom[li_Cnt])
				CASE Line!
				CASE Oval!
				CASE RoundRectangle!
				CASE Rectangle!
				CASE ELSE			//	Assume it's a DragObject

					ldrg_Resize		= iwo_RightBottom[li_Cnt]
					
					If (ai_prevx >= ldrg_Resize.X Or & 
						 ai_prevx + ai_prevwidth >= ldrg_Resize.X) And &
						ai_prevx < ldrg_Resize.X + ldrg_Resize.Width Then				
						ldrg_Resize.SetRedraw(True)
					End If
					
			END CHOOSE
			
		End If
	Next		
End If

Return 1
end function

public function integer of_register (windowobject awo_object, integer ai_position);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Register
//
//	Access:  		public
//
//	Arguments:
//  adrg_object	The object to register with the service.
//  ai_position	The position of the object in relation to the splitbar.
//	
//	Returns:  		integer
//						1 if it succeeds 
//						-1 if an error registering the objects occurs.
//
//	Description:  	Register controls which need to either be moved and/or resized
//						when the split bar object is moved.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//	12.5	10/16/2014			Change object parameter from dragObject to
//									windowObject.
//									Add validation for new position types.
//									Add support for rectangle, roundRectangle, oval and
//									line.
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

Integer	li_upperbound
Integer	li_obj

// Validate required values.
If ii_style <0 or ii_barwidth <0 Then 
	Return -1
End If

// Validate the dragobject.
If IsNull(awo_object) Or Not IsValid(awo_object) Then 
	Return -1
End If

// Validate the position parameter.
If IsNull(ai_position) Or ai_position < LEFT Or ai_position > BELOW_ANCHORED Then 
	Return -1
Else
	If (ii_style = HORIZONTAL) And &
		(ai_position = LEFT OR ai_Position = LEFT_ANCHORED Or ai_position = RIGHT OR ai_Position = RIGHT_ANCHORED) Then
		Return -1
	ElseIf (ii_style = VERTICAL) And &
		(ai_position = ABOVE OR ai_Position = ABOVE_ANCHORED Or ai_position = BELOW OR ai_Position = BELOW_ANCHORED) Then
		Return -1
	End If
End If

// Make sure this object is not already registered on the left/top array.
li_upperbound = UpperBound (iwo_lefttop)
For li_obj = 1 to li_upperbound
	If IsValid(iwo_lefttop[li_obj]) Then
		If awo_object = iwo_lefttop[li_obj] Then
			Return -1
		End If
	End If
Next

// Make sure this object is not already registered on the right/bottom array.
li_upperbound = UpperBound (iwo_rightBottom)
For li_obj = 1 to li_upperbound
	If IsValid(iwo_rightBottom[li_obj]) Then
		If awo_object = iwo_rightBottom[li_obj] Then
			Return -1
		End If
	End If
Next

Line							lln_resize
DragObject					ldrg_resize
Rectangle					lr_resize
RoundRectangle				lrr_resize
Oval							lov_resize

// Register the new object.
If ai_position = LEFT OR ai_Position = LEFT_ANCHORED Or ai_position = ABOVE OR ai_Position = ABOVE_ANCHORED Then
	
	CHOOSE CASE TypeOf(awo_Object)
			
		CASE Line!

			ii_leftTopBound							= UpperBound(iwo_leftTop[]) + 1
			
			lln_resize									= awo_Object
			
			iwo_leftTop[ii_leftTopBound]			= lln_resize
			ir_leftTopX[ii_leftTopBound]			= lln_resize.BeginX
			ir_leftTopY[ii_leftTopBound]			= lln_resize.BeginY
			ir_leftTopWidth[ii_leftTopBound]		= lln_resize.EndX
			ir_leftTopHeight[ii_leftTopBound]	= lln_resize.EndY	
			ii_leftTopPosition[ii_leftTopBound]	= ai_position
			
		CASE Oval!
			
			ii_leftTopBound							= UpperBound(iwo_leftTop[]) + 1
			
			lov_resize									= awo_Object
			
			iwo_leftTop[ii_leftTopBound]			= lov_resize
			ir_leftTopX[ii_leftTopBound]			= lov_resize.X
			ir_leftTopY[ii_leftTopBound]			= lov_resize.Y
			ir_leftTopWidth[ii_leftTopBound]		= lov_resize.Width
			ir_leftTopHeight[ii_leftTopBound]	= lov_resize.Height	
			ii_leftTopPosition[ii_leftTopBound]	= ai_position

		CASE RoundRectangle!
			
			ii_leftTopBound							= UpperBound(iwo_leftTop[]) + 1
			
			lrr_resize									= awo_Object
			
			iwo_leftTop[ii_leftTopBound]			= lrr_resize
			ir_leftTopX[ii_leftTopBound]			= lrr_resize.X
			ir_leftTopY[ii_leftTopBound]			= lrr_resize.Y
			ir_leftTopWidth[ii_leftTopBound]		= lrr_resize.Width
			ir_leftTopHeight[ii_leftTopBound]	= lrr_resize.Height	
			ii_leftTopPosition[ii_leftTopBound]	= ai_position
			
		CASE Rectangle!

			ii_leftTopBound							= UpperBound(iwo_leftTop[]) + 1
			
			lr_resize									= awo_Object
			
			iwo_leftTop[ii_leftTopBound]			= lr_resize
			ir_leftTopX[ii_leftTopBound]			= lr_resize.X
			ir_leftTopY[ii_leftTopBound]			= lr_resize.Y
			ir_leftTopWidth[ii_leftTopBound]		= lr_resize.Width
			ir_leftTopHeight[ii_leftTopBound]	= lr_resize.Height	
			ii_leftTopPosition[ii_leftTopBound]	= ai_position

		CASE ELSE										//	Assume it's a DragObject
			
			ii_leftTopBound							= UpperBound(iwo_leftTop[]) + 1
			
			ldrg_resize									= awo_Object
			
			iwo_leftTop[ii_lefttopbound]			= ldrg_resize
			ir_leftTopX[ii_lefttopbound]			= ldrg_resize.X
			ir_leftTopY[ii_lefttopbound]			= ldrg_resize.Y
			ir_leftTopWidth[ii_lefttopbound]		= ldrg_resize.Width
			ir_leftTopHeight[ii_lefttopbound]	= ldrg_resize.Height	
			ii_leftTopPosition[ii_LeftTopBound]	= ai_position
			
	END CHOOSE
	
Else
	
	CHOOSE CASE TypeOf(awo_Object)
			
		CASE Line!
			
			ii_rightBottomBound						= UpperBound(iwo_rightBottom[]) + 1
			
			lln_resize									= awo_Object
			
			iwo_rightBottom[ii_rightBottomBound]			= lln_resize
			ir_rightBottomX[ii_rightBottomBound]			= lln_resize.BeginX
			ir_rightBottomY[ii_rightBottomBound]			= lln_resize.BeginY
			ir_rightBottomWidth[ii_rightBottomBound]		= lln_resize.EndX
			ir_rightBottomHeight[ii_rightBottomBound]		= lln_resize.EndY	
			ii_rightBottomPosition[ii_rightBottomBound]	= ai_position

		CASE Oval!
			
			ii_rightBottomBound						= UpperBound(iwo_rightBottom[]) + 1
			
			lov_resize									= awo_Object
			
			iwo_rightBottom[ii_rightBottomBound]			= lov_resize
			ir_rightBottomX[ii_rightBottomBound]			= lov_resize.X
			ir_rightBottomY[ii_rightBottomBound]			= lov_resize.Y
			ir_rightBottomWidth[ii_rightBottomBound]		= lov_resize.Width
			ir_rightBottomHeight[ii_rightBottomBound]		= lov_resize.Height	
			ii_rightBottomPosition[ii_rightBottomBound]	= ai_position

		CASE RoundRectangle!
			
			ii_rightBottomBound						= UpperBound(iwo_rightBottom[]) + 1
			
			lrr_resize									= awo_Object
			
			iwo_rightBottom[ii_rightBottomBound]			= lrr_resize
			ir_rightBottomX[ii_rightBottomBound]			= lrr_resize.X
			ir_rightBottomY[ii_rightBottomBound]			= lrr_resize.Y
			ir_rightBottomWidth[ii_rightBottomBound]		= lrr_resize.Width
			ir_rightBottomHeight[ii_rightBottomBound]		= lrr_resize.Height	
			ii_rightBottomPosition[ii_rightBottomBound]	= ai_position
			
		CASE Rectangle!

			ii_rightBottomBound						= UpperBound(iwo_rightBottom[]) + 1
			
			lr_resize									= awo_Object
			
			iwo_rightBottom[ii_rightBottomBound]			= lr_resize
			ir_rightBottomx[ii_rightBottomBound]			= lr_resize.X
			ir_rightBottomy[ii_rightBottomBound]			= lr_resize.Y
			ir_rightBottomwidth[ii_rightBottomBound]		= lr_resize.Width
			ir_rightBottomheight[ii_rightBottomBound]		= lr_resize.Height	
			ii_rightBottomPosition[ii_rightBottomBound]	= ai_position
		
		CASE ELSE										//	Assume it's a DragObject
	
			ii_rightBottomBound 						= UpperBound(iwo_rightBottom[]) + 1
			
			ldrg_resize									= awo_Object
	
			iwo_rightBottom[ii_rightBottomBound]			= ldrg_resize
			ir_rightBottomX[ii_rightBottomBound]			= ldrg_resize.X
			ir_rightBottomY[ii_rightBottomBound]			= ldrg_resize.Y
			ir_rightBottomWidth[ii_rightBottomBound]		= ldrg_resize.Width
			ir_rightBottomHeight[ii_rightBottomBound]		= ldrg_resize.Height		
			ii_rightBottomPosition[ii_rightBottomBound]	= ai_position
		
	END CHOOSE

End If

Return 1
end function

public function integer of_unregister_all ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_unRegister_all
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Integer
//						Returns 1 if it succeeds and -1 if an error occurs.
//
//	Description: 	UnRegister all objects currently registered.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//
//	12.5   			Initial version
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
// 
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Integer						li_objects,	li_object

// Validate required values.
IF ii_style < 0 OR ii_barwidth < 0 THEN 
	Return(-1)
END IF

// UnRregister the left/top array.
li_objects					= UpperBound(iwo_leftTop[])
FOR li_object = 1 TO li_objects
	IF IsValid(iwo_leftTop[li_object]) THEN
		IF of_unRegister(iwo_leftTop[li_object]) = -1 THEN Return(-1)
	END IF
NEXT

// UnRregister the right/bottom array.
li_objects					= UpperBound(iwo_rightBottom[])
FOR li_object = 1 TO li_objects
	IF IsValid(iwo_rightBottom[li_object]) THEN
		IF of_unRegister(iwo_rightBottom[li_object]) = -1 THEN Return(-1)
	END IF
NEXT

//	All objects unRegistered
Return(1)
end function

public function integer of_unregister (windowobject awo_object);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_unRegister
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Integer
//						Returns 1 if it succeeds and -1 if an error occurs.
//
//	Description: 	UnRegister an object currently registered.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//
//	12.5   			Initial version
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
// 
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  FOR more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Integer						li_objects,	li_object

// Validate required values.
IF ii_style < 0 OR ii_barwidth < 0 THEN
	Return(-1)
END IF

// Validate the windowobject.
IF IsNull(awo_object) OR (NOT IsValid(awo_object)) THEN 
	Return(-1)
END IF

// Check if this object is registered on the left/top array.
li_objects					= UpperBound(iwo_lefttop[])
FOR li_object = 1 TO li_objects
	IF IsValid(iwo_leftTop[li_object]) THEN
		IF awo_object = iwo_leftTop[li_object] THEN
			
			SetNull(iwo_leftTop[li_object])
			
			ir_leftTopX[li_object]					= 0
			ir_leftTopY[li_object]					= 0
			ir_leftTopWidth[li_object]				= 0
			ir_leftTopHeight[li_object]			= 0
			ii_leftTopPosition[li_object]			= 0

			Return(1)
			
		END IF
	END IF
NEXT

// Check if this object is registered on the right/bottom array.
li_objects					= UpperBound (iwo_rightBottom[])
FOR li_object = 1 TO li_objects
	IF IsValid(iwo_rightBottom[li_object]) THEN
		IF awo_object = iwo_rightBottom[li_object] THEN
			
			SetNull(iwo_rightBottom[li_object])
			
			ir_rightBottomX[li_object]				= 0
			ir_rightBottomY[li_object]				= 0
			ir_rightBottomWidth[li_object]		= 0
			ir_rightBottomHeight[li_object]		= 0	
			ii_rightBottomPosition[li_object]	= 0

			Return(1)
		
		END IF
	END IF
NEXT

//	Object not registered
Return(-1)
end function

public subroutine of_move (long al_newx, long al_newy);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Move
//
//	Access:  		public
//
//	Arguments:		al_newX		New X postion
//						al_newY		New Y postion
//
//	Returns:  		None
//
//	Description: 	Provides the ability to programmatically move a splitBar.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//
//	12.5   			Initial version
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
// 
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Integer							li_X,	li_Y

li_X								= X
li_Y								= Y

Move(al_NewX, al_NewY)

of_PreviousPosition(li_X, li_Y)
of_Moved(X, Y)

RETURN

end subroutine

private subroutine of_moved (integer ai_pointerx, integer ai_pointery);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Moved
//
//	Access:  		private
//
//	Arguments:		ai_pointerX		Pointer's X position
//						ai_pointerY		Pointer's Y position
//
//	Returns:  		None
//
//	Description: 	Functionalized code that was originally in
//						of_lButtonUp().  This helps provide ability to move the
//						splitBar programatically by calling
//						of_Move(newX, new Y),
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//
//	12.5	Initial version	When code was moved, added logic for "anchored"
//									objects and support for rectangle,
//									roundRectangle, oval and line.
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
// 
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Integer						li_MinX,		li_MinY
Integer						li_MaxX,		li_MaxY
Integer						li_DeltaX,	li_DeltaY,	li_Cnt

// Calculate the Extreme points the split bars can be moved.
If ii_style = HORIZONTAL Then
	li_miny = of_GetExtremePoint(TOPMOST)
	li_maxy = of_GetExtremePoint(BOTTOMMOST)
	If ai_PointerY < li_miny Then
		ai_PointerY = li_miny
	ElseIf ai_PointerY > li_maxy Then
		ai_PointerY = li_maxy
	End If	
ElseIf ii_style = VERTICAL Then
	li_minx = of_GetExtremePoint(LEFTMOST)
	li_maxx = of_GetExtremePoint(RIGHTMOST)
	If ai_PointerX < li_minx Then
		ai_PointerX = li_minx
	ElseIf ai_PointerX > li_maxx Then
		ai_PointerX = li_maxx
	End If
End If

// Calculate delta values.
li_deltax = ai_PointerX - ii_prevpositionx
li_deltay = ai_PointerY - ii_prevpositiony

// Minimize size rounding problems.
of_UpdateObjectData()

Line							lln_resize
DragObject					ldrg_Resize
Rectangle					lr_Resize
RoundRectangle				lrr_Resize
Oval							lov_Resize

If ii_style = HORIZONTAL Then
	// Position bar on its new location.
	this.Y = ai_PointerY
	// Refresh the Width of the bar.
	this.Height = ii_barwidth

	// Resize the objects above the horizontal split bar.
	For li_cnt = 1 to UpperBound(iwo_lefttop)
		If IsValid(iwo_lefttop[li_cnt]) Then
			
			CHOOSE CASE TypeOf(iwo_LeftTop[li_Cnt])
					
				CASE Line!
					
					lln_resize		= iwo_leftTop[li_cnt]

					CHOOSE CASE ii_leftTopPosition[li_cnt]
						CASE ABOVE
							ir_leftTopHeight[li_cnt] += li_deltaY		
						CASE ABOVE_ANCHORED
							ir_leftTopY[li_cnt] += li_deltaY		
							ir_leftTopHeight[li_cnt] += li_deltaY		
							lln_resize.Move(ir_leftTopX[li_cnt], ir_leftTopY[li_cnt])
					END CHOOSE
					
					lln_resize.Resize(ir_leftTopWidth[li_cnt], ir_leftTopHeight[li_cnt])

				CASE Oval!
					
					lov_Resize		= iwo_LeftTop[li_Cnt]
					
					CHOOSE CASE ii_LeftTopPosition[li_Cnt]
						CASE ABOVE
							ir_lefttopheight[li_cnt] += li_deltay		
						CASE ABOVE_ANCHORED
							ir_LeftTopY[li_Cnt] += li_DeltaY		
							lov_Resize.Move(ir_LeftTopX[li_Cnt], ir_LeftTopY[li_Cnt])
					END CHOOSE
					
					lov_Resize.Resize(ir_lefttopwidth[li_cnt], ir_lefttopheight[li_cnt])

				CASE RoundRectangle!
					
					lrr_Resize		= iwo_LeftTop[li_Cnt]
					
					CHOOSE CASE ii_LeftTopPosition[li_Cnt]
						CASE ABOVE
							ir_lefttopheight[li_cnt] += li_deltay		
						CASE ABOVE_ANCHORED
							ir_LeftTopY[li_Cnt] += li_DeltaY		
							lrr_Resize.Move(ir_LeftTopX[li_Cnt], ir_LeftTopY[li_Cnt])
					END CHOOSE
					
					lrr_Resize.Resize(ir_lefttopwidth[li_cnt], ir_lefttopheight[li_cnt])

				CASE Rectangle!
					
					lr_Resize		= iwo_LeftTop[li_Cnt]
					
					CHOOSE CASE ii_LeftTopPosition[li_Cnt]
						CASE ABOVE
							ir_lefttopheight[li_cnt] += li_deltay		
						CASE ABOVE_ANCHORED
							ir_LeftTopY[li_Cnt] += li_DeltaY		
							lr_Resize.Move(ir_LeftTopX[li_Cnt], ir_LeftTopY[li_Cnt])
					END CHOOSE
					
					lr_Resize.Resize(ir_lefttopwidth[li_cnt], ir_lefttopheight[li_cnt])

				CASE ELSE			//	Assume it's a DragObject
					
					ldrg_Resize		= iwo_LeftTop[li_Cnt]
					
					CHOOSE CASE ii_LeftTopPosition[li_Cnt]
						CASE ABOVE
							ir_lefttopheight[li_cnt] += li_deltay		
						CASE ABOVE_ANCHORED
							ir_LeftTopY[li_Cnt] += li_DeltaY		
							ldrg_Resize.Move(ir_LeftTopX[li_Cnt], ir_LeftTopY[li_Cnt])
					END CHOOSE
					
					ldrg_Resize.Resize(ir_lefttopwidth[li_cnt], ir_lefttopheight[li_cnt])
			
			END CHOOSE
	
		End If
	Next
	
	// Resize the objects below the horizontal split bar.	
	For li_cnt = 1 to UpperBound(iwo_rightbottom)
		If IsValid(iwo_rightbottom[li_cnt]) Then
			
			CHOOSE CASE TypeOf(iwo_RightBottom[li_Cnt])
					
				CASE Line!
					
					lln_resize		= iwo_RightBottom[li_cnt]

					CHOOSE CASE ii_RightBottomPosition[li_cnt]
						CASE BELOW
							ir_rightBottomY[li_cnt] += li_deltaY		
						CASE BELOW_ANCHORED
							ir_rightBottomY[li_cnt] += li_deltaY		
							ir_rightBottomHeight[li_cnt] += li_deltaY		
					END CHOOSE
					
					lln_resize.Move(ir_rightBottomX[li_cnt], ir_rightBottomY[li_cnt])
					lln_resize.Resize(ir_rightBottomWidth[li_cnt], ir_rightBottomHeight[li_cnt])

				CASE Oval!
					
					lov_Resize		= iwo_RightBottom[li_Cnt]
					
					CHOOSE CASE ii_RightBottomPosition[li_Cnt]
						CASE BELOW
							ir_rightbottomy[li_cnt] += li_deltay		
							ir_rightbottomheight[li_cnt] -= li_deltay		
						CASE BELOW_ANCHORED
							ir_RightBottomY[li_Cnt] += li_DeltaY
					END CHOOSE
					
					lov_Resize.Move(ir_rightbottomx[li_cnt], ir_rightbottomy[li_cnt])
					lov_Resize.Resize (ir_rightbottomwidth[li_cnt], ir_rightbottomheight[li_cnt])

				CASE RoundRectangle!
					
					lrr_Resize		= iwo_RightBottom[li_Cnt]
					
					CHOOSE CASE ii_RightBottomPosition[li_Cnt]
						CASE BELOW
							ir_rightbottomy[li_cnt] += li_deltay		
							ir_rightbottomheight[li_cnt] -= li_deltay		
						CASE BELOW_ANCHORED
							ir_RightBottomY[li_Cnt] += li_DeltaY
					END CHOOSE
					
					lrr_Resize.Move(ir_rightbottomx[li_cnt], ir_rightbottomy[li_cnt])
					lrr_Resize.Resize (ir_rightbottomwidth[li_cnt], ir_rightbottomheight[li_cnt])

				CASE Rectangle!
					
					lr_Resize		= iwo_RightBottom[li_Cnt]
					
					CHOOSE CASE ii_RightBottomPosition[li_Cnt]
						CASE BELOW
							ir_rightbottomy[li_cnt] += li_deltay		
							ir_rightbottomheight[li_cnt] -= li_deltay		
						CASE BELOW_ANCHORED
							ir_RightBottomY[li_Cnt] += li_DeltaY
					END CHOOSE
					
					lr_Resize.Move(ir_rightbottomx[li_cnt], ir_rightbottomy[li_cnt])
					lr_Resize.Resize (ir_rightbottomwidth[li_cnt], ir_rightbottomheight[li_cnt])

				CASE ELSE			//	Assume it's a DragObject
					
					ldrg_Resize		= iwo_RightBottom[li_Cnt]
					
					CHOOSE CASE ii_RightBottomPosition[li_Cnt]
						CASE BELOW
							ir_rightbottomy[li_cnt] += li_deltay		
							ir_rightbottomheight[li_cnt] -= li_deltay		
						CASE BELOW_ANCHORED
							ir_RightBottomY[li_Cnt] += li_DeltaY
					END CHOOSE
					
					ldrg_Resize.Move(ir_rightbottomx[li_cnt], ir_rightbottomy[li_cnt])
					ldrg_Resize.Resize (ir_rightbottomwidth[li_cnt], ir_rightbottomheight[li_cnt])
					
			END CHOOSE
					
		End If
	Next	

ElseIf ii_style = VERTICAL Then
	// Position bar on its new location.	
	this.X = ai_PointerX
	// Refresh the Width of the bar.
	this.Width = ii_barwidth	
	
	// Resize the objects left of the verticalbar.
	For li_cnt = 1 to UpperBound(iwo_lefttop)
		If IsValid(iwo_lefttop[li_cnt]) Then
			
			CHOOSE CASE TypeOf(iwo_LeftTop[li_Cnt])
					
				CASE Line!
					
					lln_resize		= iwo_leftTop[li_cnt]
					
					CHOOSE CASE ii_leftTopPosition[li_cnt]
						CASE LEFT
							ir_leftTopWidth[li_cnt] += li_deltaX
						CASE LEFT_ANCHORED
							ir_leftTopX[li_cnt] += li_deltaX
							ir_leftTopWidth[li_cnt] += li_deltaX
							lln_resize.Move(ir_leftTopX[li_cnt], ir_leftTopY[li_cnt])
					END CHOOSE
					
					lln_resize.Resize(ir_leftTopWidth[li_cnt], ir_leftTopHeight[li_cnt])
					
				CASE Oval!
					
					lov_Resize		= iwo_LeftTop[li_Cnt]
					
					CHOOSE CASE ii_LeftTopPosition[li_Cnt]
						CASE LEFT
							ir_lefttopwidth[li_cnt] += li_deltax
						CASE LEFT_ANCHORED
							ir_LeftTopX[li_cnt] += li_deltax
							lov_Resize.Move(ir_LeftTopX[li_Cnt], ir_LeftTopY[li_Cnt])
					END CHOOSE
					
					lov_Resize.Resize(ir_lefttopwidth[li_cnt], ir_lefttopheight[li_cnt])
					
				CASE RoundRectangle!
					
					lrr_Resize		= iwo_LeftTop[li_Cnt]
					
					CHOOSE CASE ii_LeftTopPosition[li_Cnt]
						CASE LEFT
							ir_lefttopwidth[li_cnt] += li_deltax
						CASE LEFT_ANCHORED
							ir_LeftTopX[li_cnt] += li_deltax
							lrr_Resize.Move(ir_LeftTopX[li_Cnt], ir_LeftTopY[li_Cnt])
					END CHOOSE
					
					lrr_Resize.Resize(ir_lefttopwidth[li_cnt], ir_lefttopheight[li_cnt])
					
				CASE Rectangle!
					
					lr_Resize		= iwo_LeftTop[li_Cnt]
					
					CHOOSE CASE ii_LeftTopPosition[li_Cnt]
						CASE LEFT
							ir_lefttopwidth[li_cnt] += li_deltax
						CASE LEFT_ANCHORED
							ir_LeftTopX[li_cnt] += li_deltax
							lr_Resize.Move(ir_LeftTopX[li_Cnt], ir_LeftTopY[li_Cnt])
					END CHOOSE
					
					lr_Resize.Resize(ir_lefttopwidth[li_cnt], ir_lefttopheight[li_cnt])
					
				CASE ELSE			//	Assume it's a DragObject
					
					ldrg_Resize		= iwo_LeftTop[li_Cnt]
					
					CHOOSE CASE ii_LeftTopPosition[li_Cnt]
						CASE LEFT
							ir_lefttopwidth[li_cnt] += li_deltax
						CASE LEFT_ANCHORED
							ir_LeftTopX[li_cnt] += li_deltax
							ldrg_Resize.Move(ir_LeftTopX[li_Cnt], ir_LeftTopY[li_Cnt])
					END CHOOSE
					
					ldrg_Resize.Resize(ir_lefttopwidth[li_cnt], ir_lefttopheight[li_cnt])
					
			END CHOOSE
			
		End If
	Next
	
	// Resize the objects right of the verticalbar.	
	For li_cnt = 1 to UpperBound(iwo_rightbottom)
		If IsValid(iwo_rightbottom[li_cnt]) Then
			
			CHOOSE CASE TypeOf(iwo_RightBottom[li_Cnt])
					
				CASE Line!
					
					lln_resize		= iwo_rightBottom[li_cnt]
					
					CHOOSE CASE ii_rightBottomPosition[li_cnt]
						CASE RIGHT
							ir_rightBottomX[li_cnt] += li_deltaX	
						CASE RIGHT_ANCHORED
							ir_rightBottomX[li_cnt] += li_deltaX	
							ir_rightBottomWidth[li_cnt] += li_deltaX
					END CHOOSE
					
					lln_resize.Move(ir_rightBottomX[li_cnt], ir_rightBottomY[li_cnt])
					lln_resize.Resize(ir_rightBottomWidth[li_cnt], ir_rightBottomHeight[li_cnt])
					
				CASE Oval!
					
					lov_Resize		= iwo_RightBottom[li_Cnt]
					
					CHOOSE CASE ii_RightBottomPosition[li_Cnt]
						CASE RIGHT
							ir_rightbottomx[li_cnt] += li_deltax	
							ir_rightbottomWidth[li_cnt] -= li_deltax
						CASE RIGHT_ANCHORED
							ir_RightBottomX[li_cnt] += li_deltax	
					END CHOOSE
					
					lov_Resize.Move(ir_rightbottomx[li_cnt], ir_rightbottomy[li_cnt])
					lov_Resize.Resize(ir_rightbottomWidth[li_cnt], ir_rightbottomHeight[li_cnt])
					
				CASE RoundRectangle!
					
					lrr_Resize		= iwo_RightBottom[li_Cnt]
					
					CHOOSE CASE ii_RightBottomPosition[li_Cnt]
						CASE RIGHT
							ir_rightbottomx[li_cnt] += li_deltax	
							ir_rightbottomWidth[li_cnt] -= li_deltax
						CASE RIGHT_ANCHORED
							ir_RightBottomX[li_cnt] += li_deltax	
					END CHOOSE
					
					lrr_Resize.Move(ir_rightbottomx[li_cnt], ir_rightbottomy[li_cnt])
					lrr_Resize.Resize(ir_rightbottomWidth[li_cnt], ir_rightbottomHeight[li_cnt])
					
				CASE Rectangle!
					
					lr_Resize		= iwo_RightBottom[li_Cnt]
					
					CHOOSE CASE ii_RightBottomPosition[li_Cnt]
						CASE RIGHT
							ir_rightbottomx[li_cnt] += li_deltax	
							ir_rightbottomWidth[li_cnt] -= li_deltax
						CASE RIGHT_ANCHORED
							ir_RightBottomX[li_cnt] += li_deltax	
					END CHOOSE
					
					lr_Resize.Move(ir_rightbottomx[li_cnt], ir_rightbottomy[li_cnt])
					lr_Resize.Resize(ir_rightbottomWidth[li_cnt], ir_rightbottomHeight[li_cnt])
					
				CASE ELSE			//	Assume it's a DragObject
					
					ldrg_Resize		= iwo_RightBottom[li_Cnt]
					
					CHOOSE CASE ii_RightBottomPosition[li_Cnt]
						CASE RIGHT
							ir_rightbottomx[li_cnt] += li_deltax	
							ir_rightbottomWidth[li_cnt] -= li_deltax
						CASE RIGHT_ANCHORED
							ir_RightBottomX[li_cnt] += li_deltax	
					END CHOOSE
					
					ldrg_Resize.Move(ir_rightbottomx[li_cnt], ir_rightbottomy[li_cnt])
					ldrg_Resize.Resize(ir_rightbottomWidth[li_cnt], ir_rightbottomHeight[li_cnt])
					
			END CHOOSE
			
		End If
	Next
End If

// Reset the Previous position variables to UNITIALIZED.
of_PreviousPosition(UNITIALIZED, UNITIALIZED)

RETURN
end subroutine

private subroutine of_previousposition (integer ai_prevpositionx, integer ai_prevpositiony);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_previousPosition
//
//	Access:  		private
//
//	Arguments:		ai_prevPositionX		SplitBar's X position
//						ai_prevPositionY		SplitBar's Y position
//
//	Returns:  		None
//
//	Description: 	Functionalized code that was originally in
//						of_lButtonUp() and of_mouseMove().  This helps provide
//						ability to move the splitBar programatically by calling
//						of_Move(newX, new Y),
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//
//	12.5   			Initial version
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
// 
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

ii_PrevPositionX			= ai_PrevPositionX
ii_PrevPositionY			= ai_PrevPositionY

RETURN
end subroutine

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event: 			constructor
//
//	Arguments:		None.
//
//	Returns:  		None.
//
//	Description:	SplitBar Object. 
//		Initialize required information by the object.
//
//	*Note: The Style and the Width (this.Width for a VerticalBar and this.Height
//			for a HorizontalBar) are not changeable past this point.  For example,
//			an outside entity should not change this.Height for a HorizontalBar.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version - Claudio J. Quant
//	12.5	10/16/2014			Change rounding values to be X and Y independent
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

ii_XRounding	= PixelsToUnits(1, XPixelsToUnits!)
ii_YRounding	= PixelsToUnits(1, YPixelsToUnits!)

powerobject lpo_parent

// Determine if this object is supported.
ib_supported = of_IsSupported()

// Defined the object to be on Top of other objects.
this.SetPosition(ToTop!)

// Set the object to the Non-Moving Split bar color.
this.BackColor = il_barcolor

// Get and store the parent object.
lpo_parent = this.GetParent()
CHOOSE CASE lpo_parent.TypeOf()
	CASE Window!
		iw_parent = lpo_parent
	CASE UserObject!
		iuo_parent = lpo_parent
	CASE Tab!
		itab_parent = lpo_parent
END CHOOSE

If ib_supported Then
	// Determine object attributes by looking at the object size.
	If this.Height >= this.Width Then
		ii_style = VERTICAL
		this.Pointer = is_verticalpointer
		ii_barwidth = this.Width	
	Else
		ii_style = HORIZONTAL
		this.Pointer = is_horizontalpointer
		ii_barwidth = this.Height
	End If
Else
	// Since it is not supported - hide the object.
	this.Enabled = False
	this.Visible = False
	this.Resize(0,0)
End If

end event

on pfc_u_st_splitbar.create
call super::create
end on

on pfc_u_st_splitbar.destroy
call super::destroy
end on


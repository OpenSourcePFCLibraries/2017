HA$PBExportHeader$pfc_n_cst_winsrv_style.sru
$PBExportComments$PFC Window Preferences service
forward
global type pfc_n_cst_winsrv_style from n_cst_winsrv
end type
end forward

global type pfc_n_cst_winsrv_style from n_cst_winsrv
end type
global pfc_n_cst_winsrv_style pfc_n_cst_winsrv_style

type variables
Private:

	n_cst_platForm				invo_platForm
	n_cst_numerical			invo_numeric
	
Protected:

	n_cst_platFormAttrib		invo_constants
end variables

forward prototypes
public subroutine of_clientsize (ref long rl_width, ref long rl_height)
public subroutine of_describe (ref string rs_style[])
public subroutine of_describe (window vw_describe, ref string rs_style[])
public subroutine of_style (window vw_style, unsignedlong vul_style, boolean vb_style)
public subroutine of_style (unsignedlong vul_style, boolean vb_style)
public subroutine of_setscrollbars (window vw_scrollbars)
public subroutine of_setscrollbars ()
public subroutine of_style_extended (unsignedlong vul_styleextended, boolean vb_styleextended)
public subroutine of_style_extended (window vw_styleextended, unsignedlong vul_styleextended, boolean vb_styleextended)
public function boolean of_ismdichild ()
public subroutine of_clientsize (unsignedlong vul_hwnd, ref long rl_width, ref long rl_height)
public function boolean of_ismdichild (unsignedlong vul_hwnd)
public function boolean of_ismdichild (window vw_ismdichild)
public function boolean of_ischild (unsignedlong vul_hwnd)
public function boolean of_ischild (window vw_ischild)
public function boolean of_ischild ()
public function boolean of_isstyle (unsignedlong vul_hwnd, unsignedlong vul_style)
public function boolean of_isstyle_extended (unsignedlong vul_hwnd, unsignedlong vul_styleextended)
public subroutine of_clientsize (window vw_clientsize, ref long rl_width, ref long rl_height)
public subroutine of_describe (unsignedlong vul_hwnd, ref string rs_style[])
public function boolean of_isstyle_extended (window vw_isstyleextended, unsignedlong vul_styleextended)
public function boolean of_isstyle_extended (unsignedlong vul_styleextended)
public function boolean of_isstyle (unsignedlong vul_style)
public function boolean of_isstyle (window vw_isstyle, unsignedlong vul_style)
public subroutine of_style (unsignedlong vul_hwnd, unsignedlong vul_style, boolean vb_style)
public subroutine of_style_extended (unsignedlong vul_hwnd, unsignedlong vul_styleextended, boolean vb_styleextended)
end prototypes

public subroutine of_clientsize (ref long rl_width, ref long rl_height);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_clientSize
//
//	Access:  		public
//
//	Arguments:		Long				By Reference, holds the width of the
//											client rectangle in PowerBuilder units.
//						Long				By Reference, holds the height of the
//											client rectangle in PowerBuilder units.
//	Returns:  		None
//
//	Description: 	Gets the client rectangle for the window object
//						registered and recorded in the instance variable
//						iw_requestor.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

rl_width						= -1
rl_height					= -1

IF NOT IsValid(iw_requestor) THEN
	MessageBox('Programmer Error', 'Window instance variable not initialized in the window service.')
ELSE
	of_ClientSize(Handle(iw_requestor), rl_Width, rl_Height)
END IF

RETURN
end subroutine

public subroutine of_describe (ref string rs_style[]);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_describe
//
//	Access:  		public
//
//	Arguments:		String Array	By Reference, holds a list of styles
//											and extended styles
//	Returns:  		None
//
//	Description: 	Builds an array of styles and extended styles that
//						describe the current overall style of the object
//						registered and recorded in the instance variable
//						iw_requestor.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

String						ls_empty[]
rs_style[]					= ls_empty[]

IF NOT IsValid(iw_requestor) THEN
	MessageBox('Programmer Error', 'Window instance variable not initialized in the window service.')
ELSE
	of_describe(Handle(iw_requestor), rs_style[])
END IF

RETURN
end subroutine

public subroutine of_describe (window vw_describe, ref string rs_style[]);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_describe
//
//	Access:  		public
//
//	Arguments:		Window			PowerBuilder window object
//						String Array	By Reference, holds a list of styles
//											and extended styles
//	Returns:  		None
//
//	Description: 	Builds an array of styles and extended styles that
//						describe the current overall style of the object.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

String						ls_empty[]
rs_style[]					= ls_empty[]

of_describe(Handle(vw_describe), rs_style[])

RETURN
end subroutine

public subroutine of_style (window vw_style, unsignedlong vul_style, boolean vb_style);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_style
//
//	Access:  		public
//
//	Arguments:		Window			PowerBuilder window object
//						UnsignedLong	Style that is to be turned on/off
//						Boolean			TRUE		turn style on
//											FALSE		turn style off
//	Returns:  		None
//
//	Description: 	Adds or removes a style for the object.  Multiple
//						styles can be requested in a single call and all will
//						be set or turned off based on vb_style.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

of_style(Handle(vw_style), vul_style, vb_style)

RETURN
end subroutine

public subroutine of_style (unsignedlong vul_style, boolean vb_style);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_style
//
//	Access:  		public
//
//	Arguments:		UnsignedLong	Style that is to be turned on/off
//						Boolean			TRUE		turn style on
//											FALSE		turn style off
//	Returns:  		None
//
//	Description: 	Adds or removes a style for the object registered and
//						recorded in the instance variable iw_requestor.  
//						Multiple styles can be requested in a single call and
//						all will be set or turned off based on vb_style.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

IF NOT IsValid(iw_requestor) THEN
	MessageBox('Programmer Error', 'Window instance variable not initialized in the window service.')
ELSE
	of_style(Handle(iw_requestor), vul_style, vb_style)
END IF

RETURN
end subroutine

public subroutine of_setscrollbars (window vw_scrollbars);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_setScrollBars
//
//	Access:  		public
//
//	Arguments:		Window			Window to which scrollBars are to be
//											added/removed
//	Returns:  		None
//
//	Description: 	This routine cycles through the window's control
//						array and checks to see if any part of a control is
//						not visible (out of the window's client area).  If any
//						object is not completely visible the appropriate
//						scrollBar is added to the window.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

Boolean										lb_HScrollBar	= FALSE
Boolean										lb_VScrollBar	= FALSE

Integer										li_Control

IF isValid(vw_scrollBars) THEN
	
	FOR li_Control = 1 TO UpperBound(vw_ScrollBars.Control[])
		
		IF vw_ScrollBars.Control[li_Control].Visible THEN
			
			CHOOSE CASE TypeOf(vw_ScrollBars.Control[li_Control])
					
				CASE Line!					//	Not yet supported
					
				CASE Oval!
					
					Oval						lovl_Control
					lovl_Control			= vw_ScrollBars.Control[li_Control]
	
					IF lovl_Control.Visible THEN
						
						IF (lovl_Control.X + lovl_Control.Width - 1) > vw_ScrollBars.Width THEN
							lb_HScrollBar	= TRUE
						END IF
						
						IF (lovl_Control.Y + lovl_Control.Height - 1) > vw_ScrollBars.Height THEN
							lb_VScrollBar	= TRUE
						END IF
					
					END IF

				CASE Rectangle!
					
					Rectangle				lr_Control
					lr_Control				= vw_ScrollBars.Control[li_Control]
	
					IF lr_Control.Visible THEN
						
						IF (lr_Control.X + lr_Control.Width - 1) > vw_ScrollBars.Width THEN
							lb_HScrollBar	= TRUE
						END IF
						
						IF (lr_Control.Y + lr_Control.Height - 1) > vw_ScrollBars.Height THEN
							lb_VScrollBar	= TRUE
						END IF
					
					END IF
				
				CASE RoundRectangle!
					
					RoundRectangle			lrr_Control
					lrr_Control				= vw_ScrollBars.Control[li_Control]
	
					IF lrr_Control.Visible THEN
						
						IF (lrr_Control.X + lrr_Control.Width - 1) > vw_ScrollBars.Width THEN
							lb_HScrollBar	= TRUE
						END IF
						
						IF (lrr_Control.Y + lrr_Control.Height - 1) > vw_ScrollBars.Height THEN
							lb_VScrollBar	= TRUE
						END IF
					
					END IF
				
				CASE ELSE
					
					DragObject				ldo_Control
					ldo_Control				= vw_ScrollBars.Control[li_Control]
				
					IF ldo_Control.Visible THEN
						
						IF (ldo_Control.X + ldo_Control.Width - 1) > vw_ScrollBars.Width THEN
							lb_HScrollBar	= TRUE
						END IF
						
						IF (ldo_Control.Y + ldo_Control.Height - 1) > vw_ScrollBars.Height THEN
							lb_VScrollBar	= TRUE
						END IF
			
					END IF
		
			END CHOOSE
	
		END IF
	
	NEXT
	
	vw_ScrollBars.HScrollBar			= lb_HScrollBar
	vw_ScrollBars.VScrollBar			= lb_VScrollBar

END IF

RETURN
end subroutine

public subroutine of_setscrollbars ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_setScrollBars
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		None
//
//	Description: 	Calls of_setScrollBars for the window located in the
//						instance variable iw_requestor.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

IF NOT IsValid(iw_requestor) THEN
	MessageBox('Programmer Error', 'Window instance variable not initialized in the window service.')
ELSE
	of_setScrollBars(iw_requestor)
END IF

RETURN
end subroutine

public subroutine of_style_extended (unsignedlong vul_styleextended, boolean vb_styleextended);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_style_extended
//
//	Access:  		public
//
//	Arguments:		UnsignedLong	Extended style that is to be turned on/off
//						Boolean			TRUE		turn style on
//											FALSE		turn style off
//	Returns:  		None
//
//	Description: 	Adds or removes an extended style for the object
//						registered and recorded in the instance variable
//						iw_requestor.  Multiple extended styles can be requested
//						in a single call and all will be set or turned off based
//						on vb_styleExtended.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

IF NOT IsValid(iw_requestor) THEN
	MessageBox('Programmer Error', 'Window instance variable not initialized in the window service.')
ELSE
	of_style_Extended(Handle(iw_requestor), vul_styleExtended, vb_styleExtended)
END IF

RETURN
end subroutine

public subroutine of_style_extended (window vw_styleextended, unsignedlong vul_styleextended, boolean vb_styleextended);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_style_extended
//
//	Access:  		public
//
//	Arguments:		Window			PowerBuilder window object
//						UnsignedLong	Extended style that is to be turned on/off
//						Boolean			TRUE		turn style on
//											FALSE		turn style off
//	Returns:  		None
//
//	Description: 	Adds or removes an extended style for the object.
//						Multiple extended styles can be requested in a single
//						call and all will be set or turned off based on
//						vb_styleExtended.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

of_style_Extended(Handle(vw_styleExtended), vul_styleExtended, vb_styleExtended)

RETURN
end subroutine

public function boolean of_ismdichild ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_isMDIChild
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Boolean			TRUE indicates an MDI child
//
//	Description: 	Indicates whether or not the object registered and
//						recorded in the instance variable iw_requestor is an MDI
//						child window or not.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

Return(of_isStyle_extended(invo_constants.WS_EX_MDICHILD))
end function

public subroutine of_clientsize (unsignedlong vul_hwnd, ref long rl_width, ref long rl_height);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_clientSize
//
//	Access:  		public
//
//	Arguments:		UnsignedLong	Handle to the object
//						Long				By Reference, holds the width of the
//											client rectangle in PowerBuilder units.
//						Long				By Reference, holds the height of the
//											client rectangle in PowerBuilder units.
//	Returns:  		None
//
//	Description: 	Gets the client rectangle for the object.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

f_setPlatForm(invo_platForm, TRUE)

Long									ll_Left,	ll_Top,	ll_Right,	ll_Bottom

invo_platForm.of_GetClientRect(vul_hWnd, ll_Left, ll_Top, ll_Right, ll_Bottom)

Long									li_Width,	li_Height

li_Width								= PixelsToUnits(ll_Right - ll_Left, XPixelsToUnits!)
li_Height							= PixelsToUnits(ll_Bottom - ll_Top, YPixelsToUnits!)

//li_Width								= Width
//li_Height							= Height
//
//IF of_isstyle(hWnd, invo_constants.WS_CAPTION) THEN
//	li_Height						= li_Height - PixelsToUnits(invo_platForm.of_GetSystemMetrics(invo_constants.SM_CYCAPTION), YPixelsToUnits!)
//END IF
//
//IF of_isstyle(hWnd, invo_constants.WS_CXSIZEFRAME) THEN
//	li_Width							= li_Width - PixelsToUnits(invo_platForm.of_GetSystemMetrics(invo_constants.SM_CXSIZEFRAME) * 2, XPixelsToUnits!)
//	li_Height						= li_Height - PixelsToUnits(invo_platForm.of_GetSystemMetrics(invo_constants.SM_CYSIZEFRAME) * 2, YPixelsToUnits!)
//END IF

//IF of_isStyleExtended(hWnd, invo_constants.WS_EX_CLIENTEDGE) THEN
//	li_Width							= li_Width - PixelsToUnits(invo_platForm.of_GetSystemMetrics(invo_constants.SM_CXEDGE) * 2, XPixelsToUnits!)
//	li_Height						= li_Height - PixelsToUnits(invo_platForm.of_GetSystemMetrics(invo_constants.SM_CYEDGE) * 2, YPixelsToUnits!)
//ELSE
//	li_Width							= li_Width - PixelsToUnits(invo_platForm.of_GetSystemMetrics(invo_constants.SM_CXBORDER) * 2, XPixelsToUnits!)
//	li_Height						= li_Height - PixelsToUnits(invo_platForm.of_GetSystemMetrics(invo_constants.SM_CYBORDER) * 2, YPixelsToUnits!)
//END IF

rl_Width								= li_Width
rl_Height							= li_Height

RETURN
end subroutine

public function boolean of_ismdichild (unsignedlong vul_hwnd);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_isMDIChild
//
//	Access:  		public
//
//	Arguments:		UnsignedLong	Handle to the object
//
//	Returns:  		Boolean			TRUE indicates an MDI child
//
//	Description: 	Indicates whether or not the object is an MDI child or
//						not.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

Return(of_isStyle_extended(vul_hWnd, invo_constants.WS_EX_MDICHILD))
end function

public function boolean of_ismdichild (window vw_ismdichild);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_isMDIChild
//
//	Access:  		public
//
//	Arguments:		Window			PowerBuilder window object
//
//	Returns:  		Boolean			TRUE indicates an MDI child
//
//	Description: 	Indicates whether or not the PowerBuilder window is an
//						MDI child or not.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

Return(of_isStyle_extended(vw_isMDIChild, invo_constants.WS_EX_MDICHILD))
end function

public function boolean of_ischild (unsignedlong vul_hwnd);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_isChild
//
//	Access:  		public
//
//	Arguments:		UnsignedLong	Handle to the object
//
//	Returns:  		Boolean			TRUE indicates a child
//
//	Description: 	Indicates whether or not the object is a child or not.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

Return(of_isStyle(vul_hwnd, invo_constants.WS_CHILD))
end function

public function boolean of_ischild (window vw_ischild);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_isChild
//
//	Access:  		public
//
//	Arguments:		Window			PowerBuilder window object
//
//	Returns:  		Boolean			TRUE indicates a child
//
//	Description: 	Indicates whether or not the PowerBuilder window is a
//						child or not.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

Return(of_isStyle(vw_isChild, invo_constants.WS_CHILD))
end function

public function boolean of_ischild ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_isChild
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Boolean			TRUE indicates a child
//
//	Description: 	Indicates whether or not the object registered and
//						recorded in the instance variable iw_requestor is a child
//						window or not.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

Return(of_isStyle(invo_constants.WS_CHILD))
end function

public function boolean of_isstyle (unsignedlong vul_hwnd, unsignedlong vul_style);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_isStyle
//
//	Access:  		public
//
//	Arguments:		UnsignedLong	Handle to the object
//						UnsignedLong	Indicates which style(s) to check.
//
//	Returns:  		Boolean			TRUE indicates all styles are turned on.
//
//	Description: 	Indicates whether or not the object has the styles
//						requested turned or not.  You can request a check of
//						multiple styles in a single call.  If checking more than
//						1 styles, all of them must be set in order for method to
//						return TRUE.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

f_setPlatForm(invo_platForm, TRUE)

UnsignedLong				lul_windowLong
lul_windowLong				= invo_platForm.GetWindowLong(vul_hwnd, invo_constants.GWL_STYLE)		//	Get Style
	
Return((invo_numeric.of_bitWiseAnd(lul_windowLong, vul_style) = vul_style))						//	Test if the style is set
end function

public function boolean of_isstyle_extended (unsignedlong vul_hwnd, unsignedlong vul_styleextended);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_isStyle_extended
//
//	Access:  		public
//
//	Arguments:		UnsignedLong	Handle to the object
//						UnsignedLong	Indicates which extended style(s) to
//											check.
//
//	Returns:  		Boolean			TRUE indicates all extended styles are
//											turned on.
//
//	Description: 	Indicates whether or not the object has the extended
//						styles requested turned or not.  You can request a
//						check of multiple extended styles in a single call.  If
//						checking more than 1 extended styles, all of them must
//						be set in order for method to return TRUE.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

f_setPlatForm(invo_platForm, TRUE)

UnsignedLong				lul_windowLong
lul_windowLong				= invo_platForm.GetWindowLong(vul_hwnd, invo_constants.GWL_EXSTYLE)		//	Get Extended Style
	
Return((invo_numeric.of_bitWiseAnd(lul_windowLong, vul_styleExtended) = vul_styleExtended))		//	Test if the style is set
end function

public subroutine of_clientsize (window vw_clientsize, ref long rl_width, ref long rl_height);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_clientSize
//
//	Access:  		public
//
//	Arguments:		Window			PowerBuilder window object
//						Long				By Reference, holds the width of the
//											client rectangle in PowerBuilder units.
//						Long				By Reference, holds the height of the
//											client rectangle in PowerBuilder units.
//	Returns:  		None
//
//	Description: 	Gets the client rectangle for the window object.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

rl_width						= -1
rl_height					= -1

IF isValid(vw_clientSize) THEN
	of_clientSize(Handle(vw_clientSize), rl_width, rl_height)
END IF

RETURN
end subroutine

public subroutine of_describe (unsignedlong vul_hwnd, ref string rs_style[]);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_describe
//
//	Access:  		public
//
//	Arguments:		UnsignedLong	Handle to the object
//						String Array	By Reference, holds a list of styles
//											and extended styles
//	Returns:  		None
//
//	Description: 	Builds an array of styles and extended styles that
//						describe the current overall style of the object.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

f_setPlatForm(invo_platForm, TRUE)

String						ls_empty[]
rs_style[]					= ls_empty[]

UnsignedLong				lul_windowLong
lul_windowLong				= invo_platForm.GetWindowLong(vul_hWnd, invo_constants.GWL_STYLE)														//	Get Style

IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_BORDER)						= invo_constants.WS_BORDER						THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Border'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_CAPTION)					= invo_constants.WS_CAPTION					THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Caption'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_CHILD)						= invo_constants.WS_CHILD						THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Child'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_CLIPCHILDREN)				= invo_constants.WS_CLIPCHILDREN				THEN rs_style[UpperBound(rs_style[]) + 1]	= 'ClipChildren'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_CLIPSIBLINGS)				= invo_constants.WS_CLIPSIBLINGS				THEN rs_style[UpperBound(rs_style[]) + 1]	= 'ClipSiblings'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_DISABLED)					= invo_constants.WS_DISABLED					THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Disabled'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_DLGFRAME)					= invo_constants.WS_DLGFRAME					THEN rs_style[UpperBound(rs_style[]) + 1]	= 'DialogFrame'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_GROUP)						= invo_constants.WS_GROUP						THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Group'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_HSCROLL)					= invo_constants.WS_HSCROLL					THEN rs_style[UpperBound(rs_style[]) + 1]	= 'HorizontalScroll'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_MAXIMIZE)					= invo_constants.WS_MAXIMIZE					THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Maximize'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_MAXIMIZEBOX)				= invo_constants.WS_MAXIMIZEBOX				THEN rs_style[UpperBound(rs_style[]) + 1]	= 'MaximizeBox'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_MINIMIZE)					= invo_constants.WS_MINIMIZE					THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Minimize'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_MINIMIZEBOX)				= invo_constants.WS_MINIMIZEBOX				THEN rs_style[UpperBound(rs_style[]) + 1]	= 'MinimizeBox'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_OVERLAPPED)				= invo_constants.WS_OVERLAPPED				THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Overlapped, Tiled'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_POPUP)						= invo_constants.WS_POPUP						THEN rs_style[UpperBound(rs_style[]) + 1]	= 'PopUp'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_VISIBLE)					= invo_constants.WS_VISIBLE					THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Visible'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_VSCROLL)					= invo_constants.WS_VSCROLL					THEN rs_style[UpperBound(rs_style[]) + 1]	= 'VerticalScroll'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_SYSMENU)					= invo_constants.WS_SYSMENU					THEN rs_style[UpperBound(rs_style[]) + 1]	= 'SysMenu'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_TABSTOP)					= invo_constants.WS_TABSTOP					THEN rs_style[UpperBound(rs_style[]) + 1]	= 'TabStop'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_THICKFRAME)				= invo_constants.WS_THICKFRAME				THEN rs_style[UpperBound(rs_style[]) + 1]	= 'ThickFrame (SizeBox)'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_OVERLAPPEDWINDOW)		= invo_constants.WS_OVERLAPPEDWINDOW		THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Overlapped Window (Tiled Window)'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_POPUPWINDOW)				= invo_constants.WS_POPUPWINDOW				THEN rs_style[UpperBound(rs_style[]) + 1]	= 'PopUp Window'

lul_windowLong				= invo_platForm.GetWindowLong(vul_hWnd, invo_constants.GWL_EXSTYLE)													//	Get Extended Style

IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_ACCEPTFILES)			= invo_constants.WS_EX_ACCEPTFILES			THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended AcceptFiles'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_APPWINDOW)				= invo_constants.WS_EX_APPWINDOW				THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended AppWindow'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_CLIENTEDGE)			= invo_constants.WS_EX_CLIENTEDGE			THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended ClientEdge'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_COMPOSITED)			= invo_constants.WS_EX_COMPOSITED			THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended Composited'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_CONTEXTHELP)			= invo_constants.WS_EX_CONTEXTHELP			THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended ContextHelp'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_CONTROLPARENT)		= invo_constants.WS_EX_CONTROLPARENT		THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended ControlParent'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_DLGMODALFRAME)		= invo_constants.WS_EX_DLGMODALFRAME		THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended DialogModalFrame'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_LAYERED)				= invo_constants.WS_EX_LAYERED				THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended Layered'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_LAYOUTRTL)				= invo_constants.WS_EX_LAYOUTRTL				THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended LayOut Right-to-Left'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_LEFT)					= invo_constants.WS_EX_LEFT					THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended Left'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_LEFTSCROLLBAR)		= invo_constants.WS_EX_LEFTSCROLLBAR		THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended LeftScrollBar'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_LTRREADING)			= invo_constants.WS_EX_LTRREADING			THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended Left-to-Right Reading'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_MDICHILD)				= invo_constants.WS_EX_MDICHILD				THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended MDI Child'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_NOACTIVATE)			= invo_constants.WS_EX_NOACTIVATE			THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended NoActivate'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_NOINHERITLAYOUT)		= invo_constants.WS_EX_NOINHERITLAYOUT		THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended NoInheritLayOut'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_NOPARENTNOTIFY)		= invo_constants.WS_EX_NOPARENTNOTIFY		THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended NoParentNotify'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_RIGHT)					= invo_constants.WS_EX_RIGHT					THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended Right'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_RIGHTSCROLLBAR)		= invo_constants.WS_EX_RIGHTSCROLLBAR		THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended RightScrollBar'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_RTLREADING)			= invo_constants.WS_EX_RTLREADING			THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended Right-to-Left Reading'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_STATICEDGE)			= invo_constants.WS_EX_STATICEDGE			THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended StaticEdge'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_TOOLWINDOW)			= invo_constants.WS_EX_TOOLWINDOW			THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended ToolWindow'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_TOPMOST)				= invo_constants.WS_EX_TOPMOST				THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended TopMost'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_TRANSPARENT)			= invo_constants.WS_EX_TRANSPARENT			THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended Transparent'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_WINDOWEDGE)			= invo_constants.WS_EX_WINDOWEDGE			THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended WindowEdge'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_OVERLAPPEDWINDOW)	= invo_constants.WS_EX_OVERLAPPEDWINDOW	THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended Overlapped Window'
IF invo_numeric.of_bitWiseAnd(lul_windowLong, invo_constants.WS_EX_PALETTEWINDOW)		= invo_constants.WS_EX_PALETTEWINDOW		THEN rs_style[UpperBound(rs_style[]) + 1]	= 'Extended Palette Window'

RETURN
end subroutine

public function boolean of_isstyle_extended (window vw_isstyleextended, unsignedlong vul_styleextended);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_isStyle_extended
//
//	Access:  		public
//
//	Arguments:		Window			PowerBuilder window object
//						UnsignedLong	Indicates which extended style(s) to
//											check.
//
//	Returns:  		Boolean			TRUE indicates all styles are turned on.
//
//	Description: 	Indicates whether or not the window object has the
//						extended styles requested turned or not.  You can
//						request a check of multiple extended styles in a single
//						call.  If checking more than 1 extended styles, all of
//						them must be set in order for method to return TRUE.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

Boolean						lb_isStyleExtended	= FALSE

IF IsValid(vw_isStyleExtended) THEN
	lb_isStyleExtended	= of_isStyle_Extended(Handle(vw_isStyleExtended), vul_StyleExtended)
END IF

Return(lb_isStyleExtended)
end function

public function boolean of_isstyle_extended (unsignedlong vul_styleextended);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_isStyle_extended
//
//	Access:  		public
//
//	Arguments:		UnsignedLong	Indicates which extended style(s) to
//											check.
//
//	Returns:  		Boolean			TRUE indicates all extended styles are
//											turned on.
//
//	Description: 	Indicates whether or not the object registered and
//						recorded in the instance variable iw_requestor has the
//						extended styles requested turned or not.  You can
//						request a check of multiple extended styles in a single
//						call.  If checking more than 1 extended styles, all of
//						them must be set in order for method to return TRUE.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

Boolean							lb_isStyleExtended	= FALSE
	
IF NOT IsValid(iw_requestor) THEN
	MessageBox('Programmer Error', 'Window instance variable not initialized in the window service.')
ELSE
	lb_isStyleExtended		= of_isStyle_Extended(Handle(iw_requestor), vul_styleExtended)
END IF

Return(lb_isStyleExtended)

end function

public function boolean of_isstyle (unsignedlong vul_style);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_isStyle
//
//	Access:  		public
//
//	Arguments:		UnsignedLong	Indicates which style(s) to check.
//
//	Returns:  		Boolean			TRUE indicates all styles are turned on.
//
//	Description: 	Indicates whether or not the object registered and
//						recorded in the instance variable iw_requestor has the
//						styles requested turned or not.  You can request a
//						check of multiple styles in a single call.  If checking
//						more than 1 styles, all of them must be set in order for
//						method to return TRUE.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

Boolean							lb_isStyle	= FALSE
	
IF NOT IsValid(iw_requestor) THEN
	MessageBox('Programmer Error', 'Window instance variable not initialized in the window service.')
ELSE
	lb_isStyle					= of_isStyle(Handle(iw_requestor), vul_style)
END IF

Return(lb_isStyle)

end function

public function boolean of_isstyle (window vw_isstyle, unsignedlong vul_style);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_isStyle
//
//	Access:  		public
//
//	Arguments:		Window			PowerBuilder window object
//						UnsignedLong	Indicates which style(s) to check.
//
//	Returns:  		Boolean			TRUE indicates all styles are turned on.
//
//	Description: 	Indicates whether or not the window object has the styles
//						requested turned or not.  You can request a check of
//						multiple styles in a single call.  If checking more than
//						1 styles, all of them must be set in order for method to
//						return TRUE.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

Boolean						lb_isStyle	= FALSE

IF IsValid(vw_isStyle) THEN
	lb_isStyle				= of_isStyle(Handle(vw_isStyle), vul_Style)
END IF

Return(lb_isStyle)
end function

public subroutine of_style (unsignedlong vul_hwnd, unsignedlong vul_style, boolean vb_style);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_style
//
//	Access:  		public
//
//	Arguments:		UnsignedLong	Handle to the object
//						UnsignedLong	Style that is to be turned on/off
//						Boolean			TRUE		turn style on
//											FALSE		turn style off
//	Returns:  		None
//
//	Description: 	Adds or removes a style for the object.  Multiple styles
//						can be requested in a single call and all will be set
//						or turned off based on vb_style.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

f_setPlatForm(invo_platForm, TRUE)

UnsignedLong				lul_Styles
lul_styles					= invo_platForm.GetWindowLong(vul_hWnd, invo_constants.GWL_STYLE)

IF lul_styles <> 0 THEN
	IF vb_style THEN
		invo_platForm.SetWindowLong(vul_hWnd, invo_constants.GWL_STYLE, invo_numeric.of_BitWiseOr(lul_styles,		vul_style))
	ELSE
		invo_platForm.SetWindowLong(vul_hWnd, invo_constants.GWL_STYLE, invo_numeric.of_BitWiseXOr(lul_styles,	vul_style))
	END IF
END IF

RETURN
end subroutine

public subroutine of_style_extended (unsignedlong vul_hwnd, unsignedlong vul_styleextended, boolean vb_styleextended);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_style_extended
//
//	Access:  		public
//
//	Arguments:		UnsignedLong	Handle to the object
//						UnsignedLong	Extended style that is to be turned on/off
//						Boolean			TRUE		turn style on
//											FALSE		turn style off
//	Returns:  		None
//
//	Description: 	Adds or removes an extended style for the object.
//						Multiple extended styles can be requested in a single
//						call and all will be set or turned off based on
//						vb_styleExtended.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

f_setPlatForm(invo_platForm, TRUE)

UnsignedLong				lul_StylesExtended
lul_StylesExtended		= invo_platForm.GetWindowLong(vul_hWnd, invo_constants.GWL_EXSTYLE)

IF lul_StylesExtended <> 0 THEN
	IF vb_styleExtended THEN
		invo_platForm.SetWindowLong(vul_hWnd, invo_constants.GWL_EXSTYLE, invo_numeric.of_BitWiseOr(lul_StylesExtended,	vul_styleExtended))
	ELSE
		invo_platForm.SetWindowLong(vul_hWnd, invo_constants.GWL_EXSTYLE, invo_numeric.of_BitWiseXOr(lul_StylesExtended,	vul_styleExtended))
	END IF
END IF

RETURN
end subroutine

on pfc_n_cst_winsrv_style.create
call super::create
end on

on pfc_n_cst_winsrv_style.destroy
call super::destroy
end on

event destructor;call super::destructor;/////////////////////////////////////////////////////////////////////////
//
//	Event:  			destructor
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long
//
//	Description: 	Clean up.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

f_setPlatForm(invo_platForm, FALSE)
end event


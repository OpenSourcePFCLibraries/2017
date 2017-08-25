HA$PBExportHeader$pfc_n_cst_color.sru
$PBExportComments$PFC Color Service
forward
global type pfc_n_cst_color from n_base
end type
end forward

global type pfc_n_cst_color from n_base autoinstantiate
end type

type variables
Public:

	CONSTANT Long				PINK									= RGB(255, 204, 255)		//	xFFCCFF
	CONSTANT Long				YELLOW_STICKY						= RGB(250, 250, 167)		//	xFAFAA7

Private:

	n_cst_platform				invo_platform
	n_cst_platformAttrib		invo_constants
	
	Long							il_ActiveBorder					= -1
	Long							il_ActiveCaption					= -1
	Long							il_AppWorkSpace					= -1
	Long							il_Background						= -1
	Long							il_ButtonAlternateFace			= -1
	Long							il_3DDkShadow						= -1
	Long							il_ButtonFace						= -1
	Long							il_ButtonHilight					= -1
	Long							il_3DLight							= -1
	Long							il_ButtonShadow					= -1
	Long							il_ButtonText						= -1
	Long							il_GradientActiveCaption		= -1
	Long							il_GradientInactiveCaption		= -1
	Long							il_GrayText							= -1
	Long							il_Hilight							= -1
	Long							il_HilightText						= -1
	Long							il_HotTracking						= -1
	Long							il_InactiveBorder					= -1
	Long							il_InactiveCaption				= -1
	Long							il_InactiveCaptionText			= -1
	Long							il_InfoText							= -1
	Long							il_InfoBackGround					= -1
	Long							il_Menu								= -1
	Long							il_MenuBar							= -1
	Long							il_MenuHilight						= -1
	Long							il_MenuText							= -1
	Long							il_Scrollbar						= -1
	Long							il_CaptionText						= -1
	Long							il_Window							= -1
	Long							il_WindowFrame						= -1
	Long							il_WindowText						= -1
	
	Long							il_Link								= -1
	Long							il_LinkHover						= -1
	Long							il_LinkActive						= -1
	Long							il_LinkVisited						= -1
	
// Notes: The following additions were made in v12.5:
//        - Extra white space to improve legibility.
//        - Hexadecimal equivalents as comments.
//        - Several new named color constants.
//        - PB painter color constants (Pure green is called "lime" in PB painters, for example).
//        - PB painter mapped Windows system color constants ("highlight" [selected row in DW], for example).
//        - Summary explanation of how RGB encoding works.
//
// (*)    When R/G/B values are encoded into a value of type long, the order of the one-byte (0-255) color
//        values is reversed. PB uses the bits in the hi-order byte for special values, like TRANSPARENT.
//
//        Example: RGB(64,128,255) 64=0x40, 128=0x80, 255=0xff
//        The encoded R/G/B long value will contain 0x00ff8040, not 0x004080ff

// Traditional, legacy PFC color constants
Public:                                                      //     bbggrr (*)
constant long WINDOW_TEXT             =   33554592           // 0x02000000
constant long BUTTONFACE              =   78682240           // 0x04000000
constant long APPLICATION_WORKSPACE   =  268435456           // 0x10000000
constant long TRANSPARENT             =  553648127           // 0x20000000
constant long WINDOW_BACKGROUND       = 1087434968           // 0x40000000

constant long BLACK                   = RGB(  0,   0,   0)   // 0x00000000
constant long WHITE                   = RGB(255, 255, 255)   // 0x00ffffff
constant long LIGHT_GRAY              = RGB(192, 192, 192)   // 0x00c0c0c0
constant long DARK_GRAY               = RGB(128, 128, 128)   // 0x00808080
constant long RED                     = RGB(255,   0,   0)   // 0x000000ff
constant long DARK_RED                = RGB(128,   0,   0)   // 0x00000080
constant long GREEN                   = RGB(  0, 255,   0)   // 0x0000ff00
constant long DARK_GREEN              = RGB(  0, 128,   0)   // 0x00008000
constant long BLUE                    = RGB(  0,   0, 255)   // 0x00ff0000
constant long DARK_BLUE               = RGB(  0,   0, 128)   // 0x00800000
constant long MAGENTA                 = RGB(255,   0, 255)   // 0x00ff00ff
constant long DARK_MAGENTA            = RGB(128,   0, 128)   // 0x00800080
constant long CYAN                    = RGB(  0, 255, 255)   // 0x00ffff00
constant long DARK_CYAN               = RGB(  0, 128, 128)   // 0x00808000
constant long YELLOW                  = RGB(255, 255,   0)   // 0x0000ffff
constant long BROWN                   = RGB(128, 128,   0)   // 0x00008080

// Additional, simple-name color constants
constant long FUCSHIA                 = MAGENTA              // 0x00ff00ff
constant long LIME                    = GREEN                // 0x0000ff00
constant long AQUA                    = CYAN                 // 0x00ffff00
constant long MAROON                  = DARK_RED             // 0x00000080
constant long PURPLE                  = DARK_MAGENTA         // 0x00800080
constant long OLIVE                   = RGB(128, 128,   0)   // 0x00808000
constant long NAVY                    = DARK_BLUE            // 0x00800000
constant long TEAL                    = DARK_CYAN            // 0x00808000
constant long GRAY                    = DARK_GRAY            // 0x00808080
constant long SILVER                  = LIGHT_GRAY           // 0x00c0c0c0
constant long MINT                    = RGB(192, 220, 192)   // 0x00c0e0c0
constant long SKY                     = RGB(166, 202, 240)   // 0x00f0caa6
constant long CREAM                   = RGB(255, 251, 240)   // 0x00f0fbff
constant long MEDIUM_GRAY             = RGB(160, 160, 160)   // 0x00a0a0a0
constant long ORANGE                  = RGB(255, 128,   0)   // 0x000080ff (Note: Painters don't render orange, but run-time does)

// PowerBuilder painter color constants
constant long PB_PAINTER_BLACK        = BLACK                // 0x00000000
constant long PB_PAINTER_WHITE        = WHITE                // 0x00ffffff
constant long PB_PAINTER_RED          = RED                  // 0x000000ff
constant long PB_PAINTER_FUCSHIA      = FUCSHIA              // 0x00ff00ff
constant long PB_PAINTER_LIME         = LIME                 // 0x0000ff00
constant long PB_PAINTER_YELLOW       = YELLOW               // 0x0000ffff
constant long PB_PAINTER_BLUE         = BLUE                 // 0x00ff0000
constant long PB_PAINTER_AQUA         = AQUA                 // 0x00ffff00
constant long PB_PAINTER_MAROON       = MAROON               // 0x00000080
constant long PB_PAINTER_PURPLE       = PURPLE               // 0x00800080
constant long PB_PAINTER_GREEN        = DARK_GREEN           // 0x00008000
constant long PB_PAINTER_OLIVE        = OLIVE                // 0x00008080
constant long PB_PAINTER_NAVY         = NAVY                 // 0x00800000
constant long PB_PAINTER_TEAL         = TEAL                 // 0x00808000
constant long PB_PAINTER_GRAY         = GRAY                 // 0x00808080
constant long PB_PAINTER_SILVER       = SILVER               // 0x00c0c0c0
constant long PB_PAINTER_MINT         = MINT                 // 0x00c0dcc0
constant long PB_PAINTER_SKY          = SKY                  // 0x00f0caa6
constant long PB_PAINTER_CREAM        = CREAM                // 0x00f0fbff
constant long PB_PAINTER_MEDIUM_GRAY  = MEDIUM_GRAY          // 0x00a0a0a0

// PowerBuilder painter Windows system color constants
constant long BUTTON_FACE             = BUTTONFACE           // 0x04000000 (alternate spelling of earlier constant)

constant long SCROLL_BAR              = 134217728            // 0x08000000
constant long DESKTOP                 = 134217729            // 0x08000001
constant long ACTIVE_TITLE_BAR        = 134217730            // 0x08000002
constant long INACTIVE_TITLE_BAR      = 134217731            // 0x08000003
constant long MENU_BAR                = 134217732            // 0x08000004
constant long WINDOW_FRAME            = 134217734            // 0x08000006
constant long MENU_TEXT               = 134217735            // 0x08000007
constant long ACTIVE_TITLE_BAR_TEXT   = 134217737            // 0x08000009
constant long ACTIVE_BORDER           = 134217738            // 0x0800000a
constant long INACTIVE_BORDER         = 134217739            // 0x0800000b
constant long HIGHLIGHT               = 134217741            // 0x0800000d
constant long HIGHLIGHT_TEXT          = 134217742            // 0x0800000e
constant long BUTTON_SHADOW           = 134217744            // 0x08000010
constant long DISABLED_TEXT           = 134217745            // 0x08000011
constant long BUTTON_TEXT             = 134217746            // 0x08000012
constant long INACTIVE_TITLE_BAR_TEXT = 134217747            // 0x08000013
constant long BUTTON_HIGHLIGHT        = 134217748            // 0x08000014
constant long BUTTON_DARK_SHADOW      = 134217749            // 0x08000015
constant long BUTTON_LIGHT_SHADOW     = 134217750            // 0x08000016
constant long TOOLTIP_TEXT            = 134217751            // 0x08000017
constant long TOOLTIP                 = 134217752            // 0x08000018
constant long LINK                    = 134217856            // 0x08000080
constant long LINK_HOVER              = 134217857            // 0x08000081
constant long LINK_ACTIVE             = 134217858            // 0x08000082
constant long LINK_VISITED            = 134217859            // 0x08000083
end variables

forward prototypes
public function long of_activeborder ()
public function long of_appworkspace ()
public function long of_background ()
public function long of_buttonalternateface ()
public function long of_buttonface ()
public function long of_buttonhilight ()
public function long of_buttonshadow ()
public function long of_buttontext ()
public function long of_graytext ()
public function long of_hilight ()
public function long of_hilighttext ()
public function long of_hottracking ()
public function long of_inactiveborder ()
public function long of_infotext ()
public function long of_menu ()
public function long of_menubar ()
public function long of_menuhilight ()
public function long of_menutext ()
public function long of_scrollbar ()
public function long of_window ()
public function long of_windowframe ()
public function long of_windowtext ()
public function long of_red ()
public function long of_blue ()
public function long of_white ()
public function long of_black ()
public function long of_link ()
public function long of_linkhover ()
public function long of_linkactive ()
public function long of_linkvisited ()
public subroutine of_unrgb (long vl_color, ref integer ri_red, ref integer ri_green, ref integer ri_blue)
public function long of_3ddkshadow ()
public function long of_infobackground ()
public function long of_3dlight ()
private function long of_getcolor (string vs_getcolor)
public function long of_inactivecaption ()
public function long of_captiontext ()
public function long of_inactivecaptiontext ()
public function long of_activecaption ()
public function long of_gradientactivecaption ()
public function long of_gradientinactivecaption ()
public function long of_cyan ()
public function long of_yellowsticky ()
public function long of_yellow ()
public function long of_gray ()
public function long of_brown ()
public function long of_silver ()
public function long of_teal ()
public function long of_sky ()
public function long of_cream ()
public function long of_mint ()
public function long of_navy ()
public function long of_mediumgray ()
public function long of_olive ()
public function long of_lime ()
public function long of_green ()
public function long of_aqua ()
public function long of_fushia ()
public function long of_maroon ()
public function long of_purple ()
public function long of_hotlight ()
public function long of_pink ()
public function long of_lightgray ()
public function long of_darkgray ()
public function long of_darkred ()
public function long of_darkgreen ()
public function long of_darkblue ()
public function long of_magenta ()
public function long of_darkmagenta ()
public function long of_darkcyan ()
public subroutine of_reset ()
public function long of_convert_rgbstringtocolor (string vs_color, string vs_delimiter)
public function string of_convert_colortorgbstring (long vl_color, string vs_delimiter)
public function long of_orange ()
public function long of_disabledtext ()
end prototypes

public function long of_activeborder ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_activeBorder
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Active Border system color
//
//	Description: 	Returns Avtive Border system color as a long
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

IF il_ActiveBorder = -1 THEN
	
	f_setPlatform(invo_platform, TRUE)
	
	il_ActiveBorder				= invo_platform.GetSysColor(invo_constants.COLOR_ACTIVEBORDER)

END IF

Return(il_ActiveBorder)
end function

public function long of_appworkspace ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_appWorkSpace
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Application WorkSpace system color
//
//	Description: 	Returns Application WorkSpace system color as a long
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

IF il_AppWorkSpace = -1 THEN
	
	f_setPlatForm(invo_platform, TRUE)
	
	il_AppWorkSpace				= invo_platform.GetSysColor(invo_constants.COLOR_APPWORKSPACE)
	
END IF

Return(il_AppWorkSpace)
end function

public function long of_background ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_backGround
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				BackGround system color
//
//	Description: 	Returns BackGround system color as a long
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

IF il_BackGround = -1 THEN
	
	f_setPlatform(invo_platform, TRUE)
	
	il_BackGround					= invo_platform.GetSysColor(invo_constants.COLOR_BACKGROUND)
	
END IF

Return(il_BackGround)
end function

public function long of_buttonalternateface ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_buttonAlternateFace
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Button Alternate Face system color
//
//	Description: 	Returns Button Alternate Face system color as a long
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

IF il_ButtonAlternateFace = -1 THEN
		
	f_setPlatform(invo_platform, TRUE)
	
	il_ButtonAlternateFace		= invo_platform.GetSysColor(invo_constants.COLOR_ALTERNATEBTNFACE)
	
END IF

Return(il_ButtonAlternateFace)
end function

public function long of_buttonface ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_buttonFace
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Button Face system color
//
//	Description: 	Returns Button Face system color as a long
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

IF il_ButtonFace = -1 THEN
		
	f_setPlatform(invo_platform, TRUE)
	
	il_ButtonFace					= invo_platform.GetSysColor(invo_constants.COLOR_BTNFACE)
	
END IF

Return(il_ButtonFace)
end function

public function long of_buttonhilight ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_buttonHiLight
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Button HighLight system color
//
//	Description: 	Returns Button HighLight system color as a long
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

IF il_ButtonHiLight = -1 THEN
	
	f_setPlatform(invo_platform, TRUE)

	il_ButtonHiLight				= invo_platform.GetSysColor(invo_constants.COLOR_BTNHIGHLIGHT)
	
END IF

Return(il_ButtonHiLight)
end function

public function long of_buttonshadow ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_buttonShadow
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Button Shadow system color
//
//	Description: 	Returns Button Shadow system color as a long
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

IF il_ButtonShadow = -1 THEN
		
	f_setPlatform(invo_platform, TRUE)
	
	il_ButtonShadow				= invo_platform.GetSysColor(invo_constants.COLOR_BTNSHADOW)
	
END IF

Return(il_ButtonShadow)
end function

public function long of_buttontext ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_buttonText
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Button Text system color
//
//	Description: 	Returns Button Text system color as a long
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

IF il_ButtonText = -1 THEN
		
	f_setPlatform(invo_platform, TRUE)
	
	il_ButtonText					= invo_platform.GetSysColor(invo_constants.COLOR_BTNTEXT)
	
END IF

Return(il_ButtonText)
end function

public function long of_graytext ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_grayText
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Gray (disabled) Text system color
//
//	Description: 	Returns Gray (disabled) Text system color as a long
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

IF il_grayText = -1 THEN
	
	f_setPlatform(invo_platform, TRUE)
	
	il_grayText						= invo_platform.GetSysColor(invo_constants.COLOR_GRAYTEXT)

END IF

Return(il_grayText)
end function

public function long of_hilight ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_hiLight
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				High Light system color
//
//	Description: 	Returns High Light System color as a long
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

IF il_HiLight = -1 THEN
		
	f_setPlatform(invo_platform, TRUE)
	
	il_HiLight						= invo_platform.GetSysColor(invo_constants.COLOR_HIGHLIGHT)
	
END IF

Return(il_HiLight)
end function

public function long of_hilighttext ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_hiLightText
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				High Light Text system color
//
//	Description: 	Returns High Light Text system color as a long
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

IF il_HiLightText = -1 THEN
	
	f_setPlatform(invo_platform, TRUE)
	
	il_HiLightText					= invo_platform.GetSysColor(invo_constants.COLOR_HIGHLIGHTTEXT)
	
END IF

Return(il_HiLightText)
end function

public function long of_hottracking ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_hotTracking
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Hot Tracking system color
//
//	Description: 	Returns Hot Tracking system color as a long
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

Return(of_hotLight())
end function

public function long of_inactiveborder ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_inactiveBorder
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Inactive Border system color
//
//	Description: 	Returns Inactive Border system color as a long
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

IF il_InactiveBorder = -1 THEN
	
	f_setPlatform(invo_platform, TRUE)

	il_InactiveBorder				= invo_platform.GetSysColor(invo_constants.COLOR_INACTIVEBORDER)
	
END IF

Return(il_InactiveBorder)
end function

public function long of_infotext ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_infoText
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Info (toolTip) Text system color
//
//	Description: 	Returns Info (toolTip) Text system color as a long
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

IF il_InfoText = -1 THEN
	
	f_setPlatform(invo_platform, TRUE)

	il_InfoText						= invo_platform.GetSysColor(invo_constants.COLOR_INFOTEXT)
	
END IF

Return(il_InfoText)
end function

public function long of_menu ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_menu
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Menu system color
//
//	Description: 	Returns Menu system color as a long
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

IF il_Menu = -1 THEN
	
	f_setPlatform(invo_platform, TRUE)

	il_Menu							= invo_platform.GetSysColor(invo_constants.COLOR_MENU)
	
END IF

Return(il_Menu)
end function

public function long of_menubar ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_menuBar
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Menu Bar system color
//
//	Description: 	Returns Menu Bar system color as a long
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

IF il_MenuBar = -1 THEN
		
	f_setPlatform(invo_platform, TRUE)
	
	il_MenuBar						= invo_platform.GetSysColor(invo_constants.COLOR_MENUBAR)
	
END IF

Return(il_MenuBar)
end function

public function long of_menuhilight ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_menuHiLight
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Menu High Light system color
//
//	Description: 	Returns Menu High Light system color as a long
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

IF il_MenuHiLight = -1 THEN
		
	f_setPlatform(invo_platform, TRUE)
	
	il_MenuHiLight					= invo_platform.GetSysColor(invo_constants.COLOR_MENUHILIGHT)
	
END IF

Return(il_MenuHiLight)
end function

public function long of_menutext ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_menuText
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Menu Text system color
//
//	Description: 	Returns Menu Text system color as a long
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

IF il_MenuText = -1 THEN
	
	f_setPlatform(invo_platform, TRUE)
	
	il_MenuText						= invo_platform.GetSysColor(invo_constants.COLOR_MENUTEXT)
	
END IF

Return(il_MenuText)
end function

public function long of_scrollbar ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_scrollBar
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Scroll Bar system color
//
//	Description: 	Returns Scroll Bar system color as a long
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

IF il_ScrollBar = -1 THEN
		
	f_setPlatform(invo_platform, TRUE)
	
	il_ScrollBar					= invo_platform.GetSysColor(invo_constants.COLOR_SCROLLBAR)
	
END IF

Return(il_ScrollBar)
end function

public function long of_window ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_window
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Window system color
//
//	Description: 	Returns Window system color as a long
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

IF il_Window = -1 THEN
		
	f_setPlatform(invo_platform, TRUE)
	
	il_Window						= invo_platform.GetSysColor(invo_constants.COLOR_WINDOW)
	
END IF

Return(il_Window)
end function

public function long of_windowframe ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_windowFrame
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Window Frame system color
//
//	Description: 	Returns Window Frame system color as a long
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

IF il_WindowFrame = -1 THEN
		
	f_setPlatform(invo_platform, TRUE)
	
	il_WindowFrame					= invo_platform.GetSysColor(invo_constants.COLOR_WINDOWFRAME)
	
END IF

Return(il_WindowFrame)
end function

public function long of_windowtext ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_windowText
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Window Text system color
//
//	Description: 	Returns Window Text system color as a long
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

IF il_WindowText = -1 THEN
		
	f_setPlatform(invo_platform, TRUE)
	
	il_WindowText					= invo_platform.GetSysColor(invo_constants.COLOR_WINDOWTEXT)
	
END IF

Return(il_WindowText)
end function

public function long of_red ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_red
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Red PowerBuilder color
//
//	Description: 	Returns Red PowerBuilder color as a long
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

Return(PB_PAINTER_RED)
end function

public function long of_blue ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_blue
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Blue PowerBuilder color
//
//	Description: 	Returns Blue PowerBuilder color as a long
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

Return(PB_PAINTER_BLUE)
end function

public function long of_white ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_white
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				White PowerBuilder color
//
//	Description: 	Returns White PowerBuilder color as a long
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

Return(PB_PAINTER_WHITE)
end function

public function long of_black ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_black
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Black PowerBuilder color
//
//	Description: 	Returns Black PowerBuilder color as a long
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

Return(PB_PAINTER_BLACK)
end function

public function long of_link ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_link
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Link browser color
//
//	Description: 	Returns Link browser color as a long
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

IF il_link = -1 THEN
	
	String								ls_useDlg	= 'yes'
	
	RegistryGet('HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main', 'Use_DlgBox_Colors', ls_useDlg)
	
	IF IsNull(ls_useDlg) OR Trim(ls_useDlg) = '' OR Lower(ls_useDlg) = 'no' THEN
		
		String							ls_link,	ls_hover,	ls_visited
		
		ls_link							= of_convert_colorToRGBString(of_blue(), 		',')
		ls_hover							= of_convert_colorToRGBString(of_red(), 		',')
		ls_visited						= of_convert_colorToRGBString(of_purple(),	',')
		
		RegistryGet('HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Settings', 'Anchor Color', 				ls_link)
		RegistryGet('HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Settings', 'Anchor Color Hover',		ls_hover)
		RegistryGet('HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Settings', 'Anchor Color Visited',	ls_visited)

		il_link							= of_convert_RGBStringToColor(ls_link, 		',')
		il_linkHover					= of_convert_RGBStringToColor(ls_hover, 		',')
		il_linkVisited					= of_convert_RGBStringToColor(ls_visited, 	',')
		il_linkActive					= il_linkVisited

	ELSE
	
		//	Fall back to PowerBuilder defined colors
		il_Link							= LINK
		il_linkHover					= LINK_HOVER
		il_linkVisited					= LINK_VISITED
		il_linkActive					= LINK_ACTIVE

//		DataStore						lds_colorLinks
//		lds_colorLinks					= CREATE DataStore
//	
//		lds_colorLinks.DataObject	= 'd_color_links'
//		
//		il_Link							= Long(lds_colorLinks.Describe('t_Link.Color'))
//		il_linkHover					= Long(lds_colorLinks.Describe('t_Link_Hover.Color'))
//		il_linkVisited					= Long(lds_colorLinks.Describe('t_Link_Visited.Color'))
//		il_linkActive					= Long(lds_colorLinks.Describe('t_Link_Active.Color'))
//	
//		DESTROY lds_colorLinks

	END IF

END IF

Return(il_link)
end function

public function long of_linkhover ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_linkHover
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Link Hover browser color
//
//	Description: 	Returns Link Hover browser color as a long
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

IF il_LinkHover = -1 THEN of_Link()

Return(il_LinkHover)
end function

public function long of_linkactive ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_linkActive
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Link Active browser color
//
//	Description: 	Returns Link Active browser color as a long
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

IF il_LinkActive = -1 THEN of_Link()

Return(il_LinkActive)
end function

public function long of_linkvisited ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_linkVisited
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Link Visited browser color
//
//	Description: 	Returns Link Visited browser color as a long
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

IF il_LinkVisited = -1 THEN of_Link()

Return(il_LinkVisited)
end function

public subroutine of_unrgb (long vl_color, ref integer ri_red, ref integer ri_green, ref integer ri_blue);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_unRGB
//
//	Access:  		public
//
//	Arguments:		vl_color			by value, color to be split into its RGB
//											components
//						ri_red			by reference, holds red component
//						ri_green			by reference, holds green component
//						ri_blue			by reference, holds blue component
//
//	Returns:  		None
//
//	Description: 	Breaks a color as a long into its red, green and blue
//						components
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

ri_Blue				= Int(vl_Color / 65536)
ri_Green				= Int((vl_Color - (ri_Blue * 65536)) / 256)
ri_Red				= Int(vl_Color - (ri_Blue * 65536) - (ri_Green * 256))

RETURN
end subroutine

public function long of_3ddkshadow ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_3DDkShadow
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				3D Dark Shadow system color
//
//	Description: 	Returns 3D Dark Shadow system color as a long
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

IF il_3DDkShadow = -1 THEN
	
	f_setPlatform(invo_platform, TRUE)
	
	il_3DDkShadow					= invo_platform.GetSysColor(invo_constants.COLOR_3DDKSHADOW)
	
END IF

Return(il_3DDkShadow)
end function

public function long of_infobackground ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_infoBackGround
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Info (toolTip) BackGround system color
//
//	Description: 	Returns Info (toolTip) BackGround system color as a long
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

IF il_InfoBackGround = -1 THEN
	
	f_setPlatform(invo_platform, TRUE)
	
	il_InfoBackGround				= invo_platform.GetSysColor(invo_constants.COLOR_INFOBK)
	
END IF

Return(il_InfoBackGround)
end function

public function long of_3dlight ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_3DLight
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				3D Light system color
//
//	Description: 	Returns 3D Light system color as a long
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

IF il_3DLight = -1 THEN
	
	f_setPlatform(invo_platform, TRUE)
	
	il_3DLight						= invo_platform.GetSysColor(invo_constants.COLOR_3DLIGHT)
	
END IF

Return(il_3DLight)
end function

private function long of_getcolor (string vs_getcolor);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_getColor
//
//	Access:  		public
//
//	Arguments:		vs_getColor		by value, registry key used to locate color
//
//	Returns:  		Long				Registry RGB color requested converted to
//											a numeric
//
//	Description: 	Returns color stored in the registry as a long
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

Long							ll_Color	= -1
String						ls_Color	= ''

IF RegistryGet("HKEY_CURRENT_USER\Control Panel\Colors", vs_GetColor, RegString!, ls_Color) = 1 THEN
		
//	TRY
		IF ls_color = '' THEN
			ll_color			= -1
		ELSE
			
			String			ls_RGB[]
			
			n_cst_String	lnvo_string
			lnvo_string.of_ParseToArray(Trim(ls_Color), ' ', ls_RGB[])
				
			IF UpperBound(ls_RGB[]) = 3 THEN
				ll_Color		= RGB(Integer(ls_RGB[1]), Integer(ls_RGB[2]), Integer(ls_RGB[3]))
			END IF
			
		END IF
		
//	CATCH (RunTimeError	RunError)
//		ll_color				= -1
//	END TRY
		
END IF

Return(ll_Color)
end function

public function long of_inactivecaption ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_inactiveCaption
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				InActive Caption system color
//
//	Description: 	Returns InActive Caption system color as a long
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

IF il_InactiveCaption = -1 THEN
		
	f_setPlatform(invo_platform, TRUE)
	
	il_InactiveCaption			= invo_platform.GetSysColor(invo_constants.COLOR_INACTIVECAPTION)
	
END IF

Return(il_InactiveCaption)
end function

public function long of_captiontext ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_captionText
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Caption Text system color
//
//	Description: 	Returns Caption Text system color as a long
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

IF il_CaptionText = -1 THEN
		
	f_setPlatform(invo_platform, TRUE)
	
	il_CaptionText						= invo_platform.GetSysColor(invo_constants.COLOR_CAPTIONTEXT)
	
END IF

Return(il_CaptionText)
end function

public function long of_inactivecaptiontext ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_inActiveCaptionText
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				InActive Caption Text system color
//
//	Description: 	Returns Inactive Caption Text system color as a long
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

IF il_InactiveCaptionText = -1 THEN
		
	f_setPlatform(invo_platform, TRUE)
	
	il_InactiveCaptionText		= invo_platform.GetSysColor(invo_constants.COLOR_INACTIVECAPTIONTEXT)
	
END IF

Return(il_InactiveCaptionText)
end function

public function long of_activecaption ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_activeCaption
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Active Caption system color
//
//	Description: 	Returns Active Caption system color as a long
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

IF il_ActiveCaption = -1 THEN
	
	f_setPlatform(invo_platform, TRUE)
	
	il_ActiveCaption				= invo_platform.GetSysColor(invo_constants.COLOR_ACTIVECAPTION)
	
END IF

Return(il_ActiveCaption)
end function

public function long of_gradientactivecaption ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_gradientActiveCaption
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Gradient Active Caption system color
//
//	Description: 	Returns Gradient Active Caption system color as a long
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

IF il_GradientActiveCaption = -1 THEN
	
	f_setPlatform(invo_platform, TRUE)
	
	il_GradientActiveCaption	= invo_platform.GetSysColor(invo_constants.COLOR_GRADIENTACTIVECAPTION)
	
END IF

Return(il_GradientActiveCaption)
end function

public function long of_gradientinactivecaption ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_gradientInActiveCaption
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Gradient InActive Caption system color
//
//	Description: 	Returns Gradient InActive Caption system color as a long
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

IF il_GradientInactiveCaption = -1 THEN
		
	f_setPlatform(invo_platform, TRUE)
	
	il_GradientInactiveCaption	= invo_platform.GetSysColor(invo_constants.COLOR_GRADIENTINACTIVECAPTION)
	
END IF

Return(il_GradientInactiveCaption)
end function

public function long of_cyan ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_cyan
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Cyan RGB color
//
//	Description: 	Returns Cyan RGB color as a long
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

Return(CYAN)
end function

public function long of_yellowsticky ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_yellowSticky
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Yellow Sticky (post it) RGB color
//
//	Description: 	Returns Yellow Sticky (post it) RGB color as a long
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

Return(YELLOW_STICKY)
end function

public function long of_yellow ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_yellow
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Yellow PowerBuilder color
//
//	Description: 	Returns Yellow PowerBuilder color as a long
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

Return(PB_PAINTER_YELLOW)
end function

public function long of_gray ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_gray
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Gray PowerBuilder color
//
//	Description: 	Returns Gray PowerBuilder color as a long
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

Return(PB_PAINTER_GRAY)
end function

public function long of_brown ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_brown
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Brown RGB color
//
//	Description: 	Returns Brown RGB color as a long
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

Return(BROWN)
end function

public function long of_silver ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_silver
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Silver PowerBuilder color
//
//	Description: 	Returns Silver PowerBuilder color as a long
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

Return(PB_PAINTER_SILVER)
end function

public function long of_teal ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_teal
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Teal PowerBuilder color
//
//	Description: 	Returns Teal PowerBuilder color as a long
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

Return(PB_PAINTER_TEAL)
end function

public function long of_sky ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_sky
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Sky PowerBuilder color
//
//	Description: 	Returns Sky PowerBuilder color as a long
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

Return(PB_PAINTER_SKY)
end function

public function long of_cream ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_cream
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Cream PowerBuilder color
//
//	Description: 	Returns Cream PowerBuilder color as a long
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

Return(PB_PAINTER_CREAM)
end function

public function long of_mint ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_mint
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Mint PowerBuilder color
//
//	Description: 	Returns Mint PowerBuilder color as a long
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

Return(PB_PAINTER_MINT)
end function

public function long of_navy ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_navy
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Navy PowerBuilder color
//
//	Description: 	Returns Navy PowerBuilder color as a long
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

Return(PB_PAINTER_NAVY)
end function

public function long of_mediumgray ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_mediumGray
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Medium Gray PowerBuilder color
//
//	Description: 	Returns Medium Gray PowerBuilder color as a long
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

Return(PB_PAINTER_MEDIUM_GRAY)
end function

public function long of_olive ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_olive
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Olive PowerBuilder color
//
//	Description: 	Returns Olive PowerBuilder color as a long
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

Return(PB_PAINTER_OLIVE)
end function

public function long of_lime ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_lime
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Lime PowerBuilder color
//
//	Description: 	Returns Lime PowerBuilder color as a long
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

Return(PB_PAINTER_LIME)
end function

public function long of_green ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_green
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Green RGB color
//
//	Description: 	Returns Green RGB color as a long
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

Return(GREEN)
end function

public function long of_aqua ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_aqua
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Aqua PowerBuilder color
//
//	Description: 	Returns Aqua PowerBuilder color as a long
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

Return(PB_PAINTER_AQUA)
end function

public function long of_fushia ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_fushia
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Fushia PowerBuilder color
//
//	Description: 	Returns Fushia PowerBuilder color as a long
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

Return(PB_PAINTER_FUCSHIA)
end function

public function long of_maroon ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_maroon
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Maroon PowerBuilder color
//
//	Description: 	Returns Maroon PowerBuilder color as a long
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

Return(PB_PAINTER_MAROON)
end function

public function long of_purple ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_purple
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Purple PowerBuilder color
//
//	Description: 	Returns Purple PowerBuilder color as a long
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

Return(PB_PAINTER_PURPLE)
end function

public function long of_hotlight ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_hotLight
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Hot Light (tracking) system color
//
//	Description: 	Returns Hot Light (tracking) system color as a long
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

IF il_HotTracking = -1 THEN
		
	f_setPlatform(invo_platform, TRUE)
	
	il_HotTracking					= invo_platform.GetSysColor(invo_constants.COLOR_HOTLIGHT)
	
END IF

Return(il_HotTracking)
end function

public function long of_pink ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pink
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Pink RGB color
//
//	Description: 	Returns Pink RGB color as a long
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

Return(PINK)
end function

public function long of_lightgray ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_lightGray
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Light Gray RGB color
//
//	Description: 	Returns Light Gray RGB color as a long
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

Return(LIGHT_GRAY)
end function

public function long of_darkgray ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_darkGray
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Dark Gray RGB color
//
//	Description: 	Returns Dark Gray RGB color as a long
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

Return(DARK_GRAY)
end function

public function long of_darkred ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_darkRed
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Dark Red RGB color
//
//	Description: 	Returns Dark Red RGB color as a long
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

Return(DARK_RED)
end function

public function long of_darkgreen ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_darkGreen
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Dark Green PowerBuilder color
//
//	Description: 	Returns Dark Green PowerBuilder color as a long
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

Return(PB_PAINTER_GREEN)
end function

public function long of_darkblue ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_darkBlue
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Dark Blue RGB color
//
//	Description: 	Returns Dark Blue color as a long
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

Return(DARK_BLUE)
end function

public function long of_magenta ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_magenta
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Magenta RGB color
//
//	Description: 	Returns Magenta RGB color as a long
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

Return(MAGENTA)
end function

public function long of_darkmagenta ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_darkMagenta
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Dark Magenta RGB color
//
//	Description: 	Returns Dark Magenta RGB color as a long
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

Return(DARK_MAGENTA)
end function

public function long of_darkcyan ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_darkCyan
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Dark Cyan RGB color
//
//	Description: 	Returns Dark Cyan RGB color as a long
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

Return(DARK_CYAN)
end function

public subroutine of_reset ();il_ActiveBorder								= -1
il_ActiveCaption								= -1
il_AppWorkSpace								= -1
il_Background									= -1
il_ButtonAlternateFace						= -1
il_3DDkShadow									= -1
il_ButtonFace									= -1
il_ButtonHilight								= -1
il_3DLight										= -1
il_ButtonShadow								= -1
il_ButtonText									= -1
il_GradientActiveCaption					= -1
il_GradientInactiveCaption					= -1
il_GrayText										= -1
il_Hilight										= -1
il_HilightText									= -1
il_HotTracking									= -1
il_InactiveBorder								= -1
il_InactiveCaption							= -1
il_InactiveCaptionText						= -1
il_InfoText										= -1
il_InfoBackGround								= -1
il_Menu											= -1
il_MenuBar										= -1
il_MenuHilight									= -1
il_MenuText										= -1
il_Scrollbar									= -1
il_CaptionText									= -1
il_Window										= -1
il_WindowFrame									= -1
il_WindowText									= -1

il_Link											= -1
il_LinkHover									= -1
il_LinkActive									= -1
il_LinkVisited									= -1

RETURN
end subroutine

public function long of_convert_rgbstringtocolor (string vs_color, string vs_delimiter);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_convert_RGBStringToColor
//
//	Access:  		public
//
//	Arguments:		vs_color			by value, color string to convert
//						vs_delimiter	by value, delimiter used to separate the
//											RGB components of the color.
//
//	Returns:  		Long				color
//
//	Description: 	Takes a color stored as a string, ie. 255 255 255 is
//						white.  And combines them into a long color value.
//						Useful when reading colors stored by windows in the
//						registry.
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

String					ls_RGB[]

n_cst_String			luo_String
	
IF luo_String.of_ParseToArray(Trim(vs_Color), vs_delimiter, ls_RGB[]) < 3 THEN return -1
		
Return(RGB(Integer(ls_RGB[1]), Integer(ls_RGB[2]), Integer(ls_RGB[3])))
end function

public function string of_convert_colortorgbstring (long vl_color, string vs_delimiter);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_convert_colorToRGBString
//
//	Access:  		public
//
//	Arguments:		vl_color			by value, color as a long to reformat
//
//	Returns:  		String			color as a 3 part (RGB) string
//
//	Description: 	Takes a color stored as a long, breaks it up into its
//						RGB components and then creates a string with each
//						component separated by the delimiter indicated.  Useful
//						when storing colors in the registry as windows does,
//						ie. 255 255 255 is white.
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

Integer							li_red	= 0,	li_green	= 0,	li_blue	= 0

of_unRGB(vl_color, li_red, li_green, li_blue)

Return(String(li_red) + vs_delimiter + String(li_green) + vs_delimiter + String(li_blue))
end function

public function long of_orange ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_orange
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				Orange RGB color
//
//	Description: 	Returns Orange RGB color as a long
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

Return(ORANGE)
end function

public function long of_disabledtext ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_disabledText
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Long				of_grayText()
//
//	Description: 	Returns of_grayText() color as a long.  Purpose of this
//						method is simply to provide a more descriptive call for
//						of_grayText().
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

Return(of_grayText())
end function

on pfc_n_cst_color.create
call super::create
end on

on pfc_n_cst_color.destroy
call super::destroy
end on

event destructor;call super::destructor;f_setPlatform(invo_platform, FALSE)
end event


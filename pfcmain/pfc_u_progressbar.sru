HA$PBExportHeader$pfc_u_progressbar.sru
$PBExportComments$PFC ProgressBar class
forward
global type pfc_u_progressbar from u_base
end type
type dw_progress from datawindow within pfc_u_progressbar
end type
end forward

global type pfc_u_progressbar from u_base
int Width=1170
int Height=72
long BackColor=74481808
long PictureMaskColor=25166016
long TabBackColor=74481808
dw_progress dw_progress
end type
global pfc_u_progressbar pfc_u_progressbar

type variables
Public:
// display style
constant integer BAR = 0
constant integer PCTCOMPLETE = 1
constant integer POSITION = 2
constant integer MSGTEXT = 3

// fill style
constant integer LEFTRIGHT = 0
constant integer RIGHTLEFT = 1
constant integer TOPDOWN = 2
constant integer BOTTOMUP = 3

Protected:
boolean	ib_autoreset = True
integer	ii_displaystyle = BAR 	//0=just the bar/1=% complete/2=#complete/3=text from settext
integer	ii_fillstyle = LEFTRIGHT   	//topdown = 2/bottomup=3/leftright=0/rightleft=1
integer	ii_maximum = 100
integer	ii_minimum = 0
integer	ii_step = 10
integer	ii_percentcomplete
integer	ii_position
integer	ii_msgtextcount
long	il_fillcolor = 16668075	// blue
long	il_textcolor = 0		// black
long	il_backcolor = 78682240	// buttonface

String	is_msgtext[]



end variables

forward prototypes
public function integer of_getdisplaystyle ()
public function integer of_getmaximum ()
public function integer of_getminimum ()
public function integer of_getposition ()
public function integer of_getstep ()
public function long of_getfillcolor ()
public function integer of_setposition (integer ai_position)
public function string of_setfontbold (boolean ab_bold)
public function string of_setfontitalic (boolean ab_italic)
public function string of_setfontunderline (boolean ab_underline)
public function string of_setfontface (string as_fontface)
public function string of_setfontfamily (fontfamily aff_fontfamily)
public function string of_setfontpitch (fontpitch afp_fontpitch)
public function integer of_setmaximum (integer ai_maximum)
public function integer of_setminimum (integer ai_minimum)
public function integer of_setstep (integer ai_step)
public function integer of_setfillcolor (long al_fillcolor)
public function integer of_setfillstyle (integer ai_fillstyle)
public function integer of_getfillstyle ()
public function integer of_reset ()
public function integer of_setdisplaystyle (integer ai_displaystyle)
public function string of_getcurrenttext ()
public function integer of_increment (integer ai_inc)
public function integer of_increment ()
protected function integer of_updatevisuals (decimal adc_completion)
public function string of_setfontsize (integer ai_fontsize)
protected function string of_setfont (string as_fontface, integer ai_fontsize, integer ai_fontcharset, fontfamily aff_fontfamily, fontpitch afp_fontpitch, boolean ab_bold, boolean ab_italic, boolean ab_underline)
public function string of_setfontcharset (integer ai_fontcharset)
public function integer of_setautoreset (boolean ab_switch)
public function boolean of_isautoreset ()
public function integer of_setmessagetext (string as_msgtext[])
public function integer of_settextcolor (long al_textcolor)
public function long of_gettextcolor ()
public function long of_getbackcolor ()
public function integer of_setbackcolor (long al_backcolor)
public function integer of_getmessagetext (ref string as_messagetext[])
public function integer of_getpctcomplete ()
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
end prototypes

public function integer of_getdisplaystyle ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetDisplayStyle
//
//	Access:		public
//
//	Arguments:	None
//
//	Returns:		integer
//	 the display style of the progress bar
//		0=just the bar
//		1=% complete
//		2=position
//		3=text from settext
//
//	Description:
//	Returns the display style of the progress bar
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


return ii_displaystyle
end function

public function integer of_getmaximum ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetMaximum
//
//	Access:		public
//
//	Arguments:	None
//
//	Returns:		integer
//	 the maximum value the progress bar will increment to
//
//	Description:
//	Returns the maximum value the progress bar will increment to
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

return ii_maximum
end function

public function integer of_getminimum ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetMinimum
//
//	Access:		public
//
//	Arguments:	None
//
//	Returns:		integer
//	 the minimum value the progress bar starts from
//
//	Description:
//	Return the minumum value progress bar will start from
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

return ii_minimum
end function

public function integer of_getposition ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetPosition
//
//	Access:		public
//
//	Arguments:	None
//
//	Returns:		integer
//	 the incremented position of the progress bar (between minimum and maximum)
//
//	Description:
//	Returns the currently incremented position of the progress bar
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

return ii_position
end function

public function integer of_getstep ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetStep
//
//	Access:		public
//
//	Arguments:	None
//
//	Returns:  integer
//	 the step value of the increment if default value is to be used
//
//	Description:
//	Returns the step value to use during a default increment process
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

return ii_step
end function

public function long of_getfillcolor ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetFillColor
//
//	Access:		public
//
//	Arguments:	None
//
//	Returns:		long
//	 the color the progressbar will fill with
//
//	Description:
//	Returns the color the progress bar fills up with.
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

return il_fillcolor
end function

public function integer of_setposition (integer ai_position);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetPosition
//
//	Access:		public
//
//	Arguments:	
//	ai_position		the position the progress bar 
//
//	Returns:		integer
//	SUCCESS = the current position of the progress bar
//	ERROR = -1
//
//	Description:
//	Sets the current position of the progress bar
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
decimal	ldc_completion
integer	li_rc

if isnull(ai_position) then 
	return -1
end if

// If this is less than the minimum, the current position is set to the minimum
if ai_position < ii_minimum then
	ai_position = ii_minimum
end if

// If this is greater than the maximum, the current position is set to the maximum
if ai_position > ii_maximum then
	ai_position = ii_maximum
end if

ii_position = ai_position

dw_progress.setredraw(false)

// if maximum value is zero we are completed (prevents divide by zero)
// or if completion result will be greater than 1 then make it 1
// otherwise find our completion percentage
if (ii_maximum = 0) or (ii_position > ii_maximum) then
	ldc_completion = 1
else
	// turn on the progress rectangle and percentage text if style uses it
	dw_progress.object.pct.visible = 1
	dw_progress.object.progress_rect.visible = 1
	ldc_completion = ii_position / ii_maximum
	ii_percentcomplete = ldc_completion * 100
end if

li_rc = of_updatevisuals(ldc_completion)

dw_progress.setredraw(true)

// turn off progressbar after it reaches 100%
if ldc_completion >= 1 and ib_autoreset then
	this.post function of_reset()
end if

if li_rc < 0 then
	return li_rc
else
	return ii_position
end if
end function

public function string of_setfontbold (boolean ab_bold);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetFontBold
//
//	Access:		public
//
//	Arguments:	
//	ab_bold		true if progress bar text should be bold
//
//	Returns:		String
//		The output of the Modify command (the error text or "") 
//
//	Description:
//	Sets the progress bar text attribute to bold/not bold
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

string		ls_fontface
integer		li_fontsize, li_fontcharset
fontfamily	lff_fontfamily
fontpitch	lfp_fontpitch
boolean		lb_bold, lb_italic, lb_underline

setnull(ls_fontface)
setnull(li_fontsize)
setnull(li_fontcharset)
setnull(lff_fontfamily)
setnull(lfp_fontpitch)
setnull(lb_bold)
setnull(lb_italic)
setnull(lb_underline)

return of_setfont(ls_fontface, li_fontsize, li_fontcharset, lff_fontfamily, lfp_fontpitch, ab_bold, &
         lb_italic, lb_underline)

end function

public function string of_setfontitalic (boolean ab_italic);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetFontItalic
//
//	Access:		public
//
//	Arguments:	
//	ab_italic	true if progress bar text should be italic
//
//	Returns:		String
//		The output of the Modify command (the error text or "") 
//
//	Description:
//	Sets the progress bar text attribute to italic/not italic
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

string		ls_fontface
integer		li_fontsize, li_fontcharset
fontfamily	lff_fontfamily
fontpitch	lfp_fontpitch
boolean		lb_bold, lb_italic, lb_underline

setnull(ls_fontface)
setnull(li_fontsize)
setnull(li_fontcharset)
setnull(lff_fontfamily)
setnull(lfp_fontpitch)
setnull(lb_bold)
setnull(lb_italic)
setnull(lb_underline)

return of_setfont(ls_fontface, li_fontsize, li_fontcharset, lff_fontfamily, lfp_fontpitch, lb_bold, &
         ab_italic, lb_underline)

end function

public function string of_setfontunderline (boolean ab_underline);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetFontUnderline
//
//	Access:		public
//
//	Arguments:	
//	ab_underline	true if progress bar text should be underlined
//
//	Returns:		String
//		The output of the Modify command (the error text or "") 
//
//	Description:
//	Sets the progress bar text attribute to underline/not underline
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

string		ls_fontface
integer		li_fontsize, li_fontcharset
fontfamily	lff_fontfamily
fontpitch	lfp_fontpitch
boolean		lb_bold, lb_italic, lb_underline

setnull(ls_fontface)
setnull(li_fontsize)
setnull(li_fontcharset)
setnull(lff_fontfamily)
setnull(lfp_fontpitch)
setnull(lb_bold)
setnull(lb_italic)
setnull(lb_underline)

return of_setfont(ls_fontface, li_fontsize, li_fontcharset, lff_fontfamily, lfp_fontpitch, lb_bold, &
         lb_italic, ab_underline)

end function

public function string of_setfontface (string as_fontface);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetFontFace
//
//	Access:		public
//
//	Arguments:	
//	as_fontface	Sets the font face of the progress bar text (eg "Arial")
//
//	Returns:		String
//		The output of the Modify command (the error text or "") 
//
//	Description:
//	Sets the progress bar font face
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

string		ls_fontface
integer		li_fontsize, li_fontcharset
fontfamily	lff_fontfamily
fontpitch	lfp_fontpitch
boolean		lb_bold, lb_italic, lb_underline

setnull(ls_fontface)
setnull(li_fontsize)
setnull(li_fontcharset)
setnull(lff_fontfamily)
setnull(lfp_fontpitch)
setnull(lb_bold)
setnull(lb_italic)
setnull(lb_underline)

return of_setfont(as_fontface, li_fontsize, li_fontcharset, lff_fontfamily, lfp_fontpitch, lb_bold, &
         lb_italic, lb_underline)

end function

public function string of_setfontfamily (fontfamily aff_fontfamily);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetFontFamily
//
//	Access:		public
//
//	Arguments:	
//	aff_fontfamily	enumerated fontfamily datatype representation Family font 
//		belongs to (eg roman!)
//
//	Returns:		String
//		The output of the Modify command (the error text or "") 
//
//	Description:
//	Sets the font family progress bar text attribute
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

string		ls_fontface
integer		li_fontsize, li_fontcharset
fontfamily	lff_fontfamily
fontpitch	lfp_fontpitch
boolean		lb_bold, lb_italic, lb_underline

setnull(ls_fontface)
setnull(li_fontsize)
setnull(li_fontcharset)
setnull(lff_fontfamily)
setnull(lfp_fontpitch)
setnull(lb_bold)
setnull(lb_italic)
setnull(lb_underline)

return of_setfont(ls_fontface, li_fontsize, li_fontcharset, aff_fontfamily, lfp_fontpitch, lb_bold, &
         lb_italic, lb_underline)

end function

public function string of_setfontpitch (fontpitch afp_fontpitch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetFontPitch
//
//	Access:		public
//
//	Arguments:	
//	afp_fontpitch	enumerated datatype font should be (fixed!)
//
//	Returns:		String
//		The output of the Modify command (the error text or "") 
//
//	Description:
//	Sets the progress bar font pitch text attribute
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

string		ls_fontface
integer		li_fontsize, li_fontcharset
fontfamily	lff_fontfamily
fontpitch	lfp_fontpitch
boolean		lb_bold, lb_italic, lb_underline

setnull(ls_fontface)
setnull(li_fontsize)
setnull(li_fontcharset)
setnull(lff_fontfamily)
setnull(lfp_fontpitch)
setnull(lb_bold)
setnull(lb_italic)
setnull(lb_underline)

return of_setfont(ls_fontface, li_fontsize, li_fontcharset, lff_fontfamily, afp_fontpitch, lb_bold, &
         lb_italic, lb_underline)

end function

public function integer of_setmaximum (integer ai_maximum);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetMaximum
//
//	Access:		public
//
//	Arguments:	
//	ai_maximum	the maximum value the progress bar will increment to
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Sets the maximum value the progress bar will increment to
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

if isnull(ai_maximum) or (ai_maximum <= 0) then
	return -1
end if

ii_maximum = ai_maximum

return 1
end function

public function integer of_setminimum (integer ai_minimum);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetMinimum
//
//	Access:		public
//
//	Arguments:	
//	ai_minimum	the minimum value the progress bar will start from
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Sets the minimum value the progress bar will start from
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

if isnull(ai_minimum) or (ai_minimum < 0) then
	return -1
end if

ii_minimum = ai_minimum

return 1
end function

public function integer of_setstep (integer ai_step);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetStep
//
//	Access:		public
//
//	Arguments:	
//	ai_step	the step value the progress bar will increment by
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Sets the step value the progress bar will increment by
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

if isnull(ai_step) or (ai_step <= 0) then
	return -1
end if

ii_step = ai_step

return 1
end function

public function integer of_setfillcolor (long al_fillcolor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetFillColor
//
//	Access:		public
//
//	Arguments:
//	al_fillcolor   color the progress bar will fill with
//
//	Returns:  integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Set the color the progress bar will fill with
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

string	ls_modify, ls_return

if isnull(al_fillcolor) then
	return -1
end if

il_fillcolor = al_fillcolor

ls_modify = "progress_rect.brush.color='" + string(al_fillcolor) + "'"
ls_return = dw_progress.Modify(ls_Modify)

if ls_return <> "" then
	return -1
end if

return 1
end function

public function integer of_setfillstyle (integer ai_fillstyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetFillStyle
//
//	Access:		Public
//
//	Arguments:
//	ai_fillstyle   the fill style of the progressbar
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Set the fill style of the progress bar
//		0 = LEFTRIGHT
//		1 = RIGHTLEFT
//		2 = TOPDOWN
//		3 = BOTTOMUP
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

if isnull(ai_fillstyle) then
	return -1
end if

if NOT ((ai_fillstyle = TOPDOWN) or (ai_fillstyle = BOTTOMUP) or &
			(ai_fillstyle = LEFTRIGHT) or (ai_fillstyle = RIGHTLEFT)) then 
	return -1
end if

ii_fillstyle = ai_fillstyle

return 1

end function

public function integer of_getfillstyle ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetFillStyle
//
//	Access:		public
//
//	Arguments:	None
//
//	Returns:  integer
//	 the fill style of the progress bar
//		0 = LEFTRIGHT
//		1 = RIGHTLEFT
//		2 = TOPDOWN
//		3 = BOTTOMUP
//
//	Description:
//	Returns the fill style of the progress bar
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


return ii_fillstyle
end function

public function integer of_reset ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_reset
//
//	Access:		public
//
//	Arguments:	None
//
//	Returns:  Integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Reset the progress bar.  
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

dw_progress.setredraw(false)

// turn the visible properties of the progress bar off
dw_progress.object.progress_rect.visible = 0
dw_progress.object.pct.visible = 0

dw_progress.setredraw(true)

// reset the position of the progress bar
ii_position = ii_minimum
ii_percentcomplete = 0
dw_progress.object.pct[1] = ""

return 1
end function

public function integer of_setdisplaystyle (integer ai_displaystyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetDisplayStyle
//
//	Access:		public
//
//	Arguments:
//	ai_displaystyle   display style of the progressbar
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Set the display style of the progress bar
//		0=just the bar
// 	1=% complete
// 	2=position
// 	3=text from settext
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

if isnull(ai_displaystyle) then 
	return -1
end if

if NOT ((ai_displaystyle = BAR) or (ai_displaystyle = PCTCOMPLETE) or &
			(ai_displaystyle = POSITION) or (ai_displaystyle = MSGTEXT)) then 
	return -1
end if

ii_displaystyle = ai_displaystyle

return 1
end function

public function string of_getcurrenttext ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetCurrentText
//
//	Access:		public
//
//	Arguments:	None
//
//	Returns:		string
//	 the current text on the progress bar
//
//	Description:
//	returns the current text on the progress bar
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

string	ls_msgtext

ls_msgtext = dw_progress.object.pct[1]

return ls_msgtext
end function

public function integer of_increment (integer ai_inc);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_increment
//
//	Access:		public
//
//	Arguments:
//	ai_inc		value to increment the progress bar
//
//	Returns:		integer
//	 the new position of the progress bar
//
//	Description:
//	Increments the progress bar by ai_inc
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

integer	li_completion

if (ai_inc <= 0) or isnull(ai_inc) then
	return -1
end if

// increment the position i = i+inc
ii_position += ai_inc

// display the change on the progress bar
return of_setposition(ii_position)

end function

public function integer of_increment ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_increment
//
//	Access:		public
//
//	Arguments:	None
//
//	Returns:  integer
//	 the new position of the progress bar
//
//	Description:
//	Increments the progress bar by the default step value
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

return of_increment(ii_step)
end function

protected function integer of_updatevisuals (decimal adc_completion);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_UpdateVisuals
//
//	Access:		protected
//
//	Arguments:	decimal
//	adc_completion	the completion value of the progress bar
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Resizes the progressbar to the completion size and sets the display text
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

long	ll_index, ll_width, ll_height

if isnull(adc_completion) or (adc_completion < 0) then
	return -1
end if

ll_width = this.width
ll_height = this.height

CHOOSE Case ii_fillstyle
	Case RIGHTLEFT
		// horizontal movement from right to left
		dw_progress.object.progress_rect.x = ll_width - integer(adc_completion * ll_width)
		dw_progress.object.progress_rect.width = integer(adc_completion * ll_width)
	Case LEFTRIGHT
		// horizontal movement from left to right
		dw_progress.object.progress_rect.width = integer(adc_completion * ll_width)
	Case TOPDOWN
		// vertical movement from top to bottom
		dw_progress.object.progress_rect.height = integer(adc_completion * ll_height)
	Case BOTTOMUP
		// vertical movement from bottom to top
		dw_progress.object.progress_rect.y = ll_height - integer(adc_completion * ll_height)
		dw_progress.object.progress_rect.height = integer(adc_completion * ll_height)
END CHOOSE

// Set percentages on screen
CHOOSE CASE ii_displaystyle
	CASE BAR
		dw_progress.object.pct.visible = 0
		dw_progress.object.pct[1] = ""
	CASE PCTCOMPLETE
		dw_progress.object.pct[1] = string(adc_completion, "#%")
	CASE POSITION
		dw_progress.object.pct[1] = string(ii_position, "#")
	CASE MSGTEXT
		if ii_msgtextcount > 0 then
			for ll_index = 1 to ii_msgtextcount
				if (adc_completion <= (ll_index / ii_msgtextcount)) then
					dw_progress.object.pct[1] = is_msgtext[ll_index]
					exit
				end if
			end for
		else
			dw_progress.object.pct[1] = "??"
		end if
	CASE ELSE
		dw_progress.object.pct.visible = 0
END CHOOSE

return 1
end function

public function string of_setfontsize (integer ai_fontsize);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetFontSize
//
//	Access:		public
//
//	Arguments:	
//	ai_fontsize	size the progress bar text should display in
//
//	Returns:		String
//		The output of the Modify command (the error text or "") 
//
//	Description:
//	Sets the progress bar text font size
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

string		ls_fontface
integer		li_fontsize, li_fontcharset
fontfamily	lff_fontfamily
fontpitch	lfp_fontpitch
boolean		lb_bold, lb_italic, lb_underline

setnull(ls_fontface)
setnull(li_fontsize)
setnull(li_fontcharset)
setnull(lff_fontfamily)
setnull(lfp_fontpitch)
setnull(lb_bold)
setnull(lb_italic)
setnull(lb_underline)

return of_setfont(ls_fontface, ai_fontsize, li_fontcharset, lff_fontfamily, lfp_fontpitch, lb_bold, &
         lb_italic, lb_underline)

end function

protected function string of_setfont (string as_fontface, integer ai_fontsize, integer ai_fontcharset, fontfamily aff_fontfamily, fontpitch afp_fontpitch, boolean ab_bold, boolean ab_italic, boolean ab_underline);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetFont
//
//	Access:		protected
//
//	Arguments:
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	ai_FontCharSet			The Character set to use for the Font  (0 - ANSI)
//	aff_FontFamily			The font family (AnyFont!, Roman!, Swiss!, Modern!, 
//									Script!, Decorative!)
//	afp_FontPitch				The pitch of the font (Default!, Fixed!, Variable!)
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//
//	Returns:		String
//		The output of the Modify command (the error text or "") 
//
//	Description:	Change the font of an object in the datawindow.
//	copied from pfc_n_cst_dwsrv_report to make this object pfc independent
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

String			ls_FontFace, ls_Modify, ls_Objects[], ls_Undo, ls_FontSize, &
					ls_FontFamily, ls_OldFamily, ls_FontPitch, ls_OldPitch, ls_FontWeight, &
					ls_OldWeight, ls_Italic, ls_OldItalic, ls_Underline, ls_OldUnderline, &
					ls_FontCharSet, ls_name, ls_Return
Integer			li_NumObjects, li_Count, li_Undo

// Determine the DataWindow Modify parameters
Choose Case aff_FontFamily
	Case AnyFont!
		ls_FontFamily = "0"
	Case Roman!
		ls_FontFamily = "1"
	Case Swiss!
		ls_FontFamily = "2"
	Case Modern!
		ls_FontFamily = "3"
	Case Script!
		ls_FontFamily = "4"
	Case Decorative!
		ls_FontFamily = "5"
End Choose

Choose Case afp_FontPitch
	Case Default!
		ls_FontPitch = "0"
	Case Fixed!
		ls_FontPitch = "1"
	Case Variable!
		ls_FontPitch = "2"
End Choose

If ab_Bold Then
	ls_FontWeight = "700"
Else
	ls_FontWeight = "400"
End If

If ab_Italic Then
	ls_Italic = "1"
Else
	ls_Italic = "0"
End If

If ab_Underline Then
	ls_Underline = "1"
Else
	ls_Underline = "0"
End If

// Change font size
ls_FontSize = dw_progress.object.pct.Font.Height
If Not IsNull(ai_FontSize) And ai_FontSize <> integer(ls_FontSize) Then
	ls_Modify = " pct.Font.Height='-" + String(ai_FontSize) + "'"
End if

// Change font CharSet
ls_FontCharSet = dw_progress.object.pct.Font.CharSet
If Not IsNull(ai_FontCharSet) And ai_FontCharSet <> integer(ls_FontCharSet) Then
	ls_Modify = " pct.Font.CharSet='" + String(ai_FontCharSet) + "'"
End if

// Change font face
If Not IsNull(as_FontFace) Then
	ls_FontFace = dw_progress.object.pct.Font.Face
	If as_FontFace <> ls_FontFace Then
		ls_Modify =  ls_Modify + " pct.Font.Face='" + as_FontFace + "'"
	End if
End if

// Change font family
If Not IsNull(aff_FontFamily) Then
	ls_OldFamily = dw_progress.object.pct.Font.Family
	If ls_FontFamily <> ls_OldFamily Then
		ls_Modify =  ls_Modify + " pct.Font.Family='" + ls_FontFamily + "'"
	End if
End if

// Change font pitch
If Not IsNull(afp_FontPitch) Then
	ls_OldPitch = dw_progress.object.pct.Font.Pitch
	If ls_FontPitch <> ls_OldPitch Then
		ls_Modify =  ls_Modify + " pct.Font.Pitch='" + ls_FontPitch + "'"
	End if
End if

	// Change font weight
If Not IsNull(ab_Bold) Then
	ls_OldWeight = dw_progress.object.pct.Font.Weight
	If ls_FontWeight <> ls_OldWeight Then
		ls_Modify = ls_Modify + " pct.Font.Weight='" + ls_FontWeight + "'"
	End if
End if

// Change italic
If Not IsNull(ab_Italic) Then
	If dw_progress.object.pct.Font.Italic <> "1" Then
		ls_OldItalic = "0"
	Else
		ls_OldItalic = "1"
	End If
	If ls_Italic <> ls_OldItalic Then
		ls_Modify = ls_Modify + " pct.Font.Italic='" + ls_Italic + "'"
	End if
End if

// Change underline
If Not IsNull(ab_Underline) Then
	If dw_progress.object.pct.Font.Underline <> "1" Then
		ls_OldUnderline = "0"
	Else
		ls_OldUnderline = "1"
	End If
	If ls_Underline <> ls_OldUnderline Then
		ls_Modify = ls_Modify + " pct.Font.Underline='" + ls_Underline + "'"
	End if
End if

ls_Return = dw_progress.Modify(ls_Modify)

Return ls_Return

end function

public function string of_setfontcharset (integer ai_fontcharset);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetFontCharSet
//
//	Access:		public
//
//	Arguments:	
//	ai_FontCharSet	The Character Set The Font Uses on the Progress Bar
//
//	Returns:		String
//		The output of the Modify command (the error text or "") 
//
//	Description:
//	Sets the progress bar text font character set
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

string		ls_fontface
integer		li_fontsize, li_fontcharset
fontfamily	lff_fontfamily
fontpitch	lfp_fontpitch
boolean		lb_bold, lb_italic, lb_underline

setnull(ls_fontface)
setnull(li_fontsize)
setnull(li_fontcharset)
setnull(lff_fontfamily)
setnull(lfp_fontpitch)
setnull(lb_bold)
setnull(lb_italic)
setnull(lb_underline)

return of_setfont(ls_fontface, li_fontsize, ai_fontcharset, lff_fontfamily, lfp_fontpitch, lb_bold, &
         lb_italic, lb_underline)

end function

public function integer of_setautoreset (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetAutoReset
//
//	Access:  	public
//
//	Arguments:	
//	ab_switch	True to Reset the progress bar, false to leave it visible
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Sets the flag to reset the progress bar when it reaches 100%
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

if isnull(ab_switch)  then
	return -1
end if

ib_autoreset = ab_switch

return 1
end function

public function boolean of_isautoreset ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_IsAutoReset
//
//	Access:  	public
//
//	Arguments:	none	
//
//	Returns:		boolean
//		True = clear the progress bar
//		False = Don't clear the progress bar
//
//	Description:
//	return the flag to reset the progress bar when it reaches 100%
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

return ib_autoreset
end function

public function integer of_setmessagetext (string as_msgtext[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetMessageText
//
//	Access:		public
//
//	Arguments:	
//	as_msgtext		the text array to show on the progress bar separated by as_delimiter
//
//	Returns:		integer
//			the number of elements in the text which is parsed
//			-1 = error
//
//	Description:
//	Sets the text array which is shown on the progress bar
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

if isnull(as_msgtext) then
	return -1
end if

// pass in array of messagetext and return # of elements
is_msgtext = as_msgtext
ii_msgtextcount = upperbound(is_msgtext)

return ii_msgtextcount
end function

public function integer of_settextcolor (long al_textcolor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetTextColor
//
//	Access:		public
//
//	Arguments:
//	al_textcolor   color the progress bar text will display
//
//	Returns:  integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Set the color the progress bar text
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

string	ls_modify, ls_return

if isnull(al_textcolor) or (al_textcolor < 0) then
	return -1
end if

il_textcolor = al_textcolor

ls_modify = "pct.color='" + string(al_textcolor) + "'"
ls_return = dw_progress.Modify(ls_Modify)

if ls_return <> "" then
	return -1
end if

return 1
end function

public function long of_gettextcolor ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetTextColor
//
//	Access:		public
//
//	Arguments:	None
//
//	Returns:		long
//	 the color of the progress bar text
//
//	Description:
//	Returns the color of the progress bar text.
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

return il_textcolor
end function

public function long of_getbackcolor ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetBackColor
//
//	Access:		public
//
//	Arguments:	None
//
//	Returns:		long
//	 the background color of the empty progress bar
//
//	Description:
//	Returns background the color of the empty progress bar.
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

return il_backcolor
end function

public function integer of_setbackcolor (long al_backcolor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetBackColor
//
//	Access:		public
//
//	Arguments:
//	al_backcolor   background color of the empty progress bar
//
//	Returns:  integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Set the background color of the empty progress bar
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

string	ls_modify, ls_return

if isnull(al_backcolor) or (al_backcolor < 0) then
	return -1
end if

il_backcolor = al_backcolor

ls_modify = "datawindow.color='" + string(al_backcolor) + "'"
ls_return = dw_progress.Modify(ls_Modify)

if ls_return <> "" then
	return -1
end if

return 1
end function

public function integer of_getmessagetext (ref string as_messagetext[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetMessageText
//
//	Access:		public
//
//	Arguments:	as_messagetext[]	array to hold the message text - by reference
//
//	Returns:		integer
//	 the number of elements in the message text array
//
//	Description:
//	Returns the message text used for display on the progress bar
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
integer	li_itemcount
string	ls_temp[]

// clear out the argument array
as_messagetext = ls_temp

// set the value
as_messagetext = is_msgtext

// get the number of items in the array
li_itemcount = Upperbound(as_messagetext)

return li_itemcount

end function

public function integer of_getpctcomplete ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetPctComplete
//
//	Access:		public
//
//	Arguments:	None
//
//	Returns:		integer
//	 the visual percent complete of the progress bar (1-100)
//
//	Description:
//	Returns the visual percent complete of the progress bar
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

return ii_percentcomplete
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
anv_infoattrib.is_name = 'Progress Bar'
anv_infoattrib.is_description = 'Progress Bar'

Return 1
end function

on pfc_u_progressbar.create
int iCurrent
call super::create
this.dw_progress=create dw_progress
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_progress
end on

on pfc_u_progressbar.destroy
call super::destroy
destroy(this.dw_progress)
end on

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Constructor
//
//	Arguments:
//	None
//
//	Returns:  None
//
//	Description:
// Progress Bar Control.
//	Initialize the object properties.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version - Brian J. Grimm
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
// initalize the display text
dw_progress.object.pct[1] = ""

// expand dw to dimensions of on screen object
dw_progress.height = this.height
dw_progress.width = this.width

// make the dw header band height of on screen object
dw_progress.object.datawindow.header.height = this.height

// make the progress rectangle the height and width of on screen object 
dw_progress.object.progress_rect.height = this.height
dw_progress.object.progress_rect.width = this.width

// center percentage text on screen object
dw_progress.object.pct.y = integer((integer(dw_progress.object.datawindow.header.height) / 2 ) - &
												(integer(dw_progress.object.pct.height) / 2))
dw_progress.object.pct.width = this.width


end event

type dw_progress from datawindow within pfc_u_progressbar
int Width=384
int Height=76
string DataObject="d_progress"
boolean Border=false
end type

event rbuttondown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		RButtonDown
//
//	Arguments:	None
//
//	Returns:		None
//
//	Description:
//		Pass the button properties to the uo since this object takes up the whole
//		uo space	
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

// pass right mouse button processing to the parent user object.
parent.event rbuttondown(2, xpos, ypos)
end event


HA$PBExportHeader$w_progbarsampler.srw
$PBExportComments$NEW!  Test the PFC 6.0 Progress Bar.
forward
global type w_progbarsampler from w_main
end type
type cb_close from u_cb within w_progbarsampler
end type
type cb_start from u_cb within w_progbarsampler
end type
type uo_1 from u_progressbar within w_progbarsampler
end type
type st_1 from statictext within w_progbarsampler
end type
type uo_2 from u_progressbar within w_progbarsampler
end type
type st_2 from statictext within w_progbarsampler
end type
type uo_3 from u_progressbar within w_progbarsampler
end type
type st_3 from statictext within w_progbarsampler
end type
type uo_4 from u_progressbar within w_progbarsampler
end type
type st_4 from statictext within w_progbarsampler
end type
type uo_5 from u_progressbar within w_progbarsampler
end type
type uo_6 from u_progressbar within w_progbarsampler
end type
type uo_7 from u_progressbar within w_progbarsampler
end type
type uo_8 from u_progressbar within w_progbarsampler
end type
type cb_stop from u_cb within w_progbarsampler
end type
end forward

global type w_progbarsampler from w_main
integer x = 923
integer y = 4
integer width = 1787
integer height = 1872
string title = "PFC Example - Progress Bar Sampler"
boolean resizable = false
long backcolor = 77633680
toolbaralignment toolbaralignment = alignatleft!
event type long pfc_progressbarincrement ( integer ai_increment )
event type integer ue_startprocess ( )
cb_close cb_close
cb_start cb_start
uo_1 uo_1
st_1 st_1
uo_2 uo_2
st_2 st_2
uo_3 uo_3
st_3 st_3
uo_4 uo_4
st_4 st_4
uo_5 uo_5
uo_6 uo_6
uo_7 uo_7
uo_8 uo_8
cb_stop cb_stop
end type
global w_progbarsampler w_progbarsampler

type variables
Protected:
boolean                          ib_cancelled
boolean                          ib_closed
boolean                          ib_started
w_progbarproperties       iw_properties
end variables

event ue_startprocess;call super::ue_startprocess;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	ue_startprocess
//
// Return:
// Integer
// 0 - User closed the window while the process was being run.
// 1 - User cancelled the process midstream.
// 2 - The process completed on its own.
//
//	Description:
// Start the progress meters by calling of_SetPosition
// and running a defined algorithm.
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

integer	li_count
long		ll_complete1
long		ll_complete2
long		ll_complete3
long		ll_complete4
long		ll_complete5
long		ll_complete6
long		ll_complete7
long		ll_complete8

ib_started = true
// Initialize the Progress Bars.
uo_1.of_SetPosition(0)
uo_2.of_SetPosition(0)
uo_3.of_SetPosition(0)
uo_4.of_SetPosition(0)
uo_5.of_SetPosition(0)
uo_6.of_SetPosition(0)
uo_7.of_SetPosition(0)
uo_8.of_SetPosition(0)

ib_cancelled = false
ib_closed = false

// Start the algorithm.
for li_count = 1 to 10000
	Yield()
	if ib_closed = true then
		ib_cancelled = true
		ib_started = false
		event pfc_close()
		return 0
	end if
	if ib_cancelled = true then
		ib_started = false
		return 1
	end if
	if Mod(li_count, 100) = 0 then
		if ll_complete1 < 100 then
			ll_complete1 = uo_1.of_Increment()    //10
		end if
		st_1.text = String(ll_complete1, "#") + " % Complete"
		
		if ll_complete2 < 100 then
			ll_complete2 = uo_2.of_Increment()    //5
		end if
		st_2.text = String(ll_complete2, "#") + " % Complete"
		
		if ll_complete3 < 100 then
			ll_complete3 = uo_3.of_Increment()	  //2
		end if
		st_3.text = String(ll_complete3, "#") + " % Complete"
		
		if ll_complete4 < 100 then
			ll_complete4 = uo_4.of_Increment()    //1
		end if
		
		st_4.text = String(ll_complete4, "#") + " % Complete"
		
		if ll_complete5 < 100 then
			ll_complete5 = uo_5.of_Increment()    //10
		end if
		
		if ll_complete6 < 100 then
			ll_complete6 = uo_6.of_Increment()    //4
		end if
		
		if ll_complete7 < 100 then
			ll_complete7 = uo_7.of_Increment()    //2
		end if
		
		if ll_complete8 < 100 then
			ll_complete8 = uo_8.of_Increment()    //1
		end if
	end if
next
ib_started = false
return 2
end event

on w_progbarsampler.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.cb_start)
destroy(this.uo_1)
destroy(this.st_1)
destroy(this.uo_2)
destroy(this.st_2)
destroy(this.uo_3)
destroy(this.st_3)
destroy(this.uo_4)
destroy(this.st_4)
destroy(this.uo_5)
destroy(this.uo_6)
destroy(this.uo_7)
destroy(this.uo_8)
destroy(this.cb_stop)
end on

on w_progbarsampler.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.cb_start=create cb_start
this.uo_1=create uo_1
this.st_1=create st_1
this.uo_2=create uo_2
this.st_2=create st_2
this.uo_3=create uo_3
this.st_3=create st_3
this.uo_4=create uo_4
this.st_4=create st_4
this.uo_5=create uo_5
this.uo_6=create uo_6
this.uo_7=create uo_7
this.uo_8=create uo_8
this.cb_stop=create cb_stop
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.cb_start
this.Control[iCurrent+3]=this.uo_1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.uo_2
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.uo_3
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.uo_4
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.uo_5
this.Control[iCurrent+12]=this.uo_6
this.Control[iCurrent+13]=this.uo_7
this.Control[iCurrent+14]=this.uo_8
this.Control[iCurrent+15]=this.cb_stop
end on

event pfc_postopen;call super::pfc_postopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_postopen
//
//	Arguments:
//	None
//
//	Returns:
// None
//
//	Description:
// After the window has opened, start the progress bars.
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

cb_start.triggerevent(clicked!)
end event

event closequery;if ib_started = true then
	cb_close.Triggerevent(clicked!)
	return 1
else
	call super::closequery
end if
end event

event open;call super::open;//Close query processing is not needed.
ib_disableclosequery = true

end event

type cb_close from u_cb within w_progbarsampler
string text = "Close"
boolean cancel = true
integer x = 1390
integer y = 1620
integer taborder = 110
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Informs the processing that the user is closing the window, then  
// calls the pfc_close event on the window.
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
if ib_started = true then
	ib_closed = true
else
	parent.post event pfc_close()
end if
end event

type cb_start from u_cb within w_progbarsampler
string text = "&Start"
boolean default = true
integer x = 1390
integer y = 1396
integer taborder = 90
boolean bringtotop = true
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Start the progress meters by calling ue_startprocess
// on the window.
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

parent.event ue_startprocess()
end event

type uo_1 from u_progressbar within w_progbarsampler
event constructor pbm_constructor
event rbuttondown pbm_rbuttondown
event destroy ( )
boolean border = true
long backcolor = 77571519
borderstyle borderstyle = stylelowered!
integer x = 37
integer y = 92
integer width = 1289
integer height = 84
integer taborder = 10
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Initializes the Progress Bar.
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

of_SetFillStyle(RIGHTLEFT)
of_SetDisplayStyle(MSGTEXT)
of_SetMessageText({"Right mouse on any PBar to change properties..."})
of_SetFontSize(8)
of_SetFillColor(RGB(255,0,0))
of_SetFontBold(true)
of_SetAutoReset(false)


end event

event rbuttondown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	rbuttondown
//
//	Description:
//	Creates and pops up the progress bar right mouse click menu.
// This menu will open the progress bar properties window.
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

m_progbarproperties		lm_popmenu

message.powerobjectparm = this
lm_popmenu = create m_progbarproperties
lm_popmenu.m_table.PopMenu(parent.PointerX(), parent.PointerY())
end event

on uo_1.destroy
call u_progressbar::destroy
end on

type st_1 from statictext within w_progbarsampler
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
boolean focusrectangle = false
integer x = 1362
integer y = 108
integer width = 375
integer height = 68
end type

type uo_2 from u_progressbar within w_progbarsampler
event constructor pbm_constructor
event rbuttondown pbm_rbuttondown
event destroy ( )
boolean border = true
long backcolor = 77571519
borderstyle borderstyle = styleraised!
integer x = 37
integer y = 212
integer width = 1289
integer height = 84
integer taborder = 20
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Initializes the Progress Bar.
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

of_SetFillStyle(BOTTOMUP)
of_SetDisplayStyle(PCTCOMPLETE)
of_SetFillColor(RGB(0,128,0))
of_SetStep(5)
of_SetMaximum(100)
of_SetMinimum(0)
of_SetFontBold(true)
of_SetFontSize(10)
of_SetAutoReset(false)

end event

event rbuttondown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	rbuttondown
//
//	Description:
//	Creates and pops up the progress bar right mouse click menu.
// This menu will open the progress bar properties window.
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

m_progbarproperties		lm_popmenu

message.powerobjectparm = this
lm_popmenu = create m_progbarproperties
lm_popmenu.m_table.PopMenu(parent.PointerX(), parent.PointerY())
end event

on uo_2.destroy
call u_progressbar::destroy
end on

type st_2 from statictext within w_progbarsampler
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
boolean focusrectangle = false
integer x = 1362
integer y = 228
integer width = 375
integer height = 68
end type

type uo_3 from u_progressbar within w_progbarsampler
event constructor pbm_constructor
event rbuttondown pbm_rbuttondown
event destroy ( )
boolean border = true
long backcolor = 77571519
integer x = 37
integer y = 332
integer width = 1289
integer height = 84
integer taborder = 30
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Initializes the Progress Bar.
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

of_SetFillStyle(TOPDOWN)
of_SetDisplayStyle(POSITION)
of_SetStep(2)
of_SetFillColor(RGB(255,255,0))
of_SetTextColor(RGB(128,0,0))
of_SetFontBold(true)
of_SetFontItalic(true)
of_SetFontSize(12)
of_SetAutoReset(false)
end event

event rbuttondown;call super::rbuttondown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	rbuttondown
//
//	Description:
//	Creates and pops up the progress bar right mouse click menu.
// This menu will open the progress bar properties window.
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

m_progbarproperties		lm_popmenu

message.powerobjectparm = this
lm_popmenu = create m_progbarproperties
lm_popmenu.m_table.PopMenu(parent.PointerX(), parent.PointerY())
end event

on uo_3.destroy
call u_progressbar::destroy
end on

type st_3 from statictext within w_progbarsampler
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
boolean focusrectangle = false
integer x = 1362
integer y = 348
integer width = 375
integer height = 68
end type

type uo_4 from u_progressbar within w_progbarsampler
event constructor pbm_constructor
event rbuttondown pbm_rbuttondown
event destroy ( )
boolean border = true
long backcolor = 77571519
borderstyle borderstyle = styleshadowbox!
integer x = 37
integer y = 452
integer width = 1289
integer height = 84
integer taborder = 40
string tag = "uo_4"
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Initializes the Progress Bar.
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

string	ls_messages[]

of_SetFillStyle(LEFTRIGHT)
of_SetDisplayStyle(MSGTEXT)

ls_messages[1] = "Inspecting Application Dependencies..."
ls_messages[2] = "Opening File..."
ls_messages[3] = "Parsing Data..."
ls_messages[4] = "Deleting..."
ls_messages[5] = "Inserting..."
of_SetMessageText(ls_messages)
of_SetStep(1)
of_SetMaximum(100)
of_SetMinimum(0)
of_SetTextColor(RGB(255,255,255))
of_SetFontBold(true)
of_SetAutoReset(false)
of_SetFontSize(10)
end event

event rbuttondown;call super::rbuttondown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	rbuttondown
//
//	Description:
//	Creates and pops up the progress bar right mouse click menu.
// This menu will open the progress bar properties window.
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

m_progbarproperties		lm_popmenu

message.powerobjectparm = this
lm_popmenu = create m_progbarproperties
lm_popmenu.m_table.PopMenu(parent.PointerX(), parent.PointerY())
end event

on uo_4.destroy
call u_progressbar::destroy
end on

type st_4 from statictext within w_progbarsampler
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
boolean focusrectangle = false
integer x = 1362
integer y = 468
integer width = 375
integer height = 68
end type

type uo_5 from u_progressbar within w_progbarsampler
event constructor pbm_constructor
event rbuttondown pbm_rbuttondown
event destroy ( )
boolean border = true
long backcolor = 77571519
integer x = 69
integer y = 664
integer width = 219
integer height = 1048
integer taborder = 50
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Initializes the Progress Bar.
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

of_SetFillStyle(TOPDOWN)
of_SetDisplayStyle(BAR)
of_SetTextColor(RGB(255,255,0))
of_SetFillColor(RGB(0,128,0))
of_SetFontBold(true)
of_SetFontSize(12)
of_SetAutoReset(false)

end event

event rbuttondown;call super::rbuttondown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	rbuttondown
//
//	Description:
//	Creates and pops up the progress bar right mouse click menu.
// This menu will open the progress bar properties window.
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

m_progbarproperties		lm_popmenu

message.powerobjectparm = this
lm_popmenu = create m_progbarproperties
lm_popmenu.m_table.PopMenu(parent.PointerX(), parent.PointerY())
end event

on uo_5.destroy
call u_progressbar::destroy
end on

type uo_6 from u_progressbar within w_progbarsampler
event constructor pbm_constructor
event rbuttondown pbm_rbuttondown
event destroy ( )
boolean border = true
long backcolor = 77571519
borderstyle borderstyle = stylelowered!
integer x = 416
integer y = 664
integer width = 219
integer height = 1048
integer taborder = 60
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Initializes the Progress Bar.
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

of_SetFillStyle(BOTTOMUP)
of_SetDisplayStyle(PCTCOMPLETE)
of_SetStep(4)
of_SetMaximum(100)
of_SetMinimum(0)
of_SetTextColor(RGB(255,255,255))
of_SetFillColor(RGB(0,0,128))
of_SetFontBold(true)
of_SetFontItalic(true)
of_SetFontUnderline(true)
of_SetFontSize(12)
of_SetAutoReset(false)
end event

event rbuttondown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	rbuttondown
//
//	Description:
//	Creates and pops up the progress bar right mouse click menu.
// This menu will open the progress bar properties window.
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

m_progbarproperties		lm_popmenu

message.powerobjectparm = this
lm_popmenu = create m_progbarproperties
lm_popmenu.m_table.PopMenu(parent.PointerX(), parent.PointerY())
end event

on uo_6.destroy
call u_progressbar::destroy
end on

type uo_7 from u_progressbar within w_progbarsampler
event constructor pbm_constructor
event rbuttondown pbm_rbuttondown
event destroy ( )
boolean border = true
long backcolor = 77571519
borderstyle borderstyle = styleraised!
integer x = 763
integer y = 664
integer width = 219
integer height = 1048
integer taborder = 70
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Initializes the Progress Bar.
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

of_SetFillStyle(LEFTRIGHT)
of_SetDisplayStyle(POSITION)
of_SetStep(2)
of_SetFillColor(RGB(255,0,0))
of_SetFontSize(12)
of_SetFontFace("Arial")
of_SetAutoReset(false)
end event

event rbuttondown;call super::rbuttondown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	rbuttondown
//
//	Description:
//	Creates and pops up the progress bar right mouse click menu.
// This menu will open the progress bar properties window.
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

m_progbarproperties		lm_popmenu

message.powerobjectparm = this
lm_popmenu = create m_progbarproperties
lm_popmenu.m_table.PopMenu(parent.PointerX(), parent.PointerY())
end event

on uo_7.destroy
call u_progressbar::destroy
end on

type uo_8 from u_progressbar within w_progbarsampler
event constructor pbm_constructor
event rbuttondown pbm_rbuttondown
event destroy ( )
boolean border = true
long backcolor = 77571519
borderstyle borderstyle = styleshadowbox!
integer x = 1106
integer y = 664
integer width = 219
integer height = 1048
integer taborder = 80
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Initializes the Progress Bar.
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

of_SetFillStyle(RIGHTLEFT)
of_SetDisplayStyle(POSITION)
of_SetStep(1)
of_SetFillColor(RGB(255,255,0))
of_SetTextColor(RGB(0,0,128))
of_SetAutoReset(false)
end event

event rbuttondown;call super::rbuttondown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	rbuttondown
//
//	Description:
//	Creates and pops up the progress bar right mouse click menu.
// This menu will open the progress bar properties window.
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

m_progbarproperties		lm_popmenu

message.powerobjectparm = this
lm_popmenu = create m_progbarproperties
lm_popmenu.m_table.PopMenu(parent.PointerX(), parent.PointerY())
end event

on uo_8.destroy
call u_progressbar::destroy
end on

type cb_stop from u_cb within w_progbarsampler
string text = "S&top"
integer x = 1390
integer y = 1508
integer taborder = 100
boolean bringtotop = true
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Stop the progress meters in process.
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

if ib_cancelled = false then
	ib_cancelled = true
end if
end event


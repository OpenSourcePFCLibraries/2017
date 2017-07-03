HA$PBExportHeader$w_utilproperties.srw
$PBExportComments$window to set properties of utility objects for the pfc examples
forward
global type w_utilproperties from w_response
end type
type tab_1 from u_tab within w_utilproperties
end type
type cb_2 from u_cb within w_utilproperties
end type
type cb_5 from u_cb within w_utilproperties
end type
type cb_4 from u_cb within w_utilproperties
end type
type cb_3 from u_cb within w_utilproperties
end type
type lv_1 from u_lv within w_utilproperties
end type
type tab_1 from u_tab within w_utilproperties
end type
end forward

global type w_utilproperties from w_response
int Width=1952
int Height=1104
boolean TitleBar=true
string Title="Utilities Preferences"
long BackColor=77633680
tab_1 tab_1
cb_2 cb_2
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
lv_1 lv_1
end type
global w_utilproperties w_utilproperties

type variables
integer                     ii_rc = -99
u_utilproperties        iuo_tabpage
end variables

on w_utilproperties.create
int iCurrent
call w_response::create
this.tab_1=create tab_1
this.cb_2=create cb_2
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.lv_1=create lv_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=tab_1
this.Control[iCurrent+2]=cb_2
this.Control[iCurrent+3]=cb_5
this.Control[iCurrent+4]=cb_4
this.Control[iCurrent+5]=cb_3
this.Control[iCurrent+6]=lv_1
end on

on w_utilproperties.destroy
call w_response::destroy
destroy(this.tab_1)
destroy(this.cb_2)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.lv_1)
end on

event close;call super::close;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	close
//
//	Description:
//	Determines if changes were made to the window that were not applied.
// If so, pfc_cancel will be triggered and the appropriate return code
// will be passed back to the calling window.
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

if ii_rc = -99 then
	event pfc_cancel()
end if
end event

event pfc_apply;call super::pfc_apply;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_apply
//
//	Arguments:
//	None
//
//	Returns:
//	None
//
//	Description:
// Apply any changes that were made through the various settings on the
// response window.  This response window contains three tab pages, so
// pfc_apply will trigger the individual user events on each of the tabpages
// where the apply logic is coded.
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

ii_rc = 1
iuo_tabpage.event ue_apply()

end event

event pfc_cancel;call super::pfc_cancel;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_cancel
//
//	Arguments:
//	None
//
//	Returns:
//	None
//
//	Description:
// Closes the response window.  The ancestor script sets ib_disableclosequery
// to true.  This script issues a CloseWithReturn to tell the calling window
// that the user cancelled.
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

ii_rc = 0
CloseWithReturn(this, ii_rc)

end event

event pfc_default;call super::pfc_default;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_default
//
//	Arguments:
//	None
//
//	Returns:
//	None
//
//	Description:
//	Performs the default operations for the response window which are 
// to apply any changes that were made, then close the window.
// This script issues a CloseWithReturn to tell the calling window
// that the user may have applied changes.
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

event pfc_apply()
CloseWithReturn(this, ii_rc)

end event

event pfc_preopen;call super::pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_preopen
//
//	Arguments:
//	None
//
//	Returns:
// None
//
//	Description:
// Initialize the List View
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

integer			li_index
listviewitem	llvi_1

// Populate the list view with the bitmap.
llvi_1.pictureindex = 1
li_index = lv_1.AddItem(llvi_1)
llvi_1.itemx = -75
llvi_1.itemy = 5
lv_1.SetItem(1, llvi_1)
end event

type tab_1 from u_tab within w_utilproperties
int X=32
int Y=32
int Width=1504
int Height=940
int TabOrder=40
long BackColor=77633680
end type

event constructor;call super::constructor;integer	li_rc
li_rc = OpenTab(parent.iuo_tabpage, 0)
end event

type cb_2 from u_cb within w_utilproperties
int X=1563
int Y=44
int TabOrder=50
boolean BringToTop=true
string Text="OK"
boolean Default=true
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Calls the pfc_default event on the window.  This 
// will apply all changes, then close the window. 
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

parent.event pfc_default()

end event

type cb_5 from u_cb within w_utilproperties
int X=1563
int Y=368
int TabOrder=30
boolean BringToTop=true
string Text="Cancel"
boolean Cancel=true
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Calls the pfc_cancel event on the window.
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

parent.event pfc_cancel()
end event

type cb_4 from u_cb within w_utilproperties
int X=1563
int Y=152
int TabOrder=20
boolean BringToTop=true
string Text="&Apply"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Calls the pfc_apply event on the window.  This 
// will apply all changes. 
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

parent.event pfc_apply()
end event

type cb_3 from u_cb within w_utilproperties
int X=1563
int Y=260
int TabOrder=10
boolean Enabled=false
boolean BringToTop=true
string Text="&Help"
end type

type lv_1 from u_lv within w_utilproperties
int X=1650
int Y=532
int Width=169
int Height=132
int TabOrder=2
boolean Enabled=false
boolean Border=false
BorderStyle BorderStyle=StyleBox!
boolean ButtonHeader=false
boolean FixedLocations=true
boolean LabelWrap=false
boolean Scrolling=false
boolean ShowHeader=false
string LargePictureName[]={"SingletonReturn!"}
long LargePictureMaskColor=12632256
end type


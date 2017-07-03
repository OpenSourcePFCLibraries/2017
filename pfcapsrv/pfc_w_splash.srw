HA$PBExportHeader$pfc_w_splash.srw
$PBExportComments$PFC Splash window
forward
global type pfc_w_splash from w_popup
end type
type st_copyright from u_st within pfc_w_splash
end type
type st_version from u_st within pfc_w_splash
end type
type st_application from u_st within pfc_w_splash
end type
type gb_allaround from u_gb within pfc_w_splash
end type
type ln_1 from line within pfc_w_splash
end type
type ln_2 from line within pfc_w_splash
end type
type ln_3 from line within pfc_w_splash
end type
type ln_4 from line within pfc_w_splash
end type
type p_splash from u_p within pfc_w_splash
end type
end forward

global type pfc_w_splash from w_popup
int X=741
int Y=780
int Width=2144
int Height=912
boolean Enabled=false
boolean TitleBar=false
boolean ControlMenu=false
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
boolean Border=false
st_copyright st_copyright
st_version st_version
st_application st_application
gb_allaround gb_allaround
ln_1 ln_1
ln_2 ln_2
ln_3 ln_3
ln_4 ln_4
p_splash p_splash
end type
global pfc_w_splash pfc_w_splash

type variables
n_cst_splashattrib inv_splashattrib
end variables

on pfc_w_splash.create
int iCurrent
call super::create
this.st_copyright=create st_copyright
this.st_version=create st_version
this.st_application=create st_application
this.gb_allaround=create gb_allaround
this.ln_1=create ln_1
this.ln_2=create ln_2
this.ln_3=create ln_3
this.ln_4=create ln_4
this.p_splash=create p_splash
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_copyright
this.Control[iCurrent+2]=this.st_version
this.Control[iCurrent+3]=this.st_application
this.Control[iCurrent+4]=this.gb_allaround
this.Control[iCurrent+5]=this.ln_1
this.Control[iCurrent+6]=this.ln_2
this.Control[iCurrent+7]=this.ln_3
this.Control[iCurrent+8]=this.ln_4
this.Control[iCurrent+9]=this.p_splash
end on

on pfc_w_splash.destroy
call super::destroy
destroy(this.st_copyright)
destroy(this.st_version)
destroy(this.st_application)
destroy(this.gb_allaround)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.ln_3)
destroy(this.ln_4)
destroy(this.p_splash)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Open
//
//	Description:  Get splash object and display splash window
//	with appropriate settings that were specified
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0    Initial version
//	5.0.03	Use timer event for window close
// 5.0.04	Center splash window.
// 6.0.01 Hide the picture if there is no application bitmap.
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

// Get the splash object
inv_splashattrib = Message.PowerObjectParm

// Allow window to close without the CloseQuery checks being performed.
ib_disableclosequery = True

// Center the splash window.
of_SetBase(True)
inv_base.of_Center()

// Positioning
this.SetPosition (TopMost!)
gb_allaround.SetPosition(ToBottom!)

// Display the Application bitmap
If Len(inv_splashattrib.is_logo) > 0 Then
	p_splash.PictureName = inv_splashattrib.is_logo
Else
	p_splash.Visible = False
End If

// Copyright
If Len(inv_splashattrib.is_copyright) > 0 Then
	st_copyright.text = inv_splashattrib.is_copyright
Else
	st_copyright.text = ''
End If

// Application display name
If Len(inv_splashattrib.is_application) > 0 Then
	st_application.text = inv_splashattrib.is_application
Else
	st_application.text = ''
End If

// Application version
If Len(inv_splashattrib.is_version) > 0 Then
	st_version.text = inv_splashattrib.is_version
Else
	st_version.text = ''
End If

// Set length of time for window to close
Timer (inv_splashattrib.ii_secondsvisible)
end event

event timer;call super::timer;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	timer
//
//	Description:
//	Close window when specified length of time is reached
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0.03   Initial version
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

Timer (0)
Close (this)
end event

type st_copyright from u_st within pfc_w_splash
int X=114
int Y=776
int Width=1952
int Height=72
string Text="Copyright message..."
Alignment Alignment=Right!
long BackColor=79741120
int TextSize=-6
end type

type st_version from u_st within pfc_w_splash
int X=603
int Y=416
int Width=1472
int Height=80
string Text="version message..."
long BackColor=79741120
end type

type st_application from u_st within pfc_w_splash
int X=603
int Y=296
int Width=1472
int Height=128
string Text="Application name..."
long BackColor=79741120
int TextSize=-19
int Weight=700
end type

type gb_allaround from u_gb within pfc_w_splash
int X=46
int Y=20
int Width=2048
int Height=836
int TabOrder=0
string Text=""
long BackColor=79741120
end type

type ln_1 from line within pfc_w_splash
boolean Enabled=false
int BeginY=4
int EndX=2359
int EndY=4
int LineThickness=4
long LineColor=16777215
end type

type ln_2 from line within pfc_w_splash
boolean Enabled=false
int BeginY=908
int EndX=2354
int EndY=908
int LineThickness=4
long LineColor=8421504
end type

type ln_3 from line within pfc_w_splash
boolean Enabled=false
int BeginX=2139
int EndX=2139
int EndY=1096
int LineThickness=4
long LineColor=8421504
end type

type ln_4 from line within pfc_w_splash
boolean Enabled=false
int EndY=1096
int LineThickness=4
long LineColor=16777215
end type

type p_splash from u_p within pfc_w_splash
int X=87
int Y=84
boolean OriginalSize=true
end type


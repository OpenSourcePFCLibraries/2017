HA$PBExportHeader$u_tabpgthree.sru
forward
global type u_tabpgthree from u_tabpg
end type
type st_1 from u_st within u_tabpgthree
end type
type st_2 from u_st within u_tabpgthree
end type
type st_3 from u_st within u_tabpgthree
end type
type st_4 from u_st within u_tabpgthree
end type
type ddlb_filetypes from u_ddlb within u_tabpgthree
end type
type ddlb_filesize from u_ddlb within u_tabpgthree
end type
type em_filesize from u_em within u_tabpgthree
end type
type sle_text from u_sle within u_tabpgthree
end type
end forward

global type u_tabpgthree from u_tabpg
int Width=1531
int Height=536
long BackColor=77571519
long TabBackColor=77571519
string Text="Advanced"
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
ddlb_filetypes ddlb_filetypes
ddlb_filesize ddlb_filesize
em_filesize em_filesize
sle_text sle_text
end type
global u_tabpgthree u_tabpgthree

on u_tabpgthree.create
int iCurrent
call u_tabpg::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.ddlb_filetypes=create ddlb_filetypes
this.ddlb_filesize=create ddlb_filesize
this.em_filesize=create em_filesize
this.sle_text=create sle_text
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=st_1
this.Control[iCurrent+2]=st_2
this.Control[iCurrent+3]=st_3
this.Control[iCurrent+4]=st_4
this.Control[iCurrent+5]=ddlb_filetypes
this.Control[iCurrent+6]=ddlb_filesize
this.Control[iCurrent+7]=em_filesize
this.Control[iCurrent+8]=sle_text
end on

on u_tabpgthree.destroy
call u_tabpg::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.ddlb_filetypes)
destroy(this.ddlb_filesize)
destroy(this.em_filesize)
destroy(this.sle_text)
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Start the resize service and register the controls.
// Tab page three will be created on demand.  If the user resizes
// the window before the tab page is created then the resize event
// must be triggered.
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

// Start the Resize Service.
of_SetResize(true)
inv_resize.of_SetOrigSize(1532, 537)

//Set the MinSize of the main object.
inv_resize.of_SetMinSize(1185, 509)

//Set the behavior of each object.
inv_resize.of_Register(ddlb_filetypes, inv_resize.SCALERIGHTBOTTOM)
inv_resize.of_Register(sle_text, inv_resize.SCALERIGHT)

ddlb_filetypes.SelectItem(2)

//Trigger the resize event to be sure that the tab is sized appropriately.
event resize(1, this.width, this.height)

end event

event resize;// Notify the resize service that the object size has changed.
If IsValid (inv_resize) Then
	inv_resize.Event pfc_resize (sizetype, This.Width, This.Height)
End If
end event

type st_1 from u_st within u_tabpgthree
int X=46
int Y=80
int Width=187
string Text="Of &type:"
end type

type st_2 from u_st within u_tabpgthree
int X=46
int Y=200
boolean BringToTop=true
string Text="&Containing text:"
end type

type st_3 from u_st within u_tabpgthree
int X=46
int Y=320
int Width=165
boolean BringToTop=true
string Text="&Size is:"
end type

type st_4 from u_st within u_tabpgthree
int X=1106
int Y=320
int Width=78
boolean BringToTop=true
string Text="KB"
end type

type ddlb_filetypes from u_ddlb within u_tabpgthree
int X=407
int Y=68
int Width=1070
int Height=452
int TabOrder=20
string Item[]={"AIFF Format Sound",&
"All Files and Folders",&
"Animated Cursor",&
"Application",&
"ART Image",&
"AU Format Sound",&
"Bitmap Image",&
"Briefcase",&
"CBT File",&
"CD Audio Track",&
"Configuration Settings",&
"Control Panel extension",&
"Cursor",&
"Desktop Theme File",&
"Device driver",&
"Dial-Up Networking Script",&
"Folio Infobase",&
"GIF Image",&
"Help File",&
"Icon",&
"Internet Document (HTML)",&
"JPEG Image",&
"LOG File",&
"Mail Message",&
"Microsoft Excel Template",&
"Microsoft Excel Worksheet",&
"Microsoft Word Document",&
"MS-DOS Application",&
"MS-DOS Batch File",&
"Powersoft Report",&
"RealAudio File",&
"Registration Entries",&
"Rich Text Format",&
"Screen Saver",&
"S-Designor DataArchitect",&
"SQL File",&
"SRW file",&
"System file",&
"Text Document",&
"Video Clip",&
"Virtual Device Driver",&
"Wave Sound",&
"WinZip File",&
"Write Document",&
"XBM Image"}
end type

type ddlb_filesize from u_ddlb within u_tabpgthree
int X=407
int Y=312
int Height=216
int TabOrder=30
long BackColor=1090519039
string Item[]={"At least",&
"At most"}
end type

type em_filesize from u_em within u_tabpgthree
int X=786
int Y=312
int TabOrder=10
string Mask="#######"
boolean Spin=true
string DisplayData=","
string MinMax="1~~"
end type

type sle_text from u_sle within u_tabpgthree
int X=407
int Y=192
int Width=1065
int TabOrder=2
end type


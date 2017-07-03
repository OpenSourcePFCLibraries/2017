HA$PBExportHeader$u_pbarposition.sru
forward
global type u_pbarposition from u_tabpg
end type
type st_1 from u_st within u_pbarposition
end type
type st_2 from u_st within u_pbarposition
end type
type st_3 from u_st within u_pbarposition
end type
type st_4 from u_st within u_pbarposition
end type
type sle_1 from u_sle within u_pbarposition
end type
type sle_2 from u_sle within u_pbarposition
end type
type sle_3 from u_sle within u_pbarposition
end type
type sle_4 from u_sle within u_pbarposition
end type
end forward

global type u_pbarposition from u_tabpg
int Width=1381
int Height=1469
long BackColor=77571519
event ue_apply ( )
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
sle_1 sle_1
sle_2 sle_2
sle_3 sle_3
sle_4 sle_4
end type
global u_pbarposition u_pbarposition

type variables
u_progressbar    iuo_progbar
end variables

event ue_apply;call super::ue_apply;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	ue_apply
//
//	Description:
//	Applies user changes to the passed in Progress Bar.
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

if not IsValid(iuo_progbar) then return
if not IsNumber(sle_3.text) or Integer(sle_3.text) < 0 then
	sle_3.text = String(iuo_progbar.x)
	return
end if
if not IsNumber(sle_4.text) or Integer(sle_4.text) < 0 then
	sle_4.text = String(iuo_progbar.y)
	return
end if
if not IsNumber(sle_2.text) or Integer(sle_2.text) < 0 then
	sle_2.text = String(iuo_progbar.width)
	return
end if
if not IsNumber(sle_1.text) or Integer(sle_1.text) < 0 then
	sle_1.text = String(iuo_progbar.height)
	return
end if
	
iuo_progbar.x = Integer(sle_3.text)
iuo_progbar.y = Integer(sle_4.text)
iuo_progbar.width = Integer(sle_2.text)
iuo_progbar.height = Integer(sle_1.text)

iuo_progbar.TriggerEvent(constructor!)

end event

on u_pbarposition.create
int iCurrent
call u_tabpg::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.sle_1=create sle_1
this.sle_2=create sle_2
this.sle_3=create sle_3
this.sle_4=create sle_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=st_1
this.Control[iCurrent+2]=st_2
this.Control[iCurrent+3]=st_3
this.Control[iCurrent+4]=st_4
this.Control[iCurrent+5]=sle_1
this.Control[iCurrent+6]=sle_2
this.Control[iCurrent+7]=sle_3
this.Control[iCurrent+8]=sle_4
end on

on u_pbarposition.destroy
call u_tabpg::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.sle_1)
destroy(this.sle_2)
destroy(this.sle_3)
destroy(this.sle_4)
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Initializes the controls on the window by polling the Progress Bar that 
// was passed in for its current settings.
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

iuo_progbar = message.powerobjectparm

sle_3.text = String(iuo_progbar.x)
sle_4.text = String(iuo_progbar.y)
sle_2.text = String(iuo_progbar.width)
sle_1.text = String(iuo_progbar.height)
end event

type st_1 from u_st within u_pbarposition
int X=42
int Y=53
int Width=78
int Height=69
string Text="&X:"
end type

type st_2 from u_st within u_pbarposition
int X=375
int Y=53
int Width=92
boolean BringToTop=true
string Text="&Y:"
end type

type st_3 from u_st within u_pbarposition
int X=42
int Y=313
int Width=174
boolean BringToTop=true
string Text="&Width:"
end type

type st_4 from u_st within u_pbarposition
int X=375
int Y=313
int Width=174
boolean BringToTop=true
string Text="&Height:"
end type

type sle_1 from u_sle within u_pbarposition
int X=371
int Y=397
int Width=206
int TabOrder=40
int Accelerator=104
end type

type sle_2 from u_sle within u_pbarposition
int X=37
int Y=397
int Width=206
int TabOrder=30
boolean BringToTop=true
int Accelerator=119
end type

type sle_3 from u_sle within u_pbarposition
int X=33
int Y=133
int Width=206
int TabOrder=10
boolean BringToTop=true
int Accelerator=120
end type

type sle_4 from u_sle within u_pbarposition
int X=362
int Y=133
int Width=206
int TabOrder=20
boolean BringToTop=true
int Accelerator=121
end type


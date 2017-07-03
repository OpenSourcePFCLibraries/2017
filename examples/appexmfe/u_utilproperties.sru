HA$PBExportHeader$u_utilproperties.sru
$PBExportComments$used by w_utilproperties
forward
global type u_utilproperties from u_tabpg
end type
type cbx_5 from u_cbx within u_utilproperties
end type
type cbx_4 from u_cbx within u_utilproperties
end type
type cbx_3 from u_cbx within u_utilproperties
end type
type gb_1 from u_gb within u_utilproperties
end type
type cbx_1 from u_cbx within u_utilproperties
end type
type cbx_2 from u_cbx within u_utilproperties
end type
type gb_2 from u_gb within u_utilproperties
end type
type sle_1 from u_sle within u_utilproperties
end type
type cb_1 from u_cb within u_utilproperties
end type
end forward

global type u_utilproperties from u_tabpg
int Width=1504
int Height=848
long BackColor=77633680
long TabBackColor=77633680
string PowerTipText="Set PFC Utilities Properties"
string Text="General"
event ue_apply ( )
cbx_5 cbx_5
cbx_4 cbx_4
cbx_3 cbx_3
gb_1 gb_1
cbx_1 cbx_1
cbx_2 cbx_2
gb_2 gb_2
sle_1 sle_1
cb_1 cb_1
end type
global u_utilproperties u_utilproperties

event ue_apply;call super::ue_apply;if IsValid(gnv_app.inv_debug) then
	// Apply changes (if any) regarding the DW Properties Option.
	gnv_app.inv_debug.of_SetDWProperty(cbx_1.checked)
	
	// Apply changes (if any) regarding the Debug Log 'Set to top' option.
	gnv_app.inv_debug.of_SetAlwaysOnTop(cbx_2.checked)
	
	if IsValid(gnv_app.inv_debug.inv_sqlspy) then
		//Apply changes (if any) regarding the SQL Spy Log File.
		if cbx_3.checked then
			gnv_app.inv_debug.inv_sqlspy.of_SetLogFile(sle_1.text)
		else
			gnv_app.inv_debug.inv_sqlspy.of_SetLogFile("")
		end if
		
		// Apply changes (if any) regarding the SQL Inspect option.
		gnv_app.inv_debug.inv_sqlspy.of_SetAllowInspect(cbx_4.checked)
		
		// Apply changes (if any) regarding the SQL Spy 'Set to top' option.
		gnv_app.inv_debug.inv_sqlspy.of_SetAlwaysOnTop(cbx_5.checked)	
	end if
end if
end event

on u_utilproperties.create
int iCurrent
call super::create
this.cbx_5=create cbx_5
this.cbx_4=create cbx_4
this.cbx_3=create cbx_3
this.gb_1=create gb_1
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.gb_2=create gb_2
this.sle_1=create sle_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_5
this.Control[iCurrent+2]=this.cbx_4
this.Control[iCurrent+3]=this.cbx_3
this.Control[iCurrent+4]=this.gb_1
this.Control[iCurrent+5]=this.cbx_1
this.Control[iCurrent+6]=this.cbx_2
this.Control[iCurrent+7]=this.gb_2
this.Control[iCurrent+8]=this.sle_1
this.Control[iCurrent+9]=this.cb_1
end on

on u_utilproperties.destroy
call super::destroy
destroy(this.cbx_5)
destroy(this.cbx_4)
destroy(this.cbx_3)
destroy(this.gb_1)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.gb_2)
destroy(this.sle_1)
destroy(this.cb_1)
end on

event constructor;u_dw				ldw_obj

if IsNull(gnv_app.inv_debug) or not IsValid(gnv_app.inv_debug) then
	cbx_1.enabled = false
	cbx_2.enabled = false
	cbx_3.enabled = false
	cbx_4.enabled = false
	cbx_5.enabled = false
	return
else
	// Get the state information for the DataWindow Properties Service.	
	ldw_obj = create u_dw
	if IsValid(ldw_obj) then
		cbx_1.checked = ldw_obj.of_IsSharedProperty()
		destroy ldw_obj
	end if
	
	// Get the state information for the Debug Log 'Set to top' option.
	cbx_2.checked = gnv_app.inv_debug.of_GetAlwaysOnTop()
	
	// Determine if the SQL Spy Service is started.
	if IsNull(gnv_app.inv_debug.inv_sqlspy) or &
		not IsValid(gnv_app.inv_debug.inv_sqlspy) then
		cbx_3.enabled = false
		cbx_4.enabled = false
		cbx_5.enabled = false
	else
		// Determine if a Log File has already been set.
		sle_1.text = gnv_app.inv_debug.inv_sqlspy.of_GetLogFile()
		if sle_1.text <> "" then
			cbx_3.checked = true
			sle_1.enabled = true
			cb_1.enabled = true
		end if
		
		// Get the state information for the SQL Inspect Window.
		cbx_4.checked = gnv_app.inv_debug.inv_sqlspy.of_GetAllowInspect()
		
		// Get the state information for the SQL Spy 'Set to top' option.
		cbx_5.checked = gnv_app.inv_debug.inv_sqlspy.of_GetAlwaysOnTop()
	end if
end if
end event

type cbx_5 from u_cbx within u_utilproperties
int X=101
int Y=700
int Width=1161
int TabOrder=90
boolean BringToTop=true
string Text="Set SQL Spy Window to Stay Always on Top"
end type

type cbx_4 from u_cbx within u_utilproperties
int X=101
int Y=612
int Width=1015
int TabOrder=80
boolean BringToTop=true
string Text="Allow access to the SQL Inspect Window"
end type

type cbx_3 from u_cbx within u_utilproperties
int X=101
int Y=524
int Width=567
int TabOrder=50
boolean BringToTop=true
string Text="Set SQL Spy Log File"
end type

event clicked;call super::clicked;if this.checked = true then
	sle_1.enabled = true
	cb_1.enabled = true
else
	sle_1.text = ""
	sle_1.enabled = false
	cb_1.enabled = false
end  if
end event

type gb_1 from u_gb within u_utilproperties
int X=41
int Y=32
int Width=1422
int Height=356
int TabOrder=10
string Text="Debug Service"
end type

type cbx_1 from u_cbx within u_utilproperties
int X=123
int Y=128
int Width=791
int TabOrder=20
boolean BringToTop=true
string Text="Enable DataWindow &Properties"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Arguments:
//	None
//
//	Returns:
//	None
//
//	Description:
//	Starts and stops the DW Properties Service.
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

if this.checked = true then
	gnv_app.inv_debug.of_SetDWProperty(false)
	this.checked = false
else
	gnv_app.inv_debug.of_SetDWProperty(true)
	this.checked = true
end if
end event

type cbx_2 from u_cbx within u_utilproperties
int X=123
int Y=216
int Width=1143
int TabOrder=30
boolean BringToTop=true
string Text="Set Debug Log Window to Stay Always on Top"
end type

type gb_2 from u_gb within u_utilproperties
int X=41
int Y=448
int Width=1422
int Height=368
int TabOrder=40
string Text="SQL Spy Service"
end type

type sle_1 from u_sle within u_utilproperties
int X=686
int Y=524
int Height=68
int TabOrder=60
boolean Enabled=false
boolean BringToTop=true
boolean AutoHScroll=true
end type

type cb_1 from u_cb within u_utilproperties
int X=1157
int Y=524
int Width=274
int Height=68
int TabOrder=70
boolean Enabled=false
boolean BringToTop=true
string Text="&Browse..."
end type

event clicked;call super::clicked;constant string	TITLE='Select SQLSpy Log File'
integer	li_filenum
integer	li_return
string	ls_filename
string	ls_path_filename

SetPointer(HourGlass!)

//Get the filename
li_return = GetFileSaveName  (TITLE, ls_path_filename, ls_filename, & 
				'LOG', 'LOG Files (*.LOG), *.LOG, *.*' )

if li_return > 0 then
	sle_1.text = ls_path_filename
	li_Filenum = FileOpen(ls_filename,  &
	LineMode!, Write!, LockWrite!, Replace!)
end if

end event


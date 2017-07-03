HA$PBExportHeader$w_pfcsecurity_reportwindow.srw
$PBExportComments$Report on window information
forward
global type w_pfcsecurity_reportwindow from w_sheet
end type
type dw_report from u_dw within w_pfcsecurity_reportwindow
end type
type st_1 from u_st within w_pfcsecurity_reportwindow
end type
type ddlb_apps from u_ddlb within w_pfcsecurity_reportwindow
end type
type ddlb_windows from u_ddlb within w_pfcsecurity_reportwindow
end type
type st_win from u_st within w_pfcsecurity_reportwindow
end type
end forward

global type w_pfcsecurity_reportwindow from w_sheet
integer x = 46
integer y = 160
integer width = 2862
integer height = 1748
string title = "PFC Security Object Report"
string menuname = "m_pfcsecurity_reports"
long backcolor = 80263328
dw_report dw_report
st_1 st_1
ddlb_apps ddlb_apps
ddlb_windows ddlb_windows
st_win st_win
end type
global w_pfcsecurity_reportwindow w_pfcsecurity_reportwindow

type variables
n_ds ids_windows

end variables

on w_pfcsecurity_reportwindow.create
int iCurrent
call super::create
if this.MenuName = "m_pfcsecurity_reports" then this.MenuID = create m_pfcsecurity_reports
this.dw_report=create dw_report
this.st_1=create st_1
this.ddlb_apps=create ddlb_apps
this.ddlb_windows=create ddlb_windows
this.st_win=create st_win
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_report
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.ddlb_apps
this.Control[iCurrent+4]=this.ddlb_windows
this.Control[iCurrent+5]=this.st_win
end on

on w_pfcsecurity_reportwindow.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_report)
destroy(this.st_1)
destroy(this.ddlb_apps)
destroy(this.ddlb_windows)
destroy(this.st_win)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  w_pfcsecurity_report_user
//
//	Description:  Allows the setting of security for a window user combination
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License

//
// https://opensource.org/licenses/MIT
//
// ======================================================================
//
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
//////////////////////////////////////////////////////////////////////////////

dw_report.of_settransobject(gnv_app.inv_trans)

dw_report.of_setprintpreview(True)
This.of_SetResize(True)
inv_resize.of_SetOrigSize(dw_report.x+dw_report.width+4,dw_report.y+dw_report.height+4)
inv_resize.of_register( dw_report, inv_resize.scalerightbottom)


end event

event pfc_postopen;call super::pfc_postopen;
long li_cnt,li_row
string ls_entry

ids_windows = create n_ds

ids_windows.dataobject = 'd_pfcsecurity_applications'
ids_windows.of_settransobject(gnv_app.inv_trans)

li_cnt = ids_windows.retrieve() // populate the applications drop down list box
for li_row = 1 to li_cnt
	ls_entry = ids_windows.object.application[li_row] +' : '+ids_windows.object.description[li_row] 
	ddlb_apps.additem(ls_entry)
next

ids_windows.dataobject = 'd_pfcsecurity_windows'  // this will get reused in the ddlb_apps.selectionchanged event
ids_windows.of_settransobject(gnv_app.inv_trans)

dw_report.setfocus() // set focus here so that the message router can see the datawindow
ddlb_apps.setfocus()


end event

event pfc_print;call super::pfc_print;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_print
//
//	Arguments: None
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:  Ensure that the datawindow gets the pfc_print message. It might 
//					not if it is not the current control on the window
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License

//
// https://opensource.org/licenses/MIT
//
// ======================================================================
//
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
//////////////////////////////////////////////////////////////////////////////
return dw_report.event pfc_print()
end event

event pfc_printimmediate;call super::pfc_printimmediate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_printimmediate
//
//	Arguments: None
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:  Ensure that the datawindow gets the pfc_printimmediate message. It might 
//					not if it is not the current control on the window
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License

//
// https://opensource.org/licenses/MIT
//
// ======================================================================
//
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
//////////////////////////////////////////////////////////////////////////////
return dw_report.event pfc_printimmediate()
end event

event close;call w_sheet::close;destroy ids_windows 
end event

type dw_report from u_dw within w_pfcsecurity_reportwindow
integer x = 14
integer y = 104
integer width = 2779
integer height = 1436
integer taborder = 30
string dataobject = "d_pfcsecurity_report_by_window"
end type

event constructor;call super::constructor;ib_rmbmenu = false // turn off RMB support
end event

type st_1 from u_st within w_pfcsecurity_reportwindow
integer x = 32
integer y = 20
integer width = 297
long backcolor = 77956459
string text = "Applications :"
end type

type ddlb_apps from u_ddlb within w_pfcsecurity_reportwindow
integer x = 338
integer y = 12
integer width = 855
integer height = 1084
integer taborder = 10
end type

event selectionchanged;call u_ddlb::selectionchanged;
long li_cnt,li_row
string ls_entry,ls_app

ls_app = this.text(index) // get the application name
ls_app = trim(left(ls_app,pos(ls_app,':') - 1))


ddlb_windows.reset()
li_cnt = ids_windows.retrieve(ls_app) // populate the windows drop down list box

for li_row = 1 to li_cnt
	ls_entry = ids_windows.object.window[li_row]
	ddlb_windows.additem(ls_entry)
next

dw_report.reset()


end event

type ddlb_windows from u_ddlb within w_pfcsecurity_reportwindow
integer x = 1545
integer y = 12
integer width = 832
integer height = 916
integer taborder = 20
end type

event selectionchanged;call super::selectionchanged;string ls_window
long li_cnt

ls_window = this.text(index)

li_cnt = dw_report.retrieve(ls_window)

if li_cnt = 0 then messagebox(parent.title,'Security has not been set for this window ('+ls_window+').')
end event

type st_win from u_st within w_pfcsecurity_reportwindow
integer x = 1266
integer y = 20
integer width = 247
long backcolor = 77956459
string text = "Objects :"
alignment alignment = right!
end type


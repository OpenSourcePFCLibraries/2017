HA$PBExportHeader$w_pfcsecurity_reportuser.srw
$PBExportComments$Report on user information
forward
global type w_pfcsecurity_reportuser from w_sheet
end type
type dw_report from u_dw within w_pfcsecurity_reportuser
end type
type ddplb_users from dropdownpicturelistbox within w_pfcsecurity_reportuser
end type
type st_1 from u_st within w_pfcsecurity_reportuser
end type
end forward

global type w_pfcsecurity_reportuser from w_sheet
integer x = 110
integer y = 172
integer width = 2793
integer height = 1688
string title = "PFC Security User Report"
string menuname = "m_pfcsecurity_reports"
long backcolor = 80263328
dw_report dw_report
ddplb_users ddplb_users
st_1 st_1
end type
global w_pfcsecurity_reportuser w_pfcsecurity_reportuser

type variables

end variables

on w_pfcsecurity_reportuser.create
int iCurrent
call super::create
if this.MenuName = "m_pfcsecurity_reports" then this.MenuID = create m_pfcsecurity_reports
this.dw_report=create dw_report
this.ddplb_users=create ddplb_users
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_report
this.Control[iCurrent+2]=this.ddplb_users
this.Control[iCurrent+3]=this.st_1
end on

on w_pfcsecurity_reportuser.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_report)
destroy(this.ddplb_users)
destroy(this.st_1)
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
ddplb_users.AddPicture("Custom076!")
ddplb_users.AddPicture("Group!")

dw_report.of_settransobject(gnv_app.inv_trans)
This.of_SetResize(True)
inv_resize.of_SetOrigSize(dw_report.x+dw_report.width+4,dw_report.y+dw_report.height+4)
inv_resize.of_register( dw_report, inv_resize.scalerightbottom)


end event

event pfc_postopen;call super::pfc_postopen;
long li_cnt,li_row
integer li_picture
string ls_entry
n_ds lds_users

dw_report.setfocus()
lds_users = create n_ds
lds_users.dataobject = 'd_pfcsecurity_users'
lds_users.of_settransobject(gnv_app.inv_trans)

li_cnt = lds_users.retrieve() // populate the users drop down list box
for li_row = 1 to li_cnt
	if lds_users.object.user_type[li_row] = 0 then
		li_picture = 1
	else
		li_picture = 2
	end if
	ls_entry = lds_users.object.name[li_row] +' : '+lds_users.object.description[li_row] 
	ddplb_users.additem(ls_entry,li_picture)
next

destroy lds_users
dw_report.setfocus() // set focus here so that the message router can see the datawindow
ddplb_users.setfocus()
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

type dw_report from u_dw within w_pfcsecurity_reportuser
integer x = 14
integer y = 112
integer width = 2706
integer height = 1364
integer taborder = 10
string dataobject = "d_pfcsecurity_report_by_user"
end type

event constructor;call super::constructor;ib_rmbmenu = false // turn off RMB support
end event

type ddplb_users from dropdownpicturelistbox within w_pfcsecurity_reportuser
event selectionchanged pbm_cbnselchange
integer x = 366
integer y = 12
integer width = 905
integer height = 1076
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 12632256
end type

event selectionchanged;// save off the selected user
string ls_user
ls_user = this.text(index)
ls_user = trim(left(ls_user,pos(ls_user,':') - 1))

dw_report.retrieve(ls_user)
end event

type st_1 from u_st within w_pfcsecurity_reportuser
integer x = 46
integer y = 28
integer width = 361
long backcolor = 77956459
string text = "Users/Groups"
end type


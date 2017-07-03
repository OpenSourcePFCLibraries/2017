HA$PBExportHeader$w_pfcsecurity_infomgmt.srw
$PBExportComments$Manage window/control/user relationships
forward
global type w_pfcsecurity_infomgmt from w_sheet
end type
type tv_apps from u_tv within w_pfcsecurity_infomgmt
end type
type dw_controls from u_dw within w_pfcsecurity_infomgmt
end type
type rb_active from u_rb within w_pfcsecurity_infomgmt
end type
type rb_all from u_rb within w_pfcsecurity_infomgmt
end type
type gb_display from u_gb within w_pfcsecurity_infomgmt
end type
type ddplb_users from dropdownpicturelistbox within w_pfcsecurity_infomgmt
end type
type st_users from u_st within w_pfcsecurity_infomgmt
end type
type st_bar from u_st_splitbar within w_pfcsecurity_infomgmt
end type
end forward

global type w_pfcsecurity_infomgmt from w_sheet
integer x = 37
integer y = 212
integer width = 2926
integer height = 1632
string title = "User/Object Management"
string menuname = "m_pfcsecurity_info_mgmt"
long backcolor = 80263328
tv_apps tv_apps
dw_controls dw_controls
rb_active rb_active
rb_all rb_all
gb_display gb_display
ddplb_users ddplb_users
st_users st_users
st_bar st_bar
end type
global w_pfcsecurity_infomgmt w_pfcsecurity_infomgmt

type variables
protected:
constant string TAB = '~t'
string		is_app
string		is_window
string		is_user
string		is_controlfilter
dragobject	idrg_prevobj
n_ds		ids_users
n_ds		ids_controls
long		il_offsets[]
end variables

forward prototypes
protected subroutine of_setfilter ()
protected function integer of_loadcontrols ()
end prototypes

protected subroutine of_setfilter ();//////////////////////////////////////////////////////////////////////////////
//
//	Function: of_SetFilter
//
//	Access:  protected
//
//	Arguments : None
//
//	Returns:  None
//
//	Description:  Filter the dw_controls datawindow
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
string ls_filter
ls_filter = "application =  '"+ is_app + "' and window = '"+is_window+"' and user_name = '"+is_user+"'"+is_controlfilter

if dw_controls.setfilter(ls_filter) < 1 then
	messagebox('Selectionchanging',ls_filter)
end if
dw_controls.filter()
dw_controls.sort()


end subroutine

protected function integer of_loadcontrols ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_LoadControls
//
//	Access:  protected
//
//	Arguments : None
//
//	Returns:  integer
//				1 = success
//				-1 = failure
//
//	Description:  for the current, application, window and user; populate the dw_control datawindow
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
integer li_rc
long ll_row,ll_num_controls,ll_row_found,ll_num_rows
string ls_control , ls_buffer, ls_row,ls_desc,ls_object_type,ls_exp
boolean lb_filter

// all keys must be present 
if len(is_app) = 0 or len(is_window) = 0 or len(is_user) = 0 then return -1

lb_filter = rb_all.checked 
dw_controls.setredraw(false)
rb_all.event clicked() // set the all filter

if dw_controls.rowcount() = 0 then // ok, first time retrival to we need to add in all of the controls that are not currently set 
	ll_num_rows = dw_controls.retrieve(is_app,is_window,is_user)
	
	ll_num_controls = ids_controls.retrieve(is_app,is_window) // first get the list of controls for this window
	for ll_row = 1 to ll_num_controls
		ls_control = ids_controls.object.control[ll_row]
		ls_exp = 'Control = "'+ls_control+'"'
		ll_row_found = dw_controls.find(ls_exp,1,ll_num_rows)
		if ll_row_found = 0 then // not already on the list so lets add the control
			ls_desc = ids_controls.object.description[ll_row]
			ls_object_type = ids_controls.object.object_type[ll_row]
			ls_row = is_app + TAB + is_window + TAB +  ls_control +  TAB + is_user + TAB + 'N' + TAB + ls_desc + TAB + ls_object_type
			if len(ls_buffer) = 0 then
				ls_buffer = ls_row
			else
				ls_buffer = ls_buffer + '~r~n' + ls_row
			end if
		end if
	next		
	dw_controls.importstring(ls_buffer)
	lb_filter = true  // sine this is a new entry let's show all of the controls
end if
// reset everything back
if lb_filter then 
	rb_active.checked = false
	rb_all.checked = true
	rb_all.event clicked()
else
	rb_all.checked = false
	rb_active.checked = true
	rb_active.event clicked()
end if
dw_controls.setredraw(true)

return 1

end function

on w_pfcsecurity_infomgmt.create
int iCurrent
call super::create
if this.MenuName = "m_pfcsecurity_info_mgmt" then this.MenuID = create m_pfcsecurity_info_mgmt
this.tv_apps=create tv_apps
this.dw_controls=create dw_controls
this.rb_active=create rb_active
this.rb_all=create rb_all
this.gb_display=create gb_display
this.ddplb_users=create ddplb_users
this.st_users=create st_users
this.st_bar=create st_bar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tv_apps
this.Control[iCurrent+2]=this.dw_controls
this.Control[iCurrent+3]=this.rb_active
this.Control[iCurrent+4]=this.rb_all
this.Control[iCurrent+5]=this.gb_display
this.Control[iCurrent+6]=this.ddplb_users
this.Control[iCurrent+7]=this.st_users
this.Control[iCurrent+8]=this.st_bar
end on

on w_pfcsecurity_infomgmt.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.tv_apps)
destroy(this.dw_controls)
destroy(this.rb_active)
destroy(this.rb_all)
destroy(this.gb_display)
destroy(this.ddplb_users)
destroy(this.st_users)
destroy(this.st_bar)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  w_pfcsecurity_info_mgmt
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

dw_controls.of_settransobject(gnv_app.inv_trans)
dw_controls.of_SetSort(true) // turn on sorting
dw_controls.inv_sort.of_SetColumnHeader (true) // use header clicking only for sorting
dw_controls.inv_sort.of_SetStyle(1)

// Register the datasource for each level of the tree
// Parameters are: level, datawindow object, transaction object, column to display as the label, 
// the retrieval arguments, and whether the DW object is to be used recursively.
tv_apps.of_SetDatasource(1, "d_pfcsecurity_applications", gnv_app.inv_trans, "description", "", False, 1, 2)
tv_apps.of_SetDatasource(2, "d_pfcsecurity_windows", gnv_app.inv_trans, "window", ":parent.1.application", False, 3, 4)

ids_users = create n_ds
ids_users.dataobject = 'd_pfcsecurity_users'
ids_users.of_settransobject(gnv_app.inv_trans)

ids_controls = create n_ds
ids_controls.dataobject = 'd_pfcsecurity_templateupdate'
ids_controls.of_settransobject(gnv_app.inv_trans)

end event

event resize;call super::resize;//// resize to fit
//tv_apps.Height = newheight - tv_apps.Y
//dw_controls.Height = tv_apps.Height - dw_controls.y
//st_bar.Height = tv_apps.Height + 70
//
//dw_controls.Width = newwidth - (dw_controls.X + ii_baroffset)
//
end event

event pfc_postopen;// set up the treeviews, create and populate the datastores

integer	li_picture
long		ll_cnt, ll_row
string	ls_entry

// retrieve the treeview level 1
tv_apps.of_InitialRetrieve()

ll_cnt = ids_users.retrieve() // populate the users drop down list box
for ll_row = 1 to ll_cnt
	if ids_users.object.user_type[ll_row] = 0 then
		li_picture = 1
	else
		li_picture = 2
	end if
	ls_entry = ids_users.object.name[ll_row] + ' : ' + ids_users.object.description[ll_row] 
	ddplb_users.additem(ls_entry, li_picture)
next


end event

event close;call w_sheet::close;// destroy created controls
destroy ids_users
destroy ids_controls
end event

event pfc_endtran;call super::pfc_endtran;// commit the transaction
commit using gnv_app.inv_trans;
if gnv_app.inv_trans.sqlcode = 0 then 
	return 1
else
	return  -1
end if
end event

event pfc_postupdate;call w_sheet::pfc_postupdate;// clear and reload the controls datawindow
dw_controls.reset()
of_LoadControls()
return 1
end event

event pfc_preupdate;call w_sheet::pfc_preupdate;
// We need to do several things here
// 1. Discard (not delete) all rows that are marked as newunmodified
// 2. Discard all rows that are marked as newmodfied and have a status of 'NotSet'
// 3. Delete all rows that have a status of 'NotSet'


long ll_num_rows
integer li_rc

dw_controls.setfilter('isRowNew() and  not isRowModified()')
dw_controls.filter()
ll_num_rows = dw_controls.rowcount()
if ll_num_rows > 0 then li_rc = dw_controls.rowsdiscard(1,ll_num_rows,primary!)

dw_controls.setfilter('isRowNew() and  isRowModified() and status = "N"')
dw_controls.filter()
ll_num_rows = dw_controls.rowcount()
if ll_num_rows > 0 then li_rc = dw_controls.rowsdiscard(1,ll_num_rows,primary!)

//dw_controls.setfilter('isRowModified() and status = "N"')
dw_controls.setfilter('status = "N"')
dw_controls.filter()
ll_num_rows = dw_controls.rowcount()
if ll_num_rows > 0 then li_rc = dw_controls.rowsmove(1,ll_num_rows,primary!,dw_controls,1,delete!)

// remove the filter
dw_controls.setfilter('')
dw_controls.filter()

return  1

end event

event pfc_preclose;call w_sheet::pfc_preclose;return this.event pfc_preupdate()
end event

event pfc_preopen;this.of_setresize(true)
inv_resize.of_SetOrigSize(dw_controls.x + dw_controls.width + 4,dw_controls.y + dw_controls.height + 4)
inv_resize.of_register(tv_apps,inv_resize.scalebottom)
inv_resize.of_register(st_bar,inv_resize.scalebottom)
inv_resize.of_register(dw_controls,inv_resize.scalerightbottom)
st_bar.of_Register(tv_apps,st_bar.LEFT)
st_bar.of_Register(dw_controls,st_bar.RIGHT)
il_offsets[1] = st_users.x - st_bar.x
il_offsets[2] = ddplb_users.x - st_bar.x
il_offsets[3] = gb_display.x - st_bar.x
il_offsets[4] = rb_active.x - st_bar.x
il_offsets[5] = rb_all.x - st_bar.x


end event

type tv_apps from u_tv within w_pfcsecurity_infomgmt
integer width = 613
integer height = 1428
integer taborder = 10
fontcharset fontcharset = ansi!
long backcolor = 1090519039
boolean linesatroot = true
boolean hideselection = false
string picturename[] = {"Application5!","Application!","ArrangeTables5!","SelectObject!"}
long picturemaskcolor = 12632256
integer statepicturewidth = 16
integer statepictureheight = 16
long statepicturemaskcolor = 12632256
end type

event selectionchanged;// keep track of what application and window is active
Integer	li_cnt
TreeViewItem	ltvi_This
n_ds lds_obj
long ll_row
long ll_parenthandle

this.GetItem(newhandle, ltvi_This)

if  ltvi_this.level >= 1 then // get application info
	ll_parenthandle = newhandle
	for li_cnt = 2 to ltvi_this.level 
		ll_parenthandle = this.finditem ( parenttreeitem!, ll_parenthandle )
	next	
	this.of_GetDataRow (ll_parenthandle,lds_obj,ll_row)
	is_app = lds_obj.object.application[ll_row]
end if

if  ltvi_this.level = 2 then // get window info
	is_window = ltvi_this.label
end if
of_LoadControls()

end event

event getfocus;call u_tv::getfocus;// keep track of who had focus last
idrg_prevobj = this
end event

type dw_controls from u_dw within w_pfcsecurity_infomgmt
integer x = 626
integer y = 152
integer width = 2226
integer height = 1268
integer taborder = 20
string dataobject = "d_pfcsecurity_info_update"
boolean hscrollbar = true
end type

event retrievestart;call u_dw::retrievestart;return 2 // append data
end event

event getfocus;call u_dw::getfocus;// keep track of who had focus last
idrg_prevobj = this
end event

event pfc_prermbmenu;call super::pfc_prermbmenu;// Set up the PopUp Menu.
am_dw.m_table.m_dash11.visible = false
am_dw.m_table.m_insert.visible = False
am_dw.m_table.m_addrow.visible = False
am_dw.m_table.m_delete.visible = False

end event

type rb_active from u_rb within w_pfcsecurity_infomgmt
integer x = 1833
integer y = 60
integer width = 384
integer height = 52
long backcolor = 77956459
string text = "Active &Only"
boolean checked = true
end type

event clicked;call u_rb::clicked;//set the filter criteria and filter the datawindow
is_controlfilter = " and status <> 'N'"
of_SetFilter()


end event

type rb_all from u_rb within w_pfcsecurity_infomgmt
integer x = 2226
integer y = 60
integer width = 169
integer height = 52
long backcolor = 77956459
string text = "&All"
end type

event clicked;call u_rb::clicked;//set the filter criteria and filter the datawindow
is_controlfilter = ""
of_SetFilter()


end event

type gb_display from u_gb within w_pfcsecurity_infomgmt
integer x = 1797
integer width = 631
integer height = 132
integer taborder = 30
long backcolor = 77956459
string text = "&Display Controls"
end type

type ddplb_users from dropdownpicturelistbox within w_pfcsecurity_infomgmt
integer x = 823
integer y = 28
integer width = 910
integer height = 1076
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
integer accelerator = 117
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 12632256
end type

event selectionchanged;// save off the selected user

is_user = this.text(index)
is_user = trim(left(is_user,pos(is_user,':') - 1))

of_LoadControls()
end event

type st_users from u_st within w_pfcsecurity_infomgmt
integer x = 663
integer y = 20
integer width = 169
integer height = 52
long backcolor = 77956459
string text = "&Users :"
end type

type st_bar from u_st_splitbar within w_pfcsecurity_infomgmt
integer x = 617
integer y = 4
integer width = 9
integer height = 1428
end type

event lbuttonup;call super::lbuttonup;// custom movements here since the splitter bar code 'resizes' the object as well as moving it.
parent.setredraw(false)
st_users.x = il_offsets[1] + st_bar.x
ddplb_users.x  = il_offsets[2] + st_bar.x
gb_display.x = il_offsets[3] + st_bar.x
rb_active.x = il_offsets[4]+ st_bar.x
rb_all.x = il_offsets[5] + st_bar.x
parent.setredraw(true)

end event


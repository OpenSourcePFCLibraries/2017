HA$PBExportHeader$w_pfcsecurity_usermgmt.srw
$PBExportComments$Manage users and groups
forward
global type w_pfcsecurity_usermgmt from w_sheet
end type
type tv_users from u_tv within w_pfcsecurity_usermgmt
end type
type dw_users from u_dw within w_pfcsecurity_usermgmt
end type
type tv_groups from u_tv within w_pfcsecurity_usermgmt
end type
type dw_groups from u_dw within w_pfcsecurity_usermgmt
end type
type st_1 from u_st within w_pfcsecurity_usermgmt
end type
type st_2 from u_st within w_pfcsecurity_usermgmt
end type
end forward

global type w_pfcsecurity_usermgmt from w_sheet
integer x = 5
integer y = 4
integer width = 1810
integer height = 1540
string title = "User/Group Management"
string menuname = "m_pfcsecurity_user_mgmt"
long backcolor = 80921269
event ue_edit_item ( )
event ue_add_item ( )
event ue_delete_item ( )
tv_users tv_users
dw_users dw_users
tv_groups tv_groups
dw_groups dw_groups
st_1 st_1
st_2 st_2
end type
global w_pfcsecurity_usermgmt w_pfcsecurity_usermgmt

type variables
Protected:
integer	ii_usertype
long		il_currhandle
string		is_user
string		is_group
window	iw_frame
m_pfcsecurity_user_mgmt	im_popmenu
end variables

event ue_edit_item;call super::ue_edit_item;// editing an existing item, first figure out what we are working with and set up as needed
s_pfcsecurity_user_data lstr_data
n_ds l_ds
long ll_row

lstr_data.status = 2 // edit item
lstr_data.user_type = ii_usertype
if ii_usertype = 0 then // user
	tv_users.of_GetDataRow(il_currhandle,l_ds,ll_row)
else
	tv_groups.of_GetDataRow(il_currhandle,l_ds,ll_row)
	lstr_data.priority= l_ds.object.priority[ll_row]
end if
lstr_data.name = l_ds.object.name[ll_row]
lstr_data.desc = l_ds.object.description[ll_row]

openwithparm(w_pfcsecurity_edituser,lstr_data)

lstr_data = message.powerobjectparm
if not isvalid(lstr_data) then return
if lstr_data.status = -1 then return
l_ds.object.description[ll_row] = lstr_data.desc
l_ds.object.priority[ll_row] = lstr_data.priority
if ii_usertype = 0 then // user
	tv_users.of_RefreshItem(il_currhandle,ll_row)
	tv_users.selectitem(il_currhandle)
else
	tv_groups.of_RefreshItem(il_currhandle,ll_row)
	tv_groups.selectitem(il_currhandle)
	tv_groups.event selectionchanged(0,il_currhandle)
end if
 

end event

event ue_add_item;call super::ue_add_item;// add a new item, first figure out what we are adding and set up as needed
s_pfcsecurity_user_data lstr_data
n_ds l_ds
long ll_row,il_new
lstr_data.status = 1 // add
lstr_data.user_type = ii_usertype
lstr_data.priority = 1

openwithparm(w_pfcsecurity_edituser,lstr_data)

lstr_data = message.powerobjectparm
if not isvalid(lstr_data) then return
if lstr_data.status = -1 then return

if ii_usertype = 0 then // user
	tv_users.of_GetDatastore(1,l_ds)
else
	tv_groups.of_GetDatastore(1,l_ds)
end if

// copy the data to the datastore
ll_row = l_ds.insertrow(0)
l_ds.object.description[ll_row] = lstr_data.desc
l_ds.object.priority[ll_row] = lstr_data.priority
l_ds.object.name[ll_row] = lstr_data.name
l_ds.object.user_type[ll_row] = lstr_data.user_type
if ii_usertype = 0 then // user
	il_new  = tv_users.of_InsertItem(0,l_ds,ll_row,'Sort')
	tv_users.selectitem(il_new)
	ii_usertype = 0
	is_user = lstr_data.name
else
	il_new  = tv_groups.of_InsertItem(0,l_ds,ll_row,'Sort')
	tv_groups.selectitem(il_new)
	ii_usertype = 1
	is_group = lstr_data.name
end if
il_currhandle = il_new
is_user = lstr_data.name

 

end event

event ue_delete_item;call super::ue_delete_item;// delete an item, first figure out what we are deleting and set up as needed
s_pfcsecurity_user_data lstr_data
n_ds l_ds,l_ds_delete
integer li_rc,li_cnt
long ll_row

lstr_data.status = 3 // delete
lstr_data.user_type = ii_usertype
if ii_usertype = 0 then // user
	tv_users.of_GetDataRow(il_currhandle,l_ds,ll_row)
else
	tv_groups.of_GetDataRow(il_currhandle,l_ds,ll_row)
	if ii_usertype = 1 then lstr_data.priority= l_ds.object.priority[ll_row] // it's a group so we need the priority as well
end if
lstr_data.name = l_ds.object.name[ll_row]
lstr_data.desc = l_ds.object.description[ll_row]

openwithparm(w_pfcsecurity_edituser,lstr_data)

lstr_data = message.powerobjectparm
if not isvalid(lstr_data) then return
if lstr_data.status = -1 then return

if ii_usertype < 2 then // ok, we are deleting a user or a group so we have to worry about removing all instances of the item from all tables in the database
								// since we are not assuming that the database has the ability to do cascading deletes we have to do them ourselves.
	if messagebox(this.title,'A deletion will cause any pending updates to be written to the database at this time.',question!,okcancel!,2) = 2 then return

	li_rc = this.event pfc_save() // save off any unsaved changes
	if li_rc < 1 then return
	l_ds_delete = create n_ds
	if ii_usertype = 0 then // user
		tv_users.of_DeleteItem(il_currhandle)
		l_ds_delete.dataobject = 'd_pfcsecurity_grouplookup'
	else // group
		tv_groups.of_DeleteItem(il_currhandle)
		l_ds_delete.dataobject = 'd_pfcsecurity_user_lookup_by_group'
	end if
 
	// first delete all user/group combinations
	l_ds_delete.settransobject(gnv_app.inv_trans)
	li_cnt = l_ds_delete.retrieve(lstr_data.name)
	if li_cnt > 0 then 
		l_ds_delete.rowsmove(1,li_cnt,primary!,l_ds_delete,1,delete!)
		li_rc = l_ds_delete.update()
		If li_rc = 1 then // then delete all entries in the info table for this user
			l_ds_delete.dataobject = 'd_pfcsecurity_info_user_delete'
			l_ds_delete.settransobject(gnv_app.inv_trans)
			li_cnt = l_ds_delete.retrieve(lstr_data.name)
			if li_cnt > 0 then 
				l_ds_delete.rowsmove(1,li_cnt,primary!,l_ds_delete,1,delete!)
				li_rc = l_ds_delete.update()
				if li_rc > 1 then 
					commit using gnv_app.inv_trans;
				else
					rollback using gnv_app.inv_trans;
				end if
			end if
		else
			rollback using gnv_app.inv_trans;
		end if
	end if
	li_rc = this.event pfc_save() // now go save this deletion

	if ii_usertype = 0 then // user
		tv_groups.of_RefreshLevel(1)
	else // group
		tv_users.of_RefreshLevel(1)
	end if
else // remove a user from a group, no referential stuff to worry about
	tv_groups.of_DeleteItem(il_currhandle)
end if


end event

on w_pfcsecurity_usermgmt.create
int iCurrent
call super::create
if this.MenuName = "m_pfcsecurity_user_mgmt" then this.MenuID = create m_pfcsecurity_user_mgmt
this.tv_users=create tv_users
this.dw_users=create dw_users
this.tv_groups=create tv_groups
this.dw_groups=create dw_groups
this.st_1=create st_1
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tv_users
this.Control[iCurrent+2]=this.dw_users
this.Control[iCurrent+3]=this.tv_groups
this.Control[iCurrent+4]=this.dw_groups
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_2
end on

on w_pfcsecurity_usermgmt.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.tv_users)
destroy(this.dw_users)
destroy(this.tv_groups)
destroy(this.dw_groups)
destroy(this.st_1)
destroy(this.st_2)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  w_pfcsecurity_user_mgmt
//
//	Description:  Edit users, groups and their relationships
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



// Register the datasource for each level of the tree
// Parameters are: level, datawindow object, transaction object, column to display as the label, 
// the retrieval arguments, and whether the DW object is to be used recursively.
li_rc = tv_users.AddPicture("custom076!")
li_rc = tv_users.of_SetDatasource(1, "d_pfcsecurity_users_update", gnv_app.inv_trans, "description", "", False, li_rc,li_rc)
li_rc = tv_users.AddPicture("group!")
li_rc = tv_users.of_SetDatasource(2, "d_pfcsecurity_grouplookup", gnv_app.inv_trans, "description", ":parent.1.name", False, li_rc,li_rc)

li_rc = tv_groups.AddPicture("group!")
li_rc = tv_groups.of_SetDatasource(1, "d_pfcsecurity_users_update", gnv_app.inv_trans, "description", "", False,  li_rc,li_rc)
li_rc = tv_groups.AddPicture("custom076!")
li_rc = tv_groups.of_SetDatasource(2, "d_pfcsecurity_user_lookup_by_group", gnv_app.inv_trans, "description", ":parent.1.name", False,  li_rc,li_rc)

dw_groups.insertrow(0)
dw_users.insertrow(0)
// Make sure that datawindows show
iw_frame = gnv_app.of_GetFrame()
im_popmenu = menuid
// set up the resize service
of_setresize(true)
li_rc = this.inv_resize.of_SetOrigSize(this.workspacewidth(), this.WorkSpaceHeight())
IF li_rc = -1 THEN
	MessageBox("Resize",  "Resize service not enabled")
	Return
END IF
li_rc = this.inv_resize.of_SetMinSize(this.workspacewidth(), this.workspaceheight()/2)
this.inv_resize.of_Register  (dw_groups, "FixedToBottom")
this.inv_resize.of_Register  (tv_groups, "ScaleToBottom")
	
this.inv_resize.of_Register  (dw_users, "FixedToBottom")
this.inv_resize.of_Register  (tv_users, "ScaleToBottom")

end event

event pfc_postopen;call w_sheet::pfc_postopen;// populate the treeviews
any la_arg_list[20]

la_arg_list[1] = 0
tv_users.of_InitialRetrieve(la_arg_list)

la_arg_list[1] = 1
tv_groups.of_InitialRetrieve(la_arg_list)

end event

event pfc_endtran;call super::pfc_endtran;// commit the transaction
commit using gnv_app.inv_trans;
if gnv_app.inv_trans.sqlcode = 0 then 
	return 1
else
	return  -1
end if
end event

event pfc_save;call w_sheet::pfc_save;// update the treeviews
if tv_groups.of_update ( 1, true, false ) = 1 then
	if tv_users.of_update ( 1, true, false ) = 1 then
		if tv_groups.of_update ( 2, true, false ) = 1 then
			commit using gnv_app.inv_trans;
			 tv_users.of_ResetUpdate (1)
			 tv_groups.of_ResetUpdate (1)
			 tv_groups.of_ResetUpdate (2)

			return 1
		else
			messagebox('','update failed on tv_groups.of_update ( 2, true, false ) ')
		end if
	else
		messagebox('','update failed on tv_users.of_update ( 1, true, false ) ')
	end if
else
	messagebox('','update failed on tv_groups.of_update ( 1, true, false ) ')
	
end if
rollback using gnv_app.inv_trans;
messagebox('','update failed')
return -1

end event

event pfc_updatespending;// ancestor has been overridden because we are using datastores instead of datawindows
// determine if any of the treeviews have updates pending
// and return 1 if they do
integer li_cnt
TreeViewItem	ltvi_This
n_ds l_ds

tv_groups.of_GetDatastore(2,l_ds) // check user/group combinations
li_cnt = l_ds.modifiedcount() + l_ds.deletedcount()
if li_cnt > 0 then return 1

tv_groups.of_GetDatastore(1,l_ds) // check groups
li_cnt = l_ds.modifiedcount() + l_ds.deletedcount()
if li_cnt > 0 then return 1
	
tv_users.of_GetDatastore(1,l_ds) // check users
li_cnt = l_ds.modifiedcount() + l_ds.deletedcount()
if li_cnt > 0 then return 1


return 0




end event

type tv_users from u_tv within w_pfcsecurity_usermgmt
integer y = 64
integer width = 841
integer height = 1012
integer taborder = 30
string dragicon = "user.ico"
boolean dragauto = true
fontcharset fontcharset = ansi!
long backcolor = 16777215
boolean hasbuttons = false
boolean disabledragdrop = false
boolean hideselection = false
long picturemaskcolor = 12632256
long statepicturemaskcolor = 12632256
end type

event selectionchanged;call super::selectionchanged;Integer	li_RC
TreeViewItem	ltvi_This
n_ds l_ds
long ll_row
this.GetItem(newhandle, ltvi_This)
if ltvi_this.level = 1 then
	il_currhandle = newhandle
	ii_usertype = 0
	this.of_GetDataRow(newhandle,l_ds,ll_row)
	is_user = l_ds.object.name[ll_row]
	if dw_users.rowcount() = 0 then dw_users.insertrow(0)
	dw_users.object.name[1] = is_user
	dw_users.object.description[1] = l_ds.object.description[ll_row]
	if im_popmenu.m_edit.m_additem.enabled = false then im_popmenu.m_edit.m_additem.enabled = true
	if im_popmenu.m_edit.m_edititem.enabled = false then im_popmenu.m_edit.m_edititem.enabled = true
	if im_popmenu.m_edit.m_deleteitem.enabled = false then im_popmenu.m_edit.m_deleteitem.enabled = true
end if
	



end event

event rightclicked;call u_tv::rightclicked;//treeviewitem ltvi_ITEM
//
//this.getitem(handle,ltvi_item)
//if ltvi_item.level <> 1 then return
this.event clicked(handle)
im_popmenu.m_edit.popmenu(iw_frame.pointerx(),iw_frame.pointery())
end event

event begindrag;call u_tv::begindrag;TreeViewItem	ltvi_This


this.GetItem(handle, ltvi_This)
if ltvi_this.level <> 1 then 
	this.drag(cancel!)
else
	this.selectitem(handle)
end if
	



end event

event clicked;call u_tv::clicked;Integer	li_RC
TreeViewItem	ltvi_This
n_ds l_ds
long ll_row
if handle = 0 then
	if not im_popmenu.m_edit.m_additem.enabled then im_popmenu.m_edit.m_additem.enabled = true
	if im_popmenu.m_edit.m_edititem.enabled then im_popmenu.m_edit.m_edititem.enabled = false
	if im_popmenu.m_edit.m_deleteitem.enabled then im_popmenu.m_edit.m_deleteitem.enabled = false
	ii_usertype = 0
else
	this.GetItem(handle, ltvi_This)
	if ltvi_this.level = 1 then
		il_currhandle = handle
		ii_usertype = 0
		this.of_GetDataRow(handle,l_ds,ll_row)
		is_user = l_ds.object.name[ll_row]
		if not im_popmenu.m_edit.m_additem.enabled then im_popmenu.m_edit.m_additem.enabled = true
		if not im_popmenu.m_edit.m_edititem.enabled then im_popmenu.m_edit.m_edititem.enabled = true
		if not im_popmenu.m_edit.m_deleteitem.enabled then im_popmenu.m_edit.m_deleteitem.enabled = true
	else
		if im_popmenu.m_edit.m_additem.enabled then im_popmenu.m_edit.m_additem.enabled = false
		if im_popmenu.m_edit.m_edititem.enabled then im_popmenu.m_edit.m_edititem.enabled = false
		if im_popmenu.m_edit.m_deleteitem.enabled then im_popmenu.m_edit.m_deleteitem.enabled = false
	end if
end if
	



end event

type dw_users from u_dw within w_pfcsecurity_usermgmt
integer y = 1088
integer width = 850
integer height = 148
integer taborder = 40
boolean enabled = false
string dataobject = "d_pfcsecurity_user_info"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event retrievestart;call u_dw::retrievestart;return 2 // append data
end event

event constructor;call super::constructor;of_setupdateable(false)
end event

type tv_groups from u_tv within w_pfcsecurity_usermgmt
integer x = 891
integer y = 64
integer width = 841
integer height = 1012
integer taborder = 20
fontcharset fontcharset = ansi!
long backcolor = 16777215
boolean hasbuttons = false
boolean disabledragdrop = false
boolean hideselection = false
long picturemaskcolor = 12632256
long statepicturemaskcolor = 12632256
end type

event selectionchanged;call super::selectionchanged;Integer	li_RC
TreeViewItem	ltvi_This
n_ds l_ds
long ll_row
string ls_filter
this.GetItem(newhandle, ltvi_This)
if ltvi_this.level = 1 then
	il_currhandle = newhandle
	ii_usertype = 1
	this.of_GetDataRow(newhandle,l_ds,ll_row)
	is_group = l_ds.object.name[ll_row]
	if dw_groups.rowcount() = 0 then dw_groups.insertrow(0)
	dw_groups.object.name[1] = is_group
	dw_groups.object.description[1] = l_ds.object.description[ll_row]
	dw_groups.object.priority[1] = l_ds.object.priority[ll_row]
	if not im_popmenu.m_edit.m_additem.enabled then im_popmenu.m_edit.m_additem.enabled = true
	if not im_popmenu.m_edit.m_edititem.enabled then im_popmenu.m_edit.m_edititem.enabled = true
	if not im_popmenu.m_edit.m_deleteitem.enabled then im_popmenu.m_edit.m_deleteitem.enabled = true
else
	il_currhandle = newhandle
	ii_usertype = 2
	if im_popmenu.m_edit.m_additem.enabled then im_popmenu.m_edit.m_additem.enabled = false
	if im_popmenu.m_edit.m_edititem.enabled then im_popmenu.m_edit.m_edititem.enabled = false
	if not im_popmenu.m_edit.m_deleteitem.enabled then im_popmenu.m_edit.m_deleteitem.enabled = true
end if
	

end event

event rightclicked;call u_tv::rightclicked;this.event clicked(handle)


im_popmenu.m_edit.popmenu(iw_frame.pointerx(),iw_frame.pointery())

end event

event dragdrop;call u_tv::dragdrop;TreeViewItem	ltvi_This
n_ds l_ds
long ll_row
long il_handle
string ls_group,ls_user,ls_desc
u_tv ltv_source

ltv_source = source
if ltv_source <> tv_users then return

il_handle = tv_users.finditem ( currenttreeitem!, 0 )

tv_users.of_GetDataRow(il_handle,l_ds,ll_row)
ls_user = l_ds.object.name[ll_row]
ls_desc = l_ds.object.description[ll_row]


this.GetItem(handle, ltvi_This)
if ltvi_this.level <> 1 then return
this.of_GetDataRow(handle,l_ds,ll_row)
ls_group = l_ds.object.name[ll_row]

this.of_GetDatastore(2,l_ds)

this.expanditem(handle)
ll_row = l_ds.find('group_name = "'+ls_group+'" and name = "'+ls_user+'"',1,l_ds.rowcount())
if ll_row > 0 then
	messagebox(parent.title,'User '+ls_user+' is already a member of group '+ls_group,information!)
	return
end if

ll_row = l_ds.insertrow(0)
l_ds.object.group_name[ll_row] = ls_group
l_ds.object.name[ll_row] = ls_user
l_ds.object.description[ll_row] = ls_desc
il_handle = this.of_InsertItem(handle,l_ds,ll_row,'Sort')
tv_groups.selectitem(il_handle)

 


end event

event dragwithin;call u_tv::dragwithin;u_tv ltv_source

ltv_source = source
if ltv_source <> tv_users then return
tv_groups.selectitem(handle)

end event

event clicked;call u_tv::clicked;Integer	li_RC
TreeViewItem	ltvi_This
n_ds l_ds
long ll_row
string ls_filter
if handle = 0 then
	if not im_popmenu.m_edit.m_additem.enabled then im_popmenu.m_edit.m_additem.enabled = true
	if im_popmenu.m_edit.m_edititem.enabled then im_popmenu.m_edit.m_edititem.enabled = false
	if im_popmenu.m_edit.m_deleteitem.enabled then im_popmenu.m_edit.m_deleteitem.enabled = false
	ii_usertype = 1
else
	if not im_popmenu.m_edit.m_deleteitem.enabled then im_popmenu.m_edit.m_deleteitem.enabled = true
	this.GetItem(handle, ltvi_This)
	if ltvi_this.level = 1 then
		il_currhandle = handle
		ii_usertype = 1
		this.of_GetDataRow(handle,l_ds,ll_row)
		is_group = l_ds.object.name[ll_row]
		if not im_popmenu.m_edit.m_additem.enabled then im_popmenu.m_edit.m_additem.enabled = true
		if not im_popmenu.m_edit.m_edititem.enabled then im_popmenu.m_edit.m_edititem.enabled = true
	else
		il_currhandle = handle
		ii_usertype = 2
		if im_popmenu.m_edit.m_additem.enabled then im_popmenu.m_edit.m_additem.enabled = false
		if im_popmenu.m_edit.m_edititem.enabled then im_popmenu.m_edit.m_edititem.enabled = false
	end if
end if
	

end event

type dw_groups from u_dw within w_pfcsecurity_usermgmt
integer x = 891
integer y = 1088
integer width = 855
integer taborder = 10
boolean enabled = false
string dataobject = "d_pfcsecurity_user_info"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event retrievestart;call u_dw::retrievestart;return 2 // append data
end event

event constructor;call super::constructor;of_setupdateable(false)
end event

type st_1 from u_st within w_pfcsecurity_usermgmt
integer width = 343
long backcolor = 77956459
string text = "Users:"
end type

type st_2 from u_st within w_pfcsecurity_usermgmt
integer x = 896
integer width = 343
long backcolor = 77956459
string text = "Groups:"
end type


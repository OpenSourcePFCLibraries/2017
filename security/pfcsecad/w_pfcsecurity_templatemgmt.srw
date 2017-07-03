HA$PBExportHeader$w_pfcsecurity_templatemgmt.srw
$PBExportComments$Manage window template information
forward
global type w_pfcsecurity_templatemgmt from w_sheet
end type
type dw_deletedcontrols from u_dw within w_pfcsecurity_templatemgmt
end type
type dw_windows from u_dw within w_pfcsecurity_templatemgmt
end type
type st_bar from u_st_splitbar within w_pfcsecurity_templatemgmt
end type
type tv_apps from u_tvs within w_pfcsecurity_templatemgmt
end type
end forward

global type w_pfcsecurity_templatemgmt from w_sheet
integer x = 160
integer y = 200
integer width = 2734
integer height = 1656
string title = "Template Management"
string menuname = "m_pfcsecurity_template_mgmt"
long backcolor = 80263328
event ue_delete_window ( )
dw_deletedcontrols dw_deletedcontrols
dw_windows dw_windows
st_bar st_bar
tv_apps tv_apps
end type
global w_pfcsecurity_templatemgmt w_pfcsecurity_templatemgmt

type variables
Protected:

string	is_app
string	is_window
dragobject idrg_prevobj

end variables

event ue_delete_window;// if a window is deleted then we have to also delete any rows in the template table and the security_info table
// we are assuming that there is no cascading delete referntial integrity rules or triggers in place
int li_rc
long ll_handle,ll_cnt

if len(is_window) = 0 then
	messagebox(this.title,'No object is currently selected')
	return
end if

li_rc = messagebox(this.title,'Ok to delete all controls for object : '+is_window+'. Doing this will also cause any other changes you have made to be updated to the database at this time.',question!,okcancel!,2)
if li_rc = 2 then return

// delete any records in the security_info table for this application,window, use the hidden datawindow so that PFC will automatically update it for me
dw_deletedcontrols.retrieve(is_app, is_window)
ll_cnt = dw_deletedcontrols.rowcount()
dw_deletedcontrols.rowsmove(1, ll_cnt, primary!, dw_deletedcontrols, 1, delete!)

// delete the template rows
ll_cnt = dw_windows.rowcount()
dw_windows.rowsmove(1, ll_cnt, primary!, dw_windows, 1, delete!)

// remove the treeview item for the window
tv_apps.event pfc_DeleteItem()

this.event post pfc_save()

end event

on w_pfcsecurity_templatemgmt.create
int iCurrent
call super::create
if this.MenuName = "m_pfcsecurity_template_mgmt" then this.MenuID = create m_pfcsecurity_template_mgmt
this.dw_deletedcontrols=create dw_deletedcontrols
this.dw_windows=create dw_windows
this.st_bar=create st_bar
this.tv_apps=create tv_apps
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_deletedcontrols
this.Control[iCurrent+2]=this.dw_windows
this.Control[iCurrent+3]=this.st_bar
this.Control[iCurrent+4]=this.tv_apps
end on

on w_pfcsecurity_templatemgmt.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_deletedcontrols)
destroy(this.dw_windows)
destroy(this.st_bar)
destroy(this.tv_apps)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  w_pfcsecurity_template
//
//	Description:  Edit the controls that are on of a window
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
tv_apps.inv_levelsource.of_register(1, "description", "", "d_pfcsecurity_applications", gnv_app.inv_trans, "")
tv_apps.inv_levelsource.of_register(2, "window", ":parent.1.application", "d_pfcsecurity_windows", gnv_app.inv_trans, "")

// pictures are already defined on the tree
tv_apps.inv_levelsource.of_setpicturecolumn(1, "1")
tv_apps.inv_levelsource.of_setselectedpicturecolumn(1, "2")
tv_apps.inv_levelsource.of_setpicturecolumn(2, "3")
tv_apps.inv_levelsource.of_setselectedpicturecolumn(2, "4")

dw_windows.of_settransobject(gnv_app.inv_trans)
dw_windows.of_SetSort(true)
dw_windows.inv_sort.of_SetStyle(1)
dw_deletedcontrols.of_settransobject(gnv_app.inv_trans)




end event

event pfc_postopen;// populate the treeview
tv_apps.event pfc_populate(0)
end event

event pfc_endtran;call super::pfc_endtran;// commit the transaction
commit using gnv_app.inv_trans;
if gnv_app.inv_trans.sqlcode = 0 then 
	return 1
else
	return  -1
end if
end event

event pfc_preopen;this.of_setresize(TRUE)
inv_resize.of_setOrigSize(dw_windows.x + dw_windows.width + 4,tv_apps.y+tv_apps.height + 4)
inv_resize.of_register(tv_apps,inv_resize.scalebottom)
inv_resize.of_register(st_bar,inv_resize.scalebottom)
inv_resize.of_register(dw_windows,inv_resize.scalerightbottom)
st_bar.of_register(tv_apps,st_bar.LEFT)
st_bar.of_register(dw_windows,st_bar.RIGHT)

end event

type dw_deletedcontrols from u_dw within w_pfcsecurity_templatemgmt
string tag = "This DW is hidden so that updates to it and the template dw will be syncronized by PFC"
boolean visible = false
integer x = 1198
integer y = 324
integer taborder = 10
boolean enabled = false
string dataobject = "d_pfcsecurity_controllistdel"
end type

type dw_windows from u_dw within w_pfcsecurity_templatemgmt
integer x = 645
integer y = 16
integer width = 2021
integer height = 1428
integer taborder = 30
string dataobject = "d_pfcsecurity_templateupdate"
boolean hscrollbar = true
end type

event retrievestart;call u_dw::retrievestart;return 2 // append data
end event

event getfocus;call u_dw::getfocus;// keep track of who had focus last
idrg_prevobj = this
end event

event pfc_prermbmenu;call super::pfc_prermbmenu;// Set up the PopUp Menu.
am_dw.m_table.m_insert.visible = False
am_dw.m_table.m_addrow.visible = False

end event

type st_bar from u_st_splitbar within w_pfcsecurity_templatemgmt
integer x = 635
integer y = 20
integer width = 9
integer height = 1420
end type

type tv_apps from u_tvs within w_pfcsecurity_templatemgmt
integer x = 9
integer y = 16
integer width = 622
integer height = 1428
integer taborder = 20
boolean bringtotop = true
boolean linesatroot = true
string picturename[] = {"Application5!","Application!","ArrangeTables5!","SelectObject!"}
end type

event constructor;of_setlevelsource(true)
of_setupdateable(false)
of_setrmbmenu(false)
end event

event getfocus;call super::getfocus;// keep track of who had focus last
idrg_prevobj = this
end event

event selectionchanged;// keep track of the current application and window
Integer	li_RC
long		ll_row, ll_parenthandle
string	ls_filter
TreeViewItem	ltvi_This
n_ds		lds_obj

this.GetItem(newhandle, ltvi_This)
choose case ltvi_this.level 
	case 1
		is_window = ''
		ls_filter = "application =  '"+ is_app + "' and window = '"+is_window+"'"
		if dw_windows.setfilter(ls_filter) < 1 then
			messagebox('Selectionchanging', ls_filter)
			return
		end if
		dw_windows.filter()
	case 2
		ll_parenthandle = this.finditem ( parenttreeitem!, newhandle )
		inv_levelsource.of_GetdataRow(ll_parenthandle, lds_obj, ll_row)
		is_app = lds_obj.object.application[ll_row]
		is_window = ltvi_this.label
		ls_filter = "application =  '"+ is_app + "' and window = '"+is_window+"'"
		if dw_windows.setfilter(ls_filter) < 1 then
			messagebox('Selectionchanging', ls_filter)
			return
		end if
		dw_windows.filter()
		if dw_windows.rowcount() = 0 then
			li_rc = dw_windows.retrieve(is_app, is_window)
		end if
end choose



end event

event pfc_retrieve;call super::pfc_retrieve;any		la_args[20]
integer	li_level

if isvalid(inv_levelsource) then
	li_level = of_getnextlevel(al_parent)
	inv_levelsource.of_getargs(al_parent, li_level, la_args)
end if

return this.of_retrieve(al_parent, la_args, ads_data)
end event

event pfc_preinsertitem;call super::pfc_preinsertitem;// change the picture based on the object type
If atvi_item.level = 2 Then
	//
end if
	
end event


HA$PBExportHeader$w_examplemain.srw
$PBExportComments$Sheet contains tree view listing the PFC examples.
forward
global type w_examplemain from w_frame
end type
type lv_1 from u_lvs within w_examplemain
end type
type st_1 from statictext within w_examplemain
end type
type st_2 from statictext within w_examplemain
end type
type tv_1 from u_tvs within w_examplemain
end type
type st_v1 from u_st_splitbar within w_examplemain
end type
end forward

global type w_examplemain from w_frame
integer x = 14
integer y = 4
integer width = 2587
integer height = 1552
string title = "PFC Examples Application"
string menuname = "m_examplemain"
windowstate windowstate = maximized!
event ue_printtree ( )
event ue_statusbarclicked ( integer ai_xpos,  integer ai_ypos,  string as_name )
event ue_statusbarrbuttonup ( integer ai_xpos,  integer ai_ypos,  string as_name )
event type integer ue_notify ( string as_object,  string as_action )
lv_1 lv_1
st_1 st_1
st_2 st_2
tv_1 tv_1
st_v1 st_v1
end type
global w_examplemain w_examplemain

type variables
Public:
//integer              ii_exampleid
//integer              ii_rightclickedmode
//long                  il_selecteditemhandle
menu                im_debugservices
menu                im_sqlspyservices
menu                im_debuglogwindow
menu                im_sqlspywindow
menu                im_utilpref

n_cst_menu     inv_menu
n_cst_explorerattrib	inv_explorerattrib

Protected:
string	is_mrukey = "pfc examples"
string	is_mruexampleclassname // classname of the example opened by pfc_open
string	is_mruexampletitle	// title of the example opened
end variables

forward prototypes
public function integer of_openexample (window aw_window, n_cst_mruattrib anv_mruattrib)
end prototypes

event ue_printtree;call super::ue_printtree;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		ue_printtree
//
//	Arguments:	None
//
//	Returns:		None
//
//	Description:
//	Prints the tree view.
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

If IsValid(tv_1.inv_print) Then
	tv_1.inv_print.of_PrintTree()
End If
end event

event ue_statusbarclicked;choose case as_name
	case "debugsrv"
		im_debugservices.Event clicked()
	case "sqlspysrv"
		im_sqlspyservices.Event clicked()
	case "debuglogwin"
		im_debuglogwindow.Event clicked()
	case "sqlspywin"
		im_sqlspywindow.Event clicked()
end choose
end event

event ue_statusbarrbuttonup;integer	li_rc
integer	li_x
integer	li_y
m_utilityproperties	lm_popmenu

li_x = Pointerx()
li_y = Pointery()
lm_popmenu = create m_utilityproperties
if as_name = "debugsrv" or as_name = "sqlspysrv" &
	or as_name = "debuglogwin" or as_name = "sqlspywin" then
		lm_popmenu.m_table.PopMenu(li_x, li_y)
end if
end event

event ue_notify;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		ue_notify
//
//	Arguments:	
//	as_object
//	as_action
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Called by others to notify the mainwindow of events which affect it.
//////////////////////////////////////////////////////////////////////////////

string	ls_id
string	ls_bitmap

// Get the id.
ls_id = as_object

Choose Case ls_id
	Case 'debugsrv'		
		choose case as_action
			case "open"
				im_debugservices.text = "Stop Debug Services"
				ls_bitmap = 'dbsvc.bmp'
			case "close"
				im_debugservices.text = "Start Debug Services"

				ls_bitmap = 'dbsvcoff.bmp'		
		end choose

	Case 'sqlspysrv'
		choose case as_action
			case "open"
				im_sqlspyservices.text = "Stop SQL Spy Services"
				ls_bitmap = 'sspysvcs.bmp'
			case "close"
				im_sqlspyservices.text = "Start SQL Spy Services"
				ls_bitmap = 'sssvcoff.bmp'		
		end choose

	Case 'debuglogwin'
		choose case as_action
			case "open"
				im_debuglogwindow.text = "Close Debug Log Window"
				ls_bitmap = 'dblogwin.bmp'

			case "close"
				im_debuglogwindow.text = "Open Debug Log Window"
				ls_bitmap = 'dlgwnoff.bmp'
		end choose		
		
	Case 'sqlspywin'		
		choose case Lower(as_action)
			case "open"
				im_sqlspywindow.text = "Close SQL Spy Window"
				ls_bitmap = 'sspywin.bmp'		
			case "close"
				im_sqlspywindow.text = "Open SQL Spy Window"
				ls_bitmap = 'sswinoff.bmp'
		end choose
		
End Choose

If Len(ls_id) > 0 And Len(ls_bitmap) > 0 Then
	if IsValid(inv_statusbar) then
		inv_statusbar.of_Modify(ls_id, ls_bitmap)
	end if		
End If	

return 1
end event

public function integer of_openexample (window aw_window, n_cst_mruattrib anv_mruattrib);w_master			lw_window


OpenWithParm(lw_window, anv_mruattrib.is_menuitemkey, anv_mruattrib.is_classname)

Return 1
end function

on w_examplemain.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_examplemain" then this.MenuID = create m_examplemain
this.lv_1=create lv_1
this.st_1=create st_1
this.st_2=create st_2
this.tv_1=create tv_1
this.st_v1=create st_v1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lv_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.tv_1
this.Control[iCurrent+5]=this.st_v1
end on

on w_examplemain.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.lv_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.tv_1)
destroy(this.st_v1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:	open
//
//	Description:
//	Initialize the window and all of its controls.
//
//////////////////////////////////////////////////////////////////////////////
//	
//////////////////////////////////////////////////////////////////////////////

integer	li_rc
m_examplemain	lm_examplemenu

setpointer(hourglass!)

// Close query processing is not needed for this window.
ib_disableclosequery = true

// let the menu know what objects it needs
lm_examplemenu = this.menuid
lm_examplemenu.of_setwindow(this)
lm_examplemenu.of_setlistview(lv_1)
lm_examplemenu.of_settreeview(tv_1)
lm_examplemenu.of_GetListViewStyle()

// Initialize the utility menu references.
inv_menu.of_GetMenuReference(this.menuid, "m_debugservices", im_debugservices)
inv_menu.of_GetMenuReference(this.menuid, "m_sqlspyservices", im_sqlspyservices)
inv_menu.of_GetMenuReference(this.menuid, "m_sqlspy", im_sqlspywindow)
inv_menu.of_GetMenuReference(this.menuid, "m_debuglog", im_debuglogwindow)
inv_menu.of_GetMenuReference(this.menuid, "m_utilitypreferences", im_utilpref)

// set up treeview datasource for level 1
li_rc = tv_1.inv_levelsource.of_Register(1, "category_name", "", "d_toplevel", SQLCA, "")
// set the pictures for level 1 to a picture index on the control
tv_1.inv_levelsource.of_SetPictureColumn(1, "1")
tv_1.inv_levelsource.of_setselectedpicturecolumn(1, "1")

// set up treeview datasource for level 2
li_rc = tv_1.inv_levelsource.of_Register(2, "category_name", ":parent.1.category_id", "d_maincategorylist",	SQLCA, "")
// set the pictures for level 2 to a database column holding the control indexes
tv_1.inv_levelsource.of_setpicturecolumn(2, "picture_idx")
tv_1.inv_levelsource.of_setselectedpicturecolumn(2, "selected_picture_idx")

// set up treeview datasource for level 2
li_rc = tv_1.inv_levelsource.of_Register(3, "category_name", ":parent.1.category_id", "d_catexamples",	SQLCA, "")
// set the pictures for level 2 to a database column holding the control indexes
tv_1.inv_levelsource.of_setpicturecolumn(3, "picture_idx")
tv_1.inv_levelsource.of_setselectedpicturecolumn(3, "selected_picture_idx")
tv_1.inv_levelsource.of_setstatepicturecolumn(3, "state_picture_idx")
tv_1.inv_levelsource.of_setoverlaypicturecolumn(3, "overlay_picture_idx")
end event

event pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  preopen
//
//	Description:
// Enable the status bar and register controls with the window's resize service
// prior to the opening of the window.
//
//////////////////////////////////////////////////////////////////////////////
//	
//////////////////////////////////////////////////////////////////////////////

// Register an id with MRU service.  All examples opened from this window will use this id
If isvalid(gnv_app.inv_mru) Then
	gnv_app.inv_mru.of_Register(is_mrukey)
End If

// Set the frame window with the application manager.
gnv_app.of_SetFrame(w_examplemain)
gnv_app.of_SetMicrohelp(true)

// Enable the Status Bar Services
of_SetStatusBar(true)
if IsValid(inv_statusbar) then
	inv_statusbar.of_SetBorderType(0)
	inv_statusbar.of_SetGapWidth(40)
	inv_statusbar.of_Register('debugsrv', 'bitmap', 'dbsvc.bmp', 80)
	inv_statusbar.of_Register('sqlspysrv', 'bitmap', 'sssvcoff.bmp', 80)
	inv_statusbar.of_Register('debuglogwin', 'bitmap', 'dlgwnoff.bmp', 80)
	inv_statusbar.of_Register('sqlspywin', 'bitmap', 'sswinoff.bmp', 80)
	if gnv_app.ienv_object.Win16 then
		inv_statusbar.of_SetGDI(true)
		inv_statusbar.of_SetUser(true)
	end if
	inv_statusbar.of_SetTimer(true)
end if

// Start the Resize Service.
of_SetResize(true)

// Set the minimum size of the window object.
inv_resize.of_SetMinSize(1477, 920)

// Register each control, specifying which style of behavior it should 
// follow when the window resizes.
inv_resize.of_Register(tv_1, 0, 0, 50, 100)
inv_resize.of_Register(lv_1, 50, 0, 50, 100)
inv_resize.of_Register(st_1, 50, 0, 50, 0)
inv_resize.of_Register(st_2, 0, 0, 50, 0)
inv_resize.of_Register(st_v1, 50, 0, 0, 100 )
end event

event pfc_postopen;call super::pfc_postopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_postopen
//
//	Arguments:  none
//
//	Returns:  none
//
//	Description:  Post Open functionality.
//
//////////////////////////////////////////////////////////////////////////////
//	
//////////////////////////////////////////////////////////////////////////////

integer	li_rc
long		ll_itemhandle, ll_leveltwoitemhandle

setpointer(hourglass!)

this.setredraw(false)

// Retrieve level one on the treeview.
li_rc = tv_1.event pfc_populate(0) 

// Populate the dual datasource for level one of the treeview.
ll_itemhandle = tv_1.inv_base.of_FindFirstItemLevel(1, 0)

// Populate level two of the treeview, and start the window with the first
// item on level two selected.
tv_1.SelectItem(ll_itemhandle)
tv_1.ExpandItem(ll_itemhandle)

this.SetRedraw(true)
end event

event pfc_open;w_master		lw_window
n_cst_mruattrib	lnv_mruattrib

SetPointer(hourglass!)

// see if the powerobject is what we are expecting
If IsValid(message.powerobjectparm) Then
	if lnv_mruattrib.classname() = message.powerobjectparm.classname() Then
		lnv_mruattrib = message.powerobjectparm
	Else
		Return
	End If
Else
	Return
End IF

// set up some mru information
is_mruexampleclassname = lnv_mruattrib.is_classname
is_mruexampletitle = lnv_mruattrib.is_menuitemname
this.event pfc_mrusave()

// open the selected window
OpenWithParm(lw_window, lnv_mruattrib.is_menuitemkey, lnv_mruattrib.is_classname)
end event

event pfc_mrurestore;call super::pfc_mrurestore;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_mrurestore
//
//	Arguments:	none
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Allow MRU service to restore settings
//
//////////////////////////////////////////////////////////////////////////////
//	
//////////////////////////////////////////////////////////////////////////////

// Allow MRU service to restore settings if necessary
If IsValid(gnv_app.inv_mru) Then
	Return gnv_app.inv_mru.of_Restore( is_mrukey , This ) 
End If

Return -1
end event

event pfc_premrusave;call super::pfc_premrusave;//////////////////////////////////////////////////////////////////////////////
// 
//	Event:		pfc_premrusave
//
//	Arguments:
//	anv_mruattrib	The MRU attrib object, passed by reference.
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Initialize the passed in attribute object.  
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

string ls_classname
string ls_title

ls_classname = is_mruexampleclassname
ls_title = is_mruexampletitle

// Be sure that none of these values is set to an empty string.
if ls_classname = "" or ls_title = "" then
	return -1
else
	anv_mruattrib.is_id = is_mrukey
	anv_mruattrib.is_classname = ls_classname
	anv_mruattrib.is_menuitemname = ls_title
	anv_mruattrib.is_menuitemkey = ls_classname
	anv_mruattrib.is_menuitemmhelp = "Opens " + ls_title
end if

return 1
end event

event pfc_mruprocess;call super::pfc_mruprocess;//////////////////////////////////////////////////////////////////////////////
// 
//	Event:		pfc_mruprocess
//
//	Arguments:
//	ai_row	row in datastore that we need to pull information from
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Perform the process needed when a user clicks on an MRU item in the menu.  
// The developer will have to extend/override this event depending on what is needed
// by the application.  
//
//////////////////////////////////////////////////////////////////////////////
//	
//////////////////////////////////////////////////////////////////////////////

n_cst_mruattrib	lnv_mruattrib

// check parameters
if IsNull(ai_row) or (ai_row < 1) then
	return -1
end if

if not IsValid(gnv_app.inv_mru) or IsNull(gnv_app.inv_mru) then
	return -1
end if

// Retrieve row from datastore.
gnv_app.inv_mru.of_GetItem(ai_row, lnv_mruattrib)

// SDI Process - open the selected MRU item
message.powerobjectparm = lnv_mruattrib
this.event pfc_open()

return 1
end event

event pfc_help;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_help
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	 0 = helpfile property of the application manager not specified
//	-1 = error
//
//	Description:
//	Call the windows help file associated with the application.
//	Uses the HelpType property of this window to determine what help
//	to display.
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

// override to check for help file existance
Long		ll_helptypeid
String	ls_helpfile
String	ls_helptypeid

ls_helpfile = gnv_app.of_GetHelpFile()
If Not FileExists(ls_helpfile) Then
	Return -1	
End If

If Len (Trim (ls_helpfile)) > 0 Then
	If Lower (ClassName (ia_helptypeid)) = 'long' Then
		ll_helptypeid = ia_helptypeid
		Return ShowHelp (ls_helpfile, Topic! , ll_helptypeid)
	ElseIf Lower (ClassName (ia_helptypeid)) = 'string' Then
		ls_helptypeid = ia_helptypeid
		Return ShowHelp (ls_helpfile, Keyword!, ls_helptypeid)
	Else
		Return ShowHelp (ls_helpfile, Index!)
	End If
End If

If IsValid(gnv_app.inv_debug) Then		
	of_MessageBox ("pfc_master_helpdebug", "PowerBuilder Class Library", "Help has been requested but the"+&
					" Required Help File Name has Not been Set.  Use of_SetHelpFile"+&
					" on The Application Manager to Set The attribute.", &
					Exclamation!, OK!, 1)
End If
				
Return 0
end event

type lv_1 from u_lvs within w_examplemain
event type integer ue_selectionchange ( n_cst_explorerattrib anv_explorerattrib )
integer x = 1280
integer y = 232
integer width = 1211
integer height = 968
integer taborder = 10
long backcolor = 1090519039
boolean autoarrange = true
string largepicturename[] = {"Preferences!","Custom059!","Library5!","lgopen.bmp","Window!","RunWindow!","Run!"}
string smallpicturename[] = {"Preferences!","Custom059!","Library5!","selcatgy.bmp","Window!","RunWindow!","Run!"}
string statepicturename[] = {"new.bmp","hot.bmp"}
long statepicturemaskcolor = 16777215
end type

event ue_selectionchange;call super::ue_selectionchange;//////////////////////////////////////////////////////////////////////////////
//
//	Event: 		ue_SelectionChange
//
//	Argument:	
//	anv_explorerattrib	Attribute object containing properties about what selection
//									is changing
//
//	Returns:		Integer
//  1 = success
// -1 = error
//
//	Description:	Receives notice that a selection is changing on the object this
//						control is associated with.  Process information accordingly
//
//////////////////////////////////////////////////////////////////////////////

// set internal attributes to be used in other places scripts/functions
inv_explorerattrib = anv_explorerattrib

// Delete all columns from the list view control.  This is done for the "detail" view.
inv_datasource.of_UnRegisterReportColumn()

this.event pfc_populate()

SetMicrohelp(String( this.totalitems() ) + " Object(s).")

Return 1
end event

event doubleclicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	doubleclicked
//
//	Description:
//	Scrolls to the selected item's corresponding treeviewitem, or launches an
// example.
//
//////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////

integer		 	li_level
long			 	ll_currenttvitem, ll_lvrow, ll_selectedtreehandle
string			ls_lvlabel, ls_windowname
listviewitem 	llvi_selectedlvitem
treeviewitem 	ltvi_newtreeitem, ltvi_startingtreeitem
n_ds			 	lds_lvdatastore
n_cst_mruattrib	lnv_mruattrib

// Get the listview item that was doubleclicked.
this.GetItem(index, llvi_selectedlvitem)
ls_lvlabel = llvi_selectedlvitem.label

// Determine which treeview item is currently selected and get it
ll_currenttvitem = tv_1.FindItem(currenttreeitem!, 0)
tv_1.GetItem(ll_currenttvitem, ltvi_startingtreeitem)

// Set a local variable to the level of the currently selected treeview item.
li_level = ltvi_startingtreeitem.level

// Determine if a runtime example was selected from the listview. 
// These will only be launching from level 3 of the tree
If li_level = 3 Then
	this.inv_datasource.of_GetDataRow(index, lds_lvdatastore, ll_lvrow)
	If ll_lvrow > 0 Then
		lnv_mruattrib.is_classname = lds_lvdatastore.GetItemString(ll_lvrow, "window")
		lnv_mruattrib.is_menuitemname = lds_lvdatastore.GetItemString(ll_lvrow, "title")
		lnv_mruattrib.is_menuitemkey = ""
		message.powerobjectparm = lnv_mruattrib
		parent.event pfc_open()
		return
	Else
		Messagebox("Database Error", "Cannot find the selected row for example.", stopsign!)
		Return
	End If
End If
	
// If the double clicked item was not a runtime example item...

// Determine if the currently selected treeview item has been expanded.  
// If it hasn't, expand it. (expanding also populates)
// This loads the treeview with the listview information
if ltvi_startingtreeitem.expanded = false then
	tv_1.ExpandItem(ll_currenttvitem)
end if

// Get the handle of the treeview item that corresponds to the list view item that was doubleclicked.
ll_selectedtreehandle = tv_1.inv_base.of_FindItem("label", ls_lvlabel, ll_currenttvitem,&
	(li_level + 1), true, true)

// Get the state information of the treeview item that corresponds to the list view item that was doubleclicked.
tv_1.GetItem(ll_selectedtreehandle, ltvi_newtreeitem)

// Select and Expand the selected treeview item.
if ltvi_newtreeitem.expanded = false then
	tv_1.SelectItem(ll_selectedtreehandle)
	tv_1.ExpandItem(ll_selectedtreehandle)
end if
end event

event rbuttonup;call super::rbuttonup;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	rbuttonup
//
//	Description:
//	Scrolls to the selected item's corresponding treeviewitem, or launches an
// example.
//
//////////////////////////////////////////////////////////////////////////////
//	
//////////////////////////////////////////////////////////////////////////////
//m_examplemain	lm_menu
//
//lm_menu = parent.menuid
//lm_menu.of_SetListViewStyle(this)
end event

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:	Constructor
//
//	Description:	Turn on the listview services
//
//////////////////////////////////////////////////////////////////////////////
//	
//////////////////////////////////////////////////////////////////////////////
integer	li_index

of_setbase(true)
of_setdatasource(true)
of_setsort(true)

// set the picturemask color to white because that is the background color of the bmp
this.statepicturemaskcolor = RGB(255, 255, 255) //White!
li_index = this.addstatepicture("new.bmp")
end event

event pfc_populate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_populate
//
//	Arguments:	none
//
//	Returns:		Long
//			 # of items added to the listview
//			-1 = error
//
//	Description:
//	retrieves the datasource and uses it to load the listview with data
//
//////////////////////////////////////////////////////////////////////////////
//	
//	override ancestor script
//
//////////////////////////////////////////////////////////////////////////////
integer	li_rc
long		ll_level
string	ls_label
n_ds		lds_data

Setpointer(hourglass!)

// Set the listview source based on the treeview level information
ll_level = inv_explorerattrib.itvi_selecteditem.Level
ls_label = inv_explorerattrib.itvi_selecteditem.Label

choose case ll_level
	case 1
		inv_datasource.of_Register("category_name", "d_maincategorylist", SQLCA )
		inv_datasource.of_SetPictureColumn("picture_idx")
		inv_datasource.of_SetStatePictureColumn("overlay_picture_idx")
//		inv_datasource.of_SetOverlayPictureColumn("overlay_picture_idx")
	case 2
		inv_datasource.of_Register("category_name", "d_catexamples", SQLCA )
		inv_datasource.of_SetPictureColumn("picture_idx")
		inv_datasource.of_SetStatePictureColumn("overlay_picture_idx")
//		inv_datasource.of_SetOverlayPictureColumn("overlay_picture_idx")
	case 3
		inv_datasource.of_Register("example", "d_windows", SQLCA )
		inv_datasource.of_SetPictureColumn("7")
		inv_datasource.of_SetStatePictureColumn("overlay_picture_idx")
//		inv_datasource.of_SetOverlayPictureColumn("overlay_picture_idx")
end choose

// clear the listview
If this.DeleteItems() < 1 Then Return -1

// retrieve the data into the services datastore
If this.event pfc_retrieve(lds_data) < 0 Then Return -1

// add the retrieved rows to the listview
Return this.event pfc_addall(lds_data) 
end event

event pfc_retrieve;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_Retrieve
//
//	Arguments:	
//	ads_data		The datastore holding the rows to add to the treeview as items
//
//	Returns:		long
//			 number of items returned by the retrieve
//			-1 = error
//
//	Description:
//	Return the number of rows placed in the data source
//
//	Extend this event to populate the retrieval arguments and then call the of_retrieve()
//		function.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	override ancestor script
//
//////////////////////////////////////////////////////////////////////////////
long					ll_level, ll_row
string				ls_ostype
any					la_args[20]
n_cst_conversion	lnv_conversion

// Get the state information for the selected treeview item.
ll_level = inv_explorerattrib.itvi_selecteditem.Level
ll_row = inv_explorerattrib.il_datastorerow

choose case ll_level
	case 1
		la_args[1] = inv_explorerattrib.ids_datastore.inv_base.of_GetItemAny(ll_row, "category_id")
	case 2
		la_args[1] = inv_explorerattrib.ids_datastore.inv_base.of_GetItemAny(ll_row, "category_id")
		ls_ostype = lnv_conversion.of_String(gnv_app.ienv_object.ostype)
		if ls_ostype = "windowsnt" then ls_ostype = "winnt"
		la_args[2] = lower("%" + ls_ostype + "%")
	case 3
		la_args[1] = inv_explorerattrib.ids_datastore.inv_base.of_GetItemAny(ll_row, "example_id")
end choose

// original code
Return of_retrieve(la_args, ads_data)
end event

type st_1 from statictext within w_examplemain
integer x = 1280
integer y = 140
integer width = 1211
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 77633680
string text = "Contents of "
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_examplemain
integer x = 37
integer y = 140
integer width = 1211
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 77633680
string text = "All Folders"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type tv_1 from u_tvs within w_examplemain
event type integer ue_selectionchange ( long al_oldhandle,  long al_newhandle )
integer x = 37
integer y = 232
integer width = 1211
integer height = 968
integer taborder = 20
long backcolor = 1090519039
boolean linesatroot = true
boolean hideselection = false
string picturename[] = {"Preferences!","Custom059!","Library5!","selcatgy.bmp","Window!","RunWindow!"}
end type

event ue_selectionchange;call super::ue_selectionchange;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  ue_SelectionChange
//
//	Arguments:	
//	al_oldhandle	The handle of the item which was previously selected
//	al_newhandle	The handle of the item which is now selected
//
//	Returns:		Integer
//					 1 = success
//					 0 = no action
//					-1 = failure
//
//	Description:	Pass the selectionchanging event information to the associated
//						object so it knows selection is changing and what is happening

//
//////////////////////////////////////////////////////////////////////////////
//	
//////////////////////////////////////////////////////////////////////////////
Integer			li_rc
long				ll_row
treeviewitem	ltvi_selecteditem
n_ds				lds_datastore
n_cst_explorerattrib	lnv_explorerattrib

// Check Arguments
If (al_oldhandle < 0) or IsNull(al_oldhandle) Then Return -1
If (al_newhandle < 0) or IsNull(al_newhandle) then Return -1

//Get the state information for the selected treeview item.
If this.GetItem(al_newhandle, ltvi_selecteditem) < 1 Then Return -1

// get current datastore and row
If isvalid(inv_levelsource) then
	If inv_levelsource.of_GetDataRow(al_newhandle, lds_datastore, ll_row) < 1 Then Return -1
	If IsNull(ll_row) or IsNull(lds_datastore) or ll_row < 0 Then Return -1
	
	// populate the attribute object
	lnv_explorerattrib.itvi_selecteditem = ltvi_selecteditem
	lnv_explorerattrib.ids_datastore = lds_datastore
	lnv_explorerattrib.il_datastorerow = ll_row
	lnv_explorerattrib.il_selectedhandle = al_newhandle
Else
	Return -1
End If

// call the associated objects event
Return lv_1.event ue_selectionchange(lnv_explorerattrib)
end event

event selectionchanging;call super::selectionchanging;///////////////////////////////////////////////////////////////////////////////////////////
//
//	Event:  selectionchanging
//
//	Arguments:
//	oldhandle   the handle of the item that was selected until the selection was changed.
// newhandle	the handle of the item that is currently selected, now that the selection has changed.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	This event populates the list view, then triggers the ItemPopulate event on the Treeview.
//
//////////////////////////////////////////////////////////////////////////////
//	
//////////////////////////////////////////////////////////////////////////////

treeviewitem 	ltvi_selecteditem

// Get the state information for the selected treeview item.
GetItem(newhandle, ltvi_selecteditem)

if ltvi_selecteditem.label <> "" then
	st_1.text = "Contents of " + "'" + ltvi_selecteditem.label + "'"
	parent.title = "PFC Code Examples Application - " + ltvi_selecteditem.label
end if
end event

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Sets the overlay picture indexes to the overlay picture array.
//
//////////////////////////////////////////////////////////////////////////////
//	
//////////////////////////////////////////////////////////////////////////////
integer		li_index

of_setbase(true)
of_setprint(true)
of_setlevelsource(true)

// set the picturemask color to white because that is the background color of the bmp
this.picturemaskcolor = RGB(255, 255, 255) //White!
li_index = this.addpicture("new.bmp")

// add the picture index to the first overplay picture array location
this.SetOverlayPicture(1, li_index)
end event

event pfc_populate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_Populate
//
//	Arguments:	
//	al_parent	The handle to the Treeview item to place retrieved data under
//
//	Returns:		Long
//			 # of items treeview was populated with
//			 0 if nothing was populated
//			-1 = error
//
//	Description:
//	retrieves the datasource and uses it to load the treeview with data
//
//////////////////////////////////////////////////////////////////////////////
//	
//	overriding ancestor script
//
//////////////////////////////////////////////////////////////////////////////
treeviewitem		ltvi_selecteditem
n_ds					lds_data

// check arguments
IF (al_parent < 0) or IsNull(al_parent) then Return -1

Setpointer(hourglass!)

if this.GetItem(al_parent, ltvi_selecteditem) <> 1 then 
	// if first time populating we want to continue to populate

	If al_parent <> 0 Then
		return -1
	End If
End If

// This tree view has 3 levels.  We do not need to populate the 
// level 2 children in the tree view.  (We will put level 3 in the list view however.)
if ltvi_selecteditem.level > 2 then
	return 0
end if

// retrieve the data into the services datastore
IF this.event pfc_retrieve(al_parent, lds_data) < 0 Then Return -1

// add the treeview data
Return this.event pfc_AddAll(al_parent, lds_data) 
end event

event pfc_retrieve;call super::pfc_retrieve;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_Retrieve
//
//	Arguments:	
//	al_parent	The handle to the Treeview item to place retrieved data under
//	ads_data		The datastore holding the rows to add to the treeview as items
//						passed by reference
//
//	Returns:		long
//			 number of items returned by the retrieve
//			-1 = error
//
//	Description:
//	Return the number of rows placed in the data source.
//
//////////////////////////////////////////////////////////////////////////////
Any				la_args[20]
Integer			li_nextlevel, li_level
string			ls_ostype
treeviewitem	ltvi_item
n_cst_conversion	lnv_conversion

// Check Arguments
If (al_parent < 0) or IsNull(al_parent) Then Return -1

this.getitem(al_parent, ltvi_item)

li_nextlevel = of_GetNextLevel(al_parent)
If li_nextlevel < 1 then Return -1

If isvalid(inv_levelsource) then
	// if populating the first level (parent = 0), retrieval arguments will not be returned
	// Extend the event to populate arguments for level 1
	inv_levelsource.of_getargs(al_Parent, li_nextLevel, la_Args)
End If

// If the level you are populating requires even one retrieval argument that
// is not based on previous levels, you must add the arguments manually into the
// 20 element locally defined array of type any
li_level = ltvi_item.level
if li_level = 2 then
	ls_ostype = lnv_conversion.of_String(gnv_app.ienv_object.ostype)
	if ls_ostype = "windowsnt" then ls_ostype = "winnt"
	la_args[2] = lower("%" + ls_ostype + "%")
end if

// retrieve the rows into the datasource
Return of_retrieve(al_parent, la_args, ads_data)
end event

event selectionchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  SelectionChanged
//
//	Description:	Occurs when a treeview item is clicked and has changed.
//						Notify associated object that the selection has changed
//
//////////////////////////////////////////////////////////////////////////////
//	
//////////////////////////////////////////////////////////////////////////////

// call the event to notify associated object selection is changing
this.event ue_selectionchange(oldhandle, newhandle)
end event

type st_v1 from u_st_splitbar within w_examplemain
integer x = 1248
integer y = 136
integer width = 27
integer height = 1060
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
// Initialize the splitbar and register surrounding window controls.
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

of_Register(tv_1, LEFT)
of_Register(lv_1, RIGHT)
of_Register(st_2, LEFT)
of_Register(st_1, RIGHT)
end event


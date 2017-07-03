HA$PBExportHeader$w_s_projectlist.srw
$PBExportComments$PEAT Project List Window
forward
global type w_s_projectlist from w_sheet
end type
type tv_project_list from u_tv within w_s_projectlist
end type
type lv_project_info from u_lv within w_s_projectlist
end type
end forward

global type w_s_projectlist from w_sheet
string title = "Project List"
string menuname = "m_peat_master"
string icon = "project.ico"
event peat_estimate ( )
event peat_actual ( )
event peat_analyzer ( )
event peat_report ( )
event peat_properties ( )
event peat_delete ( )
tv_project_list tv_project_list
lv_project_info lv_project_info
end type
global w_s_projectlist w_s_projectlist

type variables
Private:
   long		il_projectid = 1
   string		is_projectname = "PEAT"
   n_ds 		ids_project
   n_cst_explorer 	inv_explorer
   string                     is_PrevLabel
end variables

forward prototypes
public function string of_getprojectname ()
public function integer of_refresh ()
public subroutine of_setexplorer (boolean ab_switch)
public subroutine of_setlistview (treeviewitem atvi_old, treeviewitem atvi_new)
public function long of_getprojectid ()
public function integer of_addnewproject (string as_name)
end prototypes

event peat_estimate;call w_sheet::peat_estimate;OpenWithParm(w_r_estimates, il_ProjectId)
end event

event peat_actual;call w_sheet::peat_actual;OpenWithParm(w_r_actuals, il_ProjectId)
end event

event peat_analyzer;call w_sheet::peat_analyzer;OpenWithParm(w_r_analyzer, il_ProjectId)
end event

event peat_report;call w_sheet::peat_report;OpenWithParm(w_r_ProjectReport, il_projectID)
end event

event peat_properties;call super::peat_properties;OpenWithParm(w_r_projectwizard, il_ProjectId)
end event

event peat_delete;call super::peat_delete;
long				ll_handle
string			ls_label
treeviewitem	ltv_local


// Get the current item so you can get the label of the project
ll_handle = tv_project_list.FindItem(CurrentTreeItem!, 0)
tv_project_list.GetItem(ll_handle, ltv_local)
ls_label = ltv_local.label

IF ltv_local.level <> 1 THEN
	gnv_app.inv_error.of_message(gnv_app.iapp_object.DisplayName, + &
			"Only projects can be deleted from this window.  Categories " + &
			"and derived items can be deleted from the 'Project Information' " +&
			"window.", Information!, OK!)
	Return
END IF
			
// Verify the delete, and then delete the project.  This will do a cascade
// delete on the dependent rows.
IF gnv_app.inv_error.of_message(gnv_app.iapp_object.DisplayName, + &
			"Deleting project '" + ls_label + "' will remove all information " + &
			"associated with the project. Do you wish to continue?", &
			Exclamation!, YesNo!, 2) = 1 THEN
		
		DELETE FROM "project" WHERE "project"."project_id" = :il_projectID;
		IF SQLCA.SQLCode = 0 THEN
			SQLCA.of_Commit()
			
			// Get the next item in the tree and delete the current one
			ll_handle = tv_project_list.FindItem(CurrentTreeItem!, 0)
			tv_project_list.SelectItem(tv_project_list.FindItem(NextVisibleTreeItem!, 0))
			tv_project_list.DeleteItem(ll_handle)
		ELSE
			SQLCA.of_Rollback()
		END IF
END IF
end event

public function string of_getprojectname ();Return is_ProjectName
end function

public function integer of_refresh ();// This function will refresh the project information when it has changed on any of
// the dialog boxes

long	ll_handle

// Refressh the project information)
tv_project_list.of_RefreshLevel(1)
tv_project_list.of_RefreshLevel(2)
lv_project_info.of_Refresh()

// Select the project that was being worked on and expand it
ll_handle = tv_project_list.FindItem(CurrentTreeItem!, 0)
tv_project_list.SelectItem(ll_handle)
tv_project_list.ExpandItem(ll_handle)

// Trigger the SelectionChanged event so the new values will be displayed
tv_project_list.Event SelectionChanged(0,ll_handle)

Return 0
end function

public subroutine of_setexplorer (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			of_SetExplorer
//
//	(Arguments:
//	ab_switch		TRUE  - Start (create) the service
// 					FALSE - Stop (destroy ) the service
//
//	(Returns:  		None)
//
//	Description:  Starts or stops the Windows Explorer Services.
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
IF ab_Switch THEN
	IF Not IsValid (inv_explorer) THEN
		inv_explorer = Create n_cst_explorer
		inv_explorer.dynamic of_SetRequestor ( this )
	END IF
ELSE 
	IF IsValid (inv_explorer) THEN
		Destroy inv_explorer
	END IF	
END IF

RETURN

end subroutine

public subroutine of_setlistview (treeviewitem atvi_old, treeviewitem atvi_new);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetListView
//
//	Access:  		public
//
//	Arguments:
//	atvi_old			The handle to the old TreeViewItem
// atvi_new			The handle to the new TreeViewItem
//	
//	Returns:  		None
//	Description: 	This function sets up the ListView with the proper
//						columns and datasource.  The logic for this is done
//						basically by the Level of the TreeViewItem.  However, 
//						the "derived items" are treated slightly differently.
//////////////////////////////////////////////////////////////////////////////

INTEGER li_rc1

SetPointer(HourGlass!)

// Is this a different Level, or can I keep the same columns and just
// populate them with different data?
IF atvi_new.level = atvi_old.level THEN
	IF atvi_new.level <> 2 THEN
		RETURN
	END IF
	IF atvi_new.label <> 'Derived Items' AND atvi_old.label <> 'Derived Items' THEN
		RETURN
	END IF
END IF

// Refresh the ListView so that there are no columns.
lv_project_info.DeleteColumns()


// Based upon the Level...
CHOOSE CASE atvi_new.level
		CASE 1
			// when a Project is selected, set up the following columns
			// in the Listview, and use the proper datasource.
			li_rc1 = lv_project_info.of_SetDatasource( "d_ds_ProjectSummary", SQLCA, "name", "1")
			li_rc1 = lv_project_info.of_addColumn("name","Category Name",Left!,750)
			li_rc1 = lv_project_info.of_addColumn("estimated_hours","Estimated Hours",Right!,450)
			li_rc1 = lv_project_info.of_addColumn("actual_hours","Actual Hours",Right!,350)
	CASE 2
		// when a Category Item is selected, set up the following columns
		// in the Listview, and use the proper datasource.  If the Category
		// Item is a Derived Item, then use one set of columns and datasource.
		// Otherwise, use the default set of columns and datasource for
		// Category Items
		IF atvi_new.label <> 'Derived Items' THEN
			li_rc1 = lv_project_info.of_SetDatasource( "d_ds_CategorySummary", SQLCA, "name", "2")
			li_rc1 = lv_project_info.of_addColumn("name","Name",Left!,700)
			li_rc1 = lv_project_info.of_addColumn("estimated_hours","Est Hours",Right!,300)
			li_rc1 = lv_project_info.of_addColumn("actual_hours","Act Hours",Right!,300)
			li_rc1 = lv_project_info.of_addColumn("estimated_cost","Est Cost",Right!,300)
			li_rc1 = lv_project_info.of_addColumn("actual_cost","Act Cost",Right!,300)
		ELSE
			li_rc1 = lv_project_info.of_SetDatasource( "d_ds_DerivedSummary", SQLCA, "name", "2")
			li_rc1 = lv_project_info.of_addColumn("name","Name",Left!,700)
			li_rc1 = lv_project_info.of_addColumn("estimated_hours","Est Hours",Right!,300)
			li_rc1 = lv_project_info.of_addColumn("actual_hours","Act Hours",Right!,300)
			li_rc1 = lv_project_info.of_addColumn("estimated_cost","Est Cost",Right!,300)
			li_rc1 = lv_project_info.of_addColumn("actual_cost","Act Cost",Right!,300)
		END IF
END CHOOSE

end subroutine

public function long of_getprojectid ();Return il_ProjectId
end function

public function integer of_addnewproject (string as_name);long 				ll_ret, ll_handle
treeviewitem	ltv_local

//This function is called after a new project has been added to refresh
//the projects listed in the tree. 

this.SetRedraw(FALSE)
ll_ret = this.tv_project_list.of_discardchildren(0)
ll_ret = this.tv_project_list.of_InitialRetrieve()


ll_handle = tv_project_list.FindItem(FirstVisibleTreeItem!, 0)
DO WHILE ll_handle <> -1
	tv_project_list.GetItem(ll_handle, ltv_local)
	IF ltv_local.label = as_name THEN
		tv_project_list.SelectItem(ll_handle)
		tv_project_list.ExpandItem(ll_handle)
		EXIT
	ELSE
		ll_handle = tv_project_list.FindItem(NextTreeItem!, ll_handle)
	END IF
LOOP


this.SetRedraw(TRUE)

Return ll_ret
end function

on w_s_projectlist.create
int iCurrent
call super::create
if this.MenuName = "m_peat_master" then this.MenuID = create m_peat_master
this.tv_project_list=create tv_project_list
this.lv_project_info=create lv_project_info
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tv_project_list
this.Control[iCurrent+2]=this.lv_project_info
end on

on w_s_projectlist.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.tv_project_list)
destroy(this.lv_project_info)
end on

event pfc_postopen;call super::pfc_postopen;SetPointer(HourGlass!)

integer 	li_rc1

// Set the DataSource for each level in the TreeView.  Then, perform
// the initial retrieve.
li_rc1=tv_project_list.of_SetDatasource(1, "d_ds_projectList", SQLCA, "name", "",FALSE,1,1,1,1)
li_rc1=tv_project_list.of_SetDatasource(2, "d_ds_category", SQLCA, "name", ":parent.1.project_id",FALSE,2,2,2,2)
li_rc1=tv_project_list.of_InitialRetrieve()


// Select the first item by default.
IF li_rc1 > 0 THEN
	tv_project_list.SelectItem(1)
END IF
end event

event close;call super::close;this.of_setExplorer(FALSE)

end event

event open;call super::open;this.of_setExplorer(TRUE)
inv_Explorer.of_setControls(tv_project_list, lv_project_info)
end event

event resize;call w_sheet::resize;IF IsValid(inv_explorer) THEN
	inv_explorer.of_resize()
END IF
end event

type tv_project_list from u_tv within w_s_projectlist
integer y = 24
integer width = 905
long backcolor = 1090519039
boolean linesatroot = true
grsorttype sorttype = ascending!
string picturename[] = {"popen.bmp","iopen.bmp"}
long statepicturemaskcolor = 1090519039
end type

event selectionchanged;call super::selectionchanged;INTEGER 			li_rc1
LONG 				ll_row, ll_current
N_DS 				lds_current
TreeViewItem 	ltvi_new, ltvi_old
any 				la_any[20]


// Get handles to the actual TreeViewItems from the TreeView using the 
// Item number.
this.GetItem(newhandle,ltvi_new)
this.GetItem(oldhandle,ltvi_old)


//Setup the ListView with the proper columns and datasoruce for the 
//TreeViewItem that is selected. 
of_SetListView(ltvi_old,ltvi_new)


//Retrieve the data based upon the Level that was selected.
CHOOSE CASE ltvi_new.level
	CASE 1
		li_rc1=tv_project_list.of_GetDataRow(newhandle, lds_current, ll_row)
		IF li_rc1 > 0 THEN
			la_any[1] = lds_current.GetItemNumber(ll_row,"project_id")
			il_ProjectID = la_any[1]
			is_ProjectName = lds_current.GetItemString(ll_row,"name")
			li_rc1=lv_project_info.of_Populate(la_any)
		ELSE
			la_any[1] = 0
			li_rc1=lv_project_info.of_Populate(la_any)
		END IF
		
	CASE 2
		li_rc1=tv_project_list.of_GetDataRow(newhandle, lds_current, ll_row)
		IF li_rc1 > 0 THEN
			la_any[1] = lds_current.GetItemNumber(ll_row,"project_id")
			la_any[2] = lds_current.GetItemNumber(ll_row,"default_category_id")
			li_rc1=lv_project_info.of_Populate(la_any)
		ELSE
			la_any[1] = 0
			li_rc1=lv_project_info.of_Populate(la_any)
		END IF
	CASE ELSE
END CHOOSE
end event

type lv_project_info from u_lv within w_s_projectlist
integer x = 983
integer y = 32
integer taborder = 2
long textcolor = 33554432
long backcolor = 1090519039
listviewview view = listviewreport!
string largepicturename[] = {"iopen.bmp","object.bmp"}
string smallpicturename[] = {"iopen.bmp","object.bmp"}
end type


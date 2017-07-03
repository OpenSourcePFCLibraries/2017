HA$PBExportHeader$w_treeview6.srw
$PBExportComments$Example of linking a treeview with a datawindow
forward
global type w_treeview6 from w_main
end type
type dw_1 from u_dw within w_treeview6
end type
type tv_1 from u_tvs within w_treeview6
end type
end forward

global type w_treeview6 from w_main
integer width = 2638
integer height = 1152
string title = "PFC Example - Basic Treeview"
dw_1 dw_1
tv_1 tv_1
end type
global w_treeview6 w_treeview6

on w_treeview6.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.tv_1=create tv_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.tv_1
end on

on w_treeview6.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.tv_1)
end on

event open;call super::open;tv_1.of_SetLevelSource ( True )
tv_1.of_SetBase ( True ) 
tv_1.of_SetUpdateable ( True )

dw_1.of_SetBase ( True )
dw_1.of_SetTransObject ( SQLCA )
dw_1.of_SetUpdateable ( True )

/*  Register the tree levels to the datastore data,
	and establish level pictures */
tv_1.inv_levelsource.of_Register ( 1, "sales_regions_region", "", "d_region", SQLCA, "" )
tv_1.inv_levelsource.of_SetPictureColumn ( 1, "1" )
tv_1.inv_levelsource.of_SetSelectedPictureColumn ( 1, "7" )

tv_1.inv_levelsource.of_Register ( 2, "states_state_name", ":parent.1.sales_regions_region", "d_regionstate", SQLCA, "" )
tv_1.inv_levelsource.of_SetPictureColumn ( 2, "2" )
tv_1.inv_levelsource.of_SetSelectedPictureColumn ( 2, "7" )

tv_1.inv_levelsource.of_Register ( 3, "customer_company_name", ":parent.2.sales_regions_region, :parent.1.states_state_id", "d_regionstatecust", SQLCA, "" )														  
tv_1.inv_levelsource.of_SetPictureColumn ( 3, "3" )
tv_1.inv_levelsource.of_SetSelectedPictureColumn ( 3, "7" )

tv_1.inv_levelsource.of_Register ( 4, "employee_emp_lname", ":parent.1.customer_id", "d_regionstatecustrep", SQLCA, "" )
tv_1.inv_levelsource.of_SetPictureColumn ( 4, "4" )
tv_1.inv_levelsource.of_SetSelectedPictureColumn ( 4, "7" )

tv_1.inv_levelsource.of_Register ( 5, "order_id_string", ":parent.2.customer_id, :parent.1.employee_emp_id", "d_regionstatecustrepord", SQLCA, "" )											  
tv_1.inv_levelsource.of_SetPictureColumn ( 5, "5" )
tv_1.inv_levelsource.of_SetSelectedPictureColumn ( 5, "7" )

tv_1.inv_levelsource.of_Register ( 6, "product_description", ":parent.1.sales_order_id", "d_regionstatecustreporditm", SQLCA, "" )
tv_1.inv_levelsource.of_SetPictureColumn ( 6, "6" )
tv_1.inv_levelsource.of_SetSelectedPictureColumn ( 6, "7" )

/*  Retrieve the data and build the tree  */
tv_1.Event pfc_populate ( 0 )

/*  Select the first item */
tv_1.SelectItem ( tv_1.inv_base.of_FindFirstItemLevel ( 1, 0 ) )

tv_1.inv_levelsource.of_SetUpdateStyle ( 1 )
end event

type dw_1 from u_dw within w_treeview6
event ue_refreshview ( datastore ads_source,  long al_row )
integer x = 891
integer y = 4
integer width = 1335
integer height = 964
integer taborder = 20
end type

event ue_refreshview;If this.Event pfc_accepttext ( True ) <> 1 Then
	// Don't let selection change if accepttext fails
	Return
End If

this.Reset ( )
this.DataObject = ads_source.DataObject
this.of_SetTransObject ( SQLCA )
ads_source.RowsCopy ( al_row, al_row, Primary!, dw_1, 1, Primary! )
dw_1.ResetUpdate ( )
end event

type tv_1 from u_tvs within w_treeview6
event ue_update ( integer ai_level )
integer x = 14
integer y = 4
integer width = 859
integer height = 1020
integer taborder = 10
boolean linesatroot = true
string picturename[] = {"globals!","parameter!","library!","custom076!","scriptyes!","update!","custom050!"}
end type

event ue_update;integer		li_rc, li_msg
long			ll_handle, ll_row
n_ds			lds_source

// Check for any changes
li_rc = dw_1.event pfc_accepttext(True)
if li_rc <> 1 then return

li_rc = dw_1.event pfc_updatespending()
If li_rc = 0 Then
	// No changes, do not save
	Return 
Else
	// Changes are pending, prompt the user to determine if they should be saved
	li_msg = of_MessageBox ("pfc_updatetree_savechanges", gnv_app.iapp_object.DisplayName, &
				"Do you want to save changes?", exclamation!, YesNoCancel!, 1)
	If li_msg <> 1 Then
		Return
	end If
End If

dw_1.of_Update ( False, True ) 
end event

event pfc_retrieve;call super::pfc_retrieve;/*  Retrieve the level data  */
any la_args[20]
integer li_level

If	IsValid ( inv_levelsource ) Then
	li_level = of_GetNextLevel ( al_parent )
	inv_levelsource.of_GetArgs ( al_parent, li_level, la_args )
End If

Return of_retrieve ( al_parent, la_args, ads_data )
end event

event selectionchanging;call super::selectionchanging;n_ds lds_datastore
treeviewitem ltvi_item
int li_level
long ll_row

If	newhandle > 0 Then
	
	this.GetItem ( newhandle, ltvi_item )
	li_level = ltvi_item.Level
	
	// Ask for save if data has changed
	this.event ue_update( li_level)
	
	this.inv_levelsource.of_GetDataSource ( li_level,  lds_datastore )
	if inv_levelsource.of_GetDataRow(newhandle, lds_datastore, ll_row) = -1 then
		MessageBox("Error", "Error in of_getdatarow", exclamation!)
		Return
	end if

	lds_datastore.ReSelectRow ( ll_row ) 
	dw_1.Event ue_RefreshView ( lds_datastore, ll_row )
	
End If
end event


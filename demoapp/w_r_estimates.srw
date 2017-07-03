HA$PBExportHeader$w_r_estimates.srw
$PBExportComments$Response window for entering project estimates
forward
global type w_r_estimates from w_response
end type
type cb_ok from u_cb within w_r_estimates
end type
type cb_cancel from u_cb within w_r_estimates
end type
type cb_apply from u_cb within w_r_estimates
end type
type dw_project_estimates from u_dw within w_r_estimates
end type
type cb_add from u_cb within w_r_estimates
end type
type cb_delete from u_cb within w_r_estimates
end type
type tab_estimates from u_estimate_tab within w_r_estimates
end type
type tab_estimates from u_estimate_tab within w_r_estimates
end type
end forward

global type w_r_estimates from w_response
int X=5
int Y=112
int Width=2921
int Height=1732
boolean TitleBar=true
string Title="Project Estimates"
string Icon="estimate.ico"
cb_ok cb_ok
cb_cancel cb_cancel
cb_apply cb_apply
dw_project_estimates dw_project_estimates
cb_add cb_add
cb_delete cb_delete
tab_estimates tab_estimates
end type
global w_r_estimates w_r_estimates

type variables
Private:
   long		il_ProjectId
   long		il_ComplexityRows
   long		il_RoleRows
   datawindowchild	idwc_complexity
   datawindowchild	idwc_projectrole
end variables

on w_r_estimates.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.cb_apply=create cb_apply
this.dw_project_estimates=create dw_project_estimates
this.cb_add=create cb_add
this.cb_delete=create cb_delete
this.tab_estimates=create tab_estimates
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.cb_apply
this.Control[iCurrent+4]=this.dw_project_estimates
this.Control[iCurrent+5]=this.cb_add
this.Control[iCurrent+6]=this.cb_delete
this.Control[iCurrent+7]=this.tab_estimates
end on

on w_r_estimates.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.cb_apply)
destroy(this.dw_project_estimates)
destroy(this.cb_add)
destroy(this.cb_delete)
destroy(this.tab_estimates)
end on

event open;call super::open;
w_s_projectlist	w_Active

// Get the project id sent in
il_ProjectId = message.DoubleParm
w_Active = gnv_app.of_GetFrame().GetActiveSheet()
this.Title = "Project Estimates - " + w_Active.of_GetProjectName()

// Contruct the dynamic tabs
IF tab_estimates.of_constructtabs(il_ProjectId) = 0 THEN
	gnv_app.inv_error.of_message(gnv_app.iapp_object.DisplayName, + &
			"Categories must be assigned to this project before estimates can be added.", Information!)
	Close(this)
	Return
END IF

// Get the project role dddw and retreive the data
dw_project_estimates.GetChild("project_category_item_role_id", idwc_projectrole)
idwc_projectrole.SetTransObject(SQLCA)
il_RoleRows = idwc_projectrole.Retrieve(il_ProjectId)

// Get the complexity dddw so the hours can be pulled out later
dw_project_estimates.GetChild("project_category_item_complexity_id", idwc_complexity)
idwc_complexity.SetTransObject(SQLCA)
il_ComplexityRows = idwc_complexity.Retrieve(il_ProjectId)


// Make sure there are complexities and roles assigned to this project
IF il_RoleRows = 0 or il_ComplexityRows = 0  THEN
	gnv_app.inv_error.of_message(gnv_app.iapp_object.DisplayName, + &
			"Both Complexities and Roles must be assigned to this project before " + &
			" estimates can be added.", Information!)
	Close(this)
	Return
END IF

// Retrieve the project data
dw_project_estimates.Retrieve(il_ProjectId)
dw_project_estimates.SetFocus()

// Turn off the closequery flag.  This will be turned on only if the user 
// clicks OK.
ib_disableclosequery = TRUE
end event

type cb_ok from u_cb within w_r_estimates
int X=1737
int Y=1500
int TabOrder=50
string Text="OK"
boolean Default=true
end type

event clicked;call super::clicked;long	ll_ret

// Call the save event on the parent window.  If it workes, commit the changes
// and notify the app manager that the project has changed.  This will refresh the
// project list window.
SetPointer(HourGlass!)

// Turn on the close query check
ib_disableclosequery = FALSE

ll_ret =  parent.Event pfc_save()
IF ll_ret > 0  THEN
	SQLCA.of_Commit()
	gnv_app.of_RefreshProjects()
	Close(Parent)
ELSEIF ll_ret = 0 THEN
	Close(Parent)
ELSE
	SQLCA.of_Rollback()
	ib_disableclosequery = TRUE
END IF

end event

type cb_cancel from u_cb within w_r_estimates
int X=2117
int Y=1500
int TabOrder=60
string Text="Cancel"
boolean Cancel=true
end type

event clicked;call u_cb::clicked;
// Close this window
Close(parent)
end event

type cb_apply from u_cb within w_r_estimates
int X=2496
int Y=1500
int TabOrder=70
string Text="&Apply"
end type

event clicked;call super::clicked;SetPointer(HourGlass!)
// Call the save event on the parent window.  If it workes, commit the changes
// and notify the app manager that the project has changed.  This will refresh the
// project list window.

IF parent.Event pfc_save() > 0  THEN
	SQLCA.of_Commit()
	gnv_app.of_RefreshProjects()
ELSE
	SQLCA.of_Rollback()
END IF

end event

type dw_project_estimates from u_dw within w_r_estimates
int X=64
int Y=220
int Width=2743
int Height=1192
int TabOrder=20
boolean Visible=false
string DataObject="d_project_estimates"
end type

event constructor;call u_dw::constructor;
// Set the processing information on this datawindow
this.of_SetTransObject(SQLCA)
this.SetRowFocusIndicator(Hand!)
this.of_SetRowManager(TRUE)


end event

event pfc_addrow;call super::pfc_addrow;long	ll_Row


// When a new row is inserted, move the project id into the row and set the
// status back to new
ll_Row = this.GetRow()

this.object.project_category_item_project_id[ll_Row] = il_projectid
this.object.project_category_item_category_id[ll_Row] = &
			Integer(tab_estimates.of_gettag(tab_estimates.selectedtab))
			
this.SetItemStatus(ll_Row, 0, Primary!, NotModified!)
this.SetColumn("project_category_item_name")

Return 0
end event

event pfc_prermbmenu;call u_dw::pfc_prermbmenu;
// Turn off the insert and select all menu items on the rmb menu
am_dw.m_table.m_insert.visible = FALSE
am_dw.m_table.m_selectall.visible = FALSE
end event

event itemchanged;call super::itemchanged;//The adjusted hours will be set if the role, complexity or estimated hour column
// value is entered.  Adjusted hours = estimated hours * muliplier assigned to the
// role

long		ll_FindRow, ll_Role

CHOOSE CASE dwo.name
		
	// If the complexity field
	CASE "project_category_item_complexity_id"
		
		// Find the same complexity id in the drop down so we can get to the
		// hours assigned to the complexity
		ll_FindRow = idwc_complexity.Find("complexity_id = " + String(data), + &
						 1, il_ComplexityRows)
			
		// Move the hours into the estimated hours field	
		this.object.project_category_item_estimated_hours[row] = + &
					idwc_complexity.GetItemDecimal(ll_FindRow, + &
					"estimated_hours")
					
		// If there is a value in the role id, the multipler must be found
		// and the multipler is used with the estimated hours
		ll_Role = this.Object.project_category_item_role_id[row]
		ll_FindRow = idwc_projectrole.Find("project_role_role_id = " + String(ll_Role), 1, il_RoleRows)
		this.object.adjusted_hours[row] = + &
						idwc_projectrole.GetItemDecimal(ll_FindRow, "multipler") * +&
		this.object.project_category_item_estimated_hours[row]
		
	// If the role field	
	CASE "project_category_item_role_id"
		
		// Each role is assigned a multiplier.  This multiplier is used to determine
		// the adjusted hours (estimated hours * multiplier)
		ll_FindRow = idwc_projectrole.Find("project_role_role_id = " + &
						 String(data), 1, il_RoleRows)
						 
		// Set the adjusted hours				 
		this.object.adjusted_hours[row] = + &
						idwc_projectrole.GetItemDecimal(ll_FindRow, "multipler") * +&
						this.object.project_category_item_estimated_hours[row]
						
	// If the estimated hours					
	CASE "project_category_item_estimated_hours"
		
		// The multiplier must be found so that the adjusted hours can be
		// set with the new estimated value
		ll_Role = this.object.project_category_item_role_id[row]
		ll_FindRow = idwc_projectrole.Find("project_role_role_id = " + String(ll_Role), 1, il_RoleRows)
		this.object.adjusted_hours[row] = + &
						idwc_projectrole.GetItemDecimal(ll_FindRow, "multipler") * +&
						Dec(data)
END CHOOSE



end event

type cb_add from u_cb within w_r_estimates
int X=41
int Y=1500
int TabOrder=30
string Text="A&dd"
end type

event clicked;call u_cb::clicked;
// Trigger the add row event on the datawindow
dw_project_estimates.Event pfc_addrow()
end event

type cb_delete from u_cb within w_r_estimates
int X=425
int Y=1500
int TabOrder=40
string Text="&Delete"
end type

event clicked;call u_cb::clicked;
// Trigger the delete row event of the datawindow
dw_project_estimates.Event pfc_deleterow()
end event

type tab_estimates from u_estimate_tab within w_r_estimates
int X=37
int Y=60
int Width=2807
int TabOrder=10
end type

event selectionchanged;call super::selectionchanged;
// When the tab has changed, filter out the data that does not belong.  The
// get tag function will return the name of the tag.  This was set when
// the dynamic tab was first created.
dw_project_estimates.SetFilter(" project_category_item_category_id = " + &
										 this.of_gettag(newindex))
dw_project_estimates.Filter()

// Make the datawindow visible 
IF NOT dw_project_estimates.visible THEN
	dw_project_estimates.visible = TRUE
END IF
end event


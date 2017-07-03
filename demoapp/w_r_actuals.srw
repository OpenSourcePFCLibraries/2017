HA$PBExportHeader$w_r_actuals.srw
$PBExportComments$Response window for entering project actuals
forward
global type w_r_actuals from w_response
end type
type cb_ok from u_cb within w_r_actuals
end type
type cb_cancel from u_cb within w_r_actuals
end type
type cb_apply from u_cb within w_r_actuals
end type
type dw_project_driven_actuals from u_dw within w_r_actuals
end type
type tab_actuals from u_actual_tab within w_r_actuals
end type
type tab_actuals from u_actual_tab within w_r_actuals
end type
end forward

global type w_r_actuals from w_response
int X=183
int Y=84
int Width=2533
int Height=1732
boolean TitleBar=true
string Title="Project Actuals"
string Icon="actuals.ico"
cb_ok cb_ok
cb_cancel cb_cancel
cb_apply cb_apply
dw_project_driven_actuals dw_project_driven_actuals
tab_actuals tab_actuals
end type
global w_r_actuals w_r_actuals

on w_r_actuals.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.cb_apply=create cb_apply
this.dw_project_driven_actuals=create dw_project_driven_actuals
this.tab_actuals=create tab_actuals
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.cb_apply
this.Control[iCurrent+4]=this.dw_project_driven_actuals
this.Control[iCurrent+5]=this.tab_actuals
end on

on w_r_actuals.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.cb_apply)
destroy(this.dw_project_driven_actuals)
destroy(this.tab_actuals)
end on

event open;call w_response::open;// Retrieve the project information.  The project id is sent in

long					ll_ProjectId
w_s_projectlist	w_Active

// Get the project id sent in
ll_ProjectId = message.DoubleParm
w_Active = gnv_app.of_GetFrame().GetActiveSheet()
this.Title = "Project Actuals - " + w_Active.of_GetProjectName()


// Contruct the dynamic tabs
tab_actuals.of_constructtabs(ll_ProjectId)

// Retrieve the data
tab_actuals.of_Retrieve(ll_ProjectId)
dw_project_driven_actuals.Retrieve(ll_ProjectId)
tab_actuals.of_SetFocus()

// Turn off the closequery flag.  This will be turned on only if the user 
// clicks OK.
ib_disableclosequery = TRUE


end event

type cb_ok from u_cb within w_r_actuals
int X=1317
int Y=1496
int TabOrder=30
string Text="OK"
boolean Default=true
end type

event clicked;call u_cb::clicked;long	ll_ret


SetPointer(HourGlass!)

// Turn the flag for disabling the closequery checks off
ib_disableclosequery = FALSE

// Call the save event on the window.  If is works, commit the changes and notify
// the app manager that the project has changed.
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

type cb_cancel from u_cb within w_r_actuals
int X=1701
int Y=1496
int TabOrder=40
string Text="Cancel"
boolean Cancel=true
end type

event clicked;call u_cb::clicked;
// True off the closequery questions
ib_disableclosequery = TRUE
Close(parent)
end event

type cb_apply from u_cb within w_r_actuals
int X=2085
int Y=1496
int TabOrder=50
string Text="&Apply"
end type

event clicked;call super::clicked;
SetPointer(HourGlass!)

// Call the save event on the window.  If is works, commit the changes and notify
// the app manager that the project has changed.
IF parent.Event pfc_save() > 0  THEN
	SQLCA.of_Commit()
	gnv_app.of_RefreshProjects()
ELSE
	SQLCA.of_Rollback()
END IF

end event

type dw_project_driven_actuals from u_dw within w_r_actuals
int X=114
int Y=180
int Width=2057
int Height=1188
int TabOrder=20
boolean Visible=false
string DataObject="d_project_driven_actuals"
end type

event constructor;call u_dw::constructor;
// Set the transaction object and the focus indicator
this.of_SetTransObject(SQLCA)
this.SetRowFocusIndicator(Hand!)
ib_rmbmenu = FALSE

end event

type tab_actuals from u_actual_tab within w_r_actuals
int X=46
int Y=44
int Width=2391
int TabOrder=10
end type

event selectionchanged;call u_actual_tab::selectionchanged;
IF newindex <> 1 THEN
	dw_project_driven_actuals.SetFilter("default_category_id = " + &
											 this.of_gettag(newindex))
	dw_project_driven_actuals.Filter()
	dw_project_driven_actuals.Visible = TRUE
	dw_project_driven_actuals.SetFocus()
ELSE
	dw_project_driven_actuals.Visible = FALSE
	tab_actuals.of_SetFocus()
END IF
end event


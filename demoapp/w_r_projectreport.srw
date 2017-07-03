HA$PBExportHeader$w_r_projectreport.srw
$PBExportComments$Response window for generating a project report
forward
global type w_r_projectreport from w_response
end type
type dw_project_report from u_dw within w_r_projectreport
end type
type cb_close from u_cb within w_r_projectreport
end type
type cb_print from u_cb within w_r_projectreport
end type
end forward

global type w_r_projectreport from w_response
int X=169
int Y=36
int Width=2697
int Height=1860
boolean TitleBar=true
string Title="Project Report"
string Icon="report.ico"
dw_project_report dw_project_report
cb_close cb_close
cb_print cb_print
end type
global w_r_projectreport w_r_projectreport

type variables
Private:
  long		 il_ProjectId
  datastore	ids_roles
  datastore	ids_categories
  datastore	ids_items
end variables

forward prototypes
private subroutine of_determineestimates ()
end prototypes

private subroutine of_determineestimates ();// This function will determine the total project hours and the total 
// cost of those project hours.  Two datastores are created to 
// get the derived and driven cost and hours.

datastore	lds_derived, lds_driven
long			ll_Rows
decimal{2}	ldc_Val1, ldc_Val2


// Create the datastore for the derived datawindow
lds_derived = CREATE datastore
lds_derived.dataobject = "d_project_derived_summary"
lds_derived.SetTransObject(SQLCA)
ll_Rows = lds_derived.Retrieve(il_projectid)

// Create the datastore for the driven datawindow
lds_driven = CREATE datastore
lds_driven.dataobject = "d_project_category_summary"
lds_driven.SetTransObject(SQLCA)
ll_Rows = lds_driven.Retrieve(il_projectid)

// Get the total estimated hours from the derived and driven datawindow summary
ldc_Val1 = lds_derived.GetItemDecimal(1, "total_estimated_hours")
ldc_Val2 = lds_driven.GetItemDecimal(1, "total_estimated_hours")
dw_project_report.SetItem(1, "total_estimated_hours", ldc_Val1 + ldc_Val2)

						
// Get the total estimated cost for the derived and drive datawindow summay						
dw_project_report.SetItem(1, "total_estimated_cost",  + &
						lds_derived.GetItemDecimal(1, "total_estimated_cost") + + &
						lds_driven.GetItemDecimal(1, "total_estimated_cost"))

															 
// Destroy the datastores																 
DESTROY lds_derived
DESTROY lds_driven
end subroutine

on w_r_projectreport.create
int iCurrent
call super::create
this.dw_project_report=create dw_project_report
this.cb_close=create cb_close
this.cb_print=create cb_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_project_report
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_print
end on

on w_r_projectreport.destroy
call super::destroy
destroy(this.dw_project_report)
destroy(this.cb_close)
destroy(this.cb_print)
end on

event open;call super::open;
w_s_projectlist	w_Active

// Get the project id sent in
il_ProjectId = message.DoubleParm
w_Active = gnv_app.of_GetFrame().GetActiveSheet()
this.Title = "Project Report - " + w_Active.of_GetProjectName()

// Retrieve the project information
IF dw_project_report.Event pfc_retrieve() = -1 THEN
	SQLCA.of_Rollback()
ELSE
	SQLCA.of_Commit()
END IF

// Determine the total estimated cost and hours for the project
this.of_determineestimates()
end event

type dw_project_report from u_dw within w_r_projectreport
int X=55
int Y=32
int Width=2551
int Height=1572
int TabOrder=10
string DataObject="d_project_estimation_report"
boolean HScrollBar=true
boolean LiveScroll=false
end type

event constructor;call u_dw::constructor;
// Set the transaction object for the datawindow and turn off the rmb menu
this.of_SetTransObject(SQLCA)
ib_rmbmenu = FALSE
end event

event pfc_retrieve;call u_dw::pfc_retrieve;// Retrieve the data
Return this.Retrieve(il_ProjectId)
end event

type cb_close from u_cb within w_r_projectreport
int X=2254
int Y=1636
int TabOrder=20
string Text="&Close"
boolean Default=true
boolean Cancel=true
end type

event clicked;call u_cb::clicked;// Close this window

SetPointer(HourGlass!)
ib_disableclosequery = TRUE
Close(Parent)



end event

type cb_print from u_cb within w_r_projectreport
int X=1865
int Y=1636
int TabOrder=2
string Text="&Print"
end type

event clicked;call u_cb::clicked;
// Trigger the print event on the report datawindow

SetPointer(HourGlass!)
dw_project_report.Event pfc_print()
end event


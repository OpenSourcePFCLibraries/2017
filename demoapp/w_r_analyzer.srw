HA$PBExportHeader$w_r_analyzer.srw
$PBExportComments$Response window for analyzing the project
forward
global type w_r_analyzer from w_response
end type
type dw_project_analyzer from u_dw within w_r_analyzer
end type
type cb_close from u_cb within w_r_analyzer
end type
type cb_print from u_cb within w_r_analyzer
end type
type cb_devation from u_cb within w_r_analyzer
end type
end forward

global type w_r_analyzer from w_response
int X=169
int Y=36
int Width=2697
int Height=1872
boolean TitleBar=true
string Title="Project Analyzer"
string Icon="analyze.ico"
dw_project_analyzer dw_project_analyzer
cb_close cb_close
cb_print cb_print
cb_devation cb_devation
end type
global w_r_analyzer w_r_analyzer

type variables
Private:
  long		il_ProjectId
  decimal		idc_deviation
end variables

on w_r_analyzer.create
int iCurrent
call super::create
this.dw_project_analyzer=create dw_project_analyzer
this.cb_close=create cb_close
this.cb_print=create cb_print
this.cb_devation=create cb_devation
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_project_analyzer
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_print
this.Control[iCurrent+4]=this.cb_devation
end on

on w_r_analyzer.destroy
call super::destroy
destroy(this.dw_project_analyzer)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.cb_devation)
end on

event pfc_postopen;call w_response::pfc_postopen;decimal				test


// Open the deviation window and let the user determine the % to
// check.  If 0 comes back, the user hit cancel and this window will
// close.
Open(w_r_deviation)
IF message.DoubleParm > 0 THEN
	idc_deviation = message.DoubleParm
ELSE
	Close(this)
	Return
END IF

// Retrieve the project information
IF dw_project_analyzer.Event pfc_retrieve() = -1 THEN
	SQLCA.of_Rollback()
ELSE
	SQLCA.of_Commit()
END IF



end event

event open;call w_response::open;w_s_projectlist	w_Active

// Get the project id sent in
il_ProjectId = message.DoubleParm
w_Active = gnv_app.of_GetFrame().GetActiveSheet()
this.Title = "Project Analyzer - " + w_Active.of_GetProjectName()

end event

type dw_project_analyzer from u_dw within w_r_analyzer
int X=55
int Y=32
int Width=2551
int Height=1572
int TabOrder=0
string DataObject="d_project_analyzer_report"
boolean HScrollBar=true
boolean LiveScroll=false
end type

event constructor;call u_dw::constructor;
// Set the transaction object for the datawindow and turn off the rmb menu
this.of_SetTransObject(SQLCA)
ib_rmbmenu = FALSE
end event

event pfc_retrieve;call u_dw::pfc_retrieve;
// Retrieve the data
Return this.Retrieve(il_ProjectId, idc_deviation)

end event

type cb_close from u_cb within w_r_analyzer
int X=2254
int Y=1636
int TabOrder=30
string Text="&Close"
boolean Default=true
boolean Cancel=true
end type

event clicked;call u_cb::clicked;// Close this window

SetPointer(HourGlass!)
ib_disableclosequery = TRUE
Close(Parent)



end event

type cb_print from u_cb within w_r_analyzer
int X=1865
int Y=1636
int TabOrder=20
string Text="&Print"
end type

event clicked;call u_cb::clicked;
// Trigger the print event on the report datawindow

SetPointer(HourGlass!)
dw_project_analyzer.Event pfc_print()
end event

type cb_devation from u_cb within w_r_analyzer
int X=55
int Y=1636
int TabOrder=10
string Text="&Deviation..."
end type

event clicked;call u_cb::clicked;// Allow the user to change the % deviation
SetPointer(HourGlass!)
OpenWithParm(w_r_deviation, (idc_deviation * 100))

// If the value has changed, re-retrieve the data
IF message.DoubleParm > 0 THEN
	idc_deviation = message.DoubleParm
	
	// Retrieve the project information
	IF dw_project_analyzer.Event pfc_retrieve() = -1 THEN
		SQLCA.of_Rollback()
	ELSE
		SQLCA.of_Commit()
	END IF
END IF
end event


HA$PBExportHeader$w_r_projectwizard.srw
$PBExportComments$The project wizard responsed window
forward
global type w_r_projectwizard from w_response
end type
type cb_cancel from u_cb within w_r_projectwizard
end type
type cb_next from u_cb within w_r_projectwizard
end type
type cb_back from u_cb within w_r_projectwizard
end type
type p_bitmap from u_p within w_r_projectwizard
end type
type cb_add from u_cb within w_r_projectwizard
end type
type cb_delete from u_cb within w_r_projectwizard
end type
type st_explain from u_st within w_r_projectwizard
end type
type dw_project from u_dw within w_r_projectwizard
end type
type dw_derived_item from u_dw within w_r_projectwizard
end type
type dw_team from u_dw within w_r_projectwizard
end type
type dw_complexity from u_dw within w_r_projectwizard
end type
type dw_category from u_dw within w_r_projectwizard
end type
end forward

global type w_r_projectwizard from w_response
int Width=2629
int Height=1520
boolean TitleBar=true
string Title="Project Wizard"
string Icon="Projinfo.ico"
cb_cancel cb_cancel
cb_next cb_next
cb_back cb_back
p_bitmap p_bitmap
cb_add cb_add
cb_delete cb_delete
st_explain st_explain
dw_project dw_project
dw_derived_item dw_derived_item
dw_team dw_team
dw_complexity dw_complexity
dw_category dw_category
end type
global w_r_projectwizard w_r_projectwizard

type variables
Private:
   long	il_ProjectId
end variables

forward prototypes
private subroutine of_finish ()
private subroutine of_move (string as_direction)
private function boolean of_setkeys (datawindow adw_datawindow)
private subroutine of_switchdw (datawindow adw_current, datawindow adw_new)
private function boolean of_delete (string as_type)
end prototypes

private subroutine of_finish ();
// This function will be called when the user pushes the "Finish" button.
// The project is first saved (so we can get a hold of the project id)
// and then a function is called to moved that project id to all of the
// dependent datawindows.

long		ll_ret
string	ls_name

SetPointer(HourGlass!)

// Update the project info if this is a new project to get the project id.
IF il_projectid = 0 THEN
	this.dw_project.AcceptText()	
	IF this.dw_project.Event pfc_validation() = 1 THEN
		this.dw_project.Event pfc_update(TRUE,TRUE)
	ELSE
		Return
	END IF
END IF

// Call the set keys function to move the project id into the dependent
// datawindows
IF NOT this.of_setkeys(dw_category) THEN Return
IF NOT this.of_setkeys(dw_complexity) THEN Return
IF NOT this.of_setkeys(dw_team) THEN Return
IF NOT this.of_setkeys(dw_derived_item) THEN Return


// Turn the flag for disabling the closequery checks off
ib_disableclosequery = FALSE
ls_name = dw_project.object.name[1]

// Call the save event on the window.  If is works, commit the changes and notify
// the app manager that the project has changed.
ll_ret = this.Event pfc_save()
IF ll_ret > 0  THEN
	SQLCA.of_Commit()
	gnv_app.of_RefreshProjects()
	CloseWithReturn(this, ls_name)
ELSEIF ll_ret = 0 THEN
	CloseWithReturn(this, ls_name)	
ELSE
	SQLCA.of_Rollback()
	ib_disableclosequery = TRUE
END IF


end subroutine

private subroutine of_move (string as_direction);// This function will move the user through the datawindows.  The tag of
// the current datawindow is checked for the valued.  The next datawindow
// in the sequence is then shown.  In addition, buttons are made visible, 
// button text is changed and enabled depending on the tag.  The help text
// is also changed.  NOTE:  This function will not be called if the
// the "Next" button displays "Finish".  


// do an accepttext on the current datawindow before moving on
IF idw_active.AcceptText() <> 1 THEN
	RETURN
END IF

// If the user pressed the back button
IF as_direction = "back" THEN
	CHOOSE CASE idw_active.tag
			
		// 2 is active, move to 1
		CASE "2"
			this.of_switchdw(idw_active, dw_project)
			
			// on the first datawindow, disable back and hide the add and delete
			cb_back.enabled = FALSE
			cb_add.visible = FALSE
			cb_delete.visible = FALSE
			
		// 3 is active move to 2
		CASE "3"
			this.of_switchdw(idw_active, dw_category)
			
		// 4 is active move to 3
		CASE "4"
			this.of_switchdw(idw_active, dw_team)
			
		// 5 is active move to 4
		CASE "5"
			this.of_switchdw(idw_active, dw_complexity)
			
			// 5 is the last datawindow and the next button was changed
			// to finish.  Since the user moved back, change the
			// text back to next.
			cb_next.Text = "&Next >"	
		END CHOOSE
		
	// User pressed next
	ELSE
		CHOOSE CASE idw_active.tag
				
		// 1 is active move to 2
		CASE "1"
			this.of_switchdw(idw_active, dw_category)
			
			// moving from 1 to 2, the back button must be enabled and
			// the add and delete need to be made visible
			cb_back.enabled = TRUE
			cb_add.visible = TRUE
			cb_delete.visible = TRUE
			
		// 2 is active move to 3
		CASE "2"
			this.of_switchdw(idw_active, dw_team)
			
		// 3 is active move to 4
		CASE "3"
			this.of_switchdw(idw_active, dw_complexity)
			
		// 4 is active move to 5
		CASE "4"
			this.of_switchdw(idw_active, dw_derived_item)
			
			// on the last datawindow, the next button should be changed to finish
			cb_next.text = "&Finish"
		END CHOOSE
	END IF

end subroutine

private function boolean of_setkeys (datawindow adw_datawindow);// This function will loop through the rows of the datawindow sent
// in and find the new modified rows.  When one is found, the project
// id is moved into the datawindow.


long	li_i, ll_Rows

// Do an accepttext on the datawindow
IF adw_datawindow.AcceptText() = -1 THEN
	Return FALSE
END IF

// Get the total number of rows
ll_Rows = adw_datawindow.RowCount()

// Loop through all the rows
FOR li_i = 1 to ll_Rows
	// If the status has changed for the datawindow
	IF adw_datawindow.GetItemStatus(li_i, 0, Primary!) = NewModified! THEN
		adw_datawindow.object.project_id[li_i] = il_projectid
	END IF
NEXT

Return TRUE
end function

private subroutine of_switchdw (datawindow adw_current, datawindow adw_new);// This funciton will make the current datawindow invisible and the new
// datawindow visible and set focus to it.  If the new datawindow does not
// have any rows, a blank row will be added.  In addition, the .INI file
// is read to get the text of the help text for the new datawindow.

string	ls_ini, ls_tag

adw_current.Visible = FALSE
adw_new.Visible = TRUE
adw_new.SetFocus()
			
// If there are no rows, add one for the user
IF adw_new.RowCount() = 0 THEN
	adw_new.Event Dynamic pfc_addrow()
END IF

// Get the help message from the .INI file
ls_ini = gnv_app.of_GetAppIniFile()
ls_tag = adw_new.tag
IF ls_tag = "1" THEN
	IF il_ProjectId = 0 THEN
		ls_tag = "1N"
		st_explain.text = ProfileString(ls_ini, "Wizard", ls_tag, "")
	ELSE
		st_explain.text = ProfileString(ls_ini, "Wizard", ls_tag, "") + " '" + &
								gnv_app.of_GetFrame().GetActiveSheet().Dynamic of_GetProjectName() +"'."
	END IF
ELSE
	st_explain.text = ProfileString(ls_ini, "Wizard", ls_tag, "")
END IF
	



end subroutine

private function boolean of_delete (string as_type);// This function will check to see if the current datawindow has dependent
// rows in the category item table (there is a field on the datawindow that
// displays the count).  If it does, the user will be warned that the dependent
// rows will be deleted and ask if they wish to continue.  

long	ll_row, ll_limit

ll_row = idw_active.GetRow()
IF idw_active.Object.dependent_count[ll_row] > 0 THEN
	IF gnv_app.inv_error.of_message(gnv_app.iapp_object.DisplayName, + &
			"There are " + String(idw_active.Object.dependent_count[ll_row]) + &
			" object(s) assigned to " + as_type + " '" + idw_active.object.name[ll_row] + &
			".'  Deleting this row will delete the dependent rows.  Do you wish to continue?", +&
			Exclamation!, YesNo!, 2) = 1 THEN
			Return TRUE
	End IF
ELSE
	Return TRUE
END IF

Return FALSE
end function

on w_r_projectwizard.create
int iCurrent
call super::create
this.cb_cancel=create cb_cancel
this.cb_next=create cb_next
this.cb_back=create cb_back
this.p_bitmap=create p_bitmap
this.cb_add=create cb_add
this.cb_delete=create cb_delete
this.st_explain=create st_explain
this.dw_project=create dw_project
this.dw_derived_item=create dw_derived_item
this.dw_team=create dw_team
this.dw_complexity=create dw_complexity
this.dw_category=create dw_category
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancel
this.Control[iCurrent+2]=this.cb_next
this.Control[iCurrent+3]=this.cb_back
this.Control[iCurrent+4]=this.p_bitmap
this.Control[iCurrent+5]=this.cb_add
this.Control[iCurrent+6]=this.cb_delete
this.Control[iCurrent+7]=this.st_explain
this.Control[iCurrent+8]=this.dw_project
this.Control[iCurrent+9]=this.dw_derived_item
this.Control[iCurrent+10]=this.dw_team
this.Control[iCurrent+11]=this.dw_complexity
this.Control[iCurrent+12]=this.dw_category
end on

on w_r_projectwizard.destroy
call super::destroy
destroy(this.cb_cancel)
destroy(this.cb_next)
destroy(this.cb_back)
destroy(this.p_bitmap)
destroy(this.cb_add)
destroy(this.cb_delete)
destroy(this.st_explain)
destroy(this.dw_project)
destroy(this.dw_derived_item)
destroy(this.dw_team)
destroy(this.dw_complexity)
destroy(this.dw_category)
end on

event open;call super::open;
w_s_projectlist	w_Active
string				ls_ini, ls_tag

// Get the project id sent in
il_ProjectId = message.DoubleParm
IF il_ProjectId = 0 THEN
	this.Title = "New Project Wizard"
	cb_add.visible = FALSE
	cb_delete.visible = FALSE
ELSE
	w_Active = gnv_app.of_GetFrame().GetActiveSheet()
	this.Title = "Project Wizard  - " + w_Active.of_GetProjectName()
END IF

// Start the linkage service on the master and its details
dw_project.of_SetLinkage(TRUE)
dw_category.of_SetLinkage(TRUE)
dw_team.of_SetLinkage(TRUE)
dw_complexity.of_SetLinkage(TRUE)
dw_derived_item.of_SetLinkage(TRUE)


// Link the master to the details
dw_category.inv_linkage.of_LinkTo(dw_project)
dw_category.inv_linkage.of_SetArguments("project_id","project_id")
dw_category.inv_linkage.of_SetUseColLinks(2)

dw_team.inv_linkage.of_LinkTo(dw_project)
dw_team.inv_linkage.of_SetArguments("project_id", "project_id")
dw_team.inv_linkage.of_SetUseColLinks(2)

dw_complexity.inv_linkage.of_LinkTo(dw_project)
dw_complexity.inv_linkage.of_SetArguments("project_id", "project_id")
dw_complexity.inv_linkage.of_SetUseColLinks(2)

dw_derived_item.inv_linkage.of_LinkTo(dw_project)
dw_derived_item.inv_linkage.of_SetArguments("project_id", "project_id")
dw_derived_item.inv_linkage.of_SetUseColLinks(2)

//
// Retrieve the project information
IF dw_project.inv_linkage.of_Retrieve() = -1 THEN
	SQLCA.of_Rollback()
ELSE
	SQLCA.of_Commit()
	dw_project.SetFocus()
END IF

// Turn off the closequery flag.  This will be turned on only if the user 
// clicks OK.
ib_disableclosequery = TRUE

// Set the first help message on the screen
ls_ini = gnv_app.of_GetAppIniFile()
IF il_ProjectId = 0 THEN
	st_explain.text = ProfileString(ls_ini, "Wizard", "1N", "")
ELSE
	st_explain.text = ProfileString(ls_ini, "Wizard", "1", "") + " '" +&
					  w_Active.of_GetProjectName() + "'."
END IF

end event

type cb_cancel from u_cb within w_r_projectwizard
int X=2199
int Y=1292
int TabOrder=100
string Text="Cancel"
end type

event clicked;call super::clicked;
// Close this window
Close(parent)
end event

type cb_next from u_cb within w_r_projectwizard
int X=1495
int Y=1292
int TabOrder=90
boolean BringToTop=true
string Text="&Next >"
boolean Default=true
end type

event clicked;call super::clicked;// IF the button is "Finish" call the finish function, otherwise
// call the move function

IF this.text = "&Finish" THEN
	parent.of_finish()
ELSE
	parent.of_move("next")
END IF
end event

type cb_back from u_cb within w_r_projectwizard
int X=1143
int Y=1292
int TabOrder=80
boolean Enabled=false
boolean BringToTop=true
string Text="< &Back"
end type

event clicked;call super::clicked;// Call the move function with "back" as a parameter

parent.of_move("back")
end event

type p_bitmap from u_p within w_r_projectwizard
int X=55
int Y=60
int Width=635
int Height=1288
string PictureName="wizard.bmp"
end type

type cb_add from u_cb within w_r_projectwizard
event clicked pbm_bnclicked
int X=773
int Y=1096
int TabOrder=60
boolean Visible=false
string Text="&Add"
end type

event clicked;call super::clicked;
// Trigger the add row event on the active datawindow
idw_active.Event pfc_addrow()
idw_active.SetColumn("name")
cb_delete.enabled = TRUE
end event

type cb_delete from u_cb within w_r_projectwizard
event clicked pbm_bnclicked
int X=1157
int Y=1096
int TabOrder=70
boolean Visible=false
string Text="&Delete"
end type

event clicked;call super::clicked;
// Trigger the delete row event on the active datawindow
idw_active.Event pfc_deleterow()
IF idw_active.RowCount() = 0 THEN
	this.enabled = FALSE
END IF
end event

type st_explain from u_st within w_r_projectwizard
int X=773
int Y=60
int Width=1778
int Height=220
string Tag="3"
string Text=""
end type

type dw_project from u_dw within w_r_projectwizard
int X=773
int Y=308
int Width=1714
int Height=324
int TabOrder=40
string Tag="1"
string DataObject="d_project"
boolean Border=false
BorderStyle BorderStyle=StyleBox!
boolean VScrollBar=false
end type

event constructor;call super::constructor;// Set the transaction object and turn off the rmb
this.of_SetTransObject(SQLCA)
ib_rmbmenu = FALSE
end event

event pfc_retrieve;call super::pfc_retrieve;long		ll_Rows

// If this is a new project, insert a new row, otherwise retrieve all the 
// project information
IF il_ProjectId = 0 THEN
	ll_Rows = this.InsertRow(0)
ELSE
	ll_Rows = this.Retrieve(il_ProjectId)
END IF

Return ll_Rows
end event

event pfc_update;call super::pfc_update;
// Once this datawindow has been updated, get the project id (which
// is an auto increment field) value and put in into the project id field
IF il_ProjectId = 0 THEN
		il_ProjectId = this.object.project_id[1]
END IF

Return 1
end event

event pfc_validation;call super::pfc_validation;
boolean	lb_Error

// Make sure the project name is there
IF this.object.name[1] = "" or IsNull(this.object.name[1]) THEN
		gnv_app.inv_error.of_message(gnv_app.iapp_object.DisplayName, &
		"Project Name is required.", Exclamation!, OK!)
	this.SetColumn("name")
	lb_Error = TRUE

// Make sure the start date is less than the end date
ELSEIF this.object.start_date[1] > this.object.end_date[1] THEN
		gnv_app.inv_error.of_message(gnv_app.iapp_object.DisplayName, &
		"Start Date must be less than End Date.", Exclamation!, OK!)
	this.SetColumn("start_date")
	lb_Error = TRUE
	
END IF


IF lb_Error THEN
	parent.of_switchdw(idw_active, this)
	cb_next.text = "&Next >"
	cb_back.enabled = FALSE
	cb_add.visible = FALSE
	cb_delete.visible = FALSE
	Return -1
ELSE
	Return 1
END IF
		

end event

event itemchanged;call super::itemchanged;// When the user has entered a project name, put it in the title

IF dwo.name = "name" THEN
	parent.title = "New Project Wizard - " + data
END IF
end event

type dw_derived_item from u_dw within w_r_projectwizard
event constructor pbm_constructor
int X=773
int Y=308
int Width=1778
int Height=740
int TabOrder=10
boolean Visible=false
string Tag="5"
string DataObject="d_project_derived_item"
end type

event constructor;call super::constructor;// Set the processing information
this.of_SetTransObject(SQLCA)
this.SetRowFocusIndicator(Hand!)
this.of_SetRowManager(TRUE)
end event

event pfc_retrieve;call super::pfc_retrieve;// Retrieve the data
Return this.Retrieve(il_ProjectId)
end event

type dw_team from u_dw within w_r_projectwizard
event constructor pbm_constructor
int X=773
int Y=308
int Width=1778
int Height=740
int TabOrder=20
boolean Visible=false
string Tag="3"
string DataObject="d_project_team"
end type

event constructor;call super::constructor;// Set the processing information
this.of_SetTransObject(SQLCA)
this.SetRowFocusIndicator(Hand!)
this.of_SetRowManager(TRUE)
end event

event pfc_retrieve;call super::pfc_retrieve;// Retrieve the data
Return this.Retrieve(il_ProjectId)
end event

event pfc_deleterow;// Override the ancestor and call the of_delete function to see if
// there are dependent rows.  If there are a message will display to the
// user before deleteing.  of_delete will return a true if the user still
// wants to delete

long	ll_row, ll_limit

IF parent.of_delete("category") THEN
	call super::pfc_deleterow
END IF

Return 1
end event

type dw_complexity from u_dw within w_r_projectwizard
int X=777
int Y=308
int Width=1778
int Height=740
int TabOrder=30
boolean Visible=false
string Tag="4"
string DataObject="d_project_complexity"
end type

event constructor;call super::constructor;// Set the processing information
this.of_SetTransObject(SQLCA)
this.SetRowFocusIndicator(Hand!)
this.of_SetRowManager(TRUE)
end event

event pfc_retrieve;call super::pfc_retrieve;// Retrieve the data
Return this.Retrieve(il_ProjectId)
end event

event pfc_deleterow;// Override the ancestor and call the of_delete function to see if
// there are dependent rows.  If there are a message will display to the
// user before deleteing.  of_delete will return a true if the user still
// wants to delete

long	ll_row, ll_limit

IF parent.of_delete("category") THEN
	call super::pfc_deleterow
END IF

Return 1
end event

type dw_category from u_dw within w_r_projectwizard
int X=773
int Y=308
int Width=1778
int Height=740
int TabOrder=50
boolean Visible=false
string Tag="2"
string DataObject="d_project_category"
end type

event constructor;call super::constructor;
// Set the processing information
this.of_SetTransObject(SQLCA)
this.SetRowFocusIndicator(Hand!)
this.of_SetRowManager(TRUE)

end event

event pfc_retrieve;call super::pfc_retrieve;// Retrieve the data
Return this.Retrieve(il_ProjectId)
end event

event pfc_deleterow;// Override the ancestor and call the of_delete function to see if
// there are dependent rows.  If there are a message will display to the
// user before deleteing.  of_delete will return a true if the user still
// wants to delete

long	ll_row, ll_limit

IF parent.of_delete("category") THEN
	call super::pfc_deleterow
END IF

Return 1

end event


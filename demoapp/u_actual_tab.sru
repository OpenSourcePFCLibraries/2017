HA$PBExportHeader$u_actual_tab.sru
$PBExportComments$Tab control for w_r_actuals
forward
global type u_actual_tab from tab
end type
type tabpage_derived from userobject within u_actual_tab
end type
type dw_project_dervied_actuals from u_dw within tabpage_derived
end type
type tabpage_derived from userobject within u_actual_tab
dw_project_dervied_actuals dw_project_dervied_actuals
end type
end forward

global type u_actual_tab from tab
int Width=2209
int Height=1417
int TabOrder=1
boolean RaggedRight=true
int SelectedTab=1
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
tabpage_derived tabpage_derived
end type
global u_actual_tab u_actual_tab

type variables
Private:
  u_tabpg	iu_tabpage[]
end variables

forward prototypes
public function integer of_constructtabs (long al_projectid)
public function string of_gettag (integer ai_tab)
public function long of_retrieve (long al_ProjectId)
public subroutine of_setfocus ()
end prototypes

public function integer of_constructtabs (long al_projectid);// Create the datastore that contains all the categories assigned to this
// project.  Then create a tab for each of those categories.  The
// tag value of the tab will contain the name of the category.

long			ll_Rows
integer		li_i
datastore	lds_Categories


lds_Categories = CREATE datastore
lds_Categories.dataobject = "d_ds_project_categories"
lds_Categories.SetTransObject(SQLCA)
ll_Rows = lds_Categories.Retrieve(al_projectid)

FOR li_i = 2 to ll_Rows + 1
	this.OpenTab(iu_tabpage[li_i],0)
	iu_tabpage[li_i].text = lds_Categories.Object.name[li_i - 1]
	iu_tabpage[li_i].tag = String(lds_Categories.Object.category_id[li_i - 1])
	iu_tabpage[li_i].Border = FALSE
NEXT

Return 0
end function

public function string of_gettag (integer ai_tab);
// Return the tag value for this current tab
Return iu_tabpage[ai_tab].tag
end function

public function long of_retrieve (long al_ProjectId);
// Retrieve the data for the derived and driven items
Return tabpage_derived.dw_project_dervied_actuals.Retrieve(al_projectid)
	
end function

public subroutine of_setfocus ();
// Set focus to the first tabpage on this tab control
this.tabpage_derived.dw_project_dervied_actuals.SetFocus()
end subroutine

on u_actual_tab.create
this.tabpage_derived=create tabpage_derived
this.Control[]={ this.tabpage_derived}
end on

on u_actual_tab.destroy
destroy(this.tabpage_derived)
end on

type tabpage_derived from userobject within u_actual_tab
int X=19
int Y=101
int Width=2172
int Height=1301
long BackColor=79741120
string Text="Derived Items"
long TabBackColor=79741120
long TabTextColor=33554432
long PictureMaskColor=536870912
dw_project_dervied_actuals dw_project_dervied_actuals
end type

on tabpage_derived.create
this.dw_project_dervied_actuals=create dw_project_dervied_actuals
this.Control[]={ this.dw_project_dervied_actuals}
end on

on tabpage_derived.destroy
destroy(this.dw_project_dervied_actuals)
end on

type dw_project_dervied_actuals from u_dw within tabpage_derived
int X=51
int Y=37
int Width=2058
int Height=1185
int TabOrder=2
string DataObject="d_project_dervied_actuals"
end type

event constructor;call u_dw::constructor;
// Set the transaction object and the focus indicator and turn off the rmb menu
this.of_SetTransObject(SQLCA)
this.SetRowFocusIndicator(Hand!)
ib_rmbmenu = FALSE

end event


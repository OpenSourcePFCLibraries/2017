HA$PBExportHeader$u_estimate_tab.sru
$PBExportComments$Tab control for w_r_estimates
forward
global type u_estimate_tab from tab
end type
end forward

global type u_estimate_tab from tab
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
end type
global u_estimate_tab u_estimate_tab

type variables
Private:
  u_tabpg	iu_tabpage[]
end variables

forward prototypes
public function integer of_constructtabs (long al_projectid)
public function string of_gettag (integer ai_tab)
end prototypes

public function integer of_constructtabs (long al_projectid);// Create the datastore for all categories assigned to this project.  Then
// create a tabpage for each of those categories.

long			ll_Rows
integer		li_i
datastore	lds_Categories


lds_Categories = CREATE datastore
lds_Categories.dataobject = "d_ds_project_categories"
lds_Categories.SetTransObject(SQLCA)
ll_Rows = lds_Categories.Retrieve(al_projectid)

FOR li_i = 1 to ll_Rows
	this.OpenTab(iu_tabpage[li_i],0)
	iu_tabpage[li_i].text = lds_Categories.Object.name[li_i]
	iu_tabpage[li_i].tag = String(lds_Categories.Object.category_id[li_i])
NEXT

Return ll_Rows
end function

public function string of_gettag (integer ai_tab);
// Return the tag value for the tabpage specified
Return iu_tabpage[ai_tab].tag
end function


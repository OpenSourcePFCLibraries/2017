HA$PBExportHeader$base_librarylist.sru
forward
global type base_librarylist from multilineedit
end type
end forward

global type base_librarylist from multilineedit
integer width = 503
integer height = 348
boolean ignoredefaultbutton = true
event e_editchanged pbm_enchange
end type
global base_librarylist base_librarylist

type variables
pfcscanner_n_cst_filesrv inv_file
end variables

forward prototypes
public function long f_GetLibraries (ref string as_libraries[])
public function integer f_addtolist (string as_library)
public function integer f_populate (string as_libraries[])
public function integer f_addtolist (string as_path, string as_libraries[])
public function integer f_clearall ()
end prototypes

event e_editchanged;//*-----------------------------------------------------------------*/
//*    e_editchanged: Notify Parent that data has changed	   	*/
//*-----------------------------------------------------------------*/
end event

public function long f_GetLibraries (ref string as_libraries[]);//*-----------------------------------------------------------------*/
//*    f_GetLibraries: Return the Library List
//*-----------------------------------------------------------------*/
long ll_l, ll_libs
string ls_libraries[], ls_liblist
pfcscanner_n_cst_string lnv_string

ll_libs = lnv_string.of_ParseToArray ( this.Text, ";~r~n", ls_libraries ) 

For ll_l = 1 to ll_libs
	ls_libraries[ll_l] = lnv_string.of_GlobalReplace ( ls_libraries[ll_l], ";", "", True ) 
	If Trim ( ls_libraries[ll_l] ) = "" Then Continue
	
	as_libraries[UpperBound (as_libraries)+1] = Trim ( ls_libraries[ll_l] )
Next

Return UpperBound (as_libraries)
end function

public function integer f_addtolist (string as_library);//*-----------------------------------------------------------------*/
//*    f_AddToList: Add to the library list
//*-----------------------------------------------------------------*/
long ll_pos, ll_len
boolean lb_linefeedbegin = False, lb_linefeedend = False
string ls_text

ll_pos = this.SelectedStart ( )
ll_len = this.SelectedLength ( ) 
If ll_pos + ll_len > Len ( this.Text ) Then ll_len = 0

If ll_pos > 1 Then lb_linefeedbegin = Not ( Mid ( this.Text, ll_pos - 2, 2 ) = "~r~n" )
lb_linefeedend = Not ( Mid ( this.Text, ll_pos + ll_len, 2 ) = "~r~n" )

If lb_linefeedbegin Then ls_text = "~r~n"
ls_text = ls_text + as_library + ";"
If lb_linefeedend Then ls_text = ls_text + "~r~n"

Return this.ReplaceText (  ls_text ) 
end function

public function integer f_populate (string as_libraries[]);//*-----------------------------------------------------------------*/
//*    f_Populate: Initialize the list
//*-----------------------------------------------------------------*/
long ll_o, ll_objects
string ls_libraries[], ls_app, ls_applib, ls_text

ls_text = ""
ll_objects = UpperBound ( as_libraries )
For ll_o = 1 to ll_objects
	ls_text = ls_text + as_libraries[ll_o] + ";~r~n"
Next

this.Text = ls_text + " " 
this.SelectText ( Len ( this.Text ), 0 )
this.SetFocus ( )

Return 1
end function

public function integer f_addtolist (string as_path, string as_libraries[]);//*-----------------------------------------------------------------*/
//*    f_AddToList: Add Many to the library list
//*-----------------------------------------------------------------*/
long ll_i, ll_libs, ll_pos, ll_len
boolean lb_linefeedbegin = False, lb_linefeedend = False
string ls_text 

ll_pos = this.SelectedStart ( )
ll_len = this.SelectedLength ( ) 
If ll_pos + ll_len > Len ( this.Text ) Then ll_len = 0

If ll_pos > 1 Then lb_linefeedbegin = Not ( Mid ( this.Text, ll_pos - 2, 2 ) = "~r~n" )
lb_linefeedend = Not ( Mid ( this.Text, ll_pos + ll_len, 2 ) = "~r~n" )

If lb_linefeedbegin Then ls_text = "~r~n"
ll_libs = UpperBound ( as_libraries )
For ll_i = 1 to ll_libs
	If ll_i < ll_libs Then 
		ls_text = ls_text + as_path + inv_file.is_separator + as_libraries[ll_i] + ";~r~n"
	Else
		ls_text = ls_text + as_path + inv_file.is_separator + as_libraries[ll_i] + ";"
	End If
Next

If lb_linefeedend Then ls_text = ls_text + "~r~n"
this.ReplaceText ( ls_text ) 

Return 1
end function

public function integer f_clearall ();//*-----------------------------------------------------------------*/
//*    f_CearAll: Clear the library list
//*-----------------------------------------------------------------*/

This.SetRedraw( False )

This.SelectText ( 1, Len ( this.Text ) ) 
This.ReplaceText ( "" )

This.SetRedraw( True )

Return 1
end function

event modified;//*-----------------------------------------------------------------*/
//*    modified: Data has changed									*/
//*-----------------------------------------------------------------*/
end event

on base_librarylist.create
end on

on base_librarylist.destroy
end on

event getfocus;//*-----------------------------------------------------------------*/
//*    getfocus:  Override Ancestor Script
//*-----------------------------------------------------------------*/
end event

event losefocus;//*-----------------------------------------------------------------*/
//*    losefocus:  Override Ancestor Script
//*-----------------------------------------------------------------*/
end event

event constructor;call super::constructor;//*-----------------------------------------------------------------*/
//*    constructor:  Initialization
//*-----------------------------------------------------------------*/
f_SetFileSrv ( inv_file, True ) 
end event

event destructor;call super::destructor;//*-----------------------------------------------------------------*/
//*    destructor:  CleanUp
//*-----------------------------------------------------------------*/
f_SetFileSrv ( inv_file, False ) 
end event


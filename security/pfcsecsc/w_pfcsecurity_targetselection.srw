HA$PBExportHeader$w_pfcsecurity_targetselection.srw
forward
global type w_pfcsecurity_targetselection from window
end type
type st_liblist from statictext within w_pfcsecurity_targetselection
end type
type st_target from statictext within w_pfcsecurity_targetselection
end type
type cb_ok from commandbutton within w_pfcsecurity_targetselection
end type
type cb_1 from commandbutton within w_pfcsecurity_targetselection
end type
type mle_1 from base_librarylist within w_pfcsecurity_targetselection
end type
type cb_browse from commandbutton within w_pfcsecurity_targetselection
end type
type sle_targetfile from singlelineedit within w_pfcsecurity_targetselection
end type
type cb_select from commandbutton within w_pfcsecurity_targetselection
end type
type cb_exit from commandbutton within w_pfcsecurity_targetselection
end type
end forward

global type w_pfcsecurity_targetselection from window
integer x = 1074
integer y = 484
integer width = 1961
integer height = 2064
boolean titlebar = true
string title = "Select Application"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 80921269
boolean center = true
st_liblist st_liblist
st_target st_target
cb_ok cb_ok
cb_1 cb_1
mle_1 mle_1
cb_browse cb_browse
sle_targetfile sle_targetfile
cb_select cb_select
cb_exit cb_exit
end type
global w_pfcsecurity_targetselection w_pfcsecurity_targetselection

type variables
pfcscanner_n_cst_filesrv inv_file

string is_appname, is_applib, is_libs[]
end variables

forward prototypes
public function string f_buildpath (string as_drive, string as_dirarray[], string as_libin)
public function integer f_getliblist (ref string as_appname, ref string as_applib, ref string as_liblist[])
end prototypes

public function string f_buildpath (string as_drive, string as_dirarray[], string as_libin);//*-------------------------------------------------------------------
//*  Function:			f_BuildPath
//*  Purpose:			Convert the relative path ( ie: ..\\..\\temp.my.pbl )
//*						to a absolute path based on the target folders 
//*-------------------------------------------------------------------
string ls_drive, ls_tempdir, ls_file, ls_sep, ls_library, ls_dir
long ll_pos, ll_cnt, ll_d, ll_dirs
pfcscanner_n_cst_string lnv_string

ls_sep = "\\"

/*  Parse the relative path  */
inv_file.of_ParsePath ( as_libin, ls_drive, ls_tempdir, ls_file ) 
If ls_drive > "" Then 
	/*  If there is a drive, then it is not a relative path  */
	ls_library = lnv_string.of_GlobalReplace ( as_libin, ls_sep, "\", True )
	Return ls_library
End If

/*  Find the ".." to determine the level of folders  */
ll_pos = Pos ( as_libin, ".." + ls_sep ) 
Do While ll_pos = 1
	ll_cnt++
	as_libin = Mid ( as_libin, ll_pos + 4 ) 
	ll_pos = Pos ( as_libin, ".." + ls_sep ) 
Loop

/*  Now adjust the folder count by the number of ".." found  */
ll_dirs = UpperBound ( as_dirarray )
ll_dirs = ll_dirs - ll_cnt

/*  Build the folder path */
For ll_d =1 to ll_dirs
	ls_dir = ls_dir + as_dirarray[ll_d] + "\"
Next

/*  Reconstruct the library path  */
ls_library = inv_file.of_AssemblePath ( as_drive, ls_dir, as_libin ) 
ls_library = lnv_string.of_GlobalReplace ( ls_library, ls_sep, "\", True )

Return ls_library
end function

public function integer f_getliblist (ref string as_appname, ref string as_applib, ref string as_liblist[]);//*-------------------------------------------------------------------
//*  Function:			f_GetLibList
//*  Purpose:			Get the library information from the target file
//*-------------------------------------------------------------------
string ls_drive, ls_dir, ls_file, ls_dirs[]
string ls_line, ls_liblist
long ll_FileNo, ll_rc, ll_l, ll_libs
long ll_pos, ll_pos2, ll_pos3
pfcscanner_n_cst_string lnv_string

f_SetFileSrv ( inv_file, True )

/* Open the target for read  */
ll_FileNo = FileOpen ( sle_targetfile.Text, LineMode!, Read! )
If ll_FileNo < 0 Then Return -1

/*  Read the target file extracting information  */
ll_rc = FileRead ( ll_FileNo, ls_line ) 
Do While ll_rc > 0 
	/*  Look for appname  */
	ll_pos = Pos ( Lower ( ls_line ), "appname" )
	If ll_pos = 1 Then
		ll_pos2 = Pos ( ls_line, "~"" ) 
		If ll_pos2 > 0 Then
			ls_line = Mid ( ls_line, ll_pos2 + 1 )
			ll_pos3 = Pos ( ls_line, "~"" ) 
			If ll_pos3 > 0 Then 
				as_appname = Left ( ls_line, ll_pos3 - 1 )
			End If
		End If
		ll_rc = FileRead (ll_FileNo, ls_line ) 
		Continue
	End If
	/*  Look for applib  */
	ll_pos = Pos ( Lower ( ls_line ), "applib" )
	If ll_pos = 1 Then
		ll_pos2 = Pos ( ls_line, "~"" ) 
		If ll_pos2 > 0 Then
			ls_line = Mid ( ls_line, ll_pos2 + 1 )
			ll_pos3 = Pos ( ls_line, "~"" ) 
			If ll_pos3 > 0 Then 
				as_applib = Left ( ls_line, ll_pos3 - 1 )
			End If
		End If
		ll_rc = FileRead ( ll_FileNo, ls_line ) 
		Continue
	End If
	/*  Look for liblist */
	ll_pos = Pos ( Lower ( ls_line ), "liblist" )
	If ll_pos = 1 Then
		ll_pos2 = Pos ( ls_line, "~"" ) 
		If ll_pos2 > 0 Then
			ls_line = Mid ( ls_line, ll_pos2 + 1 )
			ll_pos3 = Pos ( ls_line, "~"" ) 
			If ll_pos3 > 0 Then 
				ls_liblist = Left ( ls_line, ll_pos3 - 1 )
			End If
		End If
		ll_rc = FileRead ( ll_FileNo, ls_line ) 
		Continue
	End If
	ll_rc = FileRead (ll_FileNo, ls_line ) 
Loop

FileClose ( ll_FileNo)

/*  Parse the library list to an array */
ll_libs = lnv_string.of_ParseToArray ( ls_liblist, ";", as_liblist )

/*  Get the path of the target file and create an array of its folders  */
inv_file.of_ParsePath ( sle_targetfile.Text, ls_drive, ls_dir, ls_file )
lnv_string.of_ParseToArray ( ls_dir, "\", ls_dirs )

/*  Parse the relative path to a full path  */
as_applib = f_BuildPath ( ls_drive, ls_dirs, as_applib ) 

/*  For each of the libraries, Parse the relative path to a full path  */
For ll_l = 1 to ll_libs
	as_liblist[ll_l] = f_BuildPath ( ls_drive, ls_dirs, as_liblist[ll_l] ) 
Next

f_SetFileSrv ( inv_file, False )

Return 1
end function

on w_pfcsecurity_targetselection.create
this.st_liblist=create st_liblist
this.st_target=create st_target
this.cb_ok=create cb_ok
this.cb_1=create cb_1
this.mle_1=create mle_1
this.cb_browse=create cb_browse
this.sle_targetfile=create sle_targetfile
this.cb_select=create cb_select
this.cb_exit=create cb_exit
this.Control[]={this.st_liblist,&
this.st_target,&
this.cb_ok,&
this.cb_1,&
this.mle_1,&
this.cb_browse,&
this.sle_targetfile,&
this.cb_select,&
this.cb_exit}
end on

on w_pfcsecurity_targetselection.destroy
destroy(this.st_liblist)
destroy(this.st_target)
destroy(this.cb_ok)
destroy(this.cb_1)
destroy(this.mle_1)
destroy(this.cb_browse)
destroy(this.sle_targetfile)
destroy(this.cb_select)
destroy(this.cb_exit)
end on

type st_liblist from statictext within w_pfcsecurity_targetselection
integer x = 32
integer y = 332
integer width = 1472
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Adjust Library &Search Path, if necessary:"
boolean focusrectangle = false
end type

type st_target from statictext within w_pfcsecurity_targetselection
integer x = 32
integer y = 56
integer width = 1472
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Browse for a &target file containing the application you wish to scan."
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_pfcsecurity_targetselection
integer x = 1111
integer y = 1836
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "OK"
boolean default = true
end type

event clicked;long ll_l, ll_libs
string ls_liblist, ls_return, ls_libs[]

ll_libs = mle_1.f_GetLibraries ( ls_libs )
For ll_l = 1 to ll_libs
	ls_liblist = ls_liblist + ls_libs[ll_l] + ";" 
Next

ls_return = is_appname + "~t" + ls_liblist
openwithparm ( w_pfcsecurity_objectlist, ls_return)

Close ( parent )
end event

type cb_1 from commandbutton within w_pfcsecurity_targetselection
integer x = 1815
integer y = 408
integer width = 73
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&..."
end type

event clicked;//*-----------------------------------------------------------------*/
//*    clicked:  Browse for library
//*-----------------------------------------------------------------*/
long ll_rc, ll_f, ll_files
string ls_type, ls_filenames[], ls_path

/*  Get the platform-specific extension of PowerBuilder library  */
ls_type = mle_1.inv_file.is_FileType

// Note: GetFileSaveName - passing a string array for filename arg
//      allows multi-select (new for 7.0)
ll_rc = GetFileOpenName ( "Select Library", &
					ls_path, ls_filenames, ls_type, &
					"PB Libraries (*." + ls_type + "),*." + ls_type )
			
If ll_rc = 1 Then
	If UpperBound ( ls_filenames ) = 1 Then
		mle_1.f_AddToList ( ls_path ) 
	Else
		mle_1.f_AddToList ( ls_path, ls_filenames ) 
	End If
End If
end event

type mle_1 from base_librarylist within w_pfcsecurity_targetselection
integer x = 32
integer y = 408
integer width = 1783
integer height = 1400
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_browse from commandbutton within w_pfcsecurity_targetselection
integer x = 1815
integer y = 132
integer width = 73
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&..."
end type

event clicked;//*-----------------------------------------------------------------*/
//*    clicked:  Browse for target file name
//*-----------------------------------------------------------------*/
string ls_filename, ls_file
int li_rc

ls_filename = sle_targetfile.Text
li_rc = GetFileOpenName ( "Select Target File", &
			ls_filename, ls_file, "pbt", &
			"PowerBuilder Target (*.pbt),*.pbt" )

If li_rc = 1 Then
	sle_targetfile.Text = ls_filename
	sle_targetfile.TriggerEvent ( Modified! ) 
End If
end event

type sle_targetfile from singlelineedit within w_pfcsecurity_targetselection
integer x = 32
integer y = 132
integer width = 1783
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;long ll_l, ll_libs

f_GetLibList ( is_appname, is_applib, is_libs[] )

mle_1.f_Populate ( is_libs ) 

If Trim( this.Text ) = "" Then 
	mle_1.f_clearAll()
	cb_ok.Enabled = False
Else
	cb_ok.Enabled = True
End If
end event

type cb_select from commandbutton within w_pfcsecurity_targetselection
end type

type cb_exit from commandbutton within w_pfcsecurity_targetselection
integer x = 1472
integer y = 1836
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

event clicked;close(parent)
end event


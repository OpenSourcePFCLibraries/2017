HA$PBExportHeader$w_pfcsecurity_objectlist.srw
$PBExportComments$List the windows in the application and scans the ones selected
forward
global type w_pfcsecurity_objectlist from window
end type
type cb_2 from commandbutton within w_pfcsecurity_objectlist
end type
type cb_cancel from commandbutton within w_pfcsecurity_objectlist
end type
type cb_1 from commandbutton within w_pfcsecurity_objectlist
end type
type dw_1 from pfcscanner_u_dw within w_pfcsecurity_objectlist
end type
end forward

global type w_pfcsecurity_objectlist from window
integer width = 3168
integer height = 1876
boolean titlebar = true
string title = "Select Objects to be Scanned"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_scanlist ( )
event ue_postopen ( )
cb_2 cb_2
cb_cancel cb_cancel
cb_1 cb_1
dw_1 dw_1
end type
global w_pfcsecurity_objectlist w_pfcsecurity_objectlist

type variables
boolean	ib_canceled
integer	il_gutter
string	is_liblist, is_libs[]
string	is_app
end variables

event ue_scanlist;long ll_r, ll_rows
string ls_libs[], ls_liblist, ls_title, ls_object, ls_type, ls_library
pfcscanner_n_cst_securityscanner lnv_security
pfcscanner_n_cst_string lnv_string

SetPointer ( HourGlass! )

ls_libs = is_libs
ls_title = this.Title
ib_canceled = False
cb_cancel.enabled = True

SetPointer ( HourGlass! )

lnv_security = Create pfcscanner_n_cst_securityscanner
lnv_security.of_InitScanProcess ( inv_trans, is_app, ls_libs )

dw_1.SetFilter ( "IsSelected()" )
dw_1.Filter ( )

ll_rows = dw_1.RowCount ( )
dw_1.SelectRow ( 0, False )
For ll_r = 1 to ll_rows
	Yield()
	If ib_canceled Then Exit
	this.Title = ls_title + " (" + String ( ll_r ) + " of " + String ( ll_rows ) + ")"
	dw_1.ScrollToRow ( ll_r )
	dw_1.SelectRow ( ll_r, True )
	ls_object = dw_1.GetItemString ( ll_r, "name" )
	ls_type = Lower ( dw_1.GetItemString ( ll_r, "otype" ) )
	ls_library = dw_1.object.pbl[ll_r]
	Choose Case ls_type
		Case "window","menu","userobject"
			lnv_security.of_ScanObject ( ls_object, ls_library )
			Yield ( )
		Case "datawindow"
			lnv_security.of_ScanDataWindow ( ls_object, ls_library )
			Yield ( )
	End Choose
	If lnv_security.of_Update() <> 1 Then
		MessageBox ( this.Title, "Error updating " + ls_type + " - " + ls_object )
		Return 
	End If
Next

this.Title = ls_title 
dw_1.SelectRow ( 0, true )

dw_1.SetFilter ( "" )
dw_1.Filter ( )
dw_1.Sort ( )

Destroy lnv_security
cb_cancel.Enabled = False
end event

event ue_postopen;long ll_start, ll_end, ll_l, ll_libs, ll_x
string ls_libarray[], ls_init[]

SetPointer ( HourGlass! )

ll_libs = UpperBound ( is_libs ) 
For ll_l = 1 to ll_libs
	dw_1.ImportString ( LibraryDirectoryEX ( is_libs[ll_l], DirAll! ) )
	ll_start = ll_end + 1
	ll_end = dw_1.RowCount ( ) 
	ls_libarray = ls_init
	For ll_x = 1 to ( ll_end - ll_start + 1 ) 
		ls_libarray[ll_x] = is_libs[ll_l]
	Next
	dw_1.Object.PBL.Current [ll_start, ll_end ] = ls_libarray
	
Next

dw_1.Filter ( ) 
dw_1.Sort ( ) 
end event

on w_pfcsecurity_objectlist.create
this.cb_2=create cb_2
this.cb_cancel=create cb_cancel
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_cancel,&
this.cb_1,&
this.dw_1}
end on

on w_pfcsecurity_objectlist.destroy
destroy(this.cb_2)
destroy(this.cb_cancel)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;pfcscanner_n_cst_string lnv_string

is_liblist = message.stringparm
is_app = left(is_liblist,pos(is_liblist,'~t') - 1)
is_liblist = mid(is_liblist,pos(is_liblist,'~t') + 1)
lnv_string.of_ParseToArray ( is_liblist, ";", is_libs ) 

cb_cancel.enabled = false

this.event post ue_postopen()
end event

event resize;dw_1.Resize ( this.WorkSpaceWidth ( ) - dw_1.X - 24, this.WorkSpaceHeight ( ) - dw_1.Y - 24) 
end event

type cb_2 from commandbutton within w_pfcsecurity_objectlist
integer x = 745
integer y = 12
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
end type

event clicked;Close ( parent )
end event

type cb_cancel from commandbutton within w_pfcsecurity_objectlist
integer x = 384
integer y = 12
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Cancel"
boolean cancel = true
end type

event clicked;ib_canceled = True
end event

type cb_1 from commandbutton within w_pfcsecurity_objectlist
integer x = 23
integer y = 12
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Scan"
end type

event clicked;parent.Post Event ue_scanlist ( )

end event

type dw_1 from pfcscanner_u_dw within w_pfcsecurity_objectlist
integer x = 27
integer y = 120
integer width = 3095
integer height = 1640
integer taborder = 10
string title = "none"
string dataobject = "d_pfcsecurity_objectlist"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;ib_extended = true
end event


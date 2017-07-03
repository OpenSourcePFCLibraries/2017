HA$PBExportHeader$w_findreplacerte.srw
$PBExportComments$Example using Find/Replace Service on a rte
forward
global type w_findreplacerte from w_main
end type
type cb_find from u_cb within w_findreplacerte
end type
type cb_replace from u_cb within w_findreplacerte
end type
type rte_1 from u_rte within w_findreplacerte
end type
type cb_close from u_cb within w_findreplacerte
end type
end forward

global type w_findreplacerte from w_main
integer x = 283
integer y = 28
integer width = 2272
integer height = 1704
string title = "PFC Example - Find and Replace in a RTE"
boolean resizable = false
cb_find cb_find
cb_replace cb_replace
rte_1 rte_1
cb_close cb_close
end type
global w_findreplacerte w_findreplacerte

on w_findreplacerte.create
int iCurrent
call super::create
this.cb_find=create cb_find
this.cb_replace=create cb_replace
this.rte_1=create rte_1
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_find
this.Control[iCurrent+2]=this.cb_replace
this.Control[iCurrent+3]=this.rte_1
this.Control[iCurrent+4]=this.cb_close
end on

on w_findreplacerte.destroy
call super::destroy
destroy(this.cb_find)
destroy(this.cb_replace)
destroy(this.rte_1)
destroy(this.cb_close)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Makes sure that the document loaded into the RTE is scrolled to the top.
//
//////////////////////////////////////////////////////////////////////////////

rte_1.Scroll(-50)
end event

type cb_find from u_cb within w_findreplacerte
string text = "&Find"
integer x = 1129
integer y = 1488
integer taborder = 20
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Calls the pfc_finddlg event on the Rich Text Edit control to 
// invoke the find dialog.
//
//////////////////////////////////////////////////////////////////////////////

rte_1.event pfc_finddlg()
end event

type cb_replace from u_cb within w_findreplacerte
string text = "&Replace"
integer x = 1499
integer y = 1488
integer taborder = 30
boolean bringtotop = true
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Calls the pfc_replacedlg event on the Rich Text Edit control to 
// invoke the replace dialog.
//
//////////////////////////////////////////////////////////////////////////////

rte_1.event pfc_replacedlg()
end event

type rte_1 from u_rte within w_findreplacerte
boolean init_vscrollbar = true
long init_backcolor = 1090519039
long init_inputfieldbackcolor = 1090519039
boolean init_rulerbar = true
integer x = 23
integer y = 24
integer width = 2194
integer height = 1424
integer taborder = 10
end type

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Loads the example's about information into Rich Text Edit for 
// presentation purposes.
//
//////////////////////////////////////////////////////////////////////////////


string	ls_document
string	ls_sql
string	ls_windowname

ls_windowname = Classname(parent)

// If the SQLSpy Window is open, pass it the proposed embedded sql statement.
if IsValid(gnv_app.inv_debug) then
	if IsValid(gnv_app.inv_debug.inv_sqlspy) then
		ls_sql = "SELECT 'examples'.'about'~r~nINTO :ls_document "+& 
			"~r~nFROM 'examples'~r~nWHERE 'examples'."+&
			"'window' = '" + ls_windowname + "'   ;"
		gnv_app.inv_debug.inv_sqlspy.of_SQLSyntax("Get Example's 'About' Information", ls_sql)
	end if
end if

	SELECT "examples"."about"  
	INTO :ls_document  
	FROM "examples"  
	WHERE "examples"."window" = :ls_windowname   ;

rte_1.PasteRTF(ls_document)
of_SetFind(true)
end event

on rte_1.create
call super::create
VScrollBar=true
RulerBar=true
BackColor=1090519039
InputFieldBackColor=1090519039
end on

type cb_close from u_cb within w_findreplacerte
string text = "Close"
boolean cancel = true
integer x = 1870
integer y = 1488
integer taborder = 40
boolean bringtotop = true
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Calls the pfc_close event on the window.
//
//////////////////////////////////////////////////////////////////////////////

parent.event pfc_close()
end event


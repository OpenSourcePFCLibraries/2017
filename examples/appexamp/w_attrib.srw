HA$PBExportHeader$w_attrib.srw
$PBExportComments$Window to set File Attributes for File Services example
forward
global type w_attrib from w_response
end type
type cbx_readonly from u_cbx within w_attrib
end type
type cbx_system from u_cbx within w_attrib
end type
type cbx_hidden from u_cbx within w_attrib
end type
type cbx_archive from u_cbx within w_attrib
end type
type cb_ok from u_cb within w_attrib
end type
type cb_cancel from u_cb within w_attrib
end type
end forward

global type w_attrib from w_response
integer x = 965
integer y = 704
integer width = 896
integer height = 480
string title = "File Attributes"
cbx_readonly cbx_readonly
cbx_system cbx_system
cbx_hidden cbx_hidden
cbx_archive cbx_archive
cb_ok cb_ok
cb_cancel cb_cancel
end type
global w_attrib w_attrib

on w_attrib.create
int iCurrent
call super::create
this.cbx_readonly=create cbx_readonly
this.cbx_system=create cbx_system
this.cbx_hidden=create cbx_hidden
this.cbx_archive=create cbx_archive
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_readonly
this.Control[iCurrent+2]=this.cbx_system
this.Control[iCurrent+3]=this.cbx_hidden
this.Control[iCurrent+4]=this.cbx_archive
this.Control[iCurrent+5]=this.cb_ok
this.Control[iCurrent+6]=this.cb_cancel
end on

on w_attrib.destroy
call super::destroy
destroy(this.cbx_readonly)
destroy(this.cbx_system)
destroy(this.cbx_hidden)
destroy(this.cbx_archive)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

event open;call super::open;string				ls_Parm, ls_readonly, ls_hidden, ls_system, ls_archive
n_cst_conversion	lnv_conversion	

ls_parm = message.stringparm

ls_readonly = left(ls_parm, 1)
ls_hidden = mid(ls_parm, 2, 1)
ls_system = mid(ls_parm, 3, 1)
ls_archive = right(ls_parm, 1)

cbx_readonly.checked = lnv_conversion.of_boolean(ls_readonly)
cbx_hidden.checked = lnv_conversion.of_boolean(ls_hidden)
cbx_system.checked = lnv_conversion.of_boolean(ls_system)
cbx_archive.checked = lnv_conversion.of_boolean(ls_archive)

end event

type cbx_readonly from u_cbx within w_attrib
string text = "Read Only"
integer x = 41
integer y = 28
integer width = 334
integer taborder = 10
end type

type cbx_system from u_cbx within w_attrib
string text = "System"
integer x = 41
integer y = 124
integer width = 279
integer taborder = 20
boolean bringtotop = true
end type

type cbx_hidden from u_cbx within w_attrib
string text = "Hidden"
integer x = 526
integer y = 28
integer width = 283
integer taborder = 30
boolean bringtotop = true
end type

type cbx_archive from u_cbx within w_attrib
string text = "Archive"
integer x = 526
integer y = 124
integer width = 265
integer taborder = 40
boolean bringtotop = true
end type

type cb_ok from u_cb within w_attrib
string text = "OK"
boolean default = true
integer x = 114
integer y = 256
integer width = 297
integer taborder = 50
end type

event clicked;call u_cb::clicked;String	ls_Parm

If cbx_readonly.checked Then
	ls_Parm = "1"
Else
	ls_Parm = "0"
End if

If cbx_hidden.checked Then
	ls_Parm = ls_Parm + "1"
Else
	ls_Parm = ls_Parm + "0"
End if

If cbx_system.checked Then
	ls_Parm = ls_Parm + "1"
Else
	ls_Parm = ls_Parm + "0"
End if

If cbx_archive.checked Then
	ls_Parm = ls_Parm + "1"
Else
	ls_Parm = ls_Parm + "0"
End if

CloseWithReturn(Parent, ls_Parm)

end event

type cb_cancel from u_cb within w_attrib
string text = "Cancel"
integer x = 457
integer y = 256
integer width = 297
integer taborder = 60
boolean bringtotop = true
end type

event clicked;call u_cb::clicked;CloseWithReturn(Parent, "")
end event


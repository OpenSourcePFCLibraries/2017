HA$PBExportHeader$w_dropdownsearchlb.srw
$PBExportComments$Example using DropDown Search DW Service with LB
forward
global type w_dropdownsearchlb from w_main
end type
type cb_close from u_cb within w_dropdownsearchlb
end type
type ddlb_states from u_ddlb within w_dropdownsearchlb
end type
type ddplb_states from u_ddplb within w_dropdownsearchlb
end type
type st_ddplb from u_st within w_dropdownsearchlb
end type
type st_1 from u_st within w_dropdownsearchlb
end type
type st_ddlb from u_st within w_dropdownsearchlb
end type
type st_2 from u_st within w_dropdownsearchlb
end type
type st_3 from u_st within w_dropdownsearchlb
end type
end forward

global type w_dropdownsearchlb from w_main
integer x = 658
integer y = 240
integer width = 1600
integer height = 1068
string title = "PFC Example - Type Ahead in the DDLB & DDPLB"
boolean resizable = false
cb_close cb_close
ddlb_states ddlb_states
ddplb_states ddplb_states
st_ddplb st_ddplb
st_1 st_1
st_ddlb st_ddlb
st_2 st_2
st_3 st_3
end type
global w_dropdownsearchlb w_dropdownsearchlb

on w_dropdownsearchlb.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.ddlb_states=create ddlb_states
this.ddplb_states=create ddplb_states
this.st_ddplb=create st_ddplb
this.st_1=create st_1
this.st_ddlb=create st_ddlb
this.st_2=create st_2
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.ddlb_states
this.Control[iCurrent+3]=this.ddplb_states
this.Control[iCurrent+4]=this.st_ddplb
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_ddlb
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_3
end on

on w_dropdownsearchlb.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.ddlb_states)
destroy(this.ddplb_states)
destroy(this.st_ddplb)
destroy(this.st_1)
destroy(this.st_ddlb)
destroy(this.st_2)
destroy(this.st_3)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Load DDLB & DDPLB with data from state table.
//
//////////////////////////////////////////////////////////////////////////////

string	ls_sql
string	ls_statename

SetPointer(hourglass!)

// If the SQLSpy Window is open, pass it the proposed embedded sql statement.
if IsValid(gnv_app.inv_debug) then
	if IsValid(gnv_app.inv_debug.inv_sqlspy) then
		ls_sql = "SELECT 'states'.'state_name'~r~nFROM 'states'~r~n"+&
			"WHERE 'states'.'country' = 'USA'   ;"
		gnv_app.inv_debug.inv_sqlspy.of_SQLSyntax("Get US State Names", ls_sql)
	end if
end if

DECLARE sqlcursor CURSOR FOR  
SELECT "states"."state_name"  
FROM "states"
WHERE "states"."country" = 'USA';
	
open sqlcursor;
if sqlca.sqlcode < 0 then
	MessageBox("DataBase Error!", sqlca.sqlerrtext, exclamation!)
	return 
end if 

do while sqlca.sqlcode = 0
	FETCH sqlcursor into :ls_statename;
	if sqlca.sqlcode = 0 then
		ddlb_states.AddItem(ls_statename)
		ddplb_states.AddItem(ls_statename,1)
	elseif sqlca.sqlcode < 0 then
		MessageBox("DataBase Error", sqlca.sqlerrtext, exclamation!)
		return -1
	else
		exit
	end if
loop
close sqlcursor;

ddlb_states.SelectItem(1)
ddplb_states.SelectItem(1)

end event

type cb_close from u_cb within w_dropdownsearchlb
string text = "Close"
boolean cancel = true
integer x = 1179
integer y = 840
integer taborder = 30
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

type ddlb_states from u_ddlb within w_dropdownsearchlb
long textcolor = 41943040
long backcolor = 1080593568
boolean allowedit = true
integer x = 87
integer y = 380
integer width = 640
integer height = 432
integer taborder = 10
end type

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
// Enable DDLB search capabilities.
//
//////////////////////////////////////////////////////////////////////////////

ib_search = true
end event

type ddplb_states from u_ddplb within w_dropdownsearchlb
string picturename[] = {"Globals!"}
long textcolor = 41943040
long backcolor = 1080593568
boolean allowedit = true
integer x = 891
integer y = 380
integer width = 640
integer height = 432
integer taborder = 20
end type

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
// Enable DDPLB search capabilities.
//
//////////////////////////////////////////////////////////////////////////////

ib_search= true


end event

type st_ddplb from u_st within w_dropdownsearchlb
long textcolor = 41943040
long backcolor = 79219928
string text = "Drop-down Picture List Box:"
integer x = 891
integer y = 308
integer width = 640
boolean bringtotop = true
end type

type st_1 from u_st within w_dropdownsearchlb
long textcolor = 33554432
long backcolor = 79219928
string text = "Sample the ~"type ahead~" search features of PFC~'s Drop-down"
alignment alignment = center!
integer x = 82
integer y = 44
integer width = 1445
integer height = 60
boolean bringtotop = true
end type

type st_ddlb from u_st within w_dropdownsearchlb
long textcolor = 41943040
long backcolor = 79219928
string text = "Drop-down List Box:"
integer x = 82
integer y = 308
integer width = 640
boolean bringtotop = true
end type

type st_2 from u_st within w_dropdownsearchlb
long textcolor = 33554432
long backcolor = 79219928
string text = "List Box and Drop-down Picture List Box by typing the name"
alignment alignment = center!
integer x = 82
integer y = 108
integer width = 1445
integer height = 60
boolean bringtotop = true
end type

type st_3 from u_st within w_dropdownsearchlb
long textcolor = 33554432
long backcolor = 79219928
string text = "of a US state into the single line edit portion of the controls below."
alignment alignment = center!
integer x = 82
integer y = 172
integer width = 1445
integer height = 60
boolean bringtotop = true
end type


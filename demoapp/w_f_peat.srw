HA$PBExportHeader$w_f_peat.srw
$PBExportComments$PEAT Frame window
forward
global type w_f_peat from w_frame
end type
end forward

global type w_f_peat from w_frame
integer x = 5
integer y = 4
integer width = 2935
integer height = 1928
string title = "Project Estimation and Actual Tracking System"
string menuname = "m_peat_frame"
windowstate windowstate = maximized!
string icon = "peat.ico"
boolean toolbarvisible = false
end type
global w_f_peat w_f_peat

event open;call super::open;this.Event pfc_open()
end event

on w_f_peat.create
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_peat_frame" then this.MenuID = create m_peat_frame
end on

on w_f_peat.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event pfc_new;call super::pfc_new;w_s_projectlist	w_active
string				ls_name

SetPointer(HourGlass!)
OpenWithParm(w_r_projectwizard, 0)
ls_name = message.stringparm
IF ls_name <> "" THEN
	w_active = this.GetActiveSheet()
	IF IsValid(w_active) THEN
		w_active.of_addnewproject(ls_name)
	END IF
END IF


end event

event pfc_postopen;call super::pfc_postopen;OpenSheet(w_s_projectlist, this, 0, layered!)
end event


HA$PBExportHeader$w_grid.srw
$PBExportComments$Extension Grid dialog window
forward
global type w_grid from pfc_w_grid
end type
end forward

global type w_grid from pfc_w_grid
end type
global w_grid w_grid

on w_grid.create
call super::create
end on

on w_grid.destroy
call super::destroy
end on

type cb_down from pfc_w_grid`cb_down within w_grid
end type

type cb_up from pfc_w_grid`cb_up within w_grid
end type

type cb_invisible_all from pfc_w_grid`cb_invisible_all within w_grid
end type

type cb_visible_all from pfc_w_grid`cb_visible_all within w_grid
end type

type cb_apply from pfc_w_grid`cb_apply within w_grid
end type

type cb_ok from pfc_w_grid`cb_ok within w_grid
end type

type cb_cancel from pfc_w_grid`cb_cancel within w_grid
end type

type dw_1 from pfc_w_grid`dw_1 within w_grid
end type


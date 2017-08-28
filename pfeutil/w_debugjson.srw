HA$PBExportHeader$w_debugjson.srw
$PBExportComments$Extension display debugJSON utility window used by the debug service
forward
global type w_debugjson from pfc_w_debugjson
end type
end forward

global type w_debugjson from pfc_w_debugjson
end type
global w_debugjson w_debugjson

on w_debugjson.create
call super::create
end on

on w_debugjson.destroy
call super::destroy
end on

type dw_debugjson from pfc_w_debugjson`dw_debugjson within w_debugjson
end type

type cb_print from pfc_w_debugjson`cb_print within w_debugjson
end type

type cb_clear from pfc_w_debugjson`cb_clear within w_debugjson
end type

type cb_close from pfc_w_debugjson`cb_close within w_debugjson
end type

type cb_dlghelp from pfc_w_debugjson`cb_dlghelp within w_debugjson
end type


HA$PBExportHeader$pfc_w_popup.srw
$PBExportComments$PFC Popup Window class
forward
global type pfc_w_popup from w_master
end type
end forward

global type pfc_w_popup from w_master
int X=214
int Y=221
int Width=2497
int Height=1492
WindowType WindowType=popup!
end type
global pfc_w_popup pfc_w_popup

on pfc_w_popup.create
call w_master::create
end on

on pfc_w_popup.destroy
call w_master::destroy
end on


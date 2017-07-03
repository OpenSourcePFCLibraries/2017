HA$PBExportHeader$pfc_w_child.srw
$PBExportComments$PFC Child Window class
forward
global type pfc_w_child from w_master
end type
end forward

global type pfc_w_child from w_master
int X=214
int Y=221
int Width=2497
int Height=1492
WindowType WindowType=child!
end type
global pfc_w_child pfc_w_child

on pfc_w_child.create
call w_master::create
end on

on pfc_w_child.destroy
call w_master::destroy
end on


HA$PBExportHeader$pfc_w_main.srw
$PBExportComments$PFC Main Window class
forward
global type pfc_w_main from w_master
end type
end forward

global type pfc_w_main from w_master
int Width=2692
int Height=1732
end type
global pfc_w_main pfc_w_main

on pfc_w_main.create
call w_master::create
end on

on pfc_w_main.destroy
call w_master::destroy
end on


HA$PBExportHeader$w_frame.srw
$PBExportComments$Extension Frame Window class
forward
global type w_frame from pfc_w_frame
end type
end forward

global type w_frame from pfc_w_frame
end type
global w_frame w_frame

on w_frame.create
call pfc_w_frame::create
end on

on w_frame.destroy
call pfc_w_frame::destroy
if IsValid(MenuID) then destroy(MenuID)
end on


HA$PBExportHeader$w_sheet.srw
$PBExportComments$Extension Sheet Window class
forward
global type w_sheet from pfc_w_sheet
end type
end forward

global type w_sheet from pfc_w_sheet
end type
global w_sheet w_sheet

on w_sheet.create
call pfc_w_sheet::create
end on

on w_sheet.destroy
call pfc_w_sheet::destroy
if IsValid(MenuID) then destroy(MenuID)
end on


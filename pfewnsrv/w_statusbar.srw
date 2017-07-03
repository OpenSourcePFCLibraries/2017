HA$PBExportHeader$w_statusbar.srw
$PBExportComments$Extension Statusbar window
forward
global type w_statusbar from pfc_w_statusbar
end type
end forward

global type w_statusbar from pfc_w_statusbar
int Width=1761
int Height=97
end type
global w_statusbar w_statusbar

on w_statusbar.create
call pfc_w_statusbar::create
end on

on w_statusbar.destroy
call pfc_w_statusbar::destroy
end on


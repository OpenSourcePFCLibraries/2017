HA$PBExportHeader$n_cst_environment.sru
$PBExportComments$Extension Environment service
forward
global type n_cst_environment from pfc_n_cst_environment
end type
end forward

global type n_cst_environment from pfc_n_cst_environment
end type

on n_cst_environment.create
call super::create
end on

on n_cst_environment.destroy
call super::destroy
end on


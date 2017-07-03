HA$PBExportHeader$n_cst_dwsrv_report.sru
$PBExportComments$Extension DataWindow Reporting service
forward
global type n_cst_dwsrv_report from pfc_n_cst_dwsrv_report
end type
end forward

global type n_cst_dwsrv_report from pfc_n_cst_dwsrv_report
end type
global n_cst_dwsrv_report n_cst_dwsrv_report

on n_cst_dwsrv_report.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsrv_report.destroy
TriggerEvent( this, "destructor" )
end on


HA$PBExportHeader$pfc_n_cst_json_tagattrib.sru
$PBExportComments$JSON Tag attrib
forward
global type pfc_n_cst_json_tagattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_json_tagattrib from n_cst_baseattrib
end type
global pfc_n_cst_json_tagattrib pfc_n_cst_json_tagattrib

type variables
constant string	cst_CR = "~r"
constant string	cst_LF = "~n"
constant string cst_CRLF = cst_CR + cst_LF
constant string	cst_HT = "~t"
constant string	cst_FORMAT = cst_CRLF + cst_HT
constant string	cst_OBJ_START = "{"
constant string	cst_OBJ_END = "}"
constant string cst_PAIR_SEP = ":"
constant string cst_VAL_START = '"'
constant string cst_VAL_END = '"'
constant string cst_ENT_SEP = ","
constant string cst_ARRAY_START = "["
constant string cst_ARRAY_END = "]"

constant integer cst_OBJ_START_len	= len( cst_OBJ_START)
constant integer cst_OBJ_END_len	= len( cst_OBJ_END)
constant integer cst_PAIR_SEP_len 	= len( cst_PAIR_SEP)
constant integer cst_VAL_START_len = len( cst_VAL_START)
constant integer cst_VAL_END_len 	= len( cst_VAL_END)
constant integer cst_ENT_SEP_len 	= len( cst_ENT_SEP)
constant integer cst_ARRAY_START_len =len( cst_array_start )
constant integer cst_ARRAY_END_len = len( cst_array_end )

constant integer cst_OBJ_KIND 		= 1
constant integer cst_VAL_KIND 		= 2
constant integer cst_ARRAY_KIND 	= 3
end variables

on pfc_n_cst_json_tagattrib.create
call super::create
end on

on pfc_n_cst_json_tagattrib.destroy
call super::destroy
end on


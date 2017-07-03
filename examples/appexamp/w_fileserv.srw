HA$PBExportHeader$w_fileserv.srw
$PBExportComments$Window to show file services
forward
global type w_fileserv from w_main
end type
type st_dir from u_st within w_fileserv
end type
type st_filespec from u_st within w_fileserv
end type
type st_filetype from u_st within w_fileserv
end type
type sle_dir from u_sle within w_fileserv
end type
type sle_filespec from u_sle within w_fileserv
end type
type sle_type from u_sle within w_fileserv
end type
type gb_sort from u_gb within w_fileserv
end type
type rb_filename from u_rb within w_fileserv
end type
type rb_fileext from u_rb within w_fileserv
end type
type rb_datetime from u_rb within w_fileserv
end type
type rb_size from u_rb within w_fileserv
end type
type dw_dirlist from u_dw within w_fileserv
end type
type cb_list from u_cb within w_fileserv
end type
type cb_driveinfo from u_cb within w_fileserv
end type
type cb_createdir from u_cb within w_fileserv
end type
type cb_removedir from u_cb within w_fileserv
end type
type cb_deletetree from u_cb within w_fileserv
end type
type cb_rename from u_cb within w_fileserv
end type
type cb_copyfile from u_cb within w_fileserv
end type
type cb_deletefile from u_cb within w_fileserv
end type
type cb_datetime from u_cb within w_fileserv
end type
type cb_attrib from u_cb within w_fileserv
end type
type cb_close from u_cb within w_fileserv
end type
end forward

global type w_fileserv from w_main
int X=5
int Y=4
int Width=2482
int Height=1916
boolean TitleBar=true
string Title="PFC Example - File Services Example"
st_dir st_dir
st_filespec st_filespec
st_filetype st_filetype
sle_dir sle_dir
sle_filespec sle_filespec
sle_type sle_type
gb_sort gb_sort
rb_filename rb_filename
rb_fileext rb_fileext
rb_datetime rb_datetime
rb_size rb_size
dw_dirlist dw_dirlist
cb_list cb_list
cb_driveinfo cb_driveinfo
cb_createdir cb_createdir
cb_removedir cb_removedir
cb_deletetree cb_deletetree
cb_rename cb_rename
cb_copyfile cb_copyfile
cb_deletefile cb_deletefile
cb_datetime cb_datetime
cb_attrib cb_attrib
cb_close cb_close
end type
global w_fileserv w_fileserv

type variables
Protected:
string		is_separator
string		is_filespec
string		is_currdir
n_cst_dirattrib	inv_dirlist[]
n_cst_filesrv	inv_filesrv
end variables

forward prototypes
public subroutine f_dirimport ()
end prototypes

public subroutine f_dirimport ();integer		li_cnt
integer		li_entries
integer		li_sort
string		ls_import
string		ls_filespec

SetPointer(HourGlass!)

if Right(sle_dir.text, 1) <> is_separator then
	ls_filespec = sle_dir.Text + is_separator
else
	ls_filespec = sle_dir.Text
end if

li_entries = inv_filesrv.of_DirList(ls_filespec + sle_filespec.text, Long(sle_type.text), inv_dirlist)
if li_entries < 0 then
	MessageBox("File Services", "Directory not found", Exclamation!)
	return
elseif li_entries = 0 then
	MessageBox("File Services", "No files found", Exclamation!)
	return
end if

if rb_filename.checked then
	inv_filesrv.of_SortDirList(inv_dirlist, 1)
elseif rb_fileext.checked then
	inv_filesrv.of_SortDirList(inv_dirlist, 2)
elseif rb_datetime.checked then
	inv_filesrv.of_SortDirList(inv_dirlist, 3)
elseif rb_size.checked then
	inv_filesrv.of_SortDirList(inv_dirlist, 4)
end if

dw_dirlist.SetRedraw(false)
dw_dirlist.Reset()

for li_cnt = 1 to li_entries
	ls_import = ls_import + inv_dirlist[li_cnt].is_FileName + "~t" + &
				inv_dirlist[li_cnt].is_AltFileName + "~t" + &
				String(inv_dirlist[li_cnt].idb_FileSize) + "~t" + &
				String(inv_dirlist[li_cnt].id_LastWriteDate) + "~t" + &
				String(inv_dirlist[li_cnt].it_LastWriteTime) + "~t" 
//				String(inv_dirlist[li_cnt].id_CreationDate) + "~t" + &
//				String(inv_dirlist[li_cnt].it_CreationTime) + "~t" + &
//				String(inv_dirlist[li_cnt].id_LastAccessDate) + "~t"
	if inv_dirlist[li_cnt].ib_subdirectory then ls_import = ls_import + "d"
	if inv_dirlist[li_cnt].ib_readonly then ls_import = ls_import + "r"
	if inv_dirlist[li_cnt].ib_hidden then ls_import = ls_import + "h"
	if inv_dirlist[li_cnt].ib_system then ls_import = ls_import + "s"
	if inv_dirlist[li_cnt].ib_archive then ls_import = ls_import + "a"
	ls_import = ls_import + "~r~n"
next

dw_dirlist.ImportString(ls_import)

if is_currdir <> sle_dir.text then
	inv_filesrv.of_ChangeDirectory(sle_dir.text)
	is_currdir = inv_filesrv.of_GetCurrentDirectory()
	sle_dir.text = is_currdir
end if

dw_dirlist.SetRedraw(true)

end subroutine

on w_fileserv.create
int iCurrent
call super::create
this.st_dir=create st_dir
this.st_filespec=create st_filespec
this.st_filetype=create st_filetype
this.sle_dir=create sle_dir
this.sle_filespec=create sle_filespec
this.sle_type=create sle_type
this.gb_sort=create gb_sort
this.rb_filename=create rb_filename
this.rb_fileext=create rb_fileext
this.rb_datetime=create rb_datetime
this.rb_size=create rb_size
this.dw_dirlist=create dw_dirlist
this.cb_list=create cb_list
this.cb_driveinfo=create cb_driveinfo
this.cb_createdir=create cb_createdir
this.cb_removedir=create cb_removedir
this.cb_deletetree=create cb_deletetree
this.cb_rename=create cb_rename
this.cb_copyfile=create cb_copyfile
this.cb_deletefile=create cb_deletefile
this.cb_datetime=create cb_datetime
this.cb_attrib=create cb_attrib
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_dir
this.Control[iCurrent+2]=this.st_filespec
this.Control[iCurrent+3]=this.st_filetype
this.Control[iCurrent+4]=this.sle_dir
this.Control[iCurrent+5]=this.sle_filespec
this.Control[iCurrent+6]=this.sle_type
this.Control[iCurrent+7]=this.gb_sort
this.Control[iCurrent+8]=this.rb_filename
this.Control[iCurrent+9]=this.rb_fileext
this.Control[iCurrent+10]=this.rb_datetime
this.Control[iCurrent+11]=this.rb_size
this.Control[iCurrent+12]=this.dw_dirlist
this.Control[iCurrent+13]=this.cb_list
this.Control[iCurrent+14]=this.cb_driveinfo
this.Control[iCurrent+15]=this.cb_createdir
this.Control[iCurrent+16]=this.cb_removedir
this.Control[iCurrent+17]=this.cb_deletetree
this.Control[iCurrent+18]=this.cb_rename
this.Control[iCurrent+19]=this.cb_copyfile
this.Control[iCurrent+20]=this.cb_deletefile
this.Control[iCurrent+21]=this.cb_datetime
this.Control[iCurrent+22]=this.cb_attrib
this.Control[iCurrent+23]=this.cb_close
end on

on w_fileserv.destroy
call super::destroy
destroy(this.st_dir)
destroy(this.st_filespec)
destroy(this.st_filetype)
destroy(this.sle_dir)
destroy(this.sle_filespec)
destroy(this.sle_type)
destroy(this.gb_sort)
destroy(this.rb_filename)
destroy(this.rb_fileext)
destroy(this.rb_datetime)
destroy(this.rb_size)
destroy(this.dw_dirlist)
destroy(this.cb_list)
destroy(this.cb_driveinfo)
destroy(this.cb_createdir)
destroy(this.cb_removedir)
destroy(this.cb_deletetree)
destroy(this.cb_rename)
destroy(this.cb_copyfile)
destroy(this.cb_deletefile)
destroy(this.cb_datetime)
destroy(this.cb_attrib)
destroy(this.cb_close)
end on

event open;call super::open;f_setfilesrv(inv_Filesrv, True)

is_separator = inv_filesrv.of_getseparator()
sle_dir.text = inv_Filesrv.of_getcurrentdirectory()
sle_type.text = "16406"
sle_filespec.text = inv_filesrv.of_getallfilesspecifier()
is_CurrDir = sle_dir.text

ib_disableclosequery = TRUE




end event

event close;f_setfilesrv(inv_Filesrv, False)
end event

type st_dir from u_st within w_fileserv
int X=64
int Y=56
int Width=402
string Text="Current Directory:"
long TextColor=41943040
long BackColor=79219928
end type

type st_filespec from u_st within w_fileserv
int X=224
int Y=152
int Width=238
boolean BringToTop=true
string Text="File Spec:"
Alignment Alignment=Right!
long TextColor=41943040
long BackColor=79219928
end type

type st_filetype from u_st within w_fileserv
int X=315
int Y=248
int Width=151
boolean BringToTop=true
string Text="Type:"
Alignment Alignment=Right!
long TextColor=41943040
long BackColor=79219928
end type

type sle_dir from u_sle within w_fileserv
int X=475
int Y=56
int Width=878
int Height=80
int TabOrder=10
long TextColor=41943040
long BackColor=1080593568
end type

type sle_filespec from u_sle within w_fileserv
int X=475
int Y=152
int Height=80
int TabOrder=20
boolean BringToTop=true
long TextColor=41943040
long BackColor=1080593568
end type

type sle_type from u_sle within w_fileserv
int X=475
int Y=248
int Width=270
int Height=80
int TabOrder=30
boolean BringToTop=true
long TextColor=41943040
long BackColor=1080593568
end type

type gb_sort from u_gb within w_fileserv
int X=475
int Y=364
int Width=1435
int Height=148
int TabOrder=40
string Text="Sort"
long TextColor=41943040
long BackColor=79219928
end type

type rb_filename from u_rb within w_fileserv
int X=558
int Y=424
int Width=315
boolean BringToTop=true
string Text="File Name"
boolean Checked=true
long TextColor=41943040
long BackColor=79219928
end type

event clicked;call super::clicked;f_DirImport()
end event

type rb_fileext from u_rb within w_fileserv
int X=905
int Y=424
int Width=315
boolean BringToTop=true
string Text="File Ext."
long TextColor=41943040
long BackColor=79219928
end type

event clicked;call super::clicked;f_DirImport()
end event

type rb_datetime from u_rb within w_fileserv
int X=1248
int Y=424
int Width=315
boolean BringToTop=true
string Text="Date/Time"
long TextColor=41943040
long BackColor=79219928
end type

event clicked;call super::clicked;f_DirImport()
end event

type rb_size from u_rb within w_fileserv
int X=1595
int Y=424
int Width=174
boolean BringToTop=true
string Text="Size"
long TextColor=41943040
long BackColor=79219928
end type

event clicked;call super::clicked;f_DirImport()
end event

type dw_dirlist from u_dw within w_fileserv
int X=59
int Y=540
int Width=1920
int Height=1188
int TabOrder=50
string DataObject="d_dirlist"
end type

event clicked;call super::clicked;This.SelectRow(0, False)
This.SelectRow(row, True)

end event

event doubleclicked;call super::doubleclicked;integer			li_row
integer			li_pos
string			ls_directory
n_cst_string	lnv_string

li_row = this.GetSelectedRow(0)
if li_row < 1 then return

if not inv_dirlist[li_row].ib_subdirectory and not inv_dirlist[li_row].ib_drive then return

if inv_dirlist[li_row].ib_subdirectory then
	ls_directory = Mid(inv_dirlist[li_row].is_filename, 2, (Len(inv_dirlist[li_row].is_filename) - 2))
	if ls_directory = ".." then
		li_pos = lnv_string.of_lastpos (is_currdir, is_separator)
		ls_directory = Left(is_currdir, (li_Pos - 1))
		if Right(ls_directory, 1) = ":" then ls_directory = ls_directory + is_separator
	else
		if Right(is_currdir, 1) <> is_separator then
			ls_directory = is_currdir + is_separator + ls_directory
		else
			ls_directory = is_currdir + ls_directory
		End if
	End if
else
	ls_directory = Mid(inv_dirlist[li_row].is_filename, 3, 1) + ":" + is_separator
End if

if inv_filesrv.of_changedirectory(ls_directory) < 0 then
	MessageBox("File Services", "Error Changing Directory", Exclamation!)
	Return
End if

is_currdir = inv_filesrv.of_GetCurrentDirectory()
sle_dir.text = is_currdir

cb_list.PostEvent(clicked!)

end event

event pfc_prermbmenu;call super::pfc_prermbmenu;// Set up the PopUp Menu.
am_dw.m_table.m_insert.enabled = False
am_dw.m_table.m_addrow.enabled = False
am_dw.m_table.m_delete.enabled = False

end event

type cb_list from u_cb within w_fileserv
int X=2030
int Y=544
int Width=361
int TabOrder=60
string Text="List"
end type

event clicked;call super::clicked;f_DirImport()
end event

type cb_driveinfo from u_cb within w_fileserv
int X=2030
int Y=652
int Width=361
int TabOrder=70
boolean BringToTop=true
string Text="Drive Info"
end type

event clicked;call super::clicked;String	ls_Drive
String	ls_Type
Long		ll_TotalSpace, ll_FreeSpace
Integer	li_Row

li_Row = dw_dirlist.GetSelectedRow(0)
If li_Row < 1 Then Return
If Not inv_DirList[li_Row].ib_Drive Then Return

ls_Drive = Mid(inv_DirList[li_Row].is_FileName, 3, 1)

If inv_Filesrv.of_getdiskspace(ls_Drive, ll_TotalSpace, ll_FreeSpace) < 0 Then
	MessageBox("File Services", "Error getting disk space information", Exclamation!)
	Return
End If

Choose Case inv_Filesrv.of_getdrivetype(ls_Drive)
Case 2
	ls_Type = "Floppy Drive"
Case 3
	ls_Type = "Hard Drive"
Case 4
	ls_Type = "Network Drive"
Case 5
	ls_Type = "CD Rom Drive"
Case 6
	ls_Type = "RamDisk"
Case Else
	MessageBox("File Services", "Error getting drive type", Exclamation!)
	Return
End Choose

MessageBox("File Services", "Drive '" + ls_Drive + "' is a " + ls_Type + ", with " + String(ll_FreeSpace) + &
					" out of " + String(ll_TotalSpace) + " bytes free.", Information!)

end event

type cb_createdir from u_cb within w_fileserv
int X=2030
int Y=760
int Width=361
int TabOrder=80
boolean BringToTop=true
string Text="Create Dir."
end type

event clicked;call super::clicked;Integer	li_Row, li_Pos
String	ls_Directory

OpenWithParm(w_actions, "Enter new directory name:")
ls_Directory = Message.StringParm
If Trim(ls_Directory) = "" Then Return

If Right(is_CurrDir, 1) <> is_separator Then
	ls_Directory = is_CurrDir + is_separator + ls_Directory
Else
	ls_Directory = is_CurrDir + ls_Directory
End if

If inv_Filesrv.of_createdirectory(ls_Directory) < 0 Then
	MessageBox("File Services", "Error Creating Directory '"+ls_directory + "'", Exclamation!)
	Return
End if

cb_list.PostEvent(clicked!)

end event

type cb_removedir from u_cb within w_fileserv
int X=2030
int Y=868
int Width=361
int TabOrder=90
boolean BringToTop=true
string Text="Remove Dir."
end type

event clicked;call super::clicked;Integer	li_Row
String	ls_Directory

li_Row = dw_dirlist.GetSelectedRow(0)
If li_Row < 1 Then Return

If Not inv_DirList[li_Row].ib_SubDirectory Then Return

If inv_DirList[li_Row].ib_SubDirectory Then
	ls_Directory = Mid(inv_DirList[li_Row].is_FileName, 2, (Len(inv_DirList[li_Row].is_FileName) - 2))
	If ls_Directory = ".." Then Return

	If Right(is_CurrDir, 1) <> is_separator Then
		ls_Directory = is_CurrDir + is_separator + ls_Directory
	Else
		ls_Directory = is_CurrDir + ls_Directory
	End if
End if

If MessageBox("File Services", "You are about to delete " + ls_Directory + ".  " + &
				"Are you sure you want to do this?", Question!, YesNo!) = 2 Then Return

If inv_Filesrv.of_removedirectory(ls_Directory) < 0 Then
	MessageBox("File Services", "Error Removing Directory '"+ls_directory + "'", Exclamation!)
	Return
End if

cb_list.PostEvent(clicked!)

end event

type cb_deletetree from u_cb within w_fileserv
int X=2030
int Y=980
int Width=361
int TabOrder=100
boolean BringToTop=true
string Text="Delete Tree"
end type

event clicked;call super::clicked;Integer	li_Row
String	ls_Directory

li_Row = dw_dirlist.GetSelectedRow(0)
If li_Row < 1 Then Return

If Not inv_DirList[li_Row].ib_SubDirectory Then Return

ls_Directory = Mid(inv_DirList[li_Row].is_FileName, 2, (Len(inv_DirList[li_Row].is_FileName) - 2))
If ls_Directory = ".." Then Return

If Right(is_CurrDir, 1) <> is_separator Then
	ls_Directory = is_CurrDir + is_separator + ls_Directory
Else
	ls_Directory = is_CurrDir + ls_Directory
End if

If MessageBox("File Services", "You are about to delete " + ls_Directory + " and all its files and subdirectories.  " + &
				"Are you sure you want to do this?", Question!, YesNo!) = 2 Then Return

If inv_Filesrv.of_deltree(ls_Directory) < 0 Then
	MessageBox("File Services", "Error erasing directory " + ls_Directory, Exclamation!)
	Return
End if

cb_list.PostEvent(clicked!)

end event

type cb_rename from u_cb within w_fileserv
int X=2030
int Y=1088
int Width=361
int TabOrder=110
boolean BringToTop=true
string Text="Rename"
end type

event clicked;call super::clicked;Integer	li_Row
String	ls_NewFile, ls_OldFile

li_Row = dw_dirlist.GetSelectedRow(0)
If li_Row < 1 Then Return

If inv_DirList[li_Row].ib_Drive Then Return

OpenWithParm(w_actions, "Enter new name:")
ls_NewFile = Message.StringParm
If Trim(ls_NewFile) = "" Then Return

If inv_DirList[li_Row].ib_Subdirectory Then
	ls_OldFile = Mid(inv_DirList[li_Row].is_FileName, 2, (Len(inv_DirList[li_Row].is_FileName) - 2))
Else
	ls_OldFile = inv_DirList[li_Row].is_FileName
End If

If Right(is_CurrDir, 1) <> is_separator Then
	ls_OldFile = is_CurrDir + is_separator + ls_OldFile
Else
	ls_OldFile = is_CurrDir + ls_OldFile
End if

If inv_Filesrv.of_filerename(ls_OldFile, ls_NewFile) < 0 Then
	MessageBox("File Services", "Error Renaming File", Exclamation!)
	Return
End if

cb_list.PostEvent(clicked!)

end event

type cb_copyfile from u_cb within w_fileserv
int X=2030
int Y=1196
int Width=361
int TabOrder=120
boolean BringToTop=true
string Text="Copy File"
end type

event clicked;call super::clicked;Integer	li_Row
String	ls_NewFile, ls_OldFile

li_Row = dw_dirlist.GetSelectedRow(0)
If li_Row < 1 Then Return

If inv_DirList[li_Row].ib_Subdirectory Or inv_DirList[li_Row].ib_Drive Then Return

OpenWithParm(w_actions, "Enter new file/directory:")
ls_NewFile = Message.StringParm
If Trim(ls_NewFile) = "" Then Return

If Right(is_CurrDir, 1) <> is_separator Then
	ls_OldFile = is_CurrDir + is_separator + inv_DirList[li_Row].is_FileName
Else
	ls_OldFile = is_CurrDir + inv_DirList[li_Row].is_FileName
End if

If inv_Filesrv.of_filecopy(ls_OldFile, ls_NewFile, False) < 0 Then
	MessageBox("File Services", "Error Copying File", Exclamation!)
	Return
End if

cb_list.PostEvent(clicked!)

end event

type cb_deletefile from u_cb within w_fileserv
int X=2030
int Y=1304
int Width=361
int TabOrder=130
boolean BringToTop=true
string Text="Delete File"
end type

event clicked;call super::clicked;Integer	li_Row, li_RC
String	ls_File

li_Row = dw_dirlist.GetSelectedRow(0)
If li_Row < 1 Then Return

If inv_DirList[li_Row].ib_SubDirectory Or inv_DirList[li_Row].ib_Drive Then Return

If Right(is_CurrDir, 1) <> is_separator Then
	ls_File = is_CurrDir + is_separator + inv_DirList[li_Row].is_FileName
Else
	ls_File = is_CurrDir + inv_DirList[li_Row].is_FileName
End if

If MessageBox("File Services", "You are about to delete " + ls_File + ".  " + &
				"Are you sure you want to do this?", Question!, YesNo!) = 2 Then Return

If Not FileDelete(ls_File) Then
	MessageBox("File Services", "Error Deleting File", Exclamation!)
	Return
End if

cb_list.PostEvent(clicked!)

end event

type cb_datetime from u_cb within w_fileserv
int X=2030
int Y=1412
int Width=361
int TabOrder=140
boolean BringToTop=true
string Text="Set Date/Time"
end type

event clicked;call super::clicked;Integer	li_Row, li_RC
Date	ld_Date
Time	lt_Time
String	ls_File, ls_Parm, ls_Date, ls_Time

li_Row = dw_dirlist.GetSelectedRow(0)
If li_Row < 1 Then Return

If inv_DirList[li_Row].ib_SubDirectory Or inv_DirList[li_Row].ib_Drive Then Return

If inv_FileSrv.of_getlastwritedatetime(inv_DirList[li_Row].is_FileName, ld_Date, lt_Time) <> 1 Then
	MessageBox("FileServices", "Error getting file date/time", Exclamation!)
	Return
End If

ls_Date = String(ld_Date, "mm/dd/yy")
ls_Time = String(lt_Time, "hh:mm:ss")
OpenWithParm(w_datetime, ls_Date + ls_Time)
ls_Parm = Message.StringParm
If Trim(ls_Parm) = "" Then Return

ld_Date = Date(Left(ls_Parm, 8))
lt_Time = Time(Right(ls_Parm, 8))

If Right(is_CurrDir, 1) <> is_separator Then
	ls_File = is_CurrDir + is_separator + inv_DirList[li_Row].is_FileName
Else
	ls_File = is_CurrDir + inv_DirList[li_Row].is_FileName
End if

If inv_Filesrv.of_setlastwritedatetime(ls_File, ld_Date, lt_Time) < 0 Then
	MessageBox("File Services", "Error changing file date/time", Exclamation!)
	Return
End if

cb_list.PostEvent(clicked!)

end event

type cb_attrib from u_cb within w_fileserv
int X=2030
int Y=1524
int Width=361
int TabOrder=150
boolean BringToTop=true
string Text="Set Attribute"
end type

event clicked;call super::clicked;Integer	li_Row
Boolean	lb_ReadOnly, lb_Hidden, lb_System, lb_Archive, lb_Subdirectory
String	ls_Parm

li_Row = dw_dirlist.GetSelectedRow(0)
If li_Row < 1 Then Return

If inv_DirList[li_Row].ib_SubDirectory Or inv_DirList[li_Row].ib_Drive Then Return

If inv_FileSrv.of_getfileattributes(inv_DirList[li_Row].is_FileName, lb_ReadOnly, lb_Hidden, lb_System, lb_Subdirectory, lb_Archive) <> 1 Then
	MessageBox("File Services", "Error getting file attributes", Exclamation!)
	Return
End If

If lb_ReadOnly Then
	ls_Parm = "1"
Else
	ls_Parm = "0"
End if
If lb_Hidden Then
	ls_Parm = ls_Parm + "1"
Else
	ls_Parm = ls_Parm + "0"
End if
If lb_System Then
	ls_Parm = ls_Parm + "1"
Else
	ls_Parm = ls_Parm + "0"
End if
If lb_Archive Then
	ls_Parm = ls_Parm + "1"
Else
	ls_Parm = ls_Parm + "0"
End if

OpenWithParm(w_attrib, ls_Parm)
ls_Parm = Message.StringParm
If Trim(ls_Parm) = "" Then Return

If Left(ls_Parm, 1) = "1" Then
	lb_ReadOnly = True
Else
	lb_ReadOnly = False
End If

If Mid(ls_Parm, 2, 1) = "1" Then
	lb_Hidden = True
Else
	lb_Hidden = False
End If

If Mid(ls_Parm, 3, 1) = "1" Then
	lb_System = True
Else
	lb_System = False
End If

If Mid(ls_Parm, 4, 1) = "1" Then
	lb_Archive = True
Else
	lb_Archive = False
End If

If inv_Filesrv.of_setfileattributes(inv_DirList[li_Row].is_FileName, lb_ReadOnly, lb_Hidden, lb_System, lb_Archive) < 0 Then
	MessageBox("File Services", "Error changing file attributes", Exclamation!)
	Return
End if

cb_list.PostEvent(clicked!)

end event

type cb_close from u_cb within w_fileserv
int X=2030
int Y=1632
int Width=361
int TabOrder=160
boolean BringToTop=true
string Text="Close"
boolean Default=true
end type

event clicked;call super::clicked;Parent.Event pfc_close()
end event


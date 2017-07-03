HA$PBExportHeader$n_cst_platformattrib.sru
$PBExportComments$Extension About window attributes
forward
global type n_cst_platformattrib from pfc_n_cst_platformattrib
end type
end forward

global type n_cst_platformattrib from pfc_n_cst_platformattrib
end type

type prototypes

end prototypes

type variables
Public:

	//	ShellExecute
	CONSTANT Integer			SW_HIDE								= 0				//	Hides the window and activates another window.
	CONSTANT Integer			SW_MAXIMIZE							= 3				//	Maximizes the specified window.
	CONSTANT Integer			SW_MINIMIZE							= 6				//	Minimizes the specified window and activates the next top-level window in the z-order.
	CONSTANT Integer			SW_RESTORE							= 9				//	Activates and displays the window.  If the window is minimized or maximized, Windows restores it to its original size and position.  An application should specify this flag when restoring a minimized window.
	CONSTANT Integer			SW_SHOW								= 5				//	Activates the window and displays it in its current size and position.
	CONSTANT Integer			SW_SHOWDEFAULT						= 10				//	Sets the show state based on the SW_ flag specified in the STARTUPINFO structure passed to the CreateProcess function by the program that started the application.  An application should call ShowWindow with this flag to set the initial show state of its main window.
	CONSTANT Integer			SW_SHOWMAXIMIZED					= 3				//	Activates the window and displays it as a maximized window.
	CONSTANT Integer			SW_SHOWMINIMIZED					= 2				//	Activates the window and displays it as a minimized window.
	CONSTANT Integer			SW_SHOWMINNOACTIVE				= 7				//	Displays the window as a minimized window.  The active window remains active.
	CONSTANT Integer			SW_SHOWNA							= 8				//	Displays the window in its current state.  The active window remains active.
	CONSTANT Integer			SW_SHOWNOACTIVATE					= 4				//	Displays a window in its most recent size and position. The active window remains active.
	CONSTANT Integer			SW_SHOWNORMAL						= 1				//	Activates and displays a window.  If the window is minimized or maximized, Windows restores it to its original size and position.  An application should specify this flag when displaying the window for the first time.
end variables

on n_cst_platformattrib.create
call super::create
end on

on n_cst_platformattrib.destroy
call super::destroy
end on


HA$PBExportHeader$pfc_n_cst_platformattrib.sru
$PBExportComments$PFC Cross Platform service
forward
global type pfc_n_cst_platformattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_platformattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:

	//	GetCapsDevice
	CONSTANT Integer			LOGPIXELSX							= 88
	CONSTANT Integer			LOGPIXELSY							= 90
	
	//	GetSysColor
	CONSTANT Integer			COLOR_SCROLLBAR					= 0				//	Scroll bar gray area.
	CONSTANT Integer			COLOR_BACKGROUND					= 1				//	Desktop.
	CONSTANT Integer			COLOR_ACTIVECAPTION				= 2				//	Active window title bar.  Specifies the left side color in the color gradient of an active window's title bar if the gradient effect is enabled.
	CONSTANT Integer			COLOR_INACTIVECAPTION			= 3				//	Inactive window caption.  Specifies the left side color in the color gradient of an inactive window's title bar if the gradient effect is enabled.
	CONSTANT Integer			COLOR_MENU							= 4				//	Menu background.
	CONSTANT Integer			COLOR_WINDOW						= 5				//	Window background.
	CONSTANT Integer			COLOR_WINDOWFRAME					= 6				//	Window frame.
	CONSTANT Integer			COLOR_MENUTEXT						= 7				//	Text in menus.
	CONSTANT Integer			COLOR_WINDOWTEXT					= 8				//	Text in windows.
	CONSTANT Integer			COLOR_CAPTIONTEXT					= 9				//	Text in caption, size box, and scroll bar arrow box.
	CONSTANT Integer			COLOR_ACTIVEBORDER				= 10				//	Active window border.
	CONSTANT Integer			COLOR_INACTIVEBORDER				= 11				//	Inactive window border.
	CONSTANT Integer			COLOR_APPWORKSPACE				= 12				//	Background color of multiple document interface (MDI) applications.
	CONSTANT Integer			COLOR_HIGHLIGHT					= 13				//	Item(s) selected in a control.
	CONSTANT Integer			COLOR_HIGHLIGHTTEXT				= 14				//	Text of item(s) selected in a control.
	CONSTANT Integer			COLOR_BTNFACE						= 15				//	Face color for three-dimensional display elements and for dialog box backgrounds.
	CONSTANT Integer			COLOR_BTNSHADOW					= 16				//	Shadow color for three-dimensional display elements (for edges facing away from the light source).
	CONSTANT Integer			COLOR_GRAYTEXT						= 17				//	Grayed (disabled) text. This color is set to 0 if the current display driver does not support a solid gray color.
	CONSTANT Integer			COLOR_BTNTEXT						= 18				//	Text on push buttons.
	CONSTANT Integer			COLOR_INACTIVECAPTIONTEXT		= 19				//	Color of text in an inactive caption.
	CONSTANT Integer			COLOR_BTNHIGHLIGHT				= 20				//	Highlight color for three-dimensional display elements (for edges facing the light source.)
	CONSTANT Integer			COLOR_3DDKSHADOW					= 21				//	Dark shadow for three-dimensional display elements.
	CONSTANT Integer			COLOR_3DLIGHT						= 22				//	Light color for three-dimensional display elements (for edges facing the light source.)
	CONSTANT Integer			COLOR_INFOTEXT						= 23				//	Text color for tooltip controls.
	CONSTANT Integer			COLOR_INFOBK						= 24				//	Background color for tooltip controls.
	CONSTANT Integer			COLOR_HOTLIGHT						= 26				//	Color for a hyperlink or hot-tracked item.
	CONSTANT Integer			COLOR_GRADIENTACTIVECAPTION	= 27				//	Right side color in the color gradient of an active window's title bar. COLOR_ACTIVECAPTION specifies the left side color. Use SPI_GETGRADIENTCAPTIONS with the SystemParametersInfo function to determine whether the gradient effect is enabled.
	CONSTANT Integer			COLOR_GRADIENTINACTIVECAPTION	= 28				//	Right side color in the color gradient of an inactive window's title bar. COLOR_INACTIVECAPTION specifies the left side color.
	CONSTANT Integer			COLOR_MENUHILIGHT					= 29				//	The color used to highlight menu items when the menu appears as a flat menu (see SystemParametersInfo). The highlighted menu item is outlined with COLOR_HIGHLIGHT.  Windows 2000:  This value is not supported. 
	CONSTANT Integer			COLOR_MENUBAR						= 30				//	The background color for the menu bar when menus appear as flat menus (see SystemParametersInfo). However, COLOR_MENU continues to specify the background color of the menu popup.  Windows 2000:  This value is not supported. 

	CONSTANT Integer			COLOR_DESKTOP						= COLOR_BACKGROUND
	CONSTANT Integer			COLOR_3DFACE						= COLOR_BTNFACE
	CONSTANT Integer			COLOR_3DSHADOW						= COLOR_BTNSHADOW
	CONSTANT Integer			COLOR_3DHIGHLIGHT					= COLOR_BTNHIGHLIGHT
	CONSTANT Integer			COLOR_3DHILIGHT					= COLOR_BTNHIGHLIGHT
	CONSTANT Integer			COLOR_BTNHILIGHT					= COLOR_BTNHIGHLIGHT

	CONSTANT Integer			COLOR_ALTERNATEBTNFACE			= 25				//	Undocumented, constant's name unknown

	CONSTANT Integer			COLOR_MIN							= 0
	CONSTANT Integer			COLOR_MAX							= 28
	
	// GetSystemMetrics
	CONSTANT Integer			SM_CLEANBOOT						= 67				//	The value that specifies how the system is started:  0 Normal boot, 1 Fail-safe boot, 2 Fail-safe with network boot.  A fail-safe boot (also called SafeBoot, Safe Mode, or Clean Boot) bypasses the user startup files.
	CONSTANT Integer			SM_CMONITORS						= 80				//	The number of display monitors on a desktop.  For more information, see the Remarks section in this topic. 
	CONSTANT Integer			SM_CMOUSEBUTTONS					= 43				//	The number of buttons on a mouse, or zero if no mouse is installed.
	CONSTANT Integer			SM_CONVERTIBLESLATEMODE			= 8195			//	Reflects the state of the laptop or slate mode, 0 for Slate Mode and non-zero otherwise.  When this system metric changes, the system sends a broadcast message via WM_SETTINGCHANGE with "ConvertibleSlateMode" in the LPARAM.
	CONSTANT Integer			SM_CXBORDER							= 5				//	The width of a window border, in pixels.  This is equivalent to the SM_CXEDGE value for windows with the 3-D look.
	CONSTANT Integer			SM_CXCURSOR							= 13				//	The width of a cursor, in pixels.  The system cannot create cursors of other sizes.
	CONSTANT Integer			SM_CXDLGFRAME						= 7				//	This value is the same as SM_CXFIXEDFRAME.
	CONSTANT Integer			SM_CXDOUBLECLK						= 36				//	The width of the rectangle around the location of a first click in a double-click sequence, in pixels.  The second click must occur within the rectangle that is defined by SM_CXDOUBLECLK and SM_CYDOUBLECLK for the system to consider the two clicks a double-click.  The two clicks must also occur within a specified time.  To set the width of the double-click rectangle, call SystemParametersInfo with SPI_SETDOUBLECLKWIDTH.
	CONSTANT Integer			SM_CXDRAG							= 68				//	The number of pixels on either side of a mouse-down point that the mouse pointer can move before a drag operation begins.  This allows the user to click and release the mouse button easily without unintentionally starting a drag operation.  If this value is negative, it is subtracted from the left of the mouse-down point and added to the right of it.
	CONSTANT Integer			SM_CXEDGE							= 45				//	The width of a 3-D border, in pixels.  This metric is the 3-D counterpart of SM_CXBORDER.
	CONSTANT Integer			SM_CXFIXEDFRAME					= SM_CXDLGFRAME//	The thickness of the frame around the perimeter of a window that has a caption but is not sizable, in pixels.  SM_CXFIXEDFRAME is the height of the horizontal border, and SM_CYFIXEDFRAME is the width of the vertical border.  This value is the same as SM_CXDLGFRAME.
	CONSTANT Integer			SM_CXFOCUSBORDER					= 83				//	The width of the left and right edges of the focus rectangle that the DrawFocusRect draws.  This value is in pixels.  Windows 2000:  This value is not supported.
	CONSTANT Integer			SM_CXFRAME							= 32				//	This value is the same as SM_CXSIZEFRAME.
	CONSTANT Integer			SM_CXFULLSCREEN					= 16				//	The width of the client area for a full-screen window on the primary display monitor, in pixels.  To get the coordinates of the portion of the screen that is not obscured by the system taskbar or by application desktop toolbars, call the SystemParametersInfo function with the SPI_GETWORKAREA value.
	CONSTANT Integer			SM_CXHSCROLL						= 21				//	The width of the arrow bitmap on a horizontal scroll bar, in pixels.
	CONSTANT Integer			SM_CXHTHUMB							= 10				//	The width of the thumb box in a horizontal scroll bar, in pixels.
	CONSTANT Integer			SM_CXICON							= 11				//	The default width of an icon, in pixels.  The LoadIcon function can load only icons with the dimensions that SM_CXICON and SM_CYICON specifies.
	CONSTANT Integer			SM_CXICONSPACING					= 38				//	The width of a grid cell for items in large icon view, in pixels.  Each item fits into a rectangle of size SM_CXICONSPACING by SM_CYICONSPACING when arranged.  This value is always greater than or equal to SM_CXICON.
	CONSTANT Integer			SM_CXMAXIMIZED						= 61				//	The default width, in pixels, of a maximized top-level window on the primary display monitor.
	CONSTANT Integer			SM_CXMAXTRACK						= 59				//	The default maximum width of a window that has a caption and sizing borders, in pixels.  This metric refers to the entire desktop.  The user cannot drag the window frame to a size larger than these dimensions.  A window can override this value by processing the WM_GETMINMAXINFO message.
	CONSTANT Integer			SM_CXMENUCHECK						= 71				//	The width of the default menu check-mark bitmap, in pixels.
	CONSTANT Integer			SM_CXMENUSIZE						= 54				//	The width of menu bar buttons, such as the child window close button that is used in the multiple document interface, in pixels.
	CONSTANT Integer			SM_CXMIN								= 28				//	The minimum width of a window, in pixels.
	CONSTANT Integer			SM_CXMINIMIZED						= 57				//	The width of a minimized window, in pixels.
	CONSTANT Integer			SM_CXMINSPACING					= 47				//	The width of a grid cell for a minimized window, in pixels.  Each minimized window fits into a rectangle this size when arranged.  This value is always greater than or equal to SM_CXMINIMIZED.
	CONSTANT Integer			SM_CXMINTRACK						= 34				//	The minimum tracking width of a window, in pixels.  The user cannot drag the window frame to a size smaller than these dimensions.  A window can override this value by processing the WM_GETMINMAXINFO message.
	CONSTANT Integer			SM_CXPADDEDBORDER					= 92				//	The amount of border padding for captioned windows, in pixels.  Windows XP/2000:  This value is not supported.
	CONSTANT Integer			SM_CXSCREEN							= 0				//	The width of the screen of the primary display monitor, in pixels.  This is the same value obtained by calling GetDeviceCaps as follows:  GetDeviceCaps(hdcPrimaryMonitor, HORZRES).
	CONSTANT Integer			SM_CXSIZE							= 30				//	The width of a button in a window caption or title bar, in pixels.
	CONSTANT Integer			SM_CXSIZEFRAME						= SM_CXFRAME	//	The thickness of the sizing border around the perimeter of a window that can be resized, in pixels.  SM_CXSIZEFRAME is the width of the horizontal border, and SM_CYSIZEFRAME is the height of the vertical border.  This value is the same as SM_CXFRAME.
	CONSTANT Integer			SM_CXSMICON							= 49				//	The recommended width of a small icon, in pixels.  Small icons typically appear in window captions and in small icon view.
	CONSTANT Integer			SM_CXSMSIZE							= 52				//	The width of small caption buttons, in pixels.
	CONSTANT Integer			SM_CXVIRTUALSCREEN				= 78				//	The width of the virtual screen, in pixels.  The virtual screen is the bounding rectangle of all display monitors.  The SM_XVIRTUALSCREEN metric is the coordinates for the left side of the virtual screen. 
	CONSTANT Integer			SM_CXVSCROLL						= 2				//	The width of a vertical scroll bar, in pixels.
	CONSTANT Integer			SM_CYBORDER							= 6				//	The height of a window border, in pixels.  This is equivalent to the SM_CYEDGE value for windows with the 3-D look.
	CONSTANT Integer			SM_CYCAPTION						= 4				//	The height of a caption area, in pixels.
	CONSTANT Integer			SM_CYCURSOR							= 14				//	The height of a cursor, in pixels.  The system cannot create cursors of other sizes.
	CONSTANT Integer			SM_CYDLGFRAME						= 8				//	This value is the same as SM_CYFIXEDFRAME.
	CONSTANT Integer			SM_CYDOUBLECLK						= 37				//	The height of the rectangle around the location of a first click in a double-click sequence, in pixels.  The second click must occur within the rectangle defined by SM_CXDOUBLECLK and SM_CYDOUBLECLK for the system to consider the two clicks a double-click.  The two clicks must also occur within a specified time.  To set the height of the double-click rectangle, call SystemParametersInfo with SPI_SETDOUBLECLKHEIGHT.
	CONSTANT Integer			SM_CYDRAG							= 69				//	The number of pixels above and below a mouse-down point that the mouse pointer can move before a drag operation begins.  This allows the user to click and release the mouse button easily without unintentionally starting a drag operation.  If this value is negative, it is subtracted from above the mouse-down point and added below it. 
	CONSTANT Integer			SM_CYEDGE							= 46				//	The height of a 3-D border, in pixels.  This is the 3-D counterpart of SM_CYBORDER.
	CONSTANT Integer			SM_CYFIXEDFRAME					= SM_CYDLGFRAME//	The thickness of the frame around the perimeter of a window that has a caption but is not sizable, in pixels.  SM_CXFIXEDFRAME is the height of the horizontal border, and SM_CYFIXEDFRAME is the width of the vertical border.  This value is the same as SM_CYDLGFRAME.
	CONSTANT Integer			SM_CYFOCUSBORDER					= 84				//	The height of the top and bottom edges of the focus rectangle drawn by DrawFocusRect.  This value is in pixels.  Windows 2000:  This value is not supported.
	CONSTANT Integer			SM_CYFRAME							= 33				//	This value is the same as SM_CYSIZEFRAME.
 	CONSTANT Integer			SM_CYFULLSCREEN					= 17				//	The height of the client area for a full-screen window on the primary display monitor, in pixels.  To get the coordinates of the portion of the screen not obscured by the system taskbar or by application desktop toolbars, call the SystemParametersInfo function with the SPI_GETWORKAREA value.
	CONSTANT Integer			SM_CYHSCROLL						= 3				//	The height of a horizontal scroll bar, in pixels.
	CONSTANT Integer			SM_CYICON							= 12				//	The default height of an icon, in pixels.  The LoadIcon function can load only icons with the dimensions SM_CXICON and SM_CYICON.
	CONSTANT Integer			SM_CYICONSPACING					= 39				//	The height of a grid cell for items in large icon view, in pixels.  Each item fits into a rectangle of size SM_CXICONSPACING by SM_CYICONSPACING when arranged.  This value is always greater than or equal to SM_CYICON.
	CONSTANT Integer			SM_CYKANJIWINDOW					= 18				//	For double byte character set versions of the system, this is the height of the Kanji window at the bottom of the screen, in pixels.
	CONSTANT Integer			SM_CYMAXIMIZED						= 62				//	The default height, in pixels, of a maximized top-level window on the primary display monitor.
	CONSTANT Integer			SM_CYMAXTRACK						= 60				//	The default maximum height of a window that has a caption and sizing borders, in pixels.  This metric refers to the entire desktop.  The user cannot drag the window frame to a size larger than these dimensions.  A window can override this value by processing the WM_GETMINMAXINFO message.
	CONSTANT Integer			SM_CYMENU							= 15				//	The height of a single-line menu bar, in pixels.
 	CONSTANT Integer			SM_CYMENUCHECK						= 72				//	The height of the default menu check-mark bitmap, in pixels.
	CONSTANT Integer			SM_CYMENUSIZE						= 55				//	The height of menu bar buttons, such as the child window close button that is used in the multiple document interface, in pixels.
 	CONSTANT Integer			SM_CYMIN								= 29				//	The minimum height of a window, in pixels.
 	CONSTANT Integer			SM_CYMINIMIZED						= 58				//	The height of a minimized window, in pixels.
 	CONSTANT Integer			SM_CYMINSPACING					= 48				//	The height of a grid cell for a minimized window, in pixels.  Each minimized window fits into a rectangle this size when arranged.  This value is always greater than or equal to SM_CYMINIMIZED.
 	CONSTANT Integer			SM_CYMINTRACK						= 35				//	The minimum tracking height of a window, in pixels.  The user cannot drag the window frame to a size smaller than these dimensions.  A window can override this value by processing the WM_GETMINMAXINFO message.
	CONSTANT Integer			SM_CYSCREEN							= 1				//	The height of the screen of the primary display monitor, in pixels.  This is the same value obtained by calling GetDeviceCaps as follows:  GetDeviceCaps( hdcPrimaryMonitor, VERTRES).
	CONSTANT Integer			SM_CYSIZE							= 31				//	The height of a button in a window caption or title bar, in pixels.
	CONSTANT Integer			SM_CYSIZEFRAME						= SM_CYFRAME	//	The thickness of the sizing border around the perimeter of a window that can be resized, in pixels.  SM_CXSIZEFRAME is the width of the horizontal border, and SM_CYSIZEFRAME is the height of the vertical border.  This value is the same as SM_CYFRAME.
	CONSTANT Integer			SM_CYSMCAPTION						= 51				//	The height of a small caption, in pixels.
	CONSTANT Integer			SM_CYSMICON							= 50				//	The recommended height of a small icon, in pixels.  Small icons typically appear in window captions and in small icon view.
	CONSTANT Integer			SM_CYSMSIZE							= 53				//	The height of small caption buttons, in pixels.
	CONSTANT Integer			SM_CYVIRTUALSCREEN				= 79				//	The height of the virtual screen, in pixels.  The virtual screen is the bounding rectangle of all display monitors.  The SM_YVIRTUALSCREEN metric is the coordinates for the top of the virtual screen.
	CONSTANT Integer			SM_CYVSCROLL						= 20				//	The height of the arrow bitmap on a vertical scroll bar, in pixels.
	CONSTANT Integer			SM_CYVTHUMB							= 9				//	The height of the thumb box in a vertical scroll bar, in pixels.
	CONSTANT Integer			SM_DBCSENABLED						= 42				//	Nonzero if User32.dll supports DBCS; otherwise, 0. 
	CONSTANT Integer			SM_DEBUG								= 22				//	Nonzero if the debug version of User.exe is installed; otherwise, 0.
	CONSTANT Integer			SM_DIGITIZER						= 94				//	Nonzero if the current operating system is Windows 7 or Windows Server 2008 R2 and the Tablet PC Input service is started; otherwise, 0.  The return value is a bitmask that specifies the type of digitizer input supported by the device. For more information, see Remarks.  Windows Server 2008, Windows Vista, and Windows XP/2000:  This value is not supported.
	CONSTANT Integer			SM_IMMENABLED						= 82				//	Nonzero if Input Method Manager/Input Method Editor features are enabled; otherwise, 0.  SM_IMMENABLED indicates whether the system is ready to use a Unicode-based IME on a Unicode application.  To ensure that a language-dependent IME works, check SM_DBCSENABLED and the system ANSI code page.  Otherwise the ANSI-to-Unicode conversion may not be performed correctly, or some components like fonts or registry settings may not be present.
	CONSTANT Integer			SM_MAXIMUMTOUCHES					= 95				//	Nonzero if there are digitizers in the system; otherwise, 0.  SM_MAXIMUMTOUCHES returns the aggregate maximum of the maximum number of contacts supported by every digitizer in the system.  If the system has only single-touch digitizers, the return value is 1.  If the system has multi-touch digitizers, the return value is the number of simultaneous contacts the hardware can provide.  Windows Server 2008, Windows Vista, and Windows XP/2000:  This value is not supported.
	CONSTANT Integer			SM_MEDIACENTER						= 87				//	Nonzero if the current operating system is the Windows XP, Media Center Edition, 0 if not.
	CONSTANT Integer			SM_MENUDROPALIGNMENT				= 40				//	Nonzero if drop-down menus are right-aligned with the corresponding menu-bar item; 0 if the menus are left-aligned.
	CONSTANT Integer			SM_MIDEASTENABLED					= 74				//	Nonzero if the system is enabled for Hebrew and Arabic languages, 0 if not.
	CONSTANT Integer			SM_MOUSEPRESENT					= 19				//	Nonzero if a mouse is installed; otherwise, 0.  This value is rarely zero, because of support for virtual mice and because some systems detect the presence of the port instead of the presence of a mouse.
	CONSTANT Integer			SM_MOUSEHORIZONTALWHEELPRESENT					&
																			= 91				//	Nonzero if a mouse with a horizontal scroll wheel is installed; otherwise 0.
	CONSTANT Integer			SM_MOUSEWHEELPRESENT				= 75				//	Nonzero if a mouse with a vertical scroll wheel is installed; otherwise 0. 
	CONSTANT Integer			SM_NETWORK							= 63				//	The least significant bit is set if a network is present; otherwise, it is cleared.  The other bits are reserved for future use.
	CONSTANT Integer			SM_PENWINDOWS						= 41				//	Nonzero if the Microsoft Windows for Pen computing extensions are installed; zero otherwise.
	CONSTANT Integer			SM_REMOTECONTROL					= 8193			//	This system metric is used in a Terminal Services environment to determine if the current Terminal Server session is being remotely controlled.  Its value is nonzero if the current session is remotely controlled; otherwise, 0.  You can use terminal services management tools such as Terminal Services Manager (tsadmin.msc) and shadow.exe to control a remote session.  When a session is being remotely controlled, another user can view the contents of that session and potentially interact with it.
	CONSTANT Integer			SM_REMOTESESSION					= 4096			//	This system metric is used in a Terminal Services environment. If the calling process is associated with a Terminal Services client session, the return value is nonzero. If the calling process is associated with the Terminal Services console session, the return value is 0.  Windows Server 2003 and Windows XP:  The console session is not necessarily the physical console.  For more information, see WTSGetActiveConsoleSessionId.
	CONSTANT Integer			SM_SAMEDISPLAYFORMAT				= 81				//	Nonzero if all the display monitors have the same color format, otherwise, 0.  Two displays can have the same bit depth, but different color formats.  For example, the red, green, and blue pixels can be encoded with different numbers of bits, or those bits can be located in different places in a pixel color value. 
	CONSTANT Integer			SM_SECURE							= 44				//	This system metric should be ignored; it always returns 0.
	CONSTANT Integer			SM_SERVERR2							= 89				//	The build number if the system is Windows Server 2003 R2; otherwise, 0.
	CONSTANT Integer			SM_SHOWSOUNDS						= 70				//	Nonzero if the user requires an application to present information visually in situations where it would otherwise present the information only in audible form; otherwise, 0.
	CONSTANT Integer			SM_SHUTTINGDOWN					= 8192			//	Nonzero if the current session is shutting down; otherwise, 0.  Windows 2000:  This value is not supported.
	CONSTANT Integer			SM_SLOWMACHINE						= 73				//	Nonzero if the computer has a low-end (slow) processor; otherwise, 0.
	CONSTANT Integer			SM_STARTER							= 88				//	Nonzero if the current operating system is Windows 7 Starter Edition, Windows Vista Starter, or Windows XP Starter Edition; otherwise, 0.
	CONSTANT Integer			SM_SWAPBUTTON						= 23				//	Nonzero if the meanings of the left and right mouse buttons are swapped; otherwise, 0.
	CONSTANT Integer			SM_SYSTEMDOCKED					= 8196			//	Reflects the state of the docking mode, 0 for Undocked Mode and non-zero otherwise.  When this system metric changes, the system sends a broadcast message via WM_SETTINGCHANGE with "SystemDockMode" in the LPARAM.
	CONSTANT Integer			SM_TABLETPC							= 86				//	Nonzero if the current operating system is the Windows XP Tablet PC edition or if the current operating system is Windows Vista or Windows 7 and the Tablet PC Input service is started; otherwise, 0.  The SM_DIGITIZER setting indicates the type of digitizer input supported by a device running Windows 7 or Windows Server 2008 R2.  For more information, see Remarks. 
	CONSTANT Integer			SM_XVIRTUALSCREEN					= 76				//	The coordinates for the left side of the virtual screen.  The virtual screen is the bounding rectangle of all display monitors.  The SM_CXVIRTUALSCREEN metric is the width of the virtual screen. 
	CONSTANT Integer			SM_YVIRTUALSCREEN					= 77				//	The coordinates for the top of the virtual screen.  The virtual screen is the bounding rectangle of all display monitors.  The SM_CYVIRTUALSCREEN metric is the height of the virtual screen. 

	//	Get/SetWindowLong
	CONSTANT Integer			GWL_EXSTYLE							= (-20)			//	Sets a new extended window style. 
	CONSTANT Integer			GWL_HINSTANCE						= (-6)			//	Sets a new application instance handle.
	CONSTANT	Integer			GWL_HWNDPARENT						= (-8)			//	Retrieves a handle to the parent window, if any.
	CONSTANT Integer			GWL_ID								= (-12)			//	Sets a new identifier of the child window.  The window cannot be a top-level window.
	CONSTANT Integer			GWL_STYLE							= (-16)			//	Sets a new window style.
	CONSTANT Integer			GWL_USERDATA						= (-21)			//	Sets the user data associated with the window.  This data is intended for use by the application that created the window.  Its value is initially zero.
	CONSTANT Integer			GWL_WNDPROC							= (-4)			//	Sets a new address for the window procedure.  You cannot change this attribute if the window does not belong to the same process as the calling thread.
 
	//	Extended Window Styles
	CONSTANT UnsignedLong	WS_EX_ACCEPTFILES					= 16				//	The window accepts drag-drop files.
	CONSTANT UnsignedLong	WS_EX_APPWINDOW					= 262144			//	Forces a top-level window onto the taskbar when the window is visible. 
	CONSTANT UnsignedLong	WS_EX_CLIENTEDGE					= 512				//	The window has a border with a sunken edge.
	CONSTANT UnsignedLong	WS_EX_COMPOSITED					= 33554432		//	Paints all descendants of a window in bottom-to-top painting order using double-buffering. For more information, see Remarks. This cannot be used if the window has a class style of either CS_OWNDC or CS_CLASSDC.  Windows 2000:  This style is not supported. 
	CONSTANT UnsignedLong	WS_EX_CONTEXTHELP					= 1024			//	The title bar of the window includes a question mark. When the user clicks the question mark, the cursor changes to a question mark with a pointer. If the user then clicks a child window, the child receives a WM_HELP message. The child window should pass the message to the parent window procedure, which should call the WinHelp function using the HELP_WM_HELP command. The Help application displays a pop-up window that typically contains help for the child window.  WS_EX_CONTEXTHELP cannot be used with the WS_MAXIMIZEBOX or WS_MINIMIZEBOX styles.
	CONSTANT UnsignedLong	WS_EX_CONTROLPARENT				= 65536			//	The window itself contains child windows that should take part in dialog box navigation. If this style is specified, the dialog manager recurses into children of this window when performing navigation operations such as handling the TAB key, an arrow key, or a keyboard mnemonic.
	CONSTANT UnsignedLong	WS_EX_DLGMODALFRAME				= 1				//	The window has a double border; the window can, optionally, be created with a title bar by specifying the WS_CAPTION style in the dwStyle parameter.
	CONSTANT UnsignedLong	WS_EX_LAYERED						= 524288			//	The window is a layered window. This style cannot be used if the window has a class style of either CS_OWNDC or CS_CLASSDC.  Windows 8:  The WS_EX_LAYERED style is supported for top-level windows and child windows. Previous Windows versions support WS_EX_LAYERED only for top-level windows. 
	CONSTANT UnsignedLong	WS_EX_LAYOUTRTL					= 4194304		//	If the shell language is Hebrew, Arabic, or another language that supports reading order alignment, the horizontal origin of the window is on the right edge. Increasing horizontal values advance to the left. 
	CONSTANT UnsignedLong	WS_EX_LEFT							= 0				//	The window has generic left-aligned properties. This is the default.
	CONSTANT UnsignedLong	WS_EX_LEFTSCROLLBAR				= 16384			//	If the shell language is Hebrew, Arabic, or another language that supports reading order alignment, the vertical scroll bar (if present) is to the left of the client area. For other languages, the style is ignored.
	CONSTANT UnsignedLong	WS_EX_LTRREADING					= 0				//	The window text is displayed using left-to-right reading-order properties. This is the default.
	CONSTANT UnsignedLong	WS_EX_MDICHILD						= 64				//	The window is a MDI child window.
	CONSTANT UnsignedLong	WS_EX_NOACTIVATE					= 134217728		//	A top-level window created with this style does not become the foreground window when the user clicks it. The system does not bring this window to the foreground when the user minimizes or closes the foreground window.  To activate the window, use the SetActiveWindow or SetForegroundWindow function.  The window does not appear on the taskbar by default. To force the window to appear on the taskbar, use the WS_EX_APPWINDOW style.
	CONSTANT UnsignedLong	WS_EX_NOINHERITLAYOUT			= 1048576		//	The window does not pass its window layout to its child windows.
	CONSTANT UnsignedLong	WS_EX_NOPARENTNOTIFY				= 4				//	The child window created with this style does not send the WM_PARENTNOTIFY message to its parent window when it is created or destroyed.
	CONSTANT UnsignedLong	WS_EX_RIGHT							= 4096			//	The window has generic "right-aligned" properties. This depends on the window class. This style has an effect only if the shell language is Hebrew, Arabic, or another language that supports reading-order alignment; otherwise, the style is ignored.  Using the WS_EX_RIGHT style for static or edit controls has the same effect as using the SS_RIGHT or ES_RIGHT style, respectively. Using this style with button controls has the same effect as using BS_RIGHT and BS_RIGHTBUTTON styles. 
	CONSTANT UnsignedLong	WS_EX_RIGHTSCROLLBAR				= 0				//	The vertical scroll bar (if present) is to the right of the client area. This is the default.
	CONSTANT UnsignedLong	WS_EX_RTLREADING					= 8192			//	If the shell language is Hebrew, Arabic, or another language that supports reading-order alignment, the window text is displayed using right-to-left reading-order properties. For other languages, the style is ignored.
	CONSTANT UnsignedLong	WS_EX_STATICEDGE					= 131072			//	The window has a three-dimensional border style intended to be used for items that do not accept user input.
	CONSTANT UnsignedLong	WS_EX_TOOLWINDOW					= 128				//	The window is intended to be used as a floating toolbar. A tool window has a title bar that is shorter than a normal title bar, and the window title is drawn using a smaller font. A tool window does not appear in the taskbar or in the dialog that appears when the user presses ALT+TAB. If a tool window has a system menu, its icon is not displayed on the title bar. However, you can display the system menu by right-clicking or by typing ALT+SPACE. 
	CONSTANT UnsignedLong	WS_EX_TOPMOST						= 8				//	The window should be placed above all non-topmost windows and should stay above them, even when the window is deactivated. To add or remove this style, use the SetWindowPos function.
	CONSTANT UnsignedLong	WS_EX_TRANSPARENT					= 32				//	The window should not be painted until siblings beneath the window (that were created by the same thread) have been painted. The window appears transparent because the bits of underlying sibling windows have already been painted.  To achieve transparency without these restrictions, use the SetWindowRgn function.
	CONSTANT UnsignedLong	WS_EX_WINDOWEDGE					= 256				//	The window has a border with a raised edge.
	CONSTANT UnsignedLong	WS_EX_OVERLAPPEDWINDOW			= WS_EX_WINDOWEDGE + WS_EX_CLIENTEDGE
																								//	The window is an overlapped window.
	CONSTANT UnsignedLong	WS_EX_PALETTEWINDOW				= WS_EX_WINDOWEDGE + WS_EX_TOOLWINDOW + WS_EX_TOPMOST
																								//	The window is palette window, which is a modeless dialog box that presents an array of commands. 
 	//	Window Styles
	CONSTANT UnsignedLong	WS_BORDER							= 8388608
	CONSTANT UnsignedLong	WS_CAPTION							= 12582912
	CONSTANT UnsignedLong	WS_CHILD								= 1073741824
	CONSTANT UnsignedLong	WS_CHILDWINDOW						= WS_CHILD
	CONSTANT UnsignedLong	WS_CLIPCHILDREN					= 33554432
	CONSTANT UnsignedLong	WS_CLIPSIBLINGS					= 67108864
	CONSTANT UnsignedLong	WS_DISABLED							= 134217728
	CONSTANT UnsignedLong	WS_DLGFRAME							= 4194304
	CONSTANT UnsignedLong	WS_GROUP								= 131072
	CONSTANT UnsignedLong	WS_HSCROLL							= 1048576
	CONSTANT UnsignedLong	WS_MAXIMIZE							= 16777216
	CONSTANT UnsignedLong	WS_MAXIMIZEBOX						= 65536
	CONSTANT UnsignedLong	WS_MINIMIZE							= 536870912
	CONSTANT UnsignedLong	WS_MINIMIZEBOX						= 131072
	CONSTANT UnsignedLong	WS_OVERLAPPED						= 0
	CONSTANT UnsignedLong	WS_ICONIC							= WS_MINIMIZE
	CONSTANT UnsignedLong	WS_POPUP								= 2147483648
	CONSTANT UnsignedLong	WS_VISIBLE							= 268435456
	CONSTANT UnsignedLong	WS_VSCROLL							= 2097152
	CONSTANT UnsignedLong	WS_SYSMENU							= 524288
	CONSTANT UnsignedLong	WS_TABSTOP							= 65536
	CONSTANT UnsignedLong	WS_THICKFRAME						= 262144
	CONSTANT UnsignedLong	WS_TILED								= WS_OVERLAPPED
	CONSTANT UnsignedLong	WS_OVERLAPPEDWINDOW				= WS_OVERLAPPED + WS_CAPTION + WS_SYSMENU + WS_THICKFRAME + WS_MINIMIZEBOX + WS_MAXIMIZEBOX
	CONSTANT UnsignedLong	WS_POPUPWINDOW						= WS_POPUP + WS_BORDER + WS_SYSMENU
	CONSTANT UnsignedLong	WS_TILEDWINDOW						= WS_OVERLAPPEDWINDOW
	CONSTANT UnsignedLong	WS_SIZEBOX							= WS_THICKFRAME
	
	//	Menu Position
	CONSTANT Integer			MF_BYCOMMAND						= 0				//	Indicates that the uPosition parameter gives the identifier of the menu item.  The MF_BYCOMMAND flag is the default if neither the MF_BYCOMMAND nor MF_BYPOSITION flag is specified. 
	CONSTANT Integer			MF_BYPOSITION						= 1024			//	Indicates that the uPosition parameter gives the zero-based relative position of the new menu item.  If uPosition is -1, the new menu item is appended to the end of the menu. 
 
	//	Menu Flags
	CONSTANT Integer			MF_BITMAP							= 4				//	Uses a bitmap as the menu item.  The lpNewItem parameter contains a handle to the bitmap. 
	CONSTANT Integer			MF_CHECKED							= 8				//	Places a check mark next to the menu item.  If the application provides check-mark bitmaps (see SetMenuItemBitmaps), this flag displays the check-mark bitmap next to the menu item. 
	CONSTANT Integer			MF_DISABLED							= 2				//	Disables the menu item so that it cannot be selected, but does not gray it. 
	CONSTANT Integer			MF_ENABLED							= 0				//	Enables the menu item so that it can be selected and restores it from its grayed state. 
	CONSTANT Integer			MF_GRAYED							= 1				//	Disables the menu item and grays it so it cannot be selected. 
	CONSTANT Integer			MF_MENUBARBREAK					= 32				//	Functions the same as the MF_MENUBREAK flag for a menu bar.  For a drop-down menu, submenu, or shortcut menu, the new column is separated from the old column by a vertical line. 
	CONSTANT Integer			MF_MENUBREAK						= 64				//	Places the item on a new line (for menu bars) or in a new column (for a drop-down menu, submenu, or shortcut menu) without separating columns. 
	CONSTANT Integer			MF_OWNERDRAW						= 256				//	Specifies that the item is an owner-drawn item.  Before the menu is displayed for the first time, the window that owns the menu receives a WM_MEASUREITEM message to retrieve the width and height of the menu item.  The WM_DRAWITEM message is then sent to the window procedure of the owner window whenever the appearance of the menu item must be updated. 
	CONSTANT Integer			MF_POPUP								= 16				//	Specifies that the menu item opens a drop-down menu or submenu.  The uIDNewItem parameter specifies a handle to the drop-down menu or submenu.  This flag is used to add a menu name to a menu bar or a menu item that opens a submenu to a drop-down menu, submenu, or shortcut menu. 
	CONSTANT Integer			MF_SEPARATOR						= 2048			//	Draws a horizontal dividing line.  This flag is used only in a drop-down menu, submenu, or shortcut menu. The line cannot be grayed, disabled, or highlighted.  The lpNewItem and uIDNewItem parameters are ignored. 
	CONSTANT Integer			MF_STRING							= 0				//	Specifies that the menu item is a text string; the lpNewItem parameter is a pointer to the string. 
	CONSTANT Integer			MF_SYSMENU							= 8192			// A system menu.
	CONSTANT Integer			MF_UNCHECKED						= 0				//	Does not place a check mark next to the menu item (default).  If the application supplies check-mark bitmaps (see the SetMenuItemBitmaps function), this flag displays the clear bitmap next to the menu item.
	
	//	SetWindowPos Flags
	CONSTANT unsignedInt		SWP_ASYNCWINDOWPOS				= 16384	 		//	If the calling thread and the thread that owns the window are attached to different input queues, the system posts the request to the thread that owns the window.  This prevents the calling thread from blocking its execution while other threads process the request. 
	CONSTANT unsignedInt		SWP_DEFERERASE						= 8192  			//	Prevents generation of the WM_SYNCPAINT message. 
	CONSTANT unsignedInt		SWP_DRAWFRAME						= 32 				//	Draws a frame (defined in the window's class description) around the window.
	CONSTANT unsignedInt		SWP_FRAMECHANGED					= 32				//	Applies new frame styles set using the SetWindowLong function.  Sends a WM_NCCALCSIZE message to the window, even if the window's size is not being changed.  If this flag is not specified, WM_NCCALCSIZE is sent only when the window's size is being changed.
	CONSTANT unsignedInt		SWP_HIDEWINDOW						= 128 			//	Hides the window.
	CONSTANT unsignedInt		SWP_NOACTIVATE						= 16 				//	Does not activate the window.  If this flag is not set, the window is activated and moved to the top of either the topmost or non-topmost group (depending on the setting of the hWndInsertAfter parameter).
	CONSTANT unsignedInt		SWP_NOCOPYBITS						= 256 			//	Discards the entire contents of the client area. If this flag is not specified, the valid contents of the client area are saved and copied back into the client area after the window is sized or repositioned.
	CONSTANT unsignedInt		SWP_NOMOVE							= 2 				//	Retains the current position (ignores X and Y parameters).
	CONSTANT unsignedInt		SWP_NOOWNERZORDER					= 512 			//	Does not change the owner window's position in the Z order.
	CONSTANT unsignedInt		SWP_NOREDRAW						= 8 				//	Does not redraw changes.  If this flag is set, no repainting of any kind occurs.  This applies to the client area, the nonclient area (including the title bar and scroll bars), and any part of the parent window uncovered as a result of the window being moved.  When this flag is set, the application must explicitly invalidate or redraw any parts of the window and parent window that need redrawing.
	CONSTANT unsignedInt		SWP_NOREPOSITION					= 512 			//	Same as the SWP_NOOWNERZORDER flag.
	CONSTANT unsignedInt		SWP_NOSENDCHANGING				= 1024 			//	Prevents the window from receiving the WM_WINDOWPOSCHANGING message.
	CONSTANT unsignedInt		SWP_NOSIZE							= 1 				//	Retains the current size (ignores the cx and cy parameters).
	CONSTANT unsignedInt		SWP_NOZORDER						= 4 				//	Retains the current Z order (ignores the hWndInsertAfter parameter).
	CONSTANT unsignedInt		SWP_SHOWWINDOW						= 64 				//	Displays the window.
	
	//	WM_SYSCOMMAND
	CONSTANT unsignedLong	SC_CLOSE								= 61536			//	Closes the window.
	CONSTANT unsignedLong	SC_CONTEXTHELP						= 61824			//	Changes the cursor to a question mark with a pointer.  If the user then clicks a control in the dialog box, the control receives a WM_HELP message.
	CONSTANT unsignedLong	SC_DEFAULT							= 61792			//	Selects the default item; the user double-clicked the window menu.
	CONSTANT unsignedLong	SC_HOTKEY							= 61776			//	Activates the window associated with the application-specified hot key.  The lParam parameter identifies the window to activate.
	CONSTANT unsignedLong	SC_HSCROLL							= 61568			//	Scrolls horizontally.
	CONSTANT unsignedLong	SCF_ISSECURE						= 1				//	Indicates whether the screen saver is secure. 
	CONSTANT unsignedLong	SC_KEYMENU							= 61696			//	Retrieves the window menu as a result of a keystroke. For more information, see the Remarks section.
	CONSTANT unsignedLong	SC_MAXIMIZE							= 61488			//	Maximizes the window.
	CONSTANT unsignedLong	SC_MINIMIZE							= 61472			//	Minimizes the window.
	CONSTANT unsignedLong	SC_MONITORPOWER					= 61808			//	Sets the state of the display.  This command supports devices that have power-saving features, such as a battery-powered personal computer. 
																								//	The lParam parameter can have the following values:
																								//	-1 (the display is powering on)
																								//	 1 (the display is going to low power)
																								//	 2 (the display is being shut off)
	CONSTANT unsignedLong	SC_MOUSEMENU						= 61584			//	Retrieves the window menu as a result of a mouse click.
	CONSTANT unsignedLong	SC_MOVE								= 61456			//	Moves the window.
	CONSTANT unsignedLong	SC_NEXTWINDOW						= 61504			//	Moves to the next window.
	CONSTANT unsignedLong	SC_PREVWINDOW						= 61520			//	Moves to the previous window.
	CONSTANT unsignedLong	SC_RESTORE							= 61728			//	Restores the window to its normal position and size.
	CONSTANT unsignedLong	SC_SCREENSAVE						= 61760			//	Executes the screen saver application specified in the [boot] section of the System.ini file.
	CONSTANT unsignedLong	SC_SIZE								= 61440			//	Sizes the window.
	CONSTANT unsignedLong	SC_TASKLIST							= 61744			//	Activates the Start menu.
	CONSTANT unsignedLong	SC_VSCROLL							= 61552			//	Scrolls vertically.
end variables

on pfc_n_cst_platformattrib.create
call super::create
end on

on pfc_n_cst_platformattrib.destroy
call super::destroy
end on


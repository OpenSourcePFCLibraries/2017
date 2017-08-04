HA$PBExportHeader$pfc_n_cst_color.sru
$PBExportComments$PFC Color Service
forward
global type pfc_n_cst_color from n_base
end type
end forward

global type pfc_n_cst_color from n_base autoinstantiate
end type

type variables
// Notes: The following additions were made in v12.5:
//        - Extra white space to improve legibility.
//        - Hexadecimal equivalents as comments.
//        - Several new named color constants.
//        - PB painter color constants (Pure green is called "lime" in PB painters, for example).
//        - PB painter mapped Windows system color constants ("highlight" [selected row in DW], for example).
//        - Summary explanation of how RGB encoding works.
//
// (*)    When R/G/B values are encoded into a value of type long, the order of the one-byte (0-255) color
//        values is reversed. PB uses the bits in the hi-order byte for special values, like TRANSPARENT.
//
//        Example: RGB(64,128,255) 64=0x40, 128=0x80, 255=0xff
//        The encoded R/G/B long value will contain 0x00ff8040, not 0x004080ff

// Traditional, legacy PFC color constants
Public:                                                      //     bbggrr (*)
constant long WINDOW_TEXT             =   33554592           // 0x02000000
constant long BUTTONFACE              =   78682240           // 0x04000000
constant long APPLICATION_WORKSPACE   =  268435456           // 0x10000000
constant long TRANSPARENT             =  553648127           // 0x20000000
constant long WINDOW_BACKGROUND       = 1087434968           // 0x40000000

constant long BLACK                   = RGB(  0,   0,   0)   // 0x00000000
constant long WHITE                   = RGB(255, 255, 255)   // 0x00ffffff
constant long LIGHT_GRAY              = RGB(192, 192, 192)   // 0x00c0c0c0
constant long DARK_GRAY               = RGB(128, 128, 128)   // 0x00808080
constant long RED                     = RGB(255,   0,   0)   // 0x000000ff
constant long DARK_RED                = RGB(128,   0,   0)   // 0x00000080
constant long GREEN                   = RGB(  0, 255,   0)   // 0x0000ff00
constant long DARK_GREEN              = RGB(  0, 128,   0)   // 0x00008000
constant long BLUE                    = RGB(  0,   0, 255)   // 0x00ff0000
constant long DARK_BLUE               = RGB(  0,   0, 128)   // 0x00800000
constant long MAGENTA                 = RGB(255,   0, 255)   // 0x00ff00ff
constant long DARK_MAGENTA            = RGB(128,   0, 128)   // 0x00800080
constant long CYAN                    = RGB(  0, 255, 255)   // 0x00ffff00
constant long DARK_CYAN               = RGB(  0, 128, 128)   // 0x00808000
constant long YELLOW                  = RGB(255, 255,   0)   // 0x0000ffff
constant long BROWN                   = RGB(128, 128,   0)   // 0x00008080

// Additional, simple-name color constants
constant long FUCSHIA                 = MAGENTA              // 0x00ff00ff
constant long LIME                    = GREEN                // 0x0000ff00
constant long AQUA                    = CYAN                 // 0x00ffff00
constant long MAROON                  = DARK_RED             // 0x00000080
constant long PURPLE                  = DARK_MAGENTA         // 0x00800080
constant long OLIVE                   = RGB(128, 128,   0)   // 0x00808000
constant long NAVY                    = DARK_BLUE            // 0x00800000
constant long TEAL                    = DARK_CYAN            // 0x00808000
constant long GRAY                    = DARK_GRAY            // 0x00808080
constant long SILVER                  = LIGHT_GRAY           // 0x00c0c0c0
constant long MINT                    = RGB(192, 220, 192)   // 0x00c0e0c0
constant long SKY                     = RGB(166, 202, 240)   // 0x00f0caa6
constant long CREAM                   = RGB(255, 251, 240)   // 0x00f0fbff
constant long MEDIUM_GRAY             = RGB(160, 160, 160)   // 0x00a0a0a0
constant long ORANGE                  = RGB(255, 128,   0)   // 0x000080ff (Note: Painters don't render orange, but run-time does)

// PowerBuilder painter color constants
constant long PB_PAINTER_BLACK        = BLACK                // 0x00000000
constant long PB_PAINTER_WHITE        = WHITE                // 0x00ffffff
constant long PB_PAINTER_RED          = RED                  // 0x000000ff
constant long PB_PAINTER_FUCSHIA      = FUCSHIA              // 0x00ff00ff
constant long PB_PAINTER_LIME         = LIME                 // 0x0000ff00
constant long PB_PAINTER_YELLOW       = YELLOW               // 0x0000ffff
constant long PB_PAINTER_BLUE         = BLUE                 // 0x00ff0000
constant long PB_PAINTER_AQUA         = AQUA                 // 0x00ffff00
constant long PB_PAINTER_MAROON       = MAROON               // 0x00000080
constant long PB_PAINTER_PURPLE       = PURPLE               // 0x00800080
constant long PB_PAINTER_GREEN        = DARK_GREEN           // 0x00008000
constant long PB_PAINTER_OLIVE        = OLIVE                // 0x00008080
constant long PB_PAINTER_NAVY         = NAVY                 // 0x00800000
constant long PB_PAINTER_TEAL         = TEAL                 // 0x00808000
constant long PB_PAINTER_GRAY         = GRAY                 // 0x00808080
constant long PB_PAINTER_SILVER       = SILVER               // 0x00c0c0c0
constant long PB_PAINTER_MINT         = MINT                 // 0x00c0dcc0
constant long PB_PAINTER_SKY          = SKY                  // 0x00f0caa6
constant long PB_PAINTER_CREAM        = CREAM                // 0x00f0fbff
constant long PB_PAINTER_MEDIUM_GRAY  = MEDIUM_GRAY          // 0x00a0a0a0

// PowerBuilder painter Windows system color constants
constant long BUTTON_FACE             = BUTTONFACE           // 0x04000000 (alternate spelling of earlier constant)

constant long SCROLL_BAR              = 134217728            // 0x08000000
constant long DESKTOP                 = 134217729            // 0x08000001
constant long ACTIVE_TITLE_BAR        = 134217730            // 0x08000002
constant long INACTIVE_TITLE_BAR      = 134217731            // 0x08000003
constant long MENU_BAR                = 134217732            // 0x08000004
constant long WINDOW_FRAME            = 134217734            // 0x08000006
constant long MENU_TEXT               = 134217735            // 0x08000007
constant long ACTIVE_TITLE_BAR_TEXT   = 134217737            // 0x08000009
constant long ACTIVE_BORDER           = 134217738            // 0x0800000a
constant long INACTIVE_BORDER         = 134217739            // 0x0800000b
constant long HIGHLIGHT               = 134217741            // 0x0800000d
constant long HIGHLIGHT_TEXT          = 134217742            // 0x0800000e
constant long BUTTON_SHADOW           = 134217744            // 0x08000010
constant long DISABLED_TEXT           = 134217745            // 0x08000011
constant long BUTTON_TEXT             = 134217746            // 0x08000012
constant long INACTIVE_TITLE_BAR_TEXT = 134217747            // 0x08000013
constant long BUTTON_HIGHLIGHT        = 134217748            // 0x08000014
constant long BUTTON_DARK_SHADOW      = 134217749            // 0x08000015
constant long BUTTON_LIGHT_SHADOW     = 134217750            // 0x08000016
constant long TOOLTIP_TEXT            = 134217751            // 0x08000017
constant long TOOLTIP                 = 134217752            // 0x08000018
constant long LINK                    = 134217856            // 0x08000080
constant long LINK_HOVER              = 134217857            // 0x08000081
constant long LINK_ACTIVE             = 134217858            // 0x08000082
constant long LINK_VISITED            = 134217859            // 0x08000083
end variables

on pfc_n_cst_color.create
call super::create
end on

on pfc_n_cst_color.destroy
call super::destroy
end on


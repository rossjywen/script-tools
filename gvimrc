if has("gui_running")
    if has("gui_gtk2")
		:set guifont=Luxi\ Mono\ 12
    elseif has("x11")
	" Also for GTK 1
		:set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
    elseif has("gui_win32")
		:set guifont=Luxi_Mono:h12:cANSI
    elseif has("gui_macvim")
        :set guifont=Menlo:h14
    endif
endif


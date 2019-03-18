#! /bin/sh

id=$1;
instance=$3;
class=$2;

case $class in
	#(Firefox|Firefox-esr|Iceweasel) echo desktop=^2;;
	#(Gimp*) echo follow=on;;
	#(Gitk) echo state=floating\ layer=normal;;
	#(MPlayer) echo state=floating\ layer=normal;;
	#(Pidgin) echo desktop=^3;;
	(Pinentry-gtk-2) echo state=floating\ layer=above;;
	(Spotify) echo desktop=^3;;
	#(TelegramDesktop) echo desktop=^3;;
	(feh) echo state=floating\ rectangle=1200x700+75+40\ center=true;;
	(Xmessage) echo state=floating\ layer=normal;;
	#([cC]hromium|Chromium-browser) echo desktop=^2;;
	(Kodi) echo desktop=^4;;
	#([lL]ibre[oO]ffice*) echo state=tiled\ layer=normal;;
	(TeXstudio) echo desktop=^5;;
	(mpv) echo state=floating\ layer=normal;;
	(Xarchiver) echo state=floating ;;
	(Lxtask) echo state=floating\ rectangle=800x600+250+100;;
	(Lxappearance) echo state=floating;;
	(Chromium-browser) echo desktop=^4;;
	(Gpicview) echo state=floating\ rectangle=1200x700+75+40;;
	(Zathura) echo state=tiled
		#\ rectangle=1200x700+75+40;;
	('')
		case $(ps -p "$(xdo pid $id)" -o comm= 2>/dev/null) in
			(spotify) echo desktop=^3;;
		esac;
esac;
#xdotool search --name "WhatsApp - Mozilla Firefox" set_desktop_for_window %@ 1
#xdotool search --name "urserver" windowunmap %@ 
case $(ps -p "$(xdo pid -a "soundset.sh")" -o comm= 2>/dev/null) in
	(urxvt) echo state=floating;;
esac;
case $(ps -p "$(xdo pid -a "network.sh")" -o comm= 2>/dev/null) in
	(urxvt) echo state=floating;;
esac;
case $(ps -p "$(xdo pid -a "sudo")" -o comm= 2>/dev/null) in
	(urxvt) echo state=floating;;
esac;

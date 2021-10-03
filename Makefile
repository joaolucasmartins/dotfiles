dir=/home/jm# to copy from different users
# Directories
aliases=.config/aliases
bashrc=.bashrc
xmonad=.xmonad
xinit=.xinitrc
vim=.config/nvim
coc=.config/coc
dmenu=Apps/dmenu
poly=.config/polybar
scripts=.local/bin
fish=.config/fish
alacritty=.config/alacritty
picom=.config/picom.conf
wal=wal_templates

clean: clean_bash clean_scripts clean_xmonad clean_vim clean_polybar clean_dmenu clean_alac clean_fish clean_picom clean_cfg 

update: update_cfg update_bash update_scripts update_xmonad update_vim update_polybar update_dmenu update_alac update_fish update_picom

clean_cfg:
	rm -r .config
update_cfg:
	mkdir -p .config

clean_bash:
	rm -r $(bashrc)
	rm -r .config/$(aliases)
update_bash:
	cp $(dir)/$(bashrc) .
	cp $(dir)/$(aliases) ./$(aliases)

clean_picom:
	rm -r $(picom)
update_picom:
	cp $(dir)/$(picom) ./$(picom)

clean_fish:
	rm -r $(fish)
update_fish:
	cp -r $(dir)/$(fish) ./$(fish)

clean_alac:
	rm -r $(alacritty)
update_alac:
	cp -r $(dir)/$(alacritty) ./$(alacritty)

clean_scripts:
	rm -r scripts
update_scripts:
	mkdir scripts
	cp -r $(dir)/$(scripts) ./scripts/

clean_xmonad:
	rm -r $(xmonad)
	rm -r $(xinit)
update_xmonad:
	cp -r $(dir)/$(xmonad) ./$(xmonad)
	cp $(dir)/$(xinit) ./$(xinit)

clean_dmenu:
	rm -r dmenu
update_dmenu:
	mkdir ./dmenu
	cp -r $(dir)/$(dmenu)/patches ./dmenu
	cp -r $(dir)/$(dmenu)/*.h ./dmenu
	cp -r $(dir)/$(dmenu)/*.c ./dmenu
	cp -r $(dir)/$(dmenu)/*.mk ./dmenu

clean_wal:
	rm -r $(wal)
update_wal:
	mkdir $(wal)
	cp /lib/python3.9/site-packages/pywal/templates/colors.hs $(wal)
	cp /lib/python3.9/site-packages/pywal/templates/colors-wal-dmenu.h.hs $(wal)

clean_vim:
	rm -rf $(vim)
	rm -rf $(coc)
update_vim:
	mkdir -p ./$(vim)
	mkdir -p ./$(coc)
	cp -r $(dir)/$(vim)/*.vim ./$(vim)/
	cp -r $(dir)/$(coc)/*.json ./$(coc)

clean_polybar:
	rm -r $(poly)
update_polybar:
	cp -r $(dir)/$(poly) ./$(poly)

dir=/home/jm# to copy from different users
# Directories
aliases=.config/aliases.fish
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
wal=.config/wal/templates

clean: clean_bash clean_scripts clean_xmonad clean_vim clean_polybar clean_dmenu clean_alac clean_fish clean_picom clean_cfg 

update: update_cfg update_bash update_scripts update_xmonad update_vim update_polybar update_dmenu update_alac update_fish update_picom update_perms

install: install_cfg install_wal install_dmenu install_xmonad

clean_cfg:
	rm -r .config
update_cfg:
	mkdir -p .config
install_cfg:
	cp -r .config ~

# Things that are in .config
clean_bash:
	rm -r $(bashrc)
update_bash:
	cp $(dir)/$(bashrc) .

clean_picom:
	rm -r $(picom)
update_picom:
	cp $(dir)/$(picom) ./$(picom)
install_picom:
	cp ./$(picom) $(dir)/$(picom)

clean_fish:
	rm -r $(fish)
	rm -r .config/$(aliases)
update_fish:
	cp -r $(dir)/$(fish)/* ./$(fish)
	cp $(dir)/$(aliases) ./$(aliases)
install_fish:
	cp -r ./$(fish)/* $(dir)/$(fish) 
	cp ./$(aliases) $(dir)/$(aliases) 

clean_alac:
	rm -r $(alacritty)
update_alac:
	cp -r $(dir)/$(alacritty)/* ./$(alacritty)
install_alac:
	cp -r ./$(alacritty)/* $(dir)/$(alacritty)

clean_polybar:
	rm -r $(poly)
update_polybar:
	cp -r $(dir)/$(poly)/* ./$(poly)
install_polybar:
	mkdir -p $(dir)/$(poly)
	cp -r ./$(poly)/* $(dir)/$(poly)/

clean_vim:
	rm -rf $(vim)
	rm -rf $(coc)
update_vim:
	mkdir -p ./$(vim)
	mkdir -p ./$(coc)
	cp -r $(dir)/$(vim)/*.vim ./$(vim)/
	cp -r $(dir)/$(coc)/*.json ./$(coc)
install_vim:
	cp -r ./$(vim)/* $(dir)/$(vim)/
	cp -r ./$(coc)/* $(dir)/$(coc)/

# Things that aren't on .config
clean_scripts:
	rm -r scripts
update_scripts:
	mkdir scripts
	cp -r $(dir)/$(scripts)/* ./scripts/
install_scripts:
	mkdir -p $(dir)/$(scripts)
	cp -r ./scripts/* $(dir)/$(scripts)/

clean_xmonad:
	rm -r $(xmonad)
	rm -r $(xinit)
update_xmonad:
	cp -r $(dir)/$(xmonad)/* ./$(xmonad)/
	cp $(dir)/$(xinit) ./$(xinit)
install_xmonad:
	mkdir -p $(dir)/$(xmonad)
	cp -r ./$(xmonad)/* $(dir)/$(xmonad)
	cp ./$(xinit) $(dir)/$(xinit)

clean_dmenu:
	rm -r dmenu
update_dmenu:
	mkdir ./dmenu
	cp -r $(dir)/$(dmenu)/patches ./dmenu
	cp -r $(dir)/$(dmenu)/*.h ./dmenu
	cp -r $(dir)/$(dmenu)/*.c ./dmenu
	cp -r $(dir)/$(dmenu)/*.mk ./dmenu
install_dmenu:
	cp -r ./dmenu/* $(dir)/$(dmenu)/

clean_wal:
	rm -r $(wal)
update_wal:
	mkdir $(wal)
	cp $(dir)/$(wal)/* ./$(wal)/
install_wal:
	cp ./$(wal)/* $(dir)/$(wal)/

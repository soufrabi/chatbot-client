name="chatgpt-electron"
command="chatgpt-electron"

prepare :
	npm install
	npm run build

install :
	mkdir -pv /opt/${name}
	cp -rv ${name}-linux-x64 /opt/${name}
	mkdir -pv /usr/local/share/applications
	mkdir -pv /usr/local/share/icons
	cp ./desktop/desktop.desktop /usr/local/share/applications/${name}.desktop
	cp ./desktop/icon.png /usr/local/share/icons/${name}.png
	ln -sv /opt/${name}/${name}-linux-x64/${command} /usr/local/bin/${command}


clean :
	rm -rfv /opt/${name}
	rm -fv /usr/local/share/applications/${name}.desktop
	rm -fv /usr/local/share/icons/${name}.png
	unlink /usr/local/bin/${command}
	

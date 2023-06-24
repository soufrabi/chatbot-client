name="chatgpt-electron"
command="chatgpt-electron"

prepare :
	npm install
	npm run build

install :
	mkdir -pv /opt/${name}
	cp -rv APP-linux-x64 /opt/${name}
	mkdir -pv /usr/local/share/applications
	mkdir -pv /usr/local/share/icons
	cp ./desktop/desktop.desktop /usr/local/share/applications/${name}.desktop
	cp ./desktop/icon.jpg /usr/local/share/icons/${name}.jpg
	ln -sv /opt/${name}/APP-linux-x64/APP /usr/local/bin/${command}


clean :
	rm -rfv /opt/${name}
	rm -fv /usr/local/share/applications/${name}.desktop
	rm -fv /usr/local/share/icons/${name}.jpg
	unlink /usr/local/bin/${command}
	



prepare :
	npm install
	npm run build

install :
	mkdir -pv /opt/chatgpt-electron
	cp -rv APP-linux-x64 /opt/chatgpt-electron
	mkdir -pv /usr/local/share/applications
	mkdir -pv /usr/local/share/icons
	cp ./desktop/chatgpt-electron-desktop.desktop /usr/local/share/applications
	cp ./desktop/chatgpt-electron-icon.jpg /usr/local/share/icons
	ln -sv /opt/chatgpt-electron/APP-linux-x64/APP /usr/local/bin/chatgpt-electron


clean :
	rm -rfv /opt/chatgpt-electron
	rm -fv /usr/local/share/applications/chatgpt-electron-desktop.desktop
	rm -fv /usr/local/share/icons/chatgpt-electron-icon.jpg
	unlink /usr/local/bin/chatgpt-electron
	

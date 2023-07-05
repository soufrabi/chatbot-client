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
	
flatpak :
	cp -r assets/usr/share /app
	install -Dm 755 assets/usr/bin/chatgpt-electron /app/bin/chatgpt-electron
	mv assets/usr/share/metainfo/chatgpt-electron.metainfo.xml /app/share/metainfo/io.github.anirbandey1.ChatGPTElectron.metainfo.xml
	desktop-file-edit --set-key=Exec --set-value="run.sh" /app/share/applications/chatgpt-electron.desktop
	desktop-file-edit --set-key=Icon --set-value="io.github.anirbandey1.ChatGPTElectron" /app/share/applications/chatgpt-electron.desktop
	mkdir -pv /app/opt/chatgpt-electron
	cp -r * /app/opt/chatgpt-electron

name="chatbot-client"
command="chatbot-client"

prepare :
	npm install
	npm run build

install :
	mkdir -pv /opt/${name}
	cp -rv ${name}-linux-x64 /opt/${name}
	mkdir -pv /usr/local/share/applications
	mkdir -pv /usr/local/share/icons
	cp ./desktop/desktop.desktop /usr/share/applications/${name}.desktop
	cp ./desktop/icon.png /usr/share/icons/${name}.png
	ln -sv /opt/${name}/${name}-linux-x64/${command} /usr/local/bin/${command}


clean :
	rm -rfv /opt/${name}
	rm -fv /usr/local/share/applications/${name}.desktop
	rm -fv /usr/local/share/icons/${name}.png
	unlink /usr/local/bin/${command}

deb:
	mkdir "${name}"
	mkdir -pv "${name}/{usr,opt}"
	cp -rv "${name}-linux-x64" "${name}/opt"
	cp -rv "assets/usr/share" "${name}/usr"
	
flatpak :
	cp -r assets/usr/* /app
	desktop-file-edit --set-key=Icon --set-value="io.github.anirbandey1.ChatbotClient" /app/share/applications/chatbot-client.desktop
	mkdir -pv /app/opt/chatbot-client
	cp -r * /app/opt/chatbot-client

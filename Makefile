name="chatbot-client"
command="chatbot-client"
build_dir="build-linux-binary"

prepare :
	npm install
	npm run build


deb:
	echo ${build_dir}
	rm -rf ${build_dir}
	mkdir -pv "${build_dir}/${name}"
	mkdir -pv "${build_dir}/${name}/usr"
	mkdir -pv "${build_dir}/${name}/opt/chatbot-client"
	cp -rv "assets/DEBIAN" "${build_dir}/${name}"
	cp -rv "${name}-linux-x64" "${build_dir}/${name}/opt/${name}"
	cp -rv "assets/usr/bin" "${build_dir}/${name}/usr"
	cp -rv "assets/usr/share" "${build_dir}/${name}/usr"
	cd ${build_dir} && dpkg-deb --build ${name}

	
flatpak :
	cp -r assets/usr/* /app
	desktop-file-edit --set-key=Icon --set-value="io.github.anirbandey1.ChatbotClient" /app/share/applications/chatbot-client.desktop
	mkdir -pv /app/opt/chatbot-client
	cp -r * /app/opt/chatbot-client

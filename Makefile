name="chatbot-client"
_pkgname="chatbot-client"
command="chatbot-client"
build_dir="build_linux"

prepare :
	npm install
	npm run build


deb:
	echo ${build_dir}
	rm -rf ${build_dir}
	mkdir -pv "${build_dir}/${_pkgname}"
	mkdir -pv "${build_dir}/${_pkgname}/usr"
	mkdir -pv "${build_dir}/${_pkgname}/opt/chatbot-client"
	cp -rv "assets/DEBIAN" "${build_dir}/${_pkgname}"
	cp -rv "${_pkgname}-linux-x64" "${build_dir}/${_pkgname}/opt/${_pkgname}"
	cp -rv "assets/usr/bin" "${build_dir}/${_pkgname}/usr"
	cp -rv "assets/usr/share" "${build_dir}/${_pkgname}/usr"
	cd ${build_dir} && dpkg-deb --build ${_pkgname}

	
flatpak :
	cp -r assets/usr/* /app
	desktop-file-edit --set-key=Icon --set-value="io.github.anirbandey1.ChatbotClient" /app/share/applications/chatbot-client.desktop
	mkdir -pv /app/opt/chatbot-client
	cp -r * /app/opt/chatbot-client

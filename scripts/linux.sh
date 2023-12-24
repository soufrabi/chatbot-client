#!/bin/sh

show_help(){

	cat << EOF
linux.sh

Choose one of the available commands:
	build-deb
	build-flatpak
	setup
	deps
	help | --help | -h
	
EOF


}


if [ $# -eq 0 ]; then
	show_help
	exit
fi


pkgname="chatbot-client"
_pkgname="chatbot-client"
command="chatbot-client"
build_dir="build_binary"

install_dependencies() {
	echo "Install dependencies in Linux"

	# sudo apt update && sudo apt install -y libgl1 ffmpeg libsm6 libxext6 libegl1 '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev


}


setup_env() {
    npm install
    npm run build

}

build_deb() {

    echo ${build_dir}
	rm -rf ${build_dir}
	mkdir -pv "${build_dir}/${_pkgname}"
	mkdir -pv "${build_dir}/${_pkgname}/usr/bin"
	mkdir -pv "${build_dir}/${_pkgname}/usr/share/applications"
	mkdir -pv "${build_dir}/${_pkgname}/usr/share/metainfo"
	mkdir -pv "${build_dir}/${_pkgname}/usr/share/icons/hicolor/scalable/apps"
	cp -rv "assets/DEBIAN" "${build_dir}/${_pkgname}"
	cp -rv "assets/${_pkgname}" "${build_dir}/${_pkgname}/usr/bin"
	cp -rv "assets/${_pkgname}.desktop" "${build_dir}/${_pkgname}/usr/share/applications"
	cp -rv "assets/${_pkgname}.metainfo.xml" "${build_dir}/${_pkgname}/usr/share/metainfo"
	cp -rv "assets/${_pkgname}.svg" "${build_dir}/${_pkgname}/usr/share/icons/hicolor/scalable/apps"
	cp -rv "${_pkgname}-linux-x64" "${build_dir}/${_pkgname}/usr/share/${_pkgname}"
	cd ${build_dir} && dpkg-deb --build ${_pkgname}


}

build_flatpak() {
    ar -x chatbot-client.deb
	rm -vf chatbot-client.deb control.tar.xz debian-binary
	tar -xf data.tar.*
	rm -vf data.tar.xz
	cp -rv usr/share /app
	cp -rv usr/bin /app
	desktop-file-edit --set-key=Exec --set-value="chatbot-client" /app/share/applications/chatbot-client.desktop
	desktop-file-edit --set-key=Icon --set-value="io.github.anirbandey1.ChatbotClient" /app/share/applications/chatbot-client.desktop

}





main() {

	case "$1" in 
		(build-deb)
			shift
			build_deb "$@"
			;;
		(build-flatpak)
			shift
			build_flatpak "$@"
			;;
		(deps)
			shift
			install_dependencies "$@"
			;;
		(setup)
			shift
			setup_env "$@"
			;;
		(help | --help | -h)
			show_help 
			exit 0 
			;;
		(*)
			printf >&2 "Error: invalid command\n"
			show_help
			exit 1
			;;

	esac
	

}

main "$@"

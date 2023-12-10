#!/bin/sh


_package_name="chatbot-client"

printf "Build on MacOS"
architecture="$(uname -p)"

if [ "$architecture" = "i386" ] ; then 
    architecture="aarch64"
fi

build_dir="build-macos-${architecture}"
echo "$build_dir"

build_nativifier_binary() {
    npm install
    npm run build

}

package_binary() {
    mkdir "$build_dir"
    ls "${_package_name}-darwin-x64"
    mv "${_package_name}-darwin-x64/${_package_name}.app" "$build_dir"
}

build_main() {

    build_nativifier_binary
    package_binary
}

build_main



